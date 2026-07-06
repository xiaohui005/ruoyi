package cn.iocoder.yudao.framework.quartz.config;

import cn.iocoder.yudao.framework.quartz.core.scheduler.SchedulerManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.spi.TriggerFiredBundle;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.quartz.JobStoreType;
import org.springframework.boot.autoconfigure.quartz.QuartzAutoConfiguration;
import org.springframework.boot.autoconfigure.quartz.QuartzProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.scheduling.quartz.SpringBeanJobFactory;

import javax.sql.DataSource;
import java.time.Duration;
import java.util.Optional;
import java.util.Properties;

/**
 * 定时任务 Configuration
 */
@AutoConfiguration
@AutoConfigureAfter(QuartzAutoConfiguration.class)
@EnableConfigurationProperties(QuartzProperties.class)
@EnableScheduling
@Slf4j
public class YudaoQuartzAutoConfiguration {

    @Bean
    @ConditionalOnMissingBean(SchedulerFactoryBean.class)
    public SchedulerFactoryBean schedulerFactoryBean(QuartzProperties quartzProperties,
                                                     DataSource dataSource,
                                                     ApplicationContext applicationContext) {
        SchedulerFactoryBean factoryBean = new SchedulerFactoryBean();
        factoryBean.setSchedulerName(quartzProperties.getSchedulerName());
        factoryBean.setAutoStartup(quartzProperties.isAutoStartup());
        factoryBean.setWaitForJobsToCompleteOnShutdown(quartzProperties.isWaitForJobsToCompleteOnShutdown());
        factoryBean.setOverwriteExistingJobs(quartzProperties.isOverwriteExistingJobs());
        factoryBean.setApplicationContextSchedulerContextKey("applicationContext");
        factoryBean.setJobFactory(new AutowiringSpringBeanJobFactory(applicationContext.getAutowireCapableBeanFactory()));
        if (quartzProperties.getJobStoreType() == JobStoreType.JDBC) {
            factoryBean.setDataSource(dataSource);
        }

        Duration startupDelay = quartzProperties.getStartupDelay();
        if (startupDelay != null) {
            factoryBean.setStartupDelay((int) startupDelay.getSeconds());
        }

        Properties properties = new Properties();
        properties.putAll(quartzProperties.getProperties());
        factoryBean.setQuartzProperties(properties);
        return factoryBean;
    }

    @Bean
    public SchedulerManager schedulerManager(Optional<SchedulerFactoryBean> schedulerFactoryBean) throws SchedulerException {
        if (!schedulerFactoryBean.isPresent()) {
            log.info("[定时任务 - 已禁用][参考 https://doc.iocoder.cn/job/ 开启]");
            return new SchedulerManager(null);
        }
        Scheduler scheduler = schedulerFactoryBean.get().getScheduler();
        return new SchedulerManager(scheduler);
    }

    @RequiredArgsConstructor
    static class AutowiringSpringBeanJobFactory extends SpringBeanJobFactory {

        private final AutowireCapableBeanFactory beanFactory;

        @Override
        protected Object createJobInstance(TriggerFiredBundle bundle) throws Exception {
            Object job = super.createJobInstance(bundle);
            beanFactory.autowireBean(job);
            return job;
        }
    }

}
