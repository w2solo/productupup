package cn.iocoder.yudao.module.infra.framework.security.config;

import cn.iocoder.yudao.framework.security.config.AuthorizeRequestsCustomizer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AuthorizeHttpRequestsConfigurer;

/**
 * Infra 模块的 Security 配置
 */
@Configuration(proxyBeanMethods = false, value = "infraSecurityConfiguration")
public class SecurityConfiguration {

    @Value("${spring.boot.admin.context-path:''}")
    private String adminSeverContextPath;

    @Bean("infraAuthorizeRequestsCustomizer")
    public AuthorizeRequestsCustomizer authorizeRequestsCustomizer() {
        return new AuthorizeRequestsCustomizer() {

            @Override
            public void customize(AuthorizeHttpRequestsConfigurer<HttpSecurity>.AuthorizationManagerRequestMatcherRegistry registry) {
                // Swagger 接口文档
                registry.requestMatchers("/swagger-ui.html").anonymous()
                        .requestMatchers("/swagger-resources/**").anonymous()
                        .requestMatchers("/webjars/**").anonymous()
                        .requestMatchers("/*/api-docs").anonymous();
                // 积木报表
                registry.requestMatchers("/jmreport/**").anonymous();
                // Spring Boot Actuator 的安全配置
                registry.requestMatchers("/actuator").anonymous()
                        .requestMatchers("/actuator/**").anonymous();
                // Druid 监控
                registry.requestMatchers("/druid/**").anonymous();
                // Spring Boot Admin Server 的安全配置
                registry.requestMatchers(adminSeverContextPath).anonymous()
                        .requestMatchers(adminSeverContextPath + "/**").anonymous();
                // 文件读取
                registry.requestMatchers(buildAdminApi("/infra/file/*/get/**")).permitAll();
            }

        };
    }

}
