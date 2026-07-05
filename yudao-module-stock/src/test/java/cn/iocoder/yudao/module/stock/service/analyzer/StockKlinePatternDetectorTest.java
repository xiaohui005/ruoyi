package cn.iocoder.yudao.module.stock.service.analyzer;

import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockKlinePatternDTO;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class StockKlinePatternDetectorTest {

    @Test
    void shouldDetectXianRenZhiLu() {
        List<StockKlinePatternDTO> patterns = StockKlinePatternDetector.detect(Arrays.asList(
                k("2026-07-01", "10.00", "10.30", "10.40", "9.95", "100"),
                k("2026-07-02", "10.30", "10.55", "10.60", "10.20", "120"),
                k("2026-07-03", "10.56", "10.60", "11.10", "10.55", "150")
        ));
        assertTrue(patterns.stream().map(StockKlinePatternDTO::getPatternCode)
                .collect(Collectors.toSet()).contains("XIAN_REN_ZHI_LU"));
        assertFalse(patterns.stream()
                .filter(pattern -> Objects.equals(pattern.getPatternCode(), "XIAN_REN_ZHI_LU"))
                .map(StockKlinePatternDTO::getDescription)
                .collect(Collectors.toList()).isEmpty());
    }

    @Test
    void shouldDetectShuangChuiDaZhuang() {
        List<StockKlinePatternDTO> patterns = StockKlinePatternDetector.detect(Arrays.asList(
                k("2026-06-29", "11.20", "10.80", "11.30", "10.70", "100"),
                k("2026-06-30", "10.80", "10.30", "10.90", "10.10", "110"),
                k("2026-07-01", "10.20", "10.25", "10.28", "9.60", "140"),
                k("2026-07-02", "10.30", "10.45", "10.46", "9.85", "160"),
                k("2026-07-03", "10.40", "10.55", "10.70", "10.20", "180")
        ));
        assertTrue(patterns.stream().map(StockKlinePatternDTO::getPatternCode)
                .collect(Collectors.toSet()).contains("SHUANG_CHUI_DA_ZHUANG"));
    }

    @Test
    void shouldDetectXiShangMeiShao() {
        List<StockKlinePatternDTO> patterns = StockKlinePatternDetector.detect(Arrays.asList(
                k("2026-07-01", "10.00", "11.00", "11.10", "9.95", "100"),
                k("2026-07-02", "10.95", "10.88", "11.00", "10.20", "110"),
                k("2026-07-03", "10.90", "10.96", "11.02", "10.35", "135")
        ));
        assertTrue(patterns.stream().map(StockKlinePatternDTO::getPatternCode)
                .collect(Collectors.toSet()).contains("XI_SHANG_MEI_SHAO"));
    }

    @Test
    void shouldDetectXiangShangCaiSanXia() {
        List<StockKlinePatternDTO> patterns = StockKlinePatternDetector.detect(Arrays.asList(
                k("2026-06-30", "10.00", "10.45", "10.50", "9.98", "180"),
                k("2026-07-01", "10.30", "10.34", "10.40", "10.08", "90"),
                k("2026-07-02", "10.28", "10.31", "10.42", "10.10", "95"),
                k("2026-07-03", "10.32", "10.72", "10.78", "10.30", "220")
        ));
        assertTrue(patterns.stream().map(StockKlinePatternDTO::getPatternCode)
                .collect(Collectors.toSet()).contains("XIANG_SHANG_CAI_SAN_XIA"));
    }

    @Test
    void shouldDetectChangDuanYinYangTui() {
        List<StockKlinePatternDTO> patterns = StockKlinePatternDetector.detect(Arrays.asList(
                k("2026-06-29", "10.20", "10.45", "10.48", "10.10", "100"),
                k("2026-06-30", "10.45", "10.72", "10.78", "10.38", "110"),
                k("2026-07-01", "10.70", "11.00", "11.05", "10.62", "130"),
                k("2026-07-02", "11.02", "11.38", "11.45", "10.95", "150"),
                k("2026-07-03", "11.40", "11.10", "12.20", "11.02", "180")
        ));
        assertTrue(patterns.stream().map(StockKlinePatternDTO::getPatternCode)
                .collect(Collectors.toSet()).contains("CHANG_DUAN_YIN_YANG_TUI"));
    }

    @Test
    void shouldDetectSiShenSanBuQu() {
        List<StockKlinePatternDTO> patterns = StockKlinePatternDetector.detect(Arrays.asList(
                k("2026-06-30", "9.80", "10.10", "10.20", "9.70", "100"),
                k("2026-07-01", "10.10", "10.70", "10.90", "10.00", "140"),
                k("2026-07-02", "10.72", "10.74", "10.90", "10.60", "130"),
                k("2026-07-03", "10.65", "10.20", "10.68", "10.00", "180")
        ));
        assertTrue(patterns.stream().map(StockKlinePatternDTO::getPatternCode)
                .collect(Collectors.toSet()).contains("SI_SHEN_SAN_BU_QU"));
    }

    private StockKlineDailyDO k(String date, String open, String close, String high, String low, String volume) {
        StockKlineDailyDO item = new StockKlineDailyDO();
        item.setTradeDate(LocalDate.parse(date));
        item.setOpenPrice(new BigDecimal(open));
        item.setClosePrice(new BigDecimal(close));
        item.setHighPrice(new BigDecimal(high));
        item.setLowPrice(new BigDecimal(low));
        item.setVolume(new BigDecimal(volume));
        if (new BigDecimal(open).compareTo(BigDecimal.ZERO) > 0) {
            item.setChangePct(new BigDecimal(close).subtract(new BigDecimal(open))
                    .multiply(BigDecimal.valueOf(100))
                    .divide(new BigDecimal(open), 4, BigDecimal.ROUND_HALF_UP));
        }
        return item;
    }
}
