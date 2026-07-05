package cn.iocoder.yudao.module.stock.service.data.provider;

import cn.iocoder.yudao.module.stock.framework.config.StockProperties;
import cn.iocoder.yudao.module.stock.service.data.dto.StockDailyKLineDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestTemplate;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class AktoolsStockDataProviderTest {

    private static final String EASTMONEY_603993_URL = "https://push2his.eastmoney.com/api/qt/stock/kline/get?secid=1.603993"
            + "&ut=fa5fd1943c7b386f172d6893dbfba10b&fields1=f1,f2,f3,f4,f5,f6"
            + "&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61&klt=101&fqt=1&end=20500000&lmt=5";

    private static final String TENCENT_603993_URL =
            "https://web.ifzq.gtimg.cn/appstock/app/fqkline/get?param=sh603993,day,,,5,qfq";

    private static final String TENCENT_000630_URL =
            "https://web.ifzq.gtimg.cn/appstock/app/fqkline/get?param=sz000630,day,,,2,qfq";

    private static final String TENCENT_603993_RESPONSE = "{\"code\":0,\"msg\":\"\",\"data\":{\"sh603993\":{\"qfqday\":["
            + "[\"2026-06-29\",\"17.250\",\"18.000\",\"18.200\",\"17.180\",\"3122241.000\"],"
            + "[\"2026-06-30\",\"17.600\",\"17.550\",\"17.610\",\"17.110\",\"2434101.000\"],"
            + "[\"2026-07-01\",\"17.380\",\"17.730\",\"17.980\",\"17.200\",\"2561093.000\"],"
            + "[\"2026-07-02\",\"17.920\",\"18.290\",\"18.650\",\"17.400\",\"4374210.000\"],"
            + "[\"2026-07-03\",\"18.800\",\"18.520\",\"19.300\",\"18.500\",\"3696062.000\"]],"
            + "\"qt\":{\"sh603993\":[\"1\",\"洛阳钼业\",\"603993\"]}}}}";

    private static final String TENCENT_000630_RESPONSE = "{\"code\":0,\"msg\":\"\",\"data\":{\"sz000630\":{\"qfqday\":["
            + "[\"2026-06-08\",\"6.040\",\"5.930\",\"6.230\",\"5.900\",\"4411175.000\",{\"nd\":\"2025\"}],"
            + "[\"2026-06-09\",\"6.130\",\"6.250\",\"6.330\",\"6.010\",\"4441406.000\"]],"
            + "\"qt\":{\"sz000630\":[\"51\",\"铜陵有色\",\"000630\"]}}}}";

    private final RestTemplate restTemplate = mock(RestTemplate.class);

    private AktoolsStockDataProvider provider;

    @BeforeEach
    void setUp() {
        provider = new AktoolsStockDataProvider();
        ReflectionTestUtils.setField(provider, "restTemplate", restTemplate);
        ReflectionTestUtils.setField(provider, "stockProperties", new StockProperties());
    }

    @Test
    void fetchDailyKLine_whenEastMoneyFails_shouldFallbackToTencent() {
        when(restTemplate.getForObject(eq(EASTMONEY_603993_URL), eq(String.class)))
                .thenThrow(new ResourceAccessException("eastmoney unavailable"));
        when(restTemplate.getForObject(eq(TENCENT_603993_URL), eq(String.class)))
                .thenReturn(TENCENT_603993_RESPONSE);

        List<StockDailyKLineDTO> result = provider.fetchDailyKLine("603993", 5);

        assertEquals(5, result.size());
        assertEquals("603993.SH", result.get(0).getSymbol());
        assertEquals("18.000", result.get(0).getClosePrice().toPlainString());
        assertNull(result.get(0).getPreClosePrice());
        assertEquals("17.550", result.get(1).getClosePrice().toPlainString());
        assertEquals("18.000", result.get(1).getPreClosePrice().toPlainString());
        assertEquals("-2.5000", result.get(1).getChangePct().toPlainString());
        assertEquals("aktools:洛阳钼业", result.get(result.size() - 1).getSourceName());
    }

    @Test
    void fetchDailyKLine_whenTencentRowContainsDividendMetadata_shouldStillParse() {
        when(restTemplate.getForObject(eq("https://push2his.eastmoney.com/api/qt/stock/kline/get?secid=0.000630"
                + "&ut=fa5fd1943c7b386f172d6893dbfba10b&fields1=f1,f2,f3,f4,f5,f6"
                + "&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61&klt=101&fqt=1&end=20500000&lmt=2"), eq(String.class)))
                .thenReturn("{\"data\":{\"klines\":[]}}");
        when(restTemplate.getForObject(eq(TENCENT_000630_URL), eq(String.class)))
                .thenReturn(TENCENT_000630_RESPONSE);

        List<StockDailyKLineDTO> result = provider.fetchDailyKLine("000630", 2);

        assertEquals(2, result.size());
        assertEquals("000630.SZ", result.get(0).getSymbol());
        assertEquals("5.930", result.get(0).getClosePrice().toPlainString());
        assertEquals("6.250", result.get(1).getClosePrice().toPlainString());
        assertEquals("5.930", result.get(1).getPreClosePrice().toPlainString());
        assertEquals("5.3963", result.get(1).getChangePct().toPlainString());
        assertEquals("aktools:铜陵有色", result.get(result.size() - 1).getSourceName());
    }
}
