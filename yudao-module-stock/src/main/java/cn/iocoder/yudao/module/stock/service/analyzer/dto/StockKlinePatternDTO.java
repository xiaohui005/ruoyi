package cn.iocoder.yudao.module.stock.service.analyzer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StockKlinePatternDTO {

    private String patternCode;
    private String patternName;
    private String signalType;
    private String signalLabel;
    private String description;
    private String tradeAdvice;
}
