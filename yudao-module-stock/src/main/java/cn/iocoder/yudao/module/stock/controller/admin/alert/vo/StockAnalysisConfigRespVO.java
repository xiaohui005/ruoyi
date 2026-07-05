package cn.iocoder.yudao.module.stock.controller.admin.alert.vo;

import lombok.Data;

@Data
public class StockAnalysisConfigRespVO {

    private Long id;
    private String configKey;
    private String configName;
    private String configValue;
    private String remark;
}
