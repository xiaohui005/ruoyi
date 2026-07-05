package cn.iocoder.yudao.module.stock.controller.admin.journal.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class StockTradeJournalPageReqVO extends PageParam {

    private String symbol;
}
