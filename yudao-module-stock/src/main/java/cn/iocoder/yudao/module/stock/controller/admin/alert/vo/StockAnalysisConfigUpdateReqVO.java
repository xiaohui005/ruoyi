package cn.iocoder.yudao.module.stock.controller.admin.alert.vo;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Data
public class StockAnalysisConfigUpdateReqVO {

    @NotNull(message = "配置列表不能为空")
    private List<Item> items;

    @Data
    public static class Item {

        @NotBlank(message = "配置键不能为空")
        private String configKey;

        @NotBlank(message = "配置值不能为空")
        private String configValue;
    }
}
