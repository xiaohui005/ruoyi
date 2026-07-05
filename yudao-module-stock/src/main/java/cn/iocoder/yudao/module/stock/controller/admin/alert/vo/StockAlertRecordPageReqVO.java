package cn.iocoder.yudao.module.stock.controller.admin.alert.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class StockAlertRecordPageReqVO extends PageParam {

    private String symbol;
    private String channelCode;
}
