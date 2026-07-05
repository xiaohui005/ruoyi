package cn.iocoder.yudao.module.stock.service.market;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.market.vo.MarketSignalPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockMarketSignalRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockMarketSnapshotDO;
import cn.iocoder.yudao.module.stock.dal.mysql.market.StockMarketSignalRecordMapper;
import cn.iocoder.yudao.module.stock.enums.StockMarketSignalEnum;
import cn.iocoder.yudao.module.stock.service.config.StockAnalysisConfigService;
import cn.iocoder.yudao.module.stock.service.data.StockDataService;
import cn.iocoder.yudao.module.stock.service.market.dto.MarketSignalResultDTO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Service
public class StockMarketSignalServiceImpl implements StockMarketSignalService {

    @Resource
    private StockMarketSignalRecordMapper stockMarketSignalRecordMapper;
    @Resource
    private StockDataService stockDataService;
    @Resource
    private StockAnalysisConfigService stockAnalysisConfigService;

    @Override
    public MarketSignalResultDTO getCurrentSignal(boolean refreshIfNeeded) {
        StockMarketSnapshotDO snapshot = refreshIfNeeded ? stockDataService.refreshMarketSnapshot()
                : stockDataService.getLatestMarketSnapshot(true);
        if (snapshot == null) {
            return null;
        }
        StockMarketSignalRecordDO latest = stockMarketSignalRecordMapper.selectLatest();
        if (latest == null || latest.getCreateTime() == null || isSnapshotNewer(snapshot, latest.getCreateTime())) {
            latest = createSignalRecord(snapshot);
        }
        return buildResult(snapshot, latest);
    }

    @Override
    public MarketSignalResultDTO refreshCurrentSignal() {
        StockMarketSnapshotDO snapshot = stockDataService.refreshMarketSnapshot();
        if (snapshot == null) {
            return null;
        }
        StockMarketSignalRecordDO record = createSignalRecord(snapshot);
        return buildResult(snapshot, record);
    }

    @Override
    public PageResult<StockMarketSignalRecordDO> getSignalPage(MarketSignalPageReqVO reqVO) {
        return stockMarketSignalRecordMapper.selectPage(reqVO);
    }

    private boolean isSnapshotNewer(StockMarketSnapshotDO snapshot, LocalDateTime latestRecordTime) {
        return snapshot.getSnapshotTime() != null && snapshot.getSnapshotTime().isAfter(latestRecordTime);
    }

    private StockMarketSignalRecordDO createSignalRecord(StockMarketSnapshotDO snapshot) {
        StockMarketSignalEnum signal = resolveSignal(snapshot);
        StockMarketSignalRecordDO record = new StockMarketSignalRecordDO();
        record.setTradeDate(snapshot.getTradeDate());
        record.setSignalCode(signal.getCode());
        record.setSignalName(signal.getName());
        record.setTradable(signal.isTradable());
        record.setRiskLevel(signal.getRiskLevel());
        record.setReasonText(buildReason(snapshot, signal));
        record.setSnapshotId(snapshot.getId());
        stockMarketSignalRecordMapper.insert(record);
        return record;
    }

    private StockMarketSignalEnum resolveSignal(StockMarketSnapshotDO snapshot) {
        BigDecimal indexRiseThreshold = stockAnalysisConfigService.getDecimalConfig("market.index-rise-threshold", BigDecimal.valueOf(1.20));
        BigDecimal turnoverRatioThreshold = stockAnalysisConfigService.getDecimalConfig("market.turnover-ratio-threshold", BigDecimal.valueOf(1.10));
        int themeLimitUpThreshold = stockAnalysisConfigService.getDecimalConfig("market.theme-limit-up-threshold", BigDecimal.valueOf(3)).intValue();
        int limitDownMax = stockAnalysisConfigService.getDecimalConfig("market.limit-down-max", BigDecimal.TEN).intValue();
        int limitUpMin = stockAnalysisConfigService.getDecimalConfig("market.limit-up-min", BigDecimal.valueOf(20)).intValue();

        BigDecimal changePct = snapshot.getIndexChangePct() == null ? BigDecimal.ZERO : snapshot.getIndexChangePct();
        BigDecimal turnoverRatio = snapshot.getTurnoverRatio() == null ? BigDecimal.ONE : snapshot.getTurnoverRatio();
        StockMarketSignalRecordDO previous = stockMarketSignalRecordMapper.selectLatest();

        if (changePct.compareTo(indexRiseThreshold) >= 0
                && turnoverRatio.compareTo(turnoverRatioThreshold) >= 0
                && nullSafe(snapshot.getLimitUpCount()) >= limitUpMin) {
            return StockMarketSignalEnum.INCREMENTAL_RESONANCE;
        }
        if (nullSafe(snapshot.getThemeLimitUpCount()) >= themeLimitUpThreshold) {
            return StockMarketSignalEnum.THEME_FERMENT;
        }
        if (previous != null && StockMarketSignalEnum.FIRST_DIVERGENCE.getCode().equals(previous.getSignalCode())
                && changePct.compareTo(BigDecimal.valueOf(0.5)) >= 0 && nullSafe(snapshot.getLimitUpCount()) >= themeLimitUpThreshold) {
            return StockMarketSignalEnum.DIVERGENCE_TO_CONSENSUS;
        }
        if (previous != null && previous.getTradable()
                && changePct.compareTo(BigDecimal.ZERO) < 0
                && nullSafe(snapshot.getLimitDownCount()) > limitDownMax) {
            return StockMarketSignalEnum.FIRST_DIVERGENCE;
        }
        if (changePct.compareTo(BigDecimal.valueOf(0.8)) >= 0
                && nullSafe(snapshot.getRisingCount()) > nullSafe(snapshot.getFallingCount())) {
            return StockMarketSignalEnum.BREAKOUT;
        }
        if (nullSafe(snapshot.getLimitDownCount()) <= limitDownMax
                && nullSafe(snapshot.getLimitUpCount()) >= limitUpMin) {
            return StockMarketSignalEnum.THAW_REPAIR;
        }
        return StockMarketSignalEnum.WAIT_AND_SEE;
    }

    private String buildReason(StockMarketSnapshotDO snapshot, StockMarketSignalEnum signal) {
        return String.format("节点=%s，指数涨幅=%s%%，涨停=%s，跌停=%s，上涨家数=%s，下跌家数=%s，热点=%s",
                signal.getName(), value(snapshot.getIndexChangePct()), nullSafe(snapshot.getLimitUpCount()),
                nullSafe(snapshot.getLimitDownCount()), nullSafe(snapshot.getRisingCount()),
                nullSafe(snapshot.getFallingCount()), snapshot.getHotTheme());
    }

    private MarketSignalResultDTO buildResult(StockMarketSnapshotDO snapshot, StockMarketSignalRecordDO record) {
        if (record == null) {
            return null;
        }
        MarketSignalResultDTO dto = new MarketSignalResultDTO();
        dto.setRecordId(record.getId());
        dto.setTradeDate(record.getTradeDate());
        dto.setSnapshotTime(snapshot != null ? snapshot.getSnapshotTime() : record.getCreateTime());
        dto.setSignalCode(record.getSignalCode());
        dto.setSignalName(record.getSignalName());
        dto.setTradable(record.getTradable());
        dto.setRiskLevel(record.getRiskLevel());
        dto.setReasonText(record.getReasonText());
        if (snapshot != null) {
            dto.setHotTheme(snapshot.getHotTheme());
            dto.setLimitUpCount(snapshot.getLimitUpCount());
            dto.setLimitDownCount(snapshot.getLimitDownCount());
            dto.setRisingCount(snapshot.getRisingCount());
            dto.setFallingCount(snapshot.getFallingCount());
            dto.setIndexClose(snapshot.getIndexClose());
            dto.setIndexChangePct(snapshot.getIndexChangePct());
            dto.setTurnoverAmount(snapshot.getTurnoverAmount());
            dto.setTurnoverRatio(snapshot.getTurnoverRatio());
        }
        return dto;
    }

    private int nullSafe(Integer value) {
        return value == null ? 0 : value;
    }

    private String value(BigDecimal value) {
        return value == null ? "0" : value.stripTrailingZeros().toPlainString();
    }
}
