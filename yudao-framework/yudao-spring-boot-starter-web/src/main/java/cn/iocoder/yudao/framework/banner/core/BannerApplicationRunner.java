package cn.iocoder.yudao.framework.banner.core;

import cn.hutool.core.thread.ThreadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.util.ClassUtils;

import java.util.concurrent.TimeUnit;

/**
 * ?????????????????
 */
@Slf4j
public class BannerApplicationRunner implements ApplicationRunner {

    @Override
    public void run(ApplicationArguments args) {
        ThreadUtil.execute(() -> {
            ThreadUtil.sleep(1, TimeUnit.SECONDS);
            log.info("\n----------------------------------------------------------\n\t??????\n----------------------------------------------------------");

            if (isNotPresent("cn.iocoder.yudao.module.mes.framework.web.config.MesWebConfiguration")) {
                System.out.println("[MES ?? yudao-module-mes - ???]");
            }
            if (isNotPresent("cn.iocoder.yudao.module.ai.framework.web.config.AiWebConfiguration")) {
                System.out.println("[AI ?? yudao-module-ai - ???]");
            }
            if (isNotPresent("cn.iocoder.yudao.module.im.framework.web.config.ImWebConfiguration")) {
                System.out.println("[IM ?? yudao-module-im - ???]");
            }
        });
    }

    private static boolean isNotPresent(String className) {
        return !ClassUtils.isPresent(className, ClassUtils.getDefaultClassLoader());
    }

}
