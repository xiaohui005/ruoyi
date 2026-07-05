package cn.iocoder.yudao.module.stock.service.alert.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class StockAlertSendResultDTO {

    private boolean success;
    private String responseText;
}
