package cn.iocoder.yudao.module.stock.framework.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;

@Component
@ConfigurationProperties(prefix = "yudao.stock")
@Validated
@Data
public class StockProperties {

    private DataConfig data = new DataConfig();

    private Collect collect = new Collect();

    private AlertConfig alert = new AlertConfig();

    @Data
    public static class DataConfig {

        private String mode = "production";

        private ProviderConfig provider = new ProviderConfig();

        @Data
        public static class ProviderConfig {

            private String primary = "tushare";

            private String secondary = "aktools";

            private String backfill = "baostock";

            private boolean failoverEnabled = true;

            private Integer timeoutMs = 5000;
        }
    }

    @Data
    public static class Collect {

        private String marketCron = "0 0/3 9-15 ? * MON-FRI";

        private String watchlistCron = "0 0/1 9-15 ? * MON-FRI";
    }

    @Data
    public static class AlertConfig {

        private boolean enabled = true;

        private Tushare tushare = new Tushare();

        private Aktools aktools = new Aktools();

        private Wxpusher wxpusher = new Wxpusher();

        @Data
        public static class Tushare {

            private String token;

            private String baseUrl = "https://api.tushare.pro";
        }

        @Data
        public static class Aktools {

            private String baseUrl = "http://127.0.0.1:8081";
        }

        @Data
        public static class Wxpusher {

            private String sendUrl = "https://wxpusher.zjiecode.com/api/send/message";
        }
    }
}
