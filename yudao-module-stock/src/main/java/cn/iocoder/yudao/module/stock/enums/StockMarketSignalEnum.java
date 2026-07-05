package cn.iocoder.yudao.module.stock.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StockMarketSignalEnum {

    INCREMENTAL_RESONANCE("INCREMENTAL_RESONANCE", "增量共振", true, "MEDIUM"),
    THEME_FERMENT("THEME_FERMENT", "题材发酵", true, "MEDIUM"),
    FIRST_DIVERGENCE("FIRST_DIVERGENCE", "主线首次分歧", true, "MEDIUM"),
    DIVERGENCE_TO_CONSENSUS("DIVERGENCE_TO_CONSENSUS", "分歧转一致", true, "LOW"),
    BREAKOUT("BREAKOUT", "市场突破震荡", true, "LOW"),
    THAW_REPAIR("THAW_REPAIR", "情绪冰点修复", true, "MEDIUM"),
    WAIT_AND_SEE("WAIT_AND_SEE", "继续观望", false, "HIGH");

    private final String code;
    private final String name;
    private final boolean tradable;
    private final String riskLevel;
}
