-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (arm64)
--
-- Host: 127.0.0.1    Database: s_puu
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `infra_api_access_log`
--

DROP TABLE IF EXISTS `infra_api_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_api_access_log` (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                        `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
                                        `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户编号',
                                        `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '用户类型',
                                        `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
                                        `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求方法名',
                                        `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求地址',
                                        `request_params` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求参数',
                                        `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
                                        `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
                                        `begin_time` datetime NOT NULL COMMENT '开始请求时间',
                                        `end_time` datetime NOT NULL COMMENT '结束请求时间',
                                        `duration` int NOT NULL COMMENT '执行时长',
                                        `result_code` int NOT NULL DEFAULT '0' COMMENT '结果码',
                                        `result_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '结果提示',
                                        `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                        `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35832 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='API 访问日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_api_access_log`
--

LOCK TABLES `infra_api_access_log` WRITE;
/*!40000 ALTER TABLE `infra_api_access_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_api_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_api_error_log`
--

DROP TABLE IF EXISTS `infra_api_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_api_error_log` (
                                       `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
                                       `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链路追踪编号\n     *\n     * 一般来说，通过链路追踪编号，可以将访问日志，错误日志，链路追踪日志，logger 打印日志等，结合在一起，从而进行排错。',
                                       `user_id` int NOT NULL DEFAULT '0' COMMENT '用户编号',
                                       `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '用户类型',
                                       `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名\n     *\n     * 目前读取 spring.application.name',
                                       `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求方法名',
                                       `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求地址',
                                       `request_params` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求参数',
                                       `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
                                       `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
                                       `exception_time` datetime NOT NULL COMMENT '异常发生时间',
                                       `exception_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '异常名\n     *\n     * {@link Throwable#getClass()} 的类全名',
                                       `exception_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常导致的消息\n     *\n     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getMessage(Throwable)}',
                                       `exception_root_cause_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常导致的根消息\n     *\n     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getRootCauseMessage(Throwable)}',
                                       `exception_stack_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常的栈轨迹\n     *\n     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getServiceException(Exception)}',
                                       `exception_class_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的类全名\n     *\n     * {@link StackTraceElement#getClassName()}',
                                       `exception_file_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的类文件\n     *\n     * {@link StackTraceElement#getFileName()}',
                                       `exception_method_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的方法名\n     *\n     * {@link StackTraceElement#getMethodName()}',
                                       `exception_line_number` int NOT NULL COMMENT '异常发生的方法所在行\n     *\n     * {@link StackTraceElement#getLineNumber()}',
                                       `process_status` tinyint NOT NULL COMMENT '处理状态',
                                       `process_time` datetime DEFAULT NULL COMMENT '处理时间',
                                       `process_user_id` int DEFAULT '0' COMMENT '处理用户编号',
                                       `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                       `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                       `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=966 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统异常日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_api_error_log`
--

LOCK TABLES `infra_api_error_log` WRITE;
/*!40000 ALTER TABLE `infra_api_error_log` DISABLE KEYS */;
INSERT INTO `infra_api_error_log` VALUES (965,'',0,2,'yudao-server','GET','/admin-api/system/notify-message/get-unread-count','{\"query\":{},\"body\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36','2023-06-10 19:03:23','org.springframework.dao.InvalidDataAccessApiUsageException','InvalidDataAccessApiUsageException: ERR invalid expire time in setex. channel: [id: 0xce5efb2b, L:/127.0.0.1:64536 - R:127.0.0.1/127.0.0.1:6379] command: (SETEX), promise: java.util.concurrent.CompletableFuture@123dcde9[Not completed, 1 dependents], params: [[111, 97, 117, 116, 104, 50, 95, 97, 99, 99, ...], 0, [123, 34, 99, 114, 101, 97, 116, 101, 84, 105, ...]]','RedisException: ERR invalid expire time in setex. channel: [id: 0xce5efb2b, L:/127.0.0.1:64536 - R:127.0.0.1/127.0.0.1:6379] command: (SETEX), promise: java.util.concurrent.CompletableFuture@123dcde9[Not completed, 1 dependents], params: [[111, 97, 117, 116, 104, 50, 95, 97, 99, 99, ...], 0, [123, 34, 99, 114, 101, 97, 116, 101, 84, 105, ...]]','org.springframework.dao.InvalidDataAccessApiUsageException: ERR invalid expire time in setex. channel: [id: 0xce5efb2b, L:/127.0.0.1:64536 - R:127.0.0.1/127.0.0.1:6379] command: (SETEX), promise: java.util.concurrent.CompletableFuture@123dcde9[Not completed, 1 dependents], params: [[111, 97, 117, 116, 104, 50, 95, 97, 99, 99, ...], 0, [123, 34, 99, 114, 101, 97, 116, 101, 84, 105, ...]]\n	at org.redisson.spring.data.connection.RedissonExceptionConverter.convert(RedissonExceptionConverter.java:52)\n	at org.redisson.spring.data.connection.RedissonExceptionConverter.convert(RedissonExceptionConverter.java:35)\n	at org.springframework.data.redis.PassThroughExceptionTranslationStrategy.translate(PassThroughExceptionTranslationStrategy.java:40)\n	at org.redisson.spring.data.connection.RedissonConnection.transform(RedissonConnection.java:209)\n	at org.redisson.spring.data.connection.RedissonConnection.syncFuture(RedissonConnection.java:204)\n	at org.redisson.spring.data.connection.RedissonConnection.sync(RedissonConnection.java:374)\n	at org.redisson.spring.data.connection.RedissonConnection.write(RedissonConnection.java:740)\n	at org.redisson.spring.data.connection.RedissonConnection.setEx(RedissonConnection.java:548)\n	at org.springframework.data.redis.connection.DefaultStringRedisConnection.setEx(DefaultStringRedisConnection.java:795)\n	at org.springframework.data.redis.core.DefaultValueOperations$8.potentiallyUsePsetEx(DefaultValueOperations.java:265)\n	at org.springframework.data.redis.core.DefaultValueOperations$8.doInRedis(DefaultValueOperations.java:258)\n	at org.springframework.data.redis.core.RedisTemplate.execute(RedisTemplate.java:406)\n	at org.springframework.data.redis.core.RedisTemplate.execute(RedisTemplate.java:373)\n	at org.springframework.data.redis.core.AbstractOperations.execute(AbstractOperations.java:97)\n	at org.springframework.data.redis.core.DefaultValueOperations.set(DefaultValueOperations.java:253)\n	at cn.iocoder.yudao.module.system.dal.redis.oauth2.OAuth2AccessTokenRedisDAO.set(OAuth2AccessTokenRedisDAO.java:40)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:196)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:752)\n	at org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:752)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:703)\n	at cn.iocoder.yudao.module.system.dal.redis.oauth2.OAuth2AccessTokenRedisDAO$$SpringCGLIB$$0.set(<generated>)\n	at cn.iocoder.yudao.module.system.service.oauth2.OAuth2TokenServiceImpl.getAccessToken(OAuth2TokenServiceImpl.java:99)\n	at cn.iocoder.yudao.module.system.service.oauth2.OAuth2TokenServiceImpl.checkAccessToken(OAuth2TokenServiceImpl.java:106)\n	at jdk.internal.reflect.GeneratedMethodAccessor165.invoke(Unknown Source)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:699)\n	at cn.iocoder.yudao.module.system.service.oauth2.OAuth2TokenServiceImpl$$SpringCGLIB$$0.checkAccessToken(<generated>)\n	at cn.iocoder.yudao.module.system.api.oauth2.OAuth2TokenApiImpl.checkAccessToken(OAuth2TokenApiImpl.java:33)\n	at cn.iocoder.yudao.framework.security.core.filter.TokenAuthenticationFilter.buildLoginUserByToken(TokenAuthenticationFilter.java:72)\n	at cn.iocoder.yudao.framework.security.core.filter.TokenAuthenticationFilter.doFilterInternal(TokenAuthenticationFilter.java:49)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.wrapFilter(ObservationFilterChainDecorator.java:186)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.doFilter(ObservationFilterChainDecorator.java:173)\n	at org.springframework.security.web.ObservationFilterChainDecorator$VirtualFilterChain.doFilter(ObservationFilterChainDecorator.java:134)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.wrapFilter(ObservationFilterChainDecorator.java:186)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.doFilter(ObservationFilterChainDecorator.java:173)\n	at org.springframework.security.web.ObservationFilterChainDecorator$VirtualFilterChain.doFilter(ObservationFilterChainDecorator.java:134)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.wrapFilter(ObservationFilterChainDecorator.java:186)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.doFilter(ObservationFilterChainDecorator.java:173)\n	at org.springframework.security.web.ObservationFilterChainDecorator$VirtualFilterChain.doFilter(ObservationFilterChainDecorator.java:134)\n	at org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.wrapFilter(ObservationFilterChainDecorator.java:186)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.doFilter(ObservationFilterChainDecorator.java:173)\n	at org.springframework.security.web.ObservationFilterChainDecorator$VirtualFilterChain.doFilter(ObservationFilterChainDecorator.java:134)\n	at org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\n	at org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.wrapFilter(ObservationFilterChainDecorator.java:186)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.doFilter(ObservationFilterChainDecorator.java:173)\n	at org.springframework.security.web.ObservationFilterChainDecorator$VirtualFilterChain.doFilter(ObservationFilterChainDecorator.java:134)\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.wrapFilter(ObservationFilterChainDecorator.java:186)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.doFilter(ObservationFilterChainDecorator.java:173)\n	at org.springframework.security.web.ObservationFilterChainDecorator$VirtualFilterChain.doFilter(ObservationFilterChainDecorator.java:134)\n	at org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.wrapFilter(ObservationFilterChainDecorator.java:186)\n	at org.springframework.security.web.ObservationFilterChainDecorator$AroundFilterObservation$SimpleAroundFilterObservation.lambda$wrap$0(ObservationFilterChainDecorator.java:280)\n	at org.springframework.security.web.ObservationFilterChainDecorator$ObservationFilter.doFilter(ObservationFilterChainDecorator.java:170)\n	at org.springframework.security.web.ObservationFilterChainDecorator$VirtualFilterChain.doFilter(ObservationFilterChainDecorator.java:134)\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:351)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at cn.iocoder.yudao.framework.tenant.core.web.TenantContextWebFilter.doFilterInternal(TenantContextWebFilter.java:30)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at org.springframework.web.filter.ServerHttpObservationFilter.doFilterInternal(ServerHttpObservationFilter.java:109)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at cn.iocoder.yudao.framework.tracer.core.filter.TraceFilter.doFilterInternal(TraceFilter.java:30)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:185)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:158)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:177)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:542)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:119)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:357)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:400)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:859)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1734)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:833)\nCaused by: org.redisson.client.RedisException: ERR invalid expire time in setex. channel: [id: 0xce5efb2b, L:/127.0.0.1:64536 - R:127.0.0.1/127.0.0.1:6379] command: (SETEX), promise: java.util.concurrent.CompletableFuture@123dcde9[Not completed, 1 dependents], params: [[111, 97, 117, 116, 104, 50, 95, 97, 99, 99, ...], 0, [123, 34, 99, 114, 101, 97, 116, 101, 84, 105, ...]]\n	at org.redisson.client.handler.CommandDecoder.decode(CommandDecoder.java:377)\n	at org.redisson.client.handler.CommandDecoder.decodeCommand(CommandDecoder.java:205)\n	at org.redisson.client.handler.CommandDecoder.decode(CommandDecoder.java:144)\n	at org.redisson.client.handler.CommandDecoder.decode(CommandDecoder.java:120)\n	at io.netty.handler.codec.ByteToMessageDecoder.decodeRemovalReentryProtection(ByteToMessageDecoder.java:529)\n	at io.netty.handler.codec.ReplayingDecoder.callDecode(ReplayingDecoder.java:366)\n	at io.netty.handler.codec.ByteToMessageDecoder.channelRead(ByteToMessageDecoder.java:290)\n	at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:444)\n	at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:420)\n	at io.netty.channel.AbstractChannelHandlerContext.fireChannelRead(AbstractChannelHandlerContext.java:412)\n	at io.netty.channel.DefaultChannelPipeline$HeadContext.channelRead(DefaultChannelPipeline.java:1410)\n	at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:440)\n	at io.netty.channel.AbstractChannelHandlerContext.invokeChannelRead(AbstractChannelHandlerContext.java:420)\n	at io.netty.channel.DefaultChannelPipeline.fireChannelRead(DefaultChannelPipeline.java:919)\n	at io.netty.channel.nio.AbstractNioByteChannel$NioByteUnsafe.read(AbstractNioByteChannel.java:166)\n	at io.netty.channel.nio.NioEventLoop.processSelectedKey(NioEventLoop.java:788)\n	at io.netty.channel.nio.NioEventLoop.processSelectedKeysOptimized(NioEventLoop.java:724)\n	at io.netty.channel.nio.NioEventLoop.processSelectedKeys(NioEventLoop.java:650)\n	at io.netty.channel.nio.NioEventLoop.run(NioEventLoop.java:562)\n	at io.netty.util.concurrent.SingleThreadEventExecutor$4.run(SingleThreadEventExecutor.java:997)\n	at io.netty.util.internal.ThreadExecutorMap$2.run(ThreadExecutorMap.java:74)\n	at io.netty.util.concurrent.FastThreadLocalRunnable.run(FastThreadLocalRunnable.java:30)\n	... 1 more\n','org.redisson.spring.data.connection.RedissonExceptionConverter','RedissonExceptionConverter.java','convert',52,0,NULL,0,NULL,'2023-06-10 19:03:23',NULL,'2023-06-10 19:03:23',_binary '\0',1);
/*!40000 ALTER TABLE `infra_api_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_codegen_column`
--

DROP TABLE IF EXISTS `infra_codegen_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_codegen_column` (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                        `table_id` bigint NOT NULL COMMENT '表编号',
                                        `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名',
                                        `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段类型',
                                        `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段描述',
                                        `nullable` bit(1) NOT NULL COMMENT '是否允许为空',
                                        `primary_key` bit(1) NOT NULL COMMENT '是否主键',
                                        `auto_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否自增',
                                        `ordinal_position` int NOT NULL COMMENT '排序',
                                        `java_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 属性类型',
                                        `java_field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 属性名',
                                        `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
                                        `example` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据示例',
                                        `create_operation` bit(1) NOT NULL COMMENT '是否为 Create 创建操作的字段',
                                        `update_operation` bit(1) NOT NULL COMMENT '是否为 Update 更新操作的字段',
                                        `list_operation` bit(1) NOT NULL COMMENT '是否为 List 查询操作的字段',
                                        `list_operation_condition` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=' COMMENT 'List 查询操作的条件类型',
                                        `list_operation_result` bit(1) NOT NULL COMMENT '是否为 List 查询操作的返回字段',
                                        `html_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '显示类型',
                                        `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1725 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成表字段定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_codegen_column`
--

LOCK TABLES `infra_codegen_column` WRITE;
/*!40000 ALTER TABLE `infra_codegen_column` DISABLE KEYS */;
INSERT INTO `infra_codegen_column` VALUES (1627,125,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','30268',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1628,125,'product_id','BIGINT','项目id',_binary '\0',_binary '\0','0',2,'Long','productId','','9840',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1629,125,'title','VARCHAR','标题',_binary '\0',_binary '\0','0',3,'String','title','',NULL,_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1630,125,'detail','LONGVARCHAR','内容',_binary '\0',_binary '\0','0',4,'String','detail','',NULL,_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1631,125,'feedback_category_id','BIGINT','反馈分类id',_binary '',_binary '\0','0',5,'Long','feedbackCategoryId','','15370',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1632,125,'roadmap_added','BIT','是否添加到roadmap',_binary '\0',_binary '\0','0',6,'Boolean','roadmapAdded','',NULL,_binary '',_binary '',_binary '','=',_binary '','radio','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1633,125,'progress','INTEGER','进度类型',_binary '',_binary '\0','0',7,'Integer','progress','',NULL,_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1634,125,'status','INTEGER','状态：公开、不公开等，默认公开',_binary '\0',_binary '\0','0',8,'Integer','status','','2',_binary '',_binary '',_binary '','=',_binary '','radio','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1635,125,'merged_id','BIGINT','被合并到某反馈下',_binary '',_binary '\0','0',9,'Long','mergedId','','8150',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1636,125,'user_environment','LONGVARCHAR','用户环境',_binary '',_binary '\0','0',10,'String','userEnvironment','',NULL,_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1637,125,'creator','BIGINT','创建人',_binary '',_binary '\0','0',11,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1638,125,'updater','BIGINT','更新人',_binary '',_binary '\0','0',12,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1639,125,'create_time','TIMESTAMP','创建时间',_binary '',_binary '\0','0',13,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1640,125,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',14,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1641,125,'deleted','BIT','是否删除',_binary '',_binary '\0','0',15,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(1642,126,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','18700',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1643,126,'feedback_id','BIGINT','反馈id',_binary '\0',_binary '\0','0',2,'Long','feedbackId','','10726',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1644,126,'attachment_id','BIGINT','文件id',_binary '\0',_binary '\0','0',3,'Long','attachmentId','','29849',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1645,126,'creator','BIGINT','创建人',_binary '',_binary '\0','0',4,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1646,126,'updater','BIGINT','更新人',_binary '',_binary '\0','0',5,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1647,126,'create_time','TIMESTAMP','创建时间',_binary '',_binary '\0','0',6,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1648,126,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',7,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1649,126,'deleted','BIT','是否删除',_binary '\0',_binary '\0','0',8,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1650,127,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','8138',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1651,127,'product_id','BIGINT','项目id',_binary '\0',_binary '\0','0',2,'Long','productId','','5890',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1652,127,'name','VARCHAR','分类名称',_binary '',_binary '\0','0',3,'String','name','','赵六',_binary '',_binary '',_binary '','LIKE',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1653,127,'creator','BIGINT','创建人',_binary '',_binary '\0','0',4,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1654,127,'updater','BIGINT','更新人',_binary '',_binary '\0','0',5,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1655,127,'create_time','TIMESTAMP','创建时间',_binary '',_binary '\0','0',6,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1656,127,'update_time','TIMESTAMP','更新人',_binary '',_binary '\0','0',7,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1657,127,'deleted','BIT','是否删除',_binary '\0',_binary '\0','0',8,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1658,128,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','25755',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1659,128,'feedback_id','BIGINT','关联的反馈id',_binary '\0',_binary '\0','0',2,'Long','feedbackId','','9410',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1660,128,'content','LONGVARCHAR','评论详情',_binary '\0',_binary '\0','0',3,'String','content','',NULL,_binary '',_binary '',_binary '','=',_binary '','editor','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1661,128,'official','BIT','是否是官方回复',_binary '',_binary '\0','0',4,'Boolean','official','',NULL,_binary '',_binary '',_binary '','=',_binary '','radio','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1662,128,'creator','BIGINT','创建人',_binary '\0',_binary '\0','0',5,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1663,128,'updater','BIGINT','更新人',_binary '',_binary '\0','0',6,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1664,128,'create_time','TIMESTAMP','创建时间',_binary '',_binary '\0','0',7,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1665,128,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',8,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1666,128,'deleted','BIT','是否删除',_binary '\0',_binary '\0','0',9,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1667,129,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','18341',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1668,129,'feedback_comment_id','BIGINT','反馈的评论id',_binary '\0',_binary '\0','0',2,'Long','feedbackCommentId','','29119',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1669,129,'attachment_id','BIGINT','文件id',_binary '\0',_binary '\0','0',3,'Long','attachmentId','','10798',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1670,129,'creator','BIGINT','创建人',_binary '',_binary '\0','0',4,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1671,129,'updater','BIGINT','更新人',_binary '',_binary '\0','0',5,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1672,129,'create_time','TIMESTAMP','创建时间',_binary '',_binary '\0','0',6,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1673,129,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',7,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1674,129,'deleted','BIT','是否删除',_binary '\0',_binary '\0','0',8,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1675,130,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','13939',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1676,130,'tag_name','VARCHAR','标签名称',_binary '\0',_binary '\0','0',2,'String','tagName','','赵六',_binary '',_binary '',_binary '','LIKE',_binary '','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1677,130,'creator','BIGINT','创建人',_binary '',_binary '\0','0',3,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1678,130,'updater','BIGINT','更新人',_binary '',_binary '\0','0',4,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1679,130,'create_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',5,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1680,130,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',6,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1681,130,'deleted','BIT','是否删除',_binary '\0',_binary '\0','0',7,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(1682,131,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','11238',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1683,131,'feedback_id','BIGINT','反馈id',_binary '\0',_binary '\0','0',2,'Long','feedbackId','','18337',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1684,131,'feedback_tag_id','BIGINT','反馈标签id',_binary '\0',_binary '\0','0',3,'Long','feedbackTagId','','27225',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1685,131,'creator','BIGINT','创建人',_binary '',_binary '\0','0',4,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1686,131,'updater','BIGINT','更新人',_binary '',_binary '\0','0',5,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1687,131,'create_time','TIMESTAMP','创建时间',_binary '',_binary '\0','0',6,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1688,131,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',7,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1689,131,'deleted','BIT','是否删除',_binary '\0',_binary '\0','0',8,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1690,132,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','11056',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1691,132,'feedback_id','BIGINT','反馈id',_binary '\0',_binary '\0','0',2,'Long','feedbackId','','10017',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1692,132,'vote_user_id','BIGINT','投票人',_binary '\0',_binary '\0','0',3,'Long','voteUserId','','16464',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1693,132,'creator','BIGINT','创建人',_binary '',_binary '\0','0',4,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1694,132,'updater','BIGINT','更新人',_binary '',_binary '\0','0',5,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1695,132,'create_time','TIMESTAMP','创建时间',_binary '',_binary '\0','0',6,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1696,132,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',7,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1697,132,'deleted','BIT','是否删除',_binary '\0',_binary '\0','0',8,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1698,133,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','18274',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1699,133,'title','VARCHAR','公告标题',_binary '\0',_binary '\0','0',2,'String','title','',NULL,_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1700,133,'content','LONGVARCHAR','公告内容',_binary '',_binary '\0','0',3,'String','content','',NULL,_binary '',_binary '',_binary '','=',_binary '','editor','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1701,133,'jump_url','VARCHAR','跳转地址',_binary '',_binary '\0','0',4,'String','jumpUrl','','https://www.iocoder.cn',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1702,133,'creator','BIGINT','创建人',_binary '',_binary '\0','0',5,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1703,133,'updater','BIGINT','更新人\n',_binary '',_binary '\0','0',6,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1704,133,'create_time','TIMESTAMP','创建时间',_binary '',_binary '\0','0',7,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1705,133,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',8,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1706,133,'deleted','BIT','是否删除',_binary '',_binary '\0','0',9,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1707,133,'product_id','BIGINT','项目id',_binary '',_binary '\0','0',10,'Long','productId','','24911',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1708,134,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','16988',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1709,134,'creator','BIGINT','创建人',_binary '',_binary '\0','0',2,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1710,134,'name','VARCHAR','项目名称',_binary '',_binary '\0','0',3,'String','name','','李四',_binary '',_binary '',_binary '','LIKE',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1711,134,'create_time','TIMESTAMP','创建时间',_binary '',_binary '\0','0',4,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1712,134,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',5,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1713,134,'deleted','BIT','是否删除',_binary '',_binary '\0','0',6,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1714,135,'id','BIGINT','主键',_binary '\0',_binary '','1',1,'Long','id','','6533',_binary '\0',_binary '',_binary '\0','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1715,135,'title','VARCHAR','版本标题',_binary '',_binary '\0','0',2,'String','title','',NULL,_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1716,135,'version_name','VARCHAR','版本名称',_binary '\0',_binary '\0','0',3,'String','versionName','','李四',_binary '',_binary '',_binary '','LIKE',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1717,135,'version_code','INTEGER','版本号',_binary '\0',_binary '\0','0',4,'Integer','versionCode','',NULL,_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1718,135,'content','LONGVARCHAR','版本内容',_binary '',_binary '\0','0',5,'String','content','',NULL,_binary '',_binary '',_binary '','=',_binary '','editor','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1719,135,'creator','BIGINT','创建人',_binary '',_binary '\0','0',6,'Long','creator','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1720,135,'updater','BIGINT','更新人',_binary '',_binary '\0','0',7,'Long','updater','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1721,135,'create_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',8,'LocalDateTime','createTime','',NULL,_binary '\0',_binary '\0',_binary '','BETWEEN',_binary '','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1722,135,'update_time','TIMESTAMP','更新时间',_binary '',_binary '\0','0',9,'LocalDateTime','updateTime','',NULL,_binary '\0',_binary '\0',_binary '\0','BETWEEN',_binary '\0','datetime','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1723,135,'deleted','BIT','是否删除',_binary '',_binary '\0','0',10,'Boolean','deleted','',NULL,_binary '\0',_binary '\0',_binary '\0','=',_binary '\0','radio','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(1724,135,'product_id','BIGINT','项目id',_binary '',_binary '\0','0',11,'Long','productId','','4853',_binary '',_binary '',_binary '','=',_binary '','input','1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0');
/*!40000 ALTER TABLE `infra_codegen_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_codegen_table`
--

DROP TABLE IF EXISTS `infra_codegen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_codegen_table` (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                       `data_source_config_id` bigint NOT NULL COMMENT '数据源配置的编号',
                                       `scene` tinyint NOT NULL DEFAULT '1' COMMENT '生成场景',
                                       `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名称',
                                       `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表描述',
                                       `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                       `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块名',
                                       `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务名',
                                       `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类名称',
                                       `class_comment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类描述',
                                       `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者',
                                       `template_type` tinyint NOT NULL DEFAULT '1' COMMENT '模板类型',
                                       `parent_menu_id` bigint DEFAULT NULL COMMENT '父菜单编号',
                                       `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                       `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成表定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_codegen_table`
--

LOCK TABLES `infra_codegen_table` WRITE;
/*!40000 ALTER TABLE `infra_codegen_table` DISABLE KEYS */;
INSERT INTO `infra_codegen_table` VALUES (125,0,1,'puu_feedback','反馈表',NULL,'puu','feedback','Feedback','反馈','芋道源码',1,NULL,'1','2023-06-10 18:56:44','1','2023-06-10 18:56:44',_binary '\0'),(126,0,1,'puu_feedback_attachment_ref','反馈关联的文件，多堆多',NULL,'puu','feedbackattachmentref','FeedbackAttachmentRef','反馈关联的文件，多堆多','芋道源码',1,NULL,'1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(127,0,1,'puu_feedback_category','反馈分类',NULL,'puu','feedbackcategory','FeedbackCategory','反馈分类','芋道源码',1,NULL,'1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(128,0,1,'puu_feedback_comment','反馈评论',NULL,'puu','feedbackcomment','FeedbackComment','反馈评论','芋道源码',1,NULL,'1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(129,0,1,'puu_feedback_comment_attachment_ref','评论附件，多堆多',NULL,'puu','feedbackcommentattachmentref','FeedbackCommentAttachmentRef','评论附件，多堆多','芋道源码',1,NULL,'1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(130,0,1,'puu_feedback_tag','反馈标签',NULL,'puu','feedbacktag','FeedbackTag','反馈标签','芋道源码',1,NULL,'1','2023-06-10 18:57:10','1','2023-06-10 18:57:10',_binary '\0'),(131,0,1,'puu_feedback_tag_ref','反馈的标签，多堆多',NULL,'puu','feedbacktagref','FeedbackTagRef','反馈的标签，多堆多','芋道源码',1,NULL,'1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(132,0,1,'puu_feedback_vote','反馈投票',NULL,'puu','feedbackvote','FeedbackVote','反馈投票','芋道源码',1,NULL,'1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(133,0,1,'puu_notice','公告表',NULL,'puu','notice','Notice','公告','芋道源码',1,NULL,'1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(134,0,1,'puu_product','项目表',NULL,'puu','product','Product','项目','芋道源码',1,NULL,'1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0'),(135,0,1,'puu_version_history','版本历史表',NULL,'puu','versionhistory','VersionHistory','版本历史','芋道源码',1,NULL,'1','2023-06-10 18:57:11','1','2023-06-10 18:57:11',_binary '\0');
/*!40000 ALTER TABLE `infra_codegen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_config`
--

DROP TABLE IF EXISTS `infra_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_config` (
                                `id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                                `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数分组',
                                `type` tinyint NOT NULL COMMENT '参数类型',
                                `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名称',
                                `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数键名',
                                `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数键值',
                                `visible` bit(1) NOT NULL COMMENT '是否可见',
                                `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_config`
--

LOCK TABLES `infra_config` WRITE;
/*!40000 ALTER TABLE `infra_config` DISABLE KEYS */;
INSERT INTO `infra_config` VALUES (1,'ui',1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue',_binary '\0','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow','admin','2021-01-05 17:03:48','1','2022-03-26 23:10:31',_binary '\0'),(2,'biz',1,'用户管理-账号初始密码','sys.user.init-password','123456',_binary '\0','初始化密码 123456','admin','2021-01-05 17:03:48','1','2022-03-20 02:25:51',_binary '\0'),(3,'ui',1,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark',_binary '\0','深色主题theme-dark，浅色主题theme-light','admin','2021-01-05 17:03:48','','2021-01-19 03:05:21',_binary '\0'),(4,'1',2,'xxx','demo.test','10',_binary '\0','5','','2021-01-19 03:10:26','','2021-01-20 09:25:55',_binary '\0'),(5,'xxx',2,'xxx','xxx','xxx',_binary '','xxx','','2021-02-09 20:06:47','','2021-02-09 20:06:47',_binary '\0'),(6,'biz',2,'登陆验证码的开关','yudao.captcha.enable','false',_binary '',NULL,'1','2022-02-17 00:03:11','1','2022-09-04 04:23:35',_binary '\0');
/*!40000 ALTER TABLE `infra_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_data_source_config`
--

DROP TABLE IF EXISTS `infra_data_source_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_data_source_config` (
                                            `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键编号',
                                            `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名称',
                                            `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据源连接',
                                            `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
                                            `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
                                            `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                            `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                            `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                            `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据源配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_data_source_config`
--

LOCK TABLES `infra_data_source_config` WRITE;
/*!40000 ALTER TABLE `infra_data_source_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_data_source_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_file`
--

DROP TABLE IF EXISTS `infra_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file` (
                              `id` bigint NOT NULL AUTO_INCREMENT COMMENT '文件编号',
                              `config_id` bigint DEFAULT NULL COMMENT '配置编号',
                              `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名',
                              `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
                              `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件 URL',
                              `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
                              `size` int NOT NULL COMMENT '文件大小',
                              `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_file`
--

LOCK TABLES `infra_file` WRITE;
/*!40000 ALTER TABLE `infra_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_file_config`
--

DROP TABLE IF EXISTS `infra_file_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file_config` (
                                     `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                     `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名',
                                     `storage` tinyint NOT NULL COMMENT '存储器',
                                     `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                     `master` bit(1) NOT NULL COMMENT '是否为主配置',
                                     `config` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '存储配置',
                                     `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                     `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                     `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_file_config`
--

LOCK TABLES `infra_file_config` WRITE;
/*!40000 ALTER TABLE `infra_file_config` DISABLE KEYS */;
INSERT INTO `infra_file_config` VALUES (4,'数据库',1,'我是数据库',_binary '\0','{\"@class\":\"cn.iocoder.yudao.framework.file.core.client.db.DBFileClientConfig\",\"domain\":\"http://127.0.0.1:48080\"}','1','2022-03-15 23:56:24','1','2022-03-26 21:39:26',_binary '\0'),(5,'本地磁盘',10,'测试下本地存储',_binary '\0','{\"@class\":\"cn.iocoder.yudao.framework.file.core.client.local.LocalFileClientConfig\",\"basePath\":\"/Users/yunai/file_test\",\"domain\":\"http://127.0.0.1:48080\"}','1','2022-03-15 23:57:00','1','2022-03-26 21:39:26',_binary '\0'),(11,'S3 - 七牛云',20,NULL,_binary '','{\"@class\":\"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"s3-cn-south-1.qiniucs.com\",\"domain\":\"http://test.yudao.iocoder.cn\",\"bucket\":\"ruoyi-vue-pro\",\"accessKey\":\"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\",\"accessSecret\":\"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}','1','2022-03-19 18:00:03','1','2022-03-26 21:39:26',_binary '\0'),(15,'S3 - 七牛云',20,'',_binary '\0','{\"@class\":\"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"s3-cn-south-1.qiniucs.com\",\"domain\":\"http://test.yudao.iocoder.cn\",\"bucket\":\"ruoyi-vue-pro\",\"accessKey\":\"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\",\"accessSecret\":\"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}','1','2022-06-10 20:50:41','1','2022-06-10 20:50:41',_binary '\0'),(16,'S3 - 七牛云',20,'',_binary '\0','{\"@class\":\"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"s3-cn-south-1.qiniucs.com\",\"domain\":\"http://test.yudao.iocoder.cn\",\"bucket\":\"ruoyi-vue-pro\",\"accessKey\":\"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\",\"accessSecret\":\"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}','1','2022-06-11 20:32:08','1','2022-06-11 20:32:08',_binary '\0'),(17,'S3 - 七牛云',20,'',_binary '\0','{\"@class\":\"cn.iocoder.yudao.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"s3-cn-south-1.qiniucs.com\",\"domain\":\"http://test.yudao.iocoder.cn\",\"bucket\":\"ruoyi-vue-pro\",\"accessKey\":\"b7yvuhBSAGjmtPhMFcn9iMOxUOY_I06cA_p0ZUx8\",\"accessSecret\":\"kXM1l5ia1RvSX3QaOEcwI3RLz3Y2rmNszWonKZtP\"}','1','2022-06-11 20:32:47','1','2022-06-21 08:14:54',_binary '\0');
/*!40000 ALTER TABLE `infra_file_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_file_content`
--

DROP TABLE IF EXISTS `infra_file_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_file_content` (
                                      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                      `config_id` bigint NOT NULL COMMENT '配置编号',
                                      `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
                                      `content` mediumblob NOT NULL COMMENT '文件内容',
                                      `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_file_content`
--

LOCK TABLES `infra_file_content` WRITE;
/*!40000 ALTER TABLE `infra_file_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_file_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_job`
--

DROP TABLE IF EXISTS `infra_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_job` (
                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务编号',
                             `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
                             `status` tinyint NOT NULL COMMENT '任务状态',
                             `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理器的名字',
                             `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '处理器的参数',
                             `cron_expression` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CRON 表达式',
                             `retry_count` int NOT NULL DEFAULT '0' COMMENT '重试次数',
                             `retry_interval` int NOT NULL DEFAULT '0' COMMENT '重试间隔',
                             `monitor_timeout` int NOT NULL DEFAULT '0' COMMENT '监控超时时间',
                             `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_job`
--

LOCK TABLES `infra_job` WRITE;
/*!40000 ALTER TABLE `infra_job` DISABLE KEYS */;
INSERT INTO `infra_job` VALUES (5,'支付通知 Job',1,'payNotifyJob',NULL,'* * * * * ?',0,0,0,'1','2021-10-27 08:34:42','1','2022-11-24 23:01:35',_binary '\0'),(16,'Job 示例',1,'demoJob',NULL,'* * * L * ?',1,1,0,'1','2022-09-24 22:31:41','1','2022-09-24 22:31:42',_binary '\0');
/*!40000 ALTER TABLE `infra_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_job_log`
--

DROP TABLE IF EXISTS `infra_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_job_log` (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志编号',
                                 `job_id` bigint NOT NULL COMMENT '任务编号',
                                 `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理器的名字',
                                 `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '处理器的参数',
                                 `execute_index` tinyint NOT NULL DEFAULT '1' COMMENT '第几次执行',
                                 `begin_time` datetime NOT NULL COMMENT '开始执行时间',
                                 `end_time` datetime DEFAULT NULL COMMENT '结束执行时间',
                                 `duration` int DEFAULT NULL COMMENT '执行时长',
                                 `status` tinyint NOT NULL COMMENT '任务状态',
                                 `result` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '结果数据',
                                 `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_job_log`
--

LOCK TABLES `infra_job_log` WRITE;
/*!40000 ALTER TABLE `infra_job_log` DISABLE KEYS */;
INSERT INTO `infra_job_log` VALUES (60489,5,'payNotifyJob',NULL,1,'2023-06-10 16:36:53','2023-06-10 16:36:53',70,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:36:53',NULL,'2023-06-10 16:36:53',_binary '\0'),(60490,5,'payNotifyJob',NULL,1,'2023-06-10 16:36:53','2023-06-10 16:36:53',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:36:53',NULL,'2023-06-10 16:36:53',_binary '\0'),(60491,5,'payNotifyJob',NULL,1,'2023-06-10 16:36:54','2023-06-10 16:36:54',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:36:54',NULL,'2023-06-10 16:36:54',_binary '\0'),(60492,5,'payNotifyJob',NULL,1,'2023-06-10 16:36:55','2023-06-10 16:36:55',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:36:55',NULL,'2023-06-10 16:36:55',_binary '\0'),(60493,5,'payNotifyJob',NULL,1,'2023-06-10 16:36:56','2023-06-10 16:36:56',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:36:56',NULL,'2023-06-10 16:36:56',_binary '\0'),(60494,5,'payNotifyJob',NULL,1,'2023-06-10 16:36:57','2023-06-10 16:36:57',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:36:57',NULL,'2023-06-10 16:36:57',_binary '\0'),(60495,5,'payNotifyJob',NULL,1,'2023-06-10 16:36:58','2023-06-10 16:36:58',15,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:36:58',NULL,'2023-06-10 16:36:58',_binary '\0'),(60496,5,'payNotifyJob',NULL,1,'2023-06-10 16:36:59','2023-06-10 16:36:59',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:36:59',NULL,'2023-06-10 16:36:59',_binary '\0'),(60497,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:00','2023-06-10 16:37:00',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:00',NULL,'2023-06-10 16:37:00',_binary '\0'),(60498,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:01','2023-06-10 16:37:01',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:01',NULL,'2023-06-10 16:37:01',_binary '\0'),(60499,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:02','2023-06-10 16:37:02',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:02',NULL,'2023-06-10 16:37:02',_binary '\0'),(60500,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:03','2023-06-10 16:37:03',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:03',NULL,'2023-06-10 16:37:03',_binary '\0'),(60501,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:04','2023-06-10 16:37:04',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:04',NULL,'2023-06-10 16:37:04',_binary '\0'),(60502,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:05','2023-06-10 16:37:05',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:05',NULL,'2023-06-10 16:37:05',_binary '\0'),(60503,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:06','2023-06-10 16:37:06',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:06',NULL,'2023-06-10 16:37:06',_binary '\0'),(60504,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:07','2023-06-10 16:37:07',9,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:07',NULL,'2023-06-10 16:37:07',_binary '\0'),(60505,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:08','2023-06-10 16:37:08',31,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:08',NULL,'2023-06-10 16:37:08',_binary '\0'),(60506,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:09','2023-06-10 16:37:09',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:09',NULL,'2023-06-10 16:37:09',_binary '\0'),(60507,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:10','2023-06-10 16:37:10',14,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:10',NULL,'2023-06-10 16:37:10',_binary '\0'),(60508,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:11','2023-06-10 16:37:11',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:11',NULL,'2023-06-10 16:37:11',_binary '\0'),(60509,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:12','2023-06-10 16:37:12',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:12',NULL,'2023-06-10 16:37:12',_binary '\0'),(60510,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:13','2023-06-10 16:37:13',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:13',NULL,'2023-06-10 16:37:13',_binary '\0'),(60511,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:14','2023-06-10 16:37:14',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:14',NULL,'2023-06-10 16:37:14',_binary '\0'),(60512,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:15','2023-06-10 16:37:15',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:15',NULL,'2023-06-10 16:37:15',_binary '\0'),(60513,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:16','2023-06-10 16:37:16',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:16',NULL,'2023-06-10 16:37:16',_binary '\0'),(60514,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:17','2023-06-10 16:37:17',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:17',NULL,'2023-06-10 16:37:17',_binary '\0'),(60515,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:18','2023-06-10 16:37:18',13,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:18',NULL,'2023-06-10 16:37:18',_binary '\0'),(60516,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:19','2023-06-10 16:37:19',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:19',NULL,'2023-06-10 16:37:19',_binary '\0'),(60517,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:20','2023-06-10 16:37:20',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:20',NULL,'2023-06-10 16:37:20',_binary '\0'),(60518,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:21','2023-06-10 16:37:21',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:21',NULL,'2023-06-10 16:37:21',_binary '\0'),(60519,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:22','2023-06-10 16:37:22',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:22',NULL,'2023-06-10 16:37:22',_binary '\0'),(60520,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:23','2023-06-10 16:37:23',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:23',NULL,'2023-06-10 16:37:23',_binary '\0'),(60521,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:24','2023-06-10 16:37:24',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:24',NULL,'2023-06-10 16:37:24',_binary '\0'),(60522,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:25','2023-06-10 16:37:25',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:25',NULL,'2023-06-10 16:37:25',_binary '\0'),(60523,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:26','2023-06-10 16:37:26',14,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:26',NULL,'2023-06-10 16:37:26',_binary '\0'),(60524,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:27','2023-06-10 16:37:27',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:27',NULL,'2023-06-10 16:37:27',_binary '\0'),(60525,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:28','2023-06-10 16:37:28',13,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:28',NULL,'2023-06-10 16:37:28',_binary '\0'),(60526,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:29','2023-06-10 16:37:29',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:29',NULL,'2023-06-10 16:37:29',_binary '\0'),(60527,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:30','2023-06-10 16:37:30',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:30',NULL,'2023-06-10 16:37:30',_binary '\0'),(60528,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:31','2023-06-10 16:37:31',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:31',NULL,'2023-06-10 16:37:31',_binary '\0'),(60529,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:32','2023-06-10 16:37:32',7,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:32',NULL,'2023-06-10 16:37:32',_binary '\0'),(60530,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:33','2023-06-10 16:37:33',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:33',NULL,'2023-06-10 16:37:33',_binary '\0'),(60531,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:34','2023-06-10 16:37:34',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:34',NULL,'2023-06-10 16:37:34',_binary '\0'),(60532,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:35','2023-06-10 16:37:35',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:35',NULL,'2023-06-10 16:37:35',_binary '\0'),(60533,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:36','2023-06-10 16:37:36',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:36',NULL,'2023-06-10 16:37:36',_binary '\0'),(60534,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:37','2023-06-10 16:37:37',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:37',NULL,'2023-06-10 16:37:37',_binary '\0'),(60535,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:38','2023-06-10 16:37:38',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:38',NULL,'2023-06-10 16:37:38',_binary '\0'),(60536,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:39','2023-06-10 16:37:39',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:39',NULL,'2023-06-10 16:37:39',_binary '\0'),(60537,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:40','2023-06-10 16:37:40',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:40',NULL,'2023-06-10 16:37:40',_binary '\0'),(60538,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:41','2023-06-10 16:37:41',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:41',NULL,'2023-06-10 16:37:41',_binary '\0'),(60539,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:42','2023-06-10 16:37:42',9,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:42',NULL,'2023-06-10 16:37:42',_binary '\0'),(60540,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:43','2023-06-10 16:37:43',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:43',NULL,'2023-06-10 16:37:43',_binary '\0'),(60541,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:44','2023-06-10 16:37:44',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:44',NULL,'2023-06-10 16:37:44',_binary '\0'),(60542,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:45','2023-06-10 16:37:45',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:45',NULL,'2023-06-10 16:37:45',_binary '\0'),(60543,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:46','2023-06-10 16:37:46',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:46',NULL,'2023-06-10 16:37:46',_binary '\0'),(60544,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:47','2023-06-10 16:37:47',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:47',NULL,'2023-06-10 16:37:47',_binary '\0'),(60545,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:48','2023-06-10 16:37:48',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:48',NULL,'2023-06-10 16:37:48',_binary '\0'),(60546,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:49','2023-06-10 16:37:49',13,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:49',NULL,'2023-06-10 16:37:49',_binary '\0'),(60547,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:50','2023-06-10 16:37:50',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:50',NULL,'2023-06-10 16:37:50',_binary '\0'),(60548,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:51','2023-06-10 16:37:51',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:51',NULL,'2023-06-10 16:37:51',_binary '\0'),(60549,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:52','2023-06-10 16:37:52',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:52',NULL,'2023-06-10 16:37:52',_binary '\0'),(60550,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:53','2023-06-10 16:37:53',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:53',NULL,'2023-06-10 16:37:53',_binary '\0'),(60551,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:54','2023-06-10 16:37:54',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:54',NULL,'2023-06-10 16:37:54',_binary '\0'),(60552,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:55','2023-06-10 16:37:55',9,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:55',NULL,'2023-06-10 16:37:55',_binary '\0'),(60553,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:56','2023-06-10 16:37:56',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:56',NULL,'2023-06-10 16:37:56',_binary '\0'),(60554,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:57','2023-06-10 16:37:57',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:57',NULL,'2023-06-10 16:37:57',_binary '\0'),(60555,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:58','2023-06-10 16:37:58',3,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:58',NULL,'2023-06-10 16:37:58',_binary '\0'),(60556,5,'payNotifyJob',NULL,1,'2023-06-10 16:37:59','2023-06-10 16:37:59',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:37:59',NULL,'2023-06-10 16:37:59',_binary '\0'),(60557,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:00','2023-06-10 16:38:00',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:00',NULL,'2023-06-10 16:38:00',_binary '\0'),(60558,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:01','2023-06-10 16:38:01',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:01',NULL,'2023-06-10 16:38:01',_binary '\0'),(60559,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:02','2023-06-10 16:38:02',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:02',NULL,'2023-06-10 16:38:02',_binary '\0'),(60560,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:03','2023-06-10 16:38:03',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:03',NULL,'2023-06-10 16:38:03',_binary '\0'),(60561,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:04','2023-06-10 16:38:04',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:04',NULL,'2023-06-10 16:38:04',_binary '\0'),(60562,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:05','2023-06-10 16:38:05',7,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:05',NULL,'2023-06-10 16:38:05',_binary '\0'),(60563,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:06','2023-06-10 16:38:06',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:06',NULL,'2023-06-10 16:38:06',_binary '\0'),(60564,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:07','2023-06-10 16:38:07',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:07',NULL,'2023-06-10 16:38:07',_binary '\0'),(60565,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:08','2023-06-10 16:38:08',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:08',NULL,'2023-06-10 16:38:08',_binary '\0'),(60566,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:09','2023-06-10 16:38:09',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:09',NULL,'2023-06-10 16:38:09',_binary '\0'),(60567,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:10','2023-06-10 16:38:10',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:10',NULL,'2023-06-10 16:38:10',_binary '\0'),(60568,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:11','2023-06-10 16:38:11',38,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:11',NULL,'2023-06-10 16:38:11',_binary '\0'),(60569,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:12','2023-06-10 16:38:12',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:12',NULL,'2023-06-10 16:38:12',_binary '\0'),(60570,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:13','2023-06-10 16:38:13',9,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:13',NULL,'2023-06-10 16:38:13',_binary '\0'),(60571,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:14','2023-06-10 16:38:14',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:14',NULL,'2023-06-10 16:38:14',_binary '\0'),(60572,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:15','2023-06-10 16:38:15',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:15',NULL,'2023-06-10 16:38:15',_binary '\0'),(60573,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:16','2023-06-10 16:38:16',3,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:16',NULL,'2023-06-10 16:38:16',_binary '\0'),(60574,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:17','2023-06-10 16:38:17',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:17',NULL,'2023-06-10 16:38:17',_binary '\0'),(60575,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:18','2023-06-10 16:38:18',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:18',NULL,'2023-06-10 16:38:18',_binary '\0'),(60576,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:19','2023-06-10 16:38:19',9,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:19',NULL,'2023-06-10 16:38:19',_binary '\0'),(60577,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:20','2023-06-10 16:38:20',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:20',NULL,'2023-06-10 16:38:20',_binary '\0'),(60578,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:21','2023-06-10 16:38:21',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:21',NULL,'2023-06-10 16:38:21',_binary '\0'),(60579,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:22','2023-06-10 16:38:22',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:22',NULL,'2023-06-10 16:38:22',_binary '\0'),(60580,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:23','2023-06-10 16:38:23',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:23',NULL,'2023-06-10 16:38:23',_binary '\0'),(60581,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:24','2023-06-10 16:38:24',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:24',NULL,'2023-06-10 16:38:24',_binary '\0'),(60582,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:25','2023-06-10 16:38:25',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:25',NULL,'2023-06-10 16:38:25',_binary '\0'),(60583,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:26','2023-06-10 16:38:26',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:26',NULL,'2023-06-10 16:38:26',_binary '\0'),(60584,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:27','2023-06-10 16:38:27',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:27',NULL,'2023-06-10 16:38:27',_binary '\0'),(60585,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:28','2023-06-10 16:38:28',9,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:28',NULL,'2023-06-10 16:38:28',_binary '\0'),(60586,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:29','2023-06-10 16:38:29',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:29',NULL,'2023-06-10 16:38:29',_binary '\0'),(60587,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:30','2023-06-10 16:38:30',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:30',NULL,'2023-06-10 16:38:30',_binary '\0'),(60588,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:31','2023-06-10 16:38:31',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:31',NULL,'2023-06-10 16:38:31',_binary '\0'),(60589,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:32','2023-06-10 16:38:32',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:32',NULL,'2023-06-10 16:38:32',_binary '\0'),(60590,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:33','2023-06-10 16:38:33',9,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:33',NULL,'2023-06-10 16:38:33',_binary '\0'),(60591,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:34','2023-06-10 16:38:34',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:34',NULL,'2023-06-10 16:38:34',_binary '\0'),(60592,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:35','2023-06-10 16:38:35',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:35',NULL,'2023-06-10 16:38:35',_binary '\0'),(60593,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:36','2023-06-10 16:38:36',3,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:36',NULL,'2023-06-10 16:38:36',_binary '\0'),(60594,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:37','2023-06-10 16:38:37',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:37',NULL,'2023-06-10 16:38:37',_binary '\0'),(60595,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:38','2023-06-10 16:38:38',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:38',NULL,'2023-06-10 16:38:38',_binary '\0'),(60596,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:39','2023-06-10 16:38:39',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:39',NULL,'2023-06-10 16:38:39',_binary '\0'),(60597,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:40','2023-06-10 16:38:40',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:40',NULL,'2023-06-10 16:38:40',_binary '\0'),(60598,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:41','2023-06-10 16:38:41',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:41',NULL,'2023-06-10 16:38:41',_binary '\0'),(60599,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:42','2023-06-10 16:38:42',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:42',NULL,'2023-06-10 16:38:42',_binary '\0'),(60600,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:43','2023-06-10 16:38:43',3,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:43',NULL,'2023-06-10 16:38:43',_binary '\0'),(60601,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:44','2023-06-10 16:38:44',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:44',NULL,'2023-06-10 16:38:44',_binary '\0'),(60602,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:45','2023-06-10 16:38:45',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:45',NULL,'2023-06-10 16:38:45',_binary '\0'),(60603,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:46','2023-06-10 16:38:46',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:46',NULL,'2023-06-10 16:38:46',_binary '\0'),(60604,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:47','2023-06-10 16:38:47',13,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:47',NULL,'2023-06-10 16:38:47',_binary '\0'),(60605,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:48','2023-06-10 16:38:48',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:48',NULL,'2023-06-10 16:38:48',_binary '\0'),(60606,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:49','2023-06-10 16:38:49',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:49',NULL,'2023-06-10 16:38:49',_binary '\0'),(60607,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:50','2023-06-10 16:38:50',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:50',NULL,'2023-06-10 16:38:50',_binary '\0'),(60608,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:51','2023-06-10 16:38:51',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:51',NULL,'2023-06-10 16:38:51',_binary '\0'),(60609,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:52','2023-06-10 16:38:52',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:52',NULL,'2023-06-10 16:38:52',_binary '\0'),(60610,5,'payNotifyJob',NULL,1,'2023-06-10 16:38:53','2023-06-10 16:38:53',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:38:53',NULL,'2023-06-10 16:38:53',_binary '\0'),(60611,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',61,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60612,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60613,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60614,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60615,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60616,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60617,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60618,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60619,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60620,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60621,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60622,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60623,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60624,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60625,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60626,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60627,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60628,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60629,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60630,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60631,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60632,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60633,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:16','2023-06-10 16:39:16',17,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:16',NULL,'2023-06-10 16:39:16',_binary '\0'),(60634,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:17','2023-06-10 16:39:17',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:17',NULL,'2023-06-10 16:39:17',_binary '\0'),(60635,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:18','2023-06-10 16:39:18',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:18',NULL,'2023-06-10 16:39:18',_binary '\0'),(60636,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:19','2023-06-10 16:39:19',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:19',NULL,'2023-06-10 16:39:19',_binary '\0'),(60637,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:20','2023-06-10 16:39:20',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:20',NULL,'2023-06-10 16:39:20',_binary '\0'),(60638,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:21','2023-06-10 16:39:21',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:21',NULL,'2023-06-10 16:39:21',_binary '\0'),(60639,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:22','2023-06-10 16:39:22',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:22',NULL,'2023-06-10 16:39:22',_binary '\0'),(60640,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:23','2023-06-10 16:39:23',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:23',NULL,'2023-06-10 16:39:23',_binary '\0'),(60641,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:24','2023-06-10 16:39:24',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:24',NULL,'2023-06-10 16:39:24',_binary '\0'),(60642,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:25','2023-06-10 16:39:25',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:25',NULL,'2023-06-10 16:39:25',_binary '\0'),(60643,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:26','2023-06-10 16:39:26',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:26',NULL,'2023-06-10 16:39:26',_binary '\0'),(60644,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:27','2023-06-10 16:39:27',13,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:27',NULL,'2023-06-10 16:39:27',_binary '\0'),(60645,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:28','2023-06-10 16:39:28',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:28',NULL,'2023-06-10 16:39:28',_binary '\0'),(60646,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:29','2023-06-10 16:39:29',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:29',NULL,'2023-06-10 16:39:29',_binary '\0'),(60647,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:30','2023-06-10 16:39:30',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:30',NULL,'2023-06-10 16:39:30',_binary '\0'),(60648,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:31','2023-06-10 16:39:31',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:31',NULL,'2023-06-10 16:39:31',_binary '\0'),(60649,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:32','2023-06-10 16:39:32',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:32',NULL,'2023-06-10 16:39:32',_binary '\0'),(60650,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:33','2023-06-10 16:39:33',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:33',NULL,'2023-06-10 16:39:33',_binary '\0'),(60651,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:34','2023-06-10 16:39:34',13,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:34',NULL,'2023-06-10 16:39:34',_binary '\0'),(60652,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:35','2023-06-10 16:39:35',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:35',NULL,'2023-06-10 16:39:35',_binary '\0'),(60653,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:36','2023-06-10 16:39:36',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:36',NULL,'2023-06-10 16:39:36',_binary '\0'),(60654,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:37','2023-06-10 16:39:37',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:37',NULL,'2023-06-10 16:39:37',_binary '\0'),(60655,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:38','2023-06-10 16:39:38',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:38',NULL,'2023-06-10 16:39:38',_binary '\0'),(60656,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:39','2023-06-10 16:39:39',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:39',NULL,'2023-06-10 16:39:39',_binary '\0'),(60657,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:40','2023-06-10 16:39:40',9,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:40',NULL,'2023-06-10 16:39:40',_binary '\0'),(60658,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:41','2023-06-10 16:39:41',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:41',NULL,'2023-06-10 16:39:41',_binary '\0'),(60659,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:42','2023-06-10 16:39:42',13,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:42',NULL,'2023-06-10 16:39:42',_binary '\0'),(60660,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:43','2023-06-10 16:39:43',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:43',NULL,'2023-06-10 16:39:43',_binary '\0'),(60661,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:44','2023-06-10 16:39:44',9,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:44',NULL,'2023-06-10 16:39:44',_binary '\0'),(60662,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:45','2023-06-10 16:39:45',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:45',NULL,'2023-06-10 16:39:45',_binary '\0'),(60663,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:46','2023-06-10 16:39:46',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:46',NULL,'2023-06-10 16:39:46',_binary '\0'),(60664,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:47','2023-06-10 16:39:47',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:47',NULL,'2023-06-10 16:39:47',_binary '\0'),(60665,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:48','2023-06-10 16:39:48',9,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:48',NULL,'2023-06-10 16:39:48',_binary '\0'),(60666,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:49','2023-06-10 16:39:49',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:49',NULL,'2023-06-10 16:39:49',_binary '\0'),(60667,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:50','2023-06-10 16:39:50',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:50',NULL,'2023-06-10 16:39:50',_binary '\0'),(60668,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:51','2023-06-10 16:39:51',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:51',NULL,'2023-06-10 16:39:51',_binary '\0'),(60669,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:52','2023-06-10 16:39:52',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:52',NULL,'2023-06-10 16:39:52',_binary '\0'),(60670,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:53','2023-06-10 16:39:53',3,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:53',NULL,'2023-06-10 16:39:53',_binary '\0'),(60671,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:54','2023-06-10 16:39:54',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:54',NULL,'2023-06-10 16:39:54',_binary '\0'),(60672,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:55','2023-06-10 16:39:55',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:55',NULL,'2023-06-10 16:39:55',_binary '\0'),(60673,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:56','2023-06-10 16:39:56',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:56',NULL,'2023-06-10 16:39:56',_binary '\0'),(60674,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:57','2023-06-10 16:39:57',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:57',NULL,'2023-06-10 16:39:57',_binary '\0'),(60675,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:58','2023-06-10 16:39:58',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:58',NULL,'2023-06-10 16:39:58',_binary '\0'),(60676,5,'payNotifyJob',NULL,1,'2023-06-10 16:39:59','2023-06-10 16:39:59',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:39:59',NULL,'2023-06-10 16:39:59',_binary '\0'),(60677,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:00','2023-06-10 16:40:00',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:00',NULL,'2023-06-10 16:40:00',_binary '\0'),(60678,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:01','2023-06-10 16:40:01',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:01',NULL,'2023-06-10 16:40:01',_binary '\0'),(60679,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:02','2023-06-10 16:40:02',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:02',NULL,'2023-06-10 16:40:02',_binary '\0'),(60680,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:03','2023-06-10 16:40:03',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:03',NULL,'2023-06-10 16:40:03',_binary '\0'),(60681,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:04','2023-06-10 16:40:04',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:04',NULL,'2023-06-10 16:40:04',_binary '\0'),(60682,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:05','2023-06-10 16:40:05',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:05',NULL,'2023-06-10 16:40:05',_binary '\0'),(60683,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:06','2023-06-10 16:40:06',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:06',NULL,'2023-06-10 16:40:06',_binary '\0'),(60684,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:07','2023-06-10 16:40:07',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:07',NULL,'2023-06-10 16:40:07',_binary '\0'),(60685,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:08','2023-06-10 16:40:08',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:08',NULL,'2023-06-10 16:40:08',_binary '\0'),(60686,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:09','2023-06-10 16:40:09',14,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:09',NULL,'2023-06-10 16:40:09',_binary '\0'),(60687,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:10','2023-06-10 16:40:10',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:10',NULL,'2023-06-10 16:40:10',_binary '\0'),(60688,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:11','2023-06-10 16:40:11',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:11',NULL,'2023-06-10 16:40:11',_binary '\0'),(60689,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:12','2023-06-10 16:40:12',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:12',NULL,'2023-06-10 16:40:12',_binary '\0'),(60690,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:13','2023-06-10 16:40:13',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:13',NULL,'2023-06-10 16:40:13',_binary '\0'),(60691,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:14','2023-06-10 16:40:14',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:14',NULL,'2023-06-10 16:40:14',_binary '\0'),(60692,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:15','2023-06-10 16:40:15',14,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:15',NULL,'2023-06-10 16:40:15',_binary '\0'),(60693,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:16','2023-06-10 16:40:16',34,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:16',NULL,'2023-06-10 16:40:16',_binary '\0'),(60694,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:17','2023-06-10 16:40:17',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:17',NULL,'2023-06-10 16:40:17',_binary '\0'),(60695,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:18','2023-06-10 16:40:18',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:18',NULL,'2023-06-10 16:40:18',_binary '\0'),(60696,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:19','2023-06-10 16:40:19',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:19',NULL,'2023-06-10 16:40:19',_binary '\0'),(60697,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:20','2023-06-10 16:40:20',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:20',NULL,'2023-06-10 16:40:20',_binary '\0'),(60698,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:21','2023-06-10 16:40:21',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:21',NULL,'2023-06-10 16:40:21',_binary '\0'),(60699,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:22','2023-06-10 16:40:22',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:22',NULL,'2023-06-10 16:40:22',_binary '\0'),(60700,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:23','2023-06-10 16:40:23',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:23',NULL,'2023-06-10 16:40:23',_binary '\0'),(60701,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:24','2023-06-10 16:40:24',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:24',NULL,'2023-06-10 16:40:24',_binary '\0'),(60702,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:25','2023-06-10 16:40:25',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:25',NULL,'2023-06-10 16:40:25',_binary '\0'),(60703,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:26','2023-06-10 16:40:26',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:26',NULL,'2023-06-10 16:40:26',_binary '\0'),(60704,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:27','2023-06-10 16:40:27',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:27',NULL,'2023-06-10 16:40:27',_binary '\0'),(60705,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:28','2023-06-10 16:40:28',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:28',NULL,'2023-06-10 16:40:28',_binary '\0'),(60706,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:29','2023-06-10 16:40:29',9,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:29',NULL,'2023-06-10 16:40:29',_binary '\0'),(60707,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:30','2023-06-10 16:40:30',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:30',NULL,'2023-06-10 16:40:30',_binary '\0'),(60708,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:31','2023-06-10 16:40:31',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:31',NULL,'2023-06-10 16:40:31',_binary '\0'),(60709,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:32','2023-06-10 16:40:32',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:32',NULL,'2023-06-10 16:40:32',_binary '\0'),(60710,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:33','2023-06-10 16:40:33',19,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:33',NULL,'2023-06-10 16:40:33',_binary '\0'),(60711,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:34','2023-06-10 16:40:34',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:34',NULL,'2023-06-10 16:40:34',_binary '\0'),(60712,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:35','2023-06-10 16:40:35',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:35',NULL,'2023-06-10 16:40:35',_binary '\0'),(60713,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:36','2023-06-10 16:40:36',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:36',NULL,'2023-06-10 16:40:36',_binary '\0'),(60714,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:37','2023-06-10 16:40:37',9,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:37',NULL,'2023-06-10 16:40:37',_binary '\0'),(60715,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:38','2023-06-10 16:40:38',7,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:38',NULL,'2023-06-10 16:40:38',_binary '\0'),(60716,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:39','2023-06-10 16:40:39',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:39',NULL,'2023-06-10 16:40:39',_binary '\0'),(60717,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:40','2023-06-10 16:40:40',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:40',NULL,'2023-06-10 16:40:40',_binary '\0'),(60718,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:41','2023-06-10 16:40:41',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:41',NULL,'2023-06-10 16:40:41',_binary '\0'),(60719,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:42','2023-06-10 16:40:42',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:42',NULL,'2023-06-10 16:40:42',_binary '\0'),(60720,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:43','2023-06-10 16:40:43',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:43',NULL,'2023-06-10 16:40:43',_binary '\0'),(60721,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:44','2023-06-10 16:40:44',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:44',NULL,'2023-06-10 16:40:44',_binary '\0'),(60722,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:45','2023-06-10 16:40:45',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:45',NULL,'2023-06-10 16:40:45',_binary '\0'),(60723,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:46','2023-06-10 16:40:46',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:46',NULL,'2023-06-10 16:40:46',_binary '\0'),(60724,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:47','2023-06-10 16:40:47',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:47',NULL,'2023-06-10 16:40:47',_binary '\0'),(60725,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:48','2023-06-10 16:40:48',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:48',NULL,'2023-06-10 16:40:48',_binary '\0'),(60726,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:49','2023-06-10 16:40:49',13,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:49',NULL,'2023-06-10 16:40:49',_binary '\0'),(60727,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:50','2023-06-10 16:40:50',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:50',NULL,'2023-06-10 16:40:50',_binary '\0'),(60728,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:51','2023-06-10 16:40:51',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:51',NULL,'2023-06-10 16:40:51',_binary '\0'),(60729,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:52','2023-06-10 16:40:52',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:52',NULL,'2023-06-10 16:40:52',_binary '\0'),(60730,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:53','2023-06-10 16:40:53',7,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:53',NULL,'2023-06-10 16:40:53',_binary '\0'),(60731,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:54','2023-06-10 16:40:54',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:54',NULL,'2023-06-10 16:40:54',_binary '\0'),(60732,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:55','2023-06-10 16:40:55',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:55',NULL,'2023-06-10 16:40:55',_binary '\0'),(60733,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:56','2023-06-10 16:40:56',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:56',NULL,'2023-06-10 16:40:56',_binary '\0'),(60734,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:57','2023-06-10 16:40:57',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:57',NULL,'2023-06-10 16:40:57',_binary '\0'),(60735,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:58','2023-06-10 16:40:58',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:58',NULL,'2023-06-10 16:40:58',_binary '\0'),(60736,5,'payNotifyJob',NULL,1,'2023-06-10 16:40:59','2023-06-10 16:40:59',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:40:59',NULL,'2023-06-10 16:40:59',_binary '\0'),(60737,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:00','2023-06-10 16:41:00',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:00',NULL,'2023-06-10 16:41:00',_binary '\0'),(60738,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:01','2023-06-10 16:41:01',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:01',NULL,'2023-06-10 16:41:01',_binary '\0'),(60739,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:02','2023-06-10 16:41:02',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:02',NULL,'2023-06-10 16:41:02',_binary '\0'),(60740,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:03','2023-06-10 16:41:03',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:03',NULL,'2023-06-10 16:41:03',_binary '\0'),(60741,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:04','2023-06-10 16:41:04',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:04',NULL,'2023-06-10 16:41:04',_binary '\0'),(60742,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:05','2023-06-10 16:41:05',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:05',NULL,'2023-06-10 16:41:05',_binary '\0'),(60743,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:06','2023-06-10 16:41:06',13,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:06',NULL,'2023-06-10 16:41:06',_binary '\0'),(60744,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:07','2023-06-10 16:41:07',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:07',NULL,'2023-06-10 16:41:07',_binary '\0'),(60745,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:08','2023-06-10 16:41:08',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:08',NULL,'2023-06-10 16:41:08',_binary '\0'),(60746,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:09','2023-06-10 16:41:09',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:09',NULL,'2023-06-10 16:41:09',_binary '\0'),(60747,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:10','2023-06-10 16:41:10',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:10',NULL,'2023-06-10 16:41:10',_binary '\0'),(60748,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:11','2023-06-10 16:41:11',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:11',NULL,'2023-06-10 16:41:11',_binary '\0'),(60749,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:12','2023-06-10 16:41:12',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:12',NULL,'2023-06-10 16:41:12',_binary '\0'),(60750,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:13','2023-06-10 16:41:13',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:13',NULL,'2023-06-10 16:41:13',_binary '\0'),(60751,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:14','2023-06-10 16:41:14',3,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:14',NULL,'2023-06-10 16:41:14',_binary '\0'),(60752,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:15','2023-06-10 16:41:15',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:15',NULL,'2023-06-10 16:41:15',_binary '\0'),(60753,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:16','2023-06-10 16:41:16',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:16',NULL,'2023-06-10 16:41:16',_binary '\0'),(60754,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:17','2023-06-10 16:41:17',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:17',NULL,'2023-06-10 16:41:17',_binary '\0'),(60755,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:18','2023-06-10 16:41:18',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:18',NULL,'2023-06-10 16:41:18',_binary '\0'),(60756,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:19','2023-06-10 16:41:19',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:19',NULL,'2023-06-10 16:41:19',_binary '\0'),(60757,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:20','2023-06-10 16:41:20',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:20',NULL,'2023-06-10 16:41:20',_binary '\0'),(60758,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:21','2023-06-10 16:41:21',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:21',NULL,'2023-06-10 16:41:21',_binary '\0'),(60759,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:22','2023-06-10 16:41:22',30,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:22',NULL,'2023-06-10 16:41:22',_binary '\0'),(60760,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:23','2023-06-10 16:41:23',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:23',NULL,'2023-06-10 16:41:23',_binary '\0'),(60761,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:24','2023-06-10 16:41:24',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:24',NULL,'2023-06-10 16:41:24',_binary '\0'),(60762,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:25','2023-06-10 16:41:25',7,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:25',NULL,'2023-06-10 16:41:25',_binary '\0'),(60763,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:26','2023-06-10 16:41:26',7,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:26',NULL,'2023-06-10 16:41:26',_binary '\0'),(60764,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:27','2023-06-10 16:41:27',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:27',NULL,'2023-06-10 16:41:27',_binary '\0'),(60765,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:28','2023-06-10 16:41:28',18,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:28',NULL,'2023-06-10 16:41:28',_binary '\0'),(60766,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:29','2023-06-10 16:41:29',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:29',NULL,'2023-06-10 16:41:29',_binary '\0'),(60767,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:30','2023-06-10 16:41:30',12,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:30',NULL,'2023-06-10 16:41:30',_binary '\0'),(60768,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:31','2023-06-10 16:41:31',7,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:31',NULL,'2023-06-10 16:41:31',_binary '\0'),(60769,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:32','2023-06-10 16:41:32',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:32',NULL,'2023-06-10 16:41:32',_binary '\0'),(60770,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:33','2023-06-10 16:41:33',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:33',NULL,'2023-06-10 16:41:33',_binary '\0'),(60771,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:34','2023-06-10 16:41:34',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:34',NULL,'2023-06-10 16:41:34',_binary '\0'),(60772,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:35','2023-06-10 16:41:35',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:35',NULL,'2023-06-10 16:41:35',_binary '\0'),(60773,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:36','2023-06-10 16:41:36',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:36',NULL,'2023-06-10 16:41:36',_binary '\0'),(60774,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:37','2023-06-10 16:41:37',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:37',NULL,'2023-06-10 16:41:37',_binary '\0'),(60775,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:38','2023-06-10 16:41:38',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:38',NULL,'2023-06-10 16:41:38',_binary '\0'),(60776,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:39','2023-06-10 16:41:39',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:39',NULL,'2023-06-10 16:41:39',_binary '\0'),(60777,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:40','2023-06-10 16:41:40',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:40',NULL,'2023-06-10 16:41:40',_binary '\0'),(60778,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:41','2023-06-10 16:41:41',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:41',NULL,'2023-06-10 16:41:41',_binary '\0'),(60779,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:42','2023-06-10 16:41:42',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:42',NULL,'2023-06-10 16:41:42',_binary '\0'),(60780,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:43','2023-06-10 16:41:43',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:43',NULL,'2023-06-10 16:41:43',_binary '\0'),(60781,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:44','2023-06-10 16:41:44',14,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:44',NULL,'2023-06-10 16:41:44',_binary '\0'),(60782,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:45','2023-06-10 16:41:45',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:45',NULL,'2023-06-10 16:41:45',_binary '\0'),(60783,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:46','2023-06-10 16:41:46',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:46',NULL,'2023-06-10 16:41:46',_binary '\0'),(60784,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:47','2023-06-10 16:41:47',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:47',NULL,'2023-06-10 16:41:47',_binary '\0'),(60785,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:48','2023-06-10 16:41:48',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:48',NULL,'2023-06-10 16:41:48',_binary '\0'),(60786,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:49','2023-06-10 16:41:49',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:49',NULL,'2023-06-10 16:41:49',_binary '\0'),(60787,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:50','2023-06-10 16:41:50',6,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:50',NULL,'2023-06-10 16:41:50',_binary '\0'),(60788,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:51','2023-06-10 16:41:51',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:51',NULL,'2023-06-10 16:41:51',_binary '\0'),(60789,5,'payNotifyJob',NULL,1,'2023-06-10 16:41:52','2023-06-10 16:41:52',8,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:41:52',NULL,'2023-06-10 16:41:52',_binary '\0'),(60790,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:31','2023-06-10 16:43:31',26,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:31',NULL,'2023-06-10 16:43:31',_binary '\0'),(60791,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:31','2023-06-10 16:43:31',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:31',NULL,'2023-06-10 16:43:31',_binary '\0'),(60792,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:32','2023-06-10 16:43:32',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:32',NULL,'2023-06-10 16:43:32',_binary '\0'),(60793,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:33','2023-06-10 16:43:33',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:33',NULL,'2023-06-10 16:43:33',_binary '\0'),(60794,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:34','2023-06-10 16:43:34',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:34',NULL,'2023-06-10 16:43:34',_binary '\0'),(60795,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:35','2023-06-10 16:43:35',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:35',NULL,'2023-06-10 16:43:35',_binary '\0'),(60796,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:36','2023-06-10 16:43:36',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:36',NULL,'2023-06-10 16:43:36',_binary '\0'),(60797,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:37','2023-06-10 16:43:37',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:37',NULL,'2023-06-10 16:43:37',_binary '\0'),(60798,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:38','2023-06-10 16:43:38',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:38',NULL,'2023-06-10 16:43:38',_binary '\0'),(60799,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:39','2023-06-10 16:43:39',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:39',NULL,'2023-06-10 16:43:39',_binary '\0'),(60800,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:40','2023-06-10 16:43:40',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:40',NULL,'2023-06-10 16:43:40',_binary '\0'),(60801,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:41','2023-06-10 16:43:41',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:41',NULL,'2023-06-10 16:43:41',_binary '\0'),(60802,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:42','2023-06-10 16:43:42',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:42',NULL,'2023-06-10 16:43:42',_binary '\0'),(60803,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:43','2023-06-10 16:43:43',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:43',NULL,'2023-06-10 16:43:43',_binary '\0'),(60804,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:44','2023-06-10 16:43:44',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:44',NULL,'2023-06-10 16:43:44',_binary '\0'),(60805,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:45','2023-06-10 16:43:45',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:45',NULL,'2023-06-10 16:43:45',_binary '\0'),(60806,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:46','2023-06-10 16:43:46',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:46',NULL,'2023-06-10 16:43:46',_binary '\0'),(60807,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:47','2023-06-10 16:43:47',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:47',NULL,'2023-06-10 16:43:47',_binary '\0'),(60808,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:48','2023-06-10 16:43:48',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:48',NULL,'2023-06-10 16:43:48',_binary '\0'),(60809,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:49','2023-06-10 16:43:49',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:49',NULL,'2023-06-10 16:43:49',_binary '\0'),(60810,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:50','2023-06-10 16:43:50',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:50',NULL,'2023-06-10 16:43:50',_binary '\0'),(60811,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:51','2023-06-10 16:43:51',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:51',NULL,'2023-06-10 16:43:51',_binary '\0'),(60812,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:52','2023-06-10 16:43:52',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:52',NULL,'2023-06-10 16:43:52',_binary '\0'),(60813,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:53','2023-06-10 16:43:53',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:53',NULL,'2023-06-10 16:43:53',_binary '\0'),(60814,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:54','2023-06-10 16:43:54',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:54',NULL,'2023-06-10 16:43:54',_binary '\0'),(60815,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:55','2023-06-10 16:43:55',7,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:55',NULL,'2023-06-10 16:43:55',_binary '\0'),(60816,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:56','2023-06-10 16:43:56',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:56',NULL,'2023-06-10 16:43:56',_binary '\0'),(60817,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:57','2023-06-10 16:43:57',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:57',NULL,'2023-06-10 16:43:57',_binary '\0'),(60818,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:58','2023-06-10 16:43:58',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:58',NULL,'2023-06-10 16:43:58',_binary '\0'),(60819,5,'payNotifyJob',NULL,1,'2023-06-10 16:43:59','2023-06-10 16:43:59',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:43:59',NULL,'2023-06-10 16:43:59',_binary '\0'),(60820,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:00','2023-06-10 16:44:00',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:00',NULL,'2023-06-10 16:44:00',_binary '\0'),(60821,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:01','2023-06-10 16:44:01',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:01',NULL,'2023-06-10 16:44:01',_binary '\0'),(60822,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:02','2023-06-10 16:44:02',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:02',NULL,'2023-06-10 16:44:02',_binary '\0'),(60823,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:03','2023-06-10 16:44:03',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:03',NULL,'2023-06-10 16:44:03',_binary '\0'),(60824,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:04','2023-06-10 16:44:04',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:04',NULL,'2023-06-10 16:44:04',_binary '\0'),(60825,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:05','2023-06-10 16:44:05',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:05',NULL,'2023-06-10 16:44:05',_binary '\0'),(60826,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:06','2023-06-10 16:44:06',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:06',NULL,'2023-06-10 16:44:06',_binary '\0'),(60827,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:07','2023-06-10 16:44:07',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:07',NULL,'2023-06-10 16:44:07',_binary '\0'),(60828,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:08','2023-06-10 16:44:08',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:08',NULL,'2023-06-10 16:44:08',_binary '\0'),(60829,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:09','2023-06-10 16:44:09',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:09',NULL,'2023-06-10 16:44:09',_binary '\0'),(60830,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:10','2023-06-10 16:44:10',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:10',NULL,'2023-06-10 16:44:10',_binary '\0'),(60831,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:11','2023-06-10 16:44:11',8,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:11',NULL,'2023-06-10 16:44:11',_binary '\0'),(60832,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:12','2023-06-10 16:44:12',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:12',NULL,'2023-06-10 16:44:12',_binary '\0'),(60833,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:13','2023-06-10 16:44:13',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:13',NULL,'2023-06-10 16:44:13',_binary '\0'),(60834,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:14','2023-06-10 16:44:14',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:14',NULL,'2023-06-10 16:44:14',_binary '\0'),(60835,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:15','2023-06-10 16:44:15',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:15',NULL,'2023-06-10 16:44:15',_binary '\0'),(60836,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:16','2023-06-10 16:44:16',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:16',NULL,'2023-06-10 16:44:16',_binary '\0'),(60837,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:17','2023-06-10 16:44:17',6,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:17',NULL,'2023-06-10 16:44:17',_binary '\0'),(60838,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:18','2023-06-10 16:44:18',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:18',NULL,'2023-06-10 16:44:18',_binary '\0'),(60839,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:19','2023-06-10 16:44:19',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:19',NULL,'2023-06-10 16:44:19',_binary '\0'),(60840,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:20','2023-06-10 16:44:20',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:20',NULL,'2023-06-10 16:44:20',_binary '\0'),(60841,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:21','2023-06-10 16:44:21',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:21',NULL,'2023-06-10 16:44:21',_binary '\0'),(60842,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:22','2023-06-10 16:44:22',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:22',NULL,'2023-06-10 16:44:22',_binary '\0'),(60843,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:23','2023-06-10 16:44:23',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:23',NULL,'2023-06-10 16:44:23',_binary '\0'),(60844,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:24','2023-06-10 16:44:24',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:24',NULL,'2023-06-10 16:44:24',_binary '\0'),(60845,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:25','2023-06-10 16:44:25',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:25',NULL,'2023-06-10 16:44:25',_binary '\0'),(60846,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:26','2023-06-10 16:44:26',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:26',NULL,'2023-06-10 16:44:26',_binary '\0'),(60847,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:27','2023-06-10 16:44:27',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:27',NULL,'2023-06-10 16:44:27',_binary '\0'),(60848,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:28','2023-06-10 16:44:28',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:28',NULL,'2023-06-10 16:44:28',_binary '\0'),(60849,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:29','2023-06-10 16:44:29',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:29',NULL,'2023-06-10 16:44:29',_binary '\0'),(60850,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:30','2023-06-10 16:44:30',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:30',NULL,'2023-06-10 16:44:30',_binary '\0'),(60851,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:31','2023-06-10 16:44:31',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:31',NULL,'2023-06-10 16:44:31',_binary '\0'),(60852,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:32','2023-06-10 16:44:32',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:32',NULL,'2023-06-10 16:44:32',_binary '\0'),(60853,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:33','2023-06-10 16:44:33',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:33',NULL,'2023-06-10 16:44:33',_binary '\0'),(60854,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:34','2023-06-10 16:44:34',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:34',NULL,'2023-06-10 16:44:34',_binary '\0'),(60855,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:35','2023-06-10 16:44:35',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:35',NULL,'2023-06-10 16:44:35',_binary '\0'),(60856,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:36','2023-06-10 16:44:36',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:36',NULL,'2023-06-10 16:44:36',_binary '\0'),(60857,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:37','2023-06-10 16:44:37',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:37',NULL,'2023-06-10 16:44:37',_binary '\0'),(60858,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:38','2023-06-10 16:44:38',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:38',NULL,'2023-06-10 16:44:38',_binary '\0'),(60859,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:39','2023-06-10 16:44:39',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:39',NULL,'2023-06-10 16:44:39',_binary '\0'),(60860,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:40','2023-06-10 16:44:40',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:40',NULL,'2023-06-10 16:44:40',_binary '\0'),(60861,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:41','2023-06-10 16:44:41',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:41',NULL,'2023-06-10 16:44:41',_binary '\0'),(60862,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:42','2023-06-10 16:44:42',10,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:42',NULL,'2023-06-10 16:44:42',_binary '\0'),(60863,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:43','2023-06-10 16:44:43',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:43',NULL,'2023-06-10 16:44:43',_binary '\0'),(60864,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:44','2023-06-10 16:44:44',6,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:44',NULL,'2023-06-10 16:44:44',_binary '\0'),(60865,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:45','2023-06-10 16:44:45',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:45',NULL,'2023-06-10 16:44:45',_binary '\0'),(60866,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:46','2023-06-10 16:44:46',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:46',NULL,'2023-06-10 16:44:46',_binary '\0'),(60867,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:47','2023-06-10 16:44:47',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:47',NULL,'2023-06-10 16:44:47',_binary '\0'),(60868,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:48','2023-06-10 16:44:48',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:48',NULL,'2023-06-10 16:44:48',_binary '\0'),(60869,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:49','2023-06-10 16:44:49',6,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:49',NULL,'2023-06-10 16:44:49',_binary '\0'),(60870,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:50','2023-06-10 16:44:50',6,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:50',NULL,'2023-06-10 16:44:50',_binary '\0'),(60871,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:51','2023-06-10 16:44:51',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:51',NULL,'2023-06-10 16:44:51',_binary '\0'),(60872,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:52','2023-06-10 16:44:52',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:52',NULL,'2023-06-10 16:44:52',_binary '\0'),(60873,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:53','2023-06-10 16:44:53',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:53',NULL,'2023-06-10 16:44:53',_binary '\0'),(60874,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:54','2023-06-10 16:44:54',6,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:54',NULL,'2023-06-10 16:44:54',_binary '\0'),(60875,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:55','2023-06-10 16:44:55',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:55',NULL,'2023-06-10 16:44:55',_binary '\0'),(60876,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:56','2023-06-10 16:44:56',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:56',NULL,'2023-06-10 16:44:56',_binary '\0'),(60877,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:57','2023-06-10 16:44:57',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:57',NULL,'2023-06-10 16:44:57',_binary '\0'),(60878,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:58','2023-06-10 16:44:58',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:58',NULL,'2023-06-10 16:44:58',_binary '\0'),(60879,5,'payNotifyJob',NULL,1,'2023-06-10 16:44:59','2023-06-10 16:44:59',6,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:44:59',NULL,'2023-06-10 16:44:59',_binary '\0'),(60880,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:00','2023-06-10 16:45:00',16,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:00',NULL,'2023-06-10 16:45:00',_binary '\0'),(60881,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:01','2023-06-10 16:45:01',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:01',NULL,'2023-06-10 16:45:01',_binary '\0'),(60882,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:02','2023-06-10 16:45:02',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:02',NULL,'2023-06-10 16:45:02',_binary '\0'),(60883,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:03','2023-06-10 16:45:03',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:03',NULL,'2023-06-10 16:45:03',_binary '\0'),(60884,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:04','2023-06-10 16:45:04',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:04',NULL,'2023-06-10 16:45:04',_binary '\0'),(60885,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:05','2023-06-10 16:45:05',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:05',NULL,'2023-06-10 16:45:05',_binary '\0'),(60886,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:06','2023-06-10 16:45:06',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:06',NULL,'2023-06-10 16:45:06',_binary '\0'),(60887,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:07','2023-06-10 16:45:07',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:07',NULL,'2023-06-10 16:45:07',_binary '\0'),(60888,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:08','2023-06-10 16:45:08',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:08',NULL,'2023-06-10 16:45:08',_binary '\0'),(60889,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:09','2023-06-10 16:45:09',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:09',NULL,'2023-06-10 16:45:09',_binary '\0'),(60890,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:10','2023-06-10 16:45:10',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:10',NULL,'2023-06-10 16:45:10',_binary '\0'),(60891,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:11','2023-06-10 16:45:11',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:11',NULL,'2023-06-10 16:45:11',_binary '\0'),(60892,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:12','2023-06-10 16:45:12',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:12',NULL,'2023-06-10 16:45:12',_binary '\0'),(60893,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:13','2023-06-10 16:45:13',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:13',NULL,'2023-06-10 16:45:13',_binary '\0'),(60894,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:14','2023-06-10 16:45:14',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:14',NULL,'2023-06-10 16:45:14',_binary '\0'),(60895,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:15','2023-06-10 16:45:15',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:15',NULL,'2023-06-10 16:45:15',_binary '\0'),(60896,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:16','2023-06-10 16:45:16',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:16',NULL,'2023-06-10 16:45:16',_binary '\0'),(60897,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:17','2023-06-10 16:45:17',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:17',NULL,'2023-06-10 16:45:17',_binary '\0'),(60898,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:18','2023-06-10 16:45:18',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:18',NULL,'2023-06-10 16:45:18',_binary '\0'),(60899,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:19','2023-06-10 16:45:19',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:19',NULL,'2023-06-10 16:45:19',_binary '\0'),(60900,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:20','2023-06-10 16:45:20',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:20',NULL,'2023-06-10 16:45:20',_binary '\0'),(60901,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:21','2023-06-10 16:45:21',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:21',NULL,'2023-06-10 16:45:21',_binary '\0'),(60902,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:22','2023-06-10 16:45:22',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:22',NULL,'2023-06-10 16:45:22',_binary '\0'),(60903,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:23','2023-06-10 16:45:23',6,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:23',NULL,'2023-06-10 16:45:23',_binary '\0'),(60904,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:24','2023-06-10 16:45:24',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:24',NULL,'2023-06-10 16:45:24',_binary '\0'),(60905,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:25','2023-06-10 16:45:25',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:25',NULL,'2023-06-10 16:45:25',_binary '\0'),(60906,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:26','2023-06-10 16:45:26',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:26',NULL,'2023-06-10 16:45:26',_binary '\0'),(60907,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:27','2023-06-10 16:45:27',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:27',NULL,'2023-06-10 16:45:27',_binary '\0'),(60908,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:28','2023-06-10 16:45:28',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:28',NULL,'2023-06-10 16:45:28',_binary '\0'),(60909,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:29','2023-06-10 16:45:29',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:29',NULL,'2023-06-10 16:45:29',_binary '\0'),(60910,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:30','2023-06-10 16:45:30',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:30',NULL,'2023-06-10 16:45:30',_binary '\0'),(60911,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:31','2023-06-10 16:45:31',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:31',NULL,'2023-06-10 16:45:31',_binary '\0'),(60912,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:32','2023-06-10 16:45:32',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:32',NULL,'2023-06-10 16:45:32',_binary '\0'),(60913,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:33','2023-06-10 16:45:33',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:33',NULL,'2023-06-10 16:45:33',_binary '\0'),(60914,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:34','2023-06-10 16:45:34',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:34',NULL,'2023-06-10 16:45:34',_binary '\0'),(60915,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:35','2023-06-10 16:45:35',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:35',NULL,'2023-06-10 16:45:35',_binary '\0'),(60916,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:36','2023-06-10 16:45:36',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:36',NULL,'2023-06-10 16:45:36',_binary '\0'),(60917,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:37','2023-06-10 16:45:37',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:37',NULL,'2023-06-10 16:45:37',_binary '\0'),(60918,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:38','2023-06-10 16:45:38',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:38',NULL,'2023-06-10 16:45:38',_binary '\0'),(60919,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:39','2023-06-10 16:45:39',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:39',NULL,'2023-06-10 16:45:39',_binary '\0'),(60920,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:40','2023-06-10 16:45:40',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:40',NULL,'2023-06-10 16:45:40',_binary '\0'),(60921,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:41','2023-06-10 16:45:41',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:41',NULL,'2023-06-10 16:45:41',_binary '\0'),(60922,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:42','2023-06-10 16:45:42',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:42',NULL,'2023-06-10 16:45:42',_binary '\0'),(60923,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:43','2023-06-10 16:45:43',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:43',NULL,'2023-06-10 16:45:43',_binary '\0'),(60924,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:44','2023-06-10 16:45:44',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:44',NULL,'2023-06-10 16:45:44',_binary '\0'),(60925,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:45','2023-06-10 16:45:45',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:45',NULL,'2023-06-10 16:45:45',_binary '\0'),(60926,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:46','2023-06-10 16:45:46',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:46',NULL,'2023-06-10 16:45:46',_binary '\0'),(60927,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:47','2023-06-10 16:45:47',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:47',NULL,'2023-06-10 16:45:47',_binary '\0'),(60928,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:48','2023-06-10 16:45:48',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:48',NULL,'2023-06-10 16:45:48',_binary '\0'),(60929,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:49','2023-06-10 16:45:49',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:49',NULL,'2023-06-10 16:45:49',_binary '\0'),(60930,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:50','2023-06-10 16:45:50',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:50',NULL,'2023-06-10 16:45:50',_binary '\0'),(60931,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:51','2023-06-10 16:45:51',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:51',NULL,'2023-06-10 16:45:51',_binary '\0'),(60932,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:52','2023-06-10 16:45:52',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:52',NULL,'2023-06-10 16:45:52',_binary '\0'),(60933,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:53','2023-06-10 16:45:53',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:53',NULL,'2023-06-10 16:45:53',_binary '\0'),(60934,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:54','2023-06-10 16:45:54',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:54',NULL,'2023-06-10 16:45:54',_binary '\0'),(60935,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:55','2023-06-10 16:45:55',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:55',NULL,'2023-06-10 16:45:55',_binary '\0'),(60936,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:56','2023-06-10 16:45:56',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:56',NULL,'2023-06-10 16:45:56',_binary '\0'),(60937,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:57','2023-06-10 16:45:57',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:57',NULL,'2023-06-10 16:45:57',_binary '\0'),(60938,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:58','2023-06-10 16:45:58',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:58',NULL,'2023-06-10 16:45:58',_binary '\0'),(60939,5,'payNotifyJob',NULL,1,'2023-06-10 16:45:59','2023-06-10 16:45:59',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:45:59',NULL,'2023-06-10 16:45:59',_binary '\0'),(60940,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:00','2023-06-10 16:46:00',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:00',NULL,'2023-06-10 16:46:00',_binary '\0'),(60941,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:01','2023-06-10 16:46:01',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:01',NULL,'2023-06-10 16:46:01',_binary '\0'),(60942,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:02','2023-06-10 16:46:02',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:02',NULL,'2023-06-10 16:46:02',_binary '\0'),(60943,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:03','2023-06-10 16:46:03',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:03',NULL,'2023-06-10 16:46:03',_binary '\0'),(60944,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:04','2023-06-10 16:46:04',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:04',NULL,'2023-06-10 16:46:04',_binary '\0'),(60945,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:05','2023-06-10 16:46:05',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:05',NULL,'2023-06-10 16:46:05',_binary '\0'),(60946,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:06','2023-06-10 16:46:06',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:06',NULL,'2023-06-10 16:46:06',_binary '\0'),(60947,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:07','2023-06-10 16:46:07',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:07',NULL,'2023-06-10 16:46:07',_binary '\0'),(60948,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:08','2023-06-10 16:46:08',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:08',NULL,'2023-06-10 16:46:08',_binary '\0'),(60949,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:09','2023-06-10 16:46:09',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:09',NULL,'2023-06-10 16:46:09',_binary '\0'),(60950,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:10','2023-06-10 16:46:10',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:10',NULL,'2023-06-10 16:46:10',_binary '\0'),(60951,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:11','2023-06-10 16:46:11',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:11',NULL,'2023-06-10 16:46:11',_binary '\0'),(60952,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:12','2023-06-10 16:46:12',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:12',NULL,'2023-06-10 16:46:12',_binary '\0'),(60953,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:13','2023-06-10 16:46:13',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:13',NULL,'2023-06-10 16:46:13',_binary '\0'),(60954,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:14','2023-06-10 16:46:14',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:14',NULL,'2023-06-10 16:46:14',_binary '\0'),(60955,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:15','2023-06-10 16:46:15',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:15',NULL,'2023-06-10 16:46:15',_binary '\0'),(60956,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:16','2023-06-10 16:46:16',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:16',NULL,'2023-06-10 16:46:16',_binary '\0'),(60957,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:17','2023-06-10 16:46:17',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:17',NULL,'2023-06-10 16:46:17',_binary '\0'),(60958,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:18','2023-06-10 16:46:18',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:18',NULL,'2023-06-10 16:46:18',_binary '\0'),(60959,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',24,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60960,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60961,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60962,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60963,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60964,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60965,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60966,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60967,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60968,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60969,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60970,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60971,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60972,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60973,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60974,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60975,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60976,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60977,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60978,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',1,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60979,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:39','2023-06-10 16:46:39',17,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:39',NULL,'2023-06-10 16:46:39',_binary '\0'),(60980,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:40','2023-06-10 16:46:40',6,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:40',NULL,'2023-06-10 16:46:40',_binary '\0'),(60981,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:41','2023-06-10 16:46:41',2,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:41',NULL,'2023-06-10 16:46:41',_binary '\0'),(60982,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:42','2023-06-10 16:46:42',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:42',NULL,'2023-06-10 16:46:42',_binary '\0'),(60983,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:43','2023-06-10 16:46:43',4,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:43',NULL,'2023-06-10 16:46:43',_binary '\0'),(60984,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:44','2023-06-10 16:46:44',5,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:44',NULL,'2023-06-10 16:46:44',_binary '\0'),(60985,5,'payNotifyJob',NULL,1,'2023-06-10 16:46:45','2023-06-10 16:46:45',3,2,'NoSuchBeanDefinitionException: No bean named \'payNotifyJob\' available',NULL,'2023-06-10 16:46:45',NULL,'2023-06-10 16:46:45',_binary '\0'),(60986,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:36','2023-06-10 16:51:36',60,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:36',NULL,'2023-06-10 16:51:36',_binary '\0'),(60987,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:37','2023-06-10 16:51:37',13,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:37',NULL,'2023-06-10 16:51:37',_binary '\0'),(60988,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:38','2023-06-10 16:51:38',13,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:38',NULL,'2023-06-10 16:51:38',_binary '\0'),(60989,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:39','2023-06-10 16:51:39',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:39',NULL,'2023-06-10 16:51:39',_binary '\0'),(60990,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:40','2023-06-10 16:51:40',13,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:40',NULL,'2023-06-10 16:51:40',_binary '\0'),(60991,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:41','2023-06-10 16:51:41',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:41',NULL,'2023-06-10 16:51:41',_binary '\0'),(60992,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:42','2023-06-10 16:51:42',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:42',NULL,'2023-06-10 16:51:42',_binary '\0'),(60993,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:43','2023-06-10 16:51:43',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:43',NULL,'2023-06-10 16:51:43',_binary '\0'),(60994,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:44','2023-06-10 16:51:44',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:44',NULL,'2023-06-10 16:51:44',_binary '\0'),(60995,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:45','2023-06-10 16:51:45',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:45',NULL,'2023-06-10 16:51:45',_binary '\0'),(60996,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:46','2023-06-10 16:51:46',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:46',NULL,'2023-06-10 16:51:46',_binary '\0'),(60997,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:47','2023-06-10 16:51:47',13,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:47',NULL,'2023-06-10 16:51:47',_binary '\0'),(60998,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:48','2023-06-10 16:51:48',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:48',NULL,'2023-06-10 16:51:48',_binary '\0'),(60999,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:49','2023-06-10 16:51:49',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:49',NULL,'2023-06-10 16:51:49',_binary '\0'),(61000,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:50','2023-06-10 16:51:50',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:50',NULL,'2023-06-10 16:51:50',_binary '\0'),(61001,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:51','2023-06-10 16:51:51',13,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:51',NULL,'2023-06-10 16:51:51',_binary '\0'),(61002,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:52','2023-06-10 16:51:52',5,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:52',NULL,'2023-06-10 16:51:52',_binary '\0'),(61003,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:53','2023-06-10 16:51:53',6,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:53',NULL,'2023-06-10 16:51:53',_binary '\0'),(61004,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:54','2023-06-10 16:51:54',13,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:54',NULL,'2023-06-10 16:51:54',_binary '\0'),(61005,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:55','2023-06-10 16:51:55',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:55',NULL,'2023-06-10 16:51:55',_binary '\0'),(61006,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:56','2023-06-10 16:51:56',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:56',NULL,'2023-06-10 16:51:56',_binary '\0'),(61007,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:57','2023-06-10 16:51:57',13,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:57',NULL,'2023-06-10 16:51:57',_binary '\0'),(61008,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:58','2023-06-10 16:51:58',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:58',NULL,'2023-06-10 16:51:58',_binary '\0'),(61009,5,'payNotifyJob',NULL,1,'2023-06-10 16:51:59','2023-06-10 16:51:59',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:51:59',NULL,'2023-06-10 16:51:59',_binary '\0'),(61010,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:00','2023-06-10 16:52:00',14,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:00',NULL,'2023-06-10 16:52:00',_binary '\0'),(61011,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:01','2023-06-10 16:52:01',9,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:01',NULL,'2023-06-10 16:52:01',_binary '\0'),(61012,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:02','2023-06-10 16:52:02',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:02',NULL,'2023-06-10 16:52:02',_binary '\0'),(61013,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:03','2023-06-10 16:52:03',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:03',NULL,'2023-06-10 16:52:03',_binary '\0'),(61014,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:04','2023-06-10 16:52:04',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:04',NULL,'2023-06-10 16:52:04',_binary '\0'),(61015,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:05','2023-06-10 16:52:05',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:05',NULL,'2023-06-10 16:52:05',_binary '\0'),(61016,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:06','2023-06-10 16:52:06',13,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:06',NULL,'2023-06-10 16:52:06',_binary '\0'),(61017,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:07','2023-06-10 16:52:07',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:07',NULL,'2023-06-10 16:52:07',_binary '\0'),(61018,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:08','2023-06-10 16:52:08',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:08',NULL,'2023-06-10 16:52:08',_binary '\0'),(61019,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:09','2023-06-10 16:52:09',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:09',NULL,'2023-06-10 16:52:09',_binary '\0'),(61020,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:10','2023-06-10 16:52:10',4,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:10',NULL,'2023-06-10 16:52:10',_binary '\0'),(61021,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:11','2023-06-10 16:52:11',7,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:11',NULL,'2023-06-10 16:52:11',_binary '\0'),(61022,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:12','2023-06-10 16:52:12',7,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:12',NULL,'2023-06-10 16:52:12',_binary '\0'),(61023,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:13','2023-06-10 16:52:13',3,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:13',NULL,'2023-06-10 16:52:13',_binary '\0'),(61024,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:14','2023-06-10 16:52:14',9,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:14',NULL,'2023-06-10 16:52:14',_binary '\0'),(61025,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:15','2023-06-10 16:52:15',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:15',NULL,'2023-06-10 16:52:15',_binary '\0'),(61026,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:16','2023-06-10 16:52:16',5,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:16',NULL,'2023-06-10 16:52:16',_binary '\0'),(61027,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:17','2023-06-10 16:52:17',8,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:17',NULL,'2023-06-10 16:52:17',_binary '\0'),(61028,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:18','2023-06-10 16:52:18',11,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:18',NULL,'2023-06-10 16:52:18',_binary '\0'),(61029,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:19','2023-06-10 16:52:19',9,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:19',NULL,'2023-06-10 16:52:19',_binary '\0'),(61030,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:20','2023-06-10 16:52:20',11,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:20',NULL,'2023-06-10 16:52:20',_binary '\0'),(61031,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:21','2023-06-10 16:52:21',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:21',NULL,'2023-06-10 16:52:21',_binary '\0'),(61032,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:22','2023-06-10 16:52:22',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:22',NULL,'2023-06-10 16:52:22',_binary '\0'),(61033,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:23','2023-06-10 16:52:23',10,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:23',NULL,'2023-06-10 16:52:23',_binary '\0'),(61034,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:24','2023-06-10 16:52:24',10,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:24',NULL,'2023-06-10 16:52:24',_binary '\0'),(61035,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:25','2023-06-10 16:52:25',12,1,'{\"129\":\"执行支付通知 0 个\",\"1\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:25',NULL,'2023-06-10 16:52:25',_binary '\0'),(61036,5,'payNotifyJob',NULL,1,'2023-06-10 16:52:26','2023-06-10 16:52:26',4,1,'{\"1\":\"执行支付通知 0 个\",\"129\":\"执行支付通知 0 个\",\"121\":\"执行支付通知 0 个\",\"122\":\"执行支付通知 0 个\",\"125\":\"执行支付通知 0 个\",\"126\":\"执行支付通知 0 个\",\"127\":\"执行支付通知 0 个\"}',NULL,'2023-06-10 16:52:26',NULL,'2023-06-10 16:52:26',_binary '\0');
/*!40000 ALTER TABLE `infra_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infra_test_demo`
--

DROP TABLE IF EXISTS `infra_test_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infra_test_demo` (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                   `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
                                   `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态',
                                   `type` tinyint NOT NULL COMMENT '类型',
                                   `category` tinyint NOT NULL COMMENT '分类',
                                   `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                   `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infra_test_demo`
--

LOCK TABLES `infra_test_demo` WRITE;
/*!40000 ALTER TABLE `infra_test_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `infra_test_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_user`
--

DROP TABLE IF EXISTS `member_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_user` (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                               `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
                               `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
                               `status` tinyint NOT NULL COMMENT '状态',
                               `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
                               `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
                               `register_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注册 IP',
                               `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
                               `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
                               `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                               `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                               PRIMARY KEY (`id`) USING BTREE,
                               UNIQUE KEY `uk_mobile` (`mobile`) USING BTREE COMMENT '手机号'
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_user`
--

LOCK TABLES `member_user` WRITE;
/*!40000 ALTER TABLE `member_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_app`
--

DROP TABLE IF EXISTS `pay_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_app` (
                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '应用编号',
                           `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
                           `status` tinyint NOT NULL COMMENT '开启状态',
                           `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                           `pay_notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付结果的回调地址',
                           `refund_notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '退款结果的回调地址',
                           `merchant_id` bigint NOT NULL COMMENT '商户编号',
                           `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                           `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付应用信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_app`
--

LOCK TABLES `pay_app` WRITE;
/*!40000 ALTER TABLE `pay_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_channel`
--

DROP TABLE IF EXISTS `pay_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_channel` (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商户编号',
                               `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
                               `status` tinyint NOT NULL COMMENT '开启状态',
                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                               `fee_rate` double NOT NULL DEFAULT '0' COMMENT '渠道费率，单位：百分比',
                               `merchant_id` bigint NOT NULL COMMENT '商户编号',
                               `app_id` bigint NOT NULL COMMENT '应用编号',
                               `config` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付渠道配置',
                               `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                               `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付渠道\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_channel`
--

LOCK TABLES `pay_channel` WRITE;
/*!40000 ALTER TABLE `pay_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_merchant`
--

DROP TABLE IF EXISTS `pay_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_merchant` (
                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商户编号',
                                `no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户号',
                                `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户全称',
                                `short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户简称',
                                `status` tinyint NOT NULL COMMENT '开启状态',
                                `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付商户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_merchant`
--

LOCK TABLES `pay_merchant` WRITE;
/*!40000 ALTER TABLE `pay_merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_notify_log`
--

DROP TABLE IF EXISTS `pay_notify_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_notify_log` (
                                  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志编号',
                                  `task_id` bigint NOT NULL COMMENT '通知任务编号',
                                  `notify_times` tinyint NOT NULL COMMENT '第几次被通知',
                                  `response` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求参数',
                                  `status` tinyint NOT NULL COMMENT '通知状态',
                                  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=363051 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付通知 App 的日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_notify_log`
--

LOCK TABLES `pay_notify_log` WRITE;
/*!40000 ALTER TABLE `pay_notify_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_notify_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_notify_task`
--

DROP TABLE IF EXISTS `pay_notify_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_notify_task` (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务编号',
                                   `merchant_id` bigint NOT NULL COMMENT '商户编号',
                                   `app_id` bigint NOT NULL COMMENT '应用编号',
                                   `type` tinyint NOT NULL COMMENT '通知类型',
                                   `data_id` bigint NOT NULL COMMENT '数据编号',
                                   `status` tinyint NOT NULL COMMENT '通知状态',
                                   `merchant_order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户订单编号',
                                   `next_notify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下一次通知时间',
                                   `last_execute_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次执行时间',
                                   `notify_times` tinyint NOT NULL COMMENT '当前通知次数',
                                   `max_notify_times` tinyint NOT NULL COMMENT '最大可通知次数',
                                   `notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异步通知地址',
                                   `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                   `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商户支付、退款等的通知\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_notify_task`
--

LOCK TABLES `pay_notify_task` WRITE;
/*!40000 ALTER TABLE `pay_notify_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_notify_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_order`
--

DROP TABLE IF EXISTS `pay_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_order` (
                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT '支付订单编号',
                             `merchant_id` bigint NOT NULL COMMENT '商户编号',
                             `app_id` bigint NOT NULL COMMENT '应用编号',
                             `channel_id` bigint DEFAULT NULL COMMENT '渠道编号',
                             `channel_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道编码',
                             `merchant_order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户订单编号',
                             `subject` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品标题',
                             `body` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品描述',
                             `notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异步通知地址',
                             `notify_status` tinyint NOT NULL COMMENT '通知商户支付结果的回调状态',
                             `amount` bigint NOT NULL COMMENT '支付金额，单位：分',
                             `channel_fee_rate` double DEFAULT '0' COMMENT '渠道手续费，单位：百分比',
                             `channel_fee_amount` bigint DEFAULT '0' COMMENT '渠道手续金额，单位：分',
                             `status` tinyint NOT NULL COMMENT '支付状态',
                             `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
                             `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单失效时间',
                             `success_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '订单支付成功时间',
                             `notify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '订单支付通知时间',
                             `success_extension_id` bigint DEFAULT NULL COMMENT '支付成功的订单拓展单编号',
                             `refund_status` tinyint NOT NULL COMMENT '退款状态',
                             `refund_times` tinyint NOT NULL COMMENT '退款次数',
                             `refund_amount` bigint NOT NULL COMMENT '退款总金额，单位：分',
                             `channel_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道用户编号',
                             `channel_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道订单号',
                             `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                             `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付订单\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_order`
--

LOCK TABLES `pay_order` WRITE;
/*!40000 ALTER TABLE `pay_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_order_extension`
--

DROP TABLE IF EXISTS `pay_order_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_order_extension` (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '支付订单编号',
                                       `no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付订单号',
                                       `order_id` bigint NOT NULL COMMENT '支付订单编号',
                                       `channel_id` bigint NOT NULL COMMENT '渠道编号',
                                       `channel_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
                                       `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
                                       `status` tinyint NOT NULL COMMENT '支付状态',
                                       `channel_extras` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付渠道的额外参数',
                                       `channel_notify_data` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付渠道异步通知的内容',
                                       `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                       `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                       `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付订单\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_order_extension`
--

LOCK TABLES `pay_order_extension` WRITE;
/*!40000 ALTER TABLE `pay_order_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_order_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_refund`
--

DROP TABLE IF EXISTS `pay_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_refund` (
                              `id` bigint NOT NULL AUTO_INCREMENT COMMENT '支付退款编号',
                              `merchant_id` bigint NOT NULL COMMENT '商户编号',
                              `app_id` bigint NOT NULL COMMENT '应用编号',
                              `channel_id` bigint NOT NULL COMMENT '渠道编号',
                              `channel_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
                              `order_id` bigint NOT NULL COMMENT '支付订单编号 pay_order 表id',
                              `trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易订单号 pay_extension 表no 字段',
                              `merchant_order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户订单编号（商户系统生成）',
                              `merchant_refund_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户退款订单号（商户系统生成）',
                              `notify_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异步通知商户地址',
                              `notify_status` tinyint NOT NULL COMMENT '通知商户退款结果的回调状态',
                              `status` tinyint NOT NULL COMMENT '退款状态',
                              `type` tinyint NOT NULL COMMENT '退款类型(部分退款，全部退款)',
                              `pay_amount` bigint NOT NULL COMMENT '支付金额,单位分',
                              `refund_amount` bigint NOT NULL COMMENT '退款金额,单位分',
                              `reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '退款原因',
                              `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户 IP',
                              `channel_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道订单号，pay_order 中的channel_order_no 对应',
                              `channel_refund_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道退款单号，渠道返回',
                              `channel_error_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道调用报错时，错误码',
                              `channel_error_msg` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道调用报错时，错误信息',
                              `channel_extras` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付渠道的额外参数',
                              `expire_time` datetime DEFAULT NULL COMMENT '退款失效时间',
                              `success_time` datetime DEFAULT NULL COMMENT '退款成功时间',
                              `notify_time` datetime DEFAULT NULL COMMENT '退款通知时间',
                              `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                              `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='退款订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_refund`
--

LOCK TABLES `pay_refund` WRITE;
/*!40000 ALTER TABLE `pay_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_feedback`
--

DROP TABLE IF EXISTS `puu_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_feedback` (
                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                `product_id` bigint NOT NULL COMMENT '项目id',
                                `title` varchar(255) NOT NULL COMMENT '标题',
                                `detail` text NOT NULL COMMENT '内容',
                                `feedback_category_id` bigint DEFAULT NULL COMMENT '反馈分类id',
                                `roadmap_added` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否添加到roadmap',
                                `progress` int DEFAULT NULL COMMENT '进度类型',
                                `status` int NOT NULL DEFAULT '0' COMMENT '状态：公开、不公开等，默认公开',
                                `merged_id` bigint DEFAULT NULL COMMENT '被合并到某反馈下',
                                `user_environment` text COMMENT '用户环境',
                                `creator` bigint DEFAULT NULL COMMENT '创建人',
                                `updater` bigint DEFAULT NULL COMMENT '更新人',
                                `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                `deleted` tinyint(1) DEFAULT NULL COMMENT '是否删除',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_feedback`
--

LOCK TABLES `puu_feedback` WRITE;
/*!40000 ALTER TABLE `puu_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_feedback_attachment_ref`
--

DROP TABLE IF EXISTS `puu_feedback_attachment_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_feedback_attachment_ref` (
                                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                               `feedback_id` bigint NOT NULL COMMENT '反馈id',
                                               `attachment_id` bigint NOT NULL COMMENT '文件id',
                                               `creator` bigint DEFAULT NULL COMMENT '创建人',
                                               `updater` bigint DEFAULT NULL COMMENT '更新人',
                                               `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                               `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                               `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='反馈关联的文件，多堆多';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_feedback_attachment_ref`
--

LOCK TABLES `puu_feedback_attachment_ref` WRITE;
/*!40000 ALTER TABLE `puu_feedback_attachment_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_feedback_attachment_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_feedback_category`
--

DROP TABLE IF EXISTS `puu_feedback_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_feedback_category` (
                                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                         `product_id` bigint NOT NULL COMMENT '项目id',
                                         `name` varchar(150) DEFAULT NULL COMMENT '分类名称',
                                         `creator` bigint DEFAULT NULL COMMENT '创建人',
                                         `updater` bigint DEFAULT NULL COMMENT '更新人',
                                         `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                         `update_time` timestamp NULL DEFAULT NULL COMMENT '更新人',
                                         `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='反馈分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_feedback_category`
--

LOCK TABLES `puu_feedback_category` WRITE;
/*!40000 ALTER TABLE `puu_feedback_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_feedback_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_feedback_comment`
--

DROP TABLE IF EXISTS `puu_feedback_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_feedback_comment` (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                        `feedback_id` bigint NOT NULL COMMENT '关联的反馈id',
                                        `content` text NOT NULL COMMENT '评论详情',
                                        `official` tinyint(1) DEFAULT '0' COMMENT '是否是官方回复',
                                        `creator` bigint NOT NULL COMMENT '创建人',
                                        `updater` bigint DEFAULT NULL COMMENT '更新人',
                                        `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                        `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                        `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='反馈评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_feedback_comment`
--

LOCK TABLES `puu_feedback_comment` WRITE;
/*!40000 ALTER TABLE `puu_feedback_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_feedback_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_feedback_comment_attachment_ref`
--

DROP TABLE IF EXISTS `puu_feedback_comment_attachment_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_feedback_comment_attachment_ref` (
                                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                                       `feedback_comment_id` bigint NOT NULL COMMENT '反馈的评论id',
                                                       `attachment_id` bigint NOT NULL COMMENT '文件id',
                                                       `creator` bigint DEFAULT NULL COMMENT '创建人',
                                                       `updater` bigint DEFAULT NULL COMMENT '更新人',
                                                       `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                                       `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                                       `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                                                       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='评论附件，多堆多';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_feedback_comment_attachment_ref`
--

LOCK TABLES `puu_feedback_comment_attachment_ref` WRITE;
/*!40000 ALTER TABLE `puu_feedback_comment_attachment_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_feedback_comment_attachment_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_feedback_tag`
--

DROP TABLE IF EXISTS `puu_feedback_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_feedback_tag` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                    `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
                                    `creator` bigint DEFAULT NULL COMMENT '创建人',
                                    `updater` bigint DEFAULT NULL COMMENT '更新人',
                                    `create_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                    `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                    `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='反馈标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_feedback_tag`
--

LOCK TABLES `puu_feedback_tag` WRITE;
/*!40000 ALTER TABLE `puu_feedback_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_feedback_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_feedback_tag_ref`
--

DROP TABLE IF EXISTS `puu_feedback_tag_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_feedback_tag_ref` (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                        `feedback_id` bigint NOT NULL COMMENT '反馈id',
                                        `feedback_tag_id` bigint NOT NULL COMMENT '反馈标签id',
                                        `creator` bigint DEFAULT NULL COMMENT '创建人',
                                        `updater` bigint DEFAULT NULL COMMENT '更新人',
                                        `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                        `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                        `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='反馈的标签，多堆多';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_feedback_tag_ref`
--

LOCK TABLES `puu_feedback_tag_ref` WRITE;
/*!40000 ALTER TABLE `puu_feedback_tag_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_feedback_tag_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_feedback_vote`
--

DROP TABLE IF EXISTS `puu_feedback_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_feedback_vote` (
                                     `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                     `feedback_id` bigint NOT NULL COMMENT '反馈id',
                                     `vote_user_id` bigint NOT NULL COMMENT '投票人',
                                     `creator` bigint DEFAULT NULL COMMENT '创建人',
                                     `updater` bigint DEFAULT NULL COMMENT '更新人',
                                     `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                     `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                     `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='反馈投票';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_feedback_vote`
--

LOCK TABLES `puu_feedback_vote` WRITE;
/*!40000 ALTER TABLE `puu_feedback_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_feedback_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_notice`
--

DROP TABLE IF EXISTS `puu_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_notice` (
                              `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                              `title` varchar(255) NOT NULL COMMENT '公告标题',
                              `content` text COMMENT '公告内容',
                              `jump_url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
                              `creator` bigint DEFAULT NULL COMMENT '创建人',
                              `updater` bigint DEFAULT NULL COMMENT '更新人\n',
                              `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                              `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                              `deleted` tinyint(1) DEFAULT NULL COMMENT '是否删除',
                              `product_id` bigint DEFAULT NULL COMMENT '项目id',
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_notice`
--

LOCK TABLES `puu_notice` WRITE;
/*!40000 ALTER TABLE `puu_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_product`
--

DROP TABLE IF EXISTS `puu_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_product` (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                               `creator` bigint DEFAULT NULL COMMENT '创建人',
                               `name` varchar(100) DEFAULT NULL COMMENT '项目名称',
                               `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                               `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                               `deleted` tinyint(1) DEFAULT NULL COMMENT '是否删除',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_product`
--

LOCK TABLES `puu_product` WRITE;
/*!40000 ALTER TABLE `puu_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puu_version_history`
--

DROP TABLE IF EXISTS `puu_version_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puu_version_history` (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                       `title` varchar(255) DEFAULT NULL COMMENT '版本标题',
                                       `version_name` varchar(100) NOT NULL COMMENT '版本名称',
                                       `version_code` int NOT NULL COMMENT '版本号',
                                       `content` text COMMENT '版本内容',
                                       `creator` bigint DEFAULT NULL COMMENT '创建人',
                                       `updater` bigint DEFAULT NULL COMMENT '更新人',
                                       `create_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                       `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                       `deleted` tinyint(1) DEFAULT NULL COMMENT '是否删除',
                                       `product_id` bigint DEFAULT NULL COMMENT '项目id',
                                       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='版本历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puu_version_history`
--

LOCK TABLES `puu_version_history` WRITE;
/*!40000 ALTER TABLE `puu_version_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `puu_version_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
                                      `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `BLOB_DATA` blob,
                                      PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
                                      KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
                                      CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
                                  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `CALENDAR` blob NOT NULL,
                                  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
                                      `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
                                      CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
                                       `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `FIRED_TIME` bigint NOT NULL,
                                       `SCHED_TIME` bigint NOT NULL,
                                       `PRIORITY` int NOT NULL,
                                       `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
                                       KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
                                       KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
                                       KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
                                       KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
                                       KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
                                       KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
                                    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `JOB_DATA` blob,
                                    PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
                                    KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
                                    KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
                              `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('schedulerName','STATE_ACCESS'),('schedulerName','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
                                            `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                            PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
                                        `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `LAST_CHECKIN_TIME` bigint NOT NULL,
                                        `CHECKIN_INTERVAL` bigint NOT NULL,
                                        PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('schedulerName','cmlanchedeMBP.lan1686397141072',1686397645131,15000);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
                                        `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `REPEAT_COUNT` bigint NOT NULL,
                                        `REPEAT_INTERVAL` bigint NOT NULL,
                                        `TIMES_TRIGGERED` bigint NOT NULL,
                                        PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
                                        CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
                                         `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `INT_PROP_1` int DEFAULT NULL,
                                         `INT_PROP_2` int DEFAULT NULL,
                                         `LONG_PROP_1` bigint DEFAULT NULL,
                                         `LONG_PROP_2` bigint DEFAULT NULL,
                                         `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
                                         `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
                                         `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
                                         CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
                                 `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `NEXT_FIRE_TIME` bigint DEFAULT NULL,
                                 `PREV_FIRE_TIME` bigint DEFAULT NULL,
                                 `PRIORITY` int DEFAULT NULL,
                                 `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `START_TIME` bigint NOT NULL,
                                 `END_TIME` bigint DEFAULT NULL,
                                 `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `MISFIRE_INSTR` smallint DEFAULT NULL,
                                 `JOB_DATA` blob,
                                 PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
                                 KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
                                 KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
                                 KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
                                 KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
                                 KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
                                 KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
                                 KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
                                 KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
                                 KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
                                 KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
                                 KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
                                 KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
                                 CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dept`
--

DROP TABLE IF EXISTS `system_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dept` (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
                               `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
                               `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父部门id',
                               `sort` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
                               `leader_user_id` bigint DEFAULT NULL COMMENT '负责人',
                               `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
                               `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
                               `status` tinyint NOT NULL COMMENT '部门状态（0正常 1停用）',
                               `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                               `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dept`
--

LOCK TABLES `system_dept` WRITE;
/*!40000 ALTER TABLE `system_dept` DISABLE KEYS */;
INSERT INTO `system_dept` VALUES (100,'芋道源码',0,0,1,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2022-06-19 00:29:10',_binary '\0',1),(101,'深圳总公司',100,1,104,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2022-05-16 20:25:23',_binary '\0',1),(102,'长沙分公司',100,2,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','','2021-12-15 05:01:40',_binary '\0',1),(103,'研发部门',101,1,104,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','103','2022-01-14 01:04:14',_binary '\0',1),(104,'市场部门',101,2,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','','2021-12-15 05:01:38',_binary '\0',1),(105,'测试部门',101,3,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2022-05-16 20:25:15',_binary '\0',1),(106,'财务部门',101,4,103,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','103','2022-01-15 21:32:22',_binary '\0',1),(107,'运维部门',101,5,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','','2021-12-15 05:01:33',_binary '\0',1),(108,'市场部门',102,1,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','1','2022-02-16 08:35:45',_binary '\0',1),(109,'财务部门',102,2,NULL,'15888888888','ry@qq.com',0,'admin','2021-01-05 17:03:47','','2021-12-15 05:01:29',_binary '\0',1),(110,'新部门',0,1,NULL,NULL,NULL,0,'110','2022-02-23 20:46:30','110','2022-02-23 20:46:30',_binary '\0',121),(111,'顶级部门',0,1,NULL,NULL,NULL,0,'113','2022-03-07 21:44:50','113','2022-03-07 21:44:50',_binary '\0',122);
/*!40000 ALTER TABLE `system_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dict_data`
--

DROP TABLE IF EXISTS `system_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict_data` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                    `sort` int NOT NULL DEFAULT '0' COMMENT '字典排序',
                                    `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典标签',
                                    `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典键值',
                                    `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典类型',
                                    `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                    `color_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '颜色类型',
                                    `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'css 样式',
                                    `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                    `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dict_data`
--

LOCK TABLES `system_dict_data` WRITE;
/*!40000 ALTER TABLE `system_dict_data` DISABLE KEYS */;
INSERT INTO `system_dict_data` VALUES (1,1,'男','1','system_user_sex',0,'default','A','性别男','admin','2021-01-05 17:03:48','1','2022-03-29 00:14:39',_binary '\0'),(2,2,'女','2','system_user_sex',1,'success','','性别女','admin','2021-01-05 17:03:48','1','2022-02-16 01:30:51',_binary '\0'),(8,1,'正常','1','infra_job_status',0,'success','','正常状态','admin','2021-01-05 17:03:48','1','2022-02-16 19:33:38',_binary '\0'),(9,2,'暂停','2','infra_job_status',0,'danger','','停用状态','admin','2021-01-05 17:03:48','1','2022-02-16 19:33:45',_binary '\0'),(12,1,'系统内置','1','infra_config_type',0,'danger','','参数类型 - 系统内置','admin','2021-01-05 17:03:48','1','2022-02-16 19:06:02',_binary '\0'),(13,2,'自定义','2','infra_config_type',0,'primary','','参数类型 - 自定义','admin','2021-01-05 17:03:48','1','2022-02-16 19:06:07',_binary '\0'),(14,1,'通知','1','system_notice_type',0,'success','','通知','admin','2021-01-05 17:03:48','1','2022-02-16 13:05:57',_binary '\0'),(15,2,'公告','2','system_notice_type',0,'info','','公告','admin','2021-01-05 17:03:48','1','2022-02-16 13:06:01',_binary '\0'),(16,0,'其它','0','system_operate_type',0,'default','','其它操作','admin','2021-01-05 17:03:48','1','2022-02-16 09:32:46',_binary '\0'),(17,1,'查询','1','system_operate_type',0,'info','','查询操作','admin','2021-01-05 17:03:48','1','2022-02-16 09:33:16',_binary '\0'),(18,2,'新增','2','system_operate_type',0,'primary','','新增操作','admin','2021-01-05 17:03:48','1','2022-02-16 09:33:13',_binary '\0'),(19,3,'修改','3','system_operate_type',0,'warning','','修改操作','admin','2021-01-05 17:03:48','1','2022-02-16 09:33:22',_binary '\0'),(20,4,'删除','4','system_operate_type',0,'danger','','删除操作','admin','2021-01-05 17:03:48','1','2022-02-16 09:33:27',_binary '\0'),(22,5,'导出','5','system_operate_type',0,'default','','导出操作','admin','2021-01-05 17:03:48','1','2022-02-16 09:33:32',_binary '\0'),(23,6,'导入','6','system_operate_type',0,'default','','导入操作','admin','2021-01-05 17:03:48','1','2022-02-16 09:33:35',_binary '\0'),(27,1,'开启','0','common_status',0,'primary','','开启状态','admin','2021-01-05 17:03:48','1','2022-02-16 08:00:39',_binary '\0'),(28,2,'关闭','1','common_status',0,'info','','关闭状态','admin','2021-01-05 17:03:48','1','2022-02-16 08:00:44',_binary '\0'),(29,1,'目录','1','system_menu_type',0,'','','目录','admin','2021-01-05 17:03:48','','2022-02-01 16:43:45',_binary '\0'),(30,2,'菜单','2','system_menu_type',0,'','','菜单','admin','2021-01-05 17:03:48','','2022-02-01 16:43:41',_binary '\0'),(31,3,'按钮','3','system_menu_type',0,'','','按钮','admin','2021-01-05 17:03:48','','2022-02-01 16:43:39',_binary '\0'),(32,1,'内置','1','system_role_type',0,'danger','','内置角色','admin','2021-01-05 17:03:48','1','2022-02-16 13:02:08',_binary '\0'),(33,2,'自定义','2','system_role_type',0,'primary','','自定义角色','admin','2021-01-05 17:03:48','1','2022-02-16 13:02:12',_binary '\0'),(34,1,'全部数据权限','1','system_data_scope',0,'','','全部数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:17',_binary '\0'),(35,2,'指定部门数据权限','2','system_data_scope',0,'','','指定部门数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:18',_binary '\0'),(36,3,'本部门数据权限','3','system_data_scope',0,'','','本部门数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:16',_binary '\0'),(37,4,'本部门及以下数据权限','4','system_data_scope',0,'','','本部门及以下数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:21',_binary '\0'),(38,5,'仅本人数据权限','5','system_data_scope',0,'','','仅本人数据权限','admin','2021-01-05 17:03:48','','2022-02-01 16:47:23',_binary '\0'),(39,0,'成功','0','system_login_result',0,'success','','登陆结果 - 成功','','2021-01-18 06:17:36','1','2022-02-16 13:23:49',_binary '\0'),(40,10,'账号或密码不正确','10','system_login_result',0,'primary','','登陆结果 - 账号或密码不正确','','2021-01-18 06:17:54','1','2022-02-16 13:24:27',_binary '\0'),(41,20,'用户被禁用','20','system_login_result',0,'warning','','登陆结果 - 用户被禁用','','2021-01-18 06:17:54','1','2022-02-16 13:23:57',_binary '\0'),(42,30,'验证码不存在','30','system_login_result',0,'info','','登陆结果 - 验证码不存在','','2021-01-18 06:17:54','1','2022-02-16 13:24:07',_binary '\0'),(43,31,'验证码不正确','31','system_login_result',0,'info','','登陆结果 - 验证码不正确','','2021-01-18 06:17:54','1','2022-02-16 13:24:11',_binary '\0'),(44,100,'未知异常','100','system_login_result',0,'danger','','登陆结果 - 未知异常','','2021-01-18 06:17:54','1','2022-02-16 13:24:23',_binary '\0'),(45,1,'是','true','infra_boolean_string',0,'danger','','Boolean 是否类型 - 是','','2021-01-19 03:20:55','1','2022-03-15 23:01:45',_binary '\0'),(46,1,'否','false','infra_boolean_string',0,'info','','Boolean 是否类型 - 否','','2021-01-19 03:20:55','1','2022-03-15 23:09:45',_binary '\0'),(47,1,'永不超时','1','infra_redis_timeout_type',0,'primary','','Redis 未设置超时的情况','','2021-01-26 00:53:17','1','2022-02-16 19:03:35',_binary '\0'),(48,1,'动态超时','2','infra_redis_timeout_type',0,'info','','程序里动态传入超时时间，无法固定','','2021-01-26 00:55:00','1','2022-02-16 19:03:41',_binary '\0'),(49,3,'固定超时','3','infra_redis_timeout_type',0,'success','','Redis 设置了过期时间','','2021-01-26 00:55:26','1','2022-02-16 19:03:45',_binary '\0'),(50,1,'单表（增删改查）','1','infra_codegen_template_type',0,'','',NULL,'','2021-02-05 07:09:06','','2022-03-10 16:33:15',_binary '\0'),(51,2,'树表（增删改查）','2','infra_codegen_template_type',0,'','',NULL,'','2021-02-05 07:14:46','','2022-03-10 16:33:19',_binary '\0'),(53,0,'初始化中','0','infra_job_status',0,'primary','',NULL,'','2021-02-07 07:46:49','1','2022-02-16 19:33:29',_binary '\0'),(57,0,'运行中','0','infra_job_log_status',0,'primary','','RUNNING','','2021-02-08 10:04:24','1','2022-02-16 19:07:48',_binary '\0'),(58,1,'成功','1','infra_job_log_status',0,'success','',NULL,'','2021-02-08 10:06:57','1','2022-02-16 19:07:52',_binary '\0'),(59,2,'失败','2','infra_job_log_status',0,'warning','','失败','','2021-02-08 10:07:38','1','2022-02-16 19:07:56',_binary '\0'),(60,1,'会员','1','user_type',0,'primary','',NULL,'','2021-02-26 00:16:27','1','2022-02-16 10:22:19',_binary '\0'),(61,2,'管理员','2','user_type',0,'success','',NULL,'','2021-02-26 00:16:34','1','2022-02-16 10:22:22',_binary '\0'),(62,0,'未处理','0','infra_api_error_log_process_status',0,'primary','',NULL,'','2021-02-26 07:07:19','1','2022-02-16 20:14:17',_binary '\0'),(63,1,'已处理','1','infra_api_error_log_process_status',0,'success','',NULL,'','2021-02-26 07:07:26','1','2022-02-16 20:14:08',_binary '\0'),(64,2,'已忽略','2','infra_api_error_log_process_status',0,'danger','',NULL,'','2021-02-26 07:07:34','1','2022-02-16 20:14:14',_binary '\0'),(66,2,'阿里云','ALIYUN','system_sms_channel_code',0,'primary','',NULL,'1','2021-04-05 01:05:26','1','2022-02-16 10:09:52',_binary '\0'),(67,1,'验证码','1','system_sms_template_type',0,'warning','',NULL,'1','2021-04-05 21:50:57','1','2022-02-16 12:48:30',_binary '\0'),(68,2,'通知','2','system_sms_template_type',0,'primary','',NULL,'1','2021-04-05 21:51:08','1','2022-02-16 12:48:27',_binary '\0'),(69,0,'营销','3','system_sms_template_type',0,'danger','',NULL,'1','2021-04-05 21:51:15','1','2022-02-16 12:48:22',_binary '\0'),(70,0,'初始化','0','system_sms_send_status',0,'primary','',NULL,'1','2021-04-11 20:18:33','1','2022-02-16 10:26:07',_binary '\0'),(71,1,'发送成功','10','system_sms_send_status',0,'success','',NULL,'1','2021-04-11 20:18:43','1','2022-02-16 10:25:56',_binary '\0'),(72,2,'发送失败','20','system_sms_send_status',0,'danger','',NULL,'1','2021-04-11 20:18:49','1','2022-02-16 10:26:03',_binary '\0'),(73,3,'不发送','30','system_sms_send_status',0,'info','',NULL,'1','2021-04-11 20:19:44','1','2022-02-16 10:26:10',_binary '\0'),(74,0,'等待结果','0','system_sms_receive_status',0,'primary','',NULL,'1','2021-04-11 20:27:43','1','2022-02-16 10:28:24',_binary '\0'),(75,1,'接收成功','10','system_sms_receive_status',0,'success','',NULL,'1','2021-04-11 20:29:25','1','2022-02-16 10:28:28',_binary '\0'),(76,2,'接收失败','20','system_sms_receive_status',0,'danger','',NULL,'1','2021-04-11 20:29:31','1','2022-02-16 10:28:32',_binary '\0'),(77,0,'调试(钉钉)','DEBUG_DING_TALK','system_sms_channel_code',0,'info','',NULL,'1','2021-04-13 00:20:37','1','2022-02-16 10:10:00',_binary '\0'),(78,1,'自动生成','1','system_error_code_type',0,'warning','',NULL,'1','2021-04-21 00:06:48','1','2022-02-16 13:57:20',_binary '\0'),(79,2,'手动编辑','2','system_error_code_type',0,'primary','',NULL,'1','2021-04-21 00:07:14','1','2022-02-16 13:57:24',_binary '\0'),(80,100,'账号登录','100','system_login_type',0,'primary','','账号登录','1','2021-10-06 00:52:02','1','2022-02-16 13:11:34',_binary '\0'),(81,101,'社交登录','101','system_login_type',0,'info','','社交登录','1','2021-10-06 00:52:17','1','2022-02-16 13:11:40',_binary '\0'),(83,200,'主动登出','200','system_login_type',0,'primary','','主动登出','1','2021-10-06 00:52:58','1','2022-02-16 13:11:49',_binary '\0'),(85,202,'强制登出','202','system_login_type',0,'danger','','强制退出','1','2021-10-06 00:53:41','1','2022-02-16 13:11:57',_binary '\0'),(86,0,'病假','1','bpm_oa_leave_type',0,'primary','',NULL,'1','2021-09-21 22:35:28','1','2022-02-16 10:00:41',_binary '\0'),(87,1,'事假','2','bpm_oa_leave_type',0,'info','',NULL,'1','2021-09-21 22:36:11','1','2022-02-16 10:00:49',_binary '\0'),(88,2,'婚假','3','bpm_oa_leave_type',0,'warning','',NULL,'1','2021-09-21 22:36:38','1','2022-02-16 10:00:53',_binary '\0'),(98,1,'v2','v2','pay_channel_wechat_version',0,'','','v2版本','1','2021-11-08 17:00:58','1','2021-11-08 17:00:58',_binary '\0'),(99,2,'v3','v3','pay_channel_wechat_version',0,'','','v3版本','1','2021-11-08 17:01:07','1','2021-11-08 17:01:07',_binary '\0'),(108,1,'RSA2','RSA2','pay_channel_alipay_sign_type',0,'','','RSA2','1','2021-11-18 15:39:29','1','2021-11-18 15:39:29',_binary '\0'),(109,1,'公钥模式','1','pay_channel_alipay_mode',0,'','','公钥模式：privateKey + alipayPublicKey','1','2021-11-18 15:45:23','1','2021-11-18 15:45:23',_binary '\0'),(110,2,'证书模式','2','pay_channel_alipay_mode',0,'','','证书模式：appCertContent + alipayPublicCertContent + rootCertContent','1','2021-11-18 15:45:40','1','2021-11-18 15:45:40',_binary '\0'),(111,1,'线上','https://openapi.alipay.com/gateway.do','pay_channel_alipay_server_type',0,'','','网关地址 - 线上','1','2021-11-18 16:59:32','1','2021-11-21 17:37:29',_binary '\0'),(112,2,'沙箱','https://openapi.alipaydev.com/gateway.do','pay_channel_alipay_server_type',0,'','','网关地址 - 沙箱','1','2021-11-18 16:59:48','1','2021-11-21 17:37:39',_binary '\0'),(113,1,'微信 JSAPI 支付','wx_pub','pay_channel_code_type',0,'','','微信 JSAPI（公众号） 支付','1','2021-12-03 10:40:24','1','2021-12-04 16:41:00',_binary '\0'),(114,2,'微信小程序支付','wx_lite','pay_channel_code_type',0,'','','微信小程序支付','1','2021-12-03 10:41:06','1','2021-12-03 10:41:06',_binary '\0'),(115,3,'微信 App 支付','wx_app','pay_channel_code_type',0,'','','微信 App 支付','1','2021-12-03 10:41:20','1','2021-12-03 10:41:20',_binary '\0'),(116,4,'支付宝 PC 网站支付','alipay_pc','pay_channel_code_type',0,'','','支付宝 PC 网站支付','1','2021-12-03 10:42:09','1','2021-12-03 10:42:09',_binary '\0'),(117,5,'支付宝 Wap 网站支付','alipay_wap','pay_channel_code_type',0,'','','支付宝 Wap 网站支付','1','2021-12-03 10:42:26','1','2021-12-03 10:42:26',_binary '\0'),(118,6,'支付宝App 支付','alipay_app','pay_channel_code_type',0,'','','支付宝App 支付','1','2021-12-03 10:42:55','1','2021-12-03 10:42:55',_binary '\0'),(119,7,'支付宝扫码支付','alipay_qr','pay_channel_code_type',0,'','','支付宝扫码支付','1','2021-12-03 10:43:10','1','2021-12-03 10:43:10',_binary '\0'),(120,1,'通知成功','10','pay_order_notify_status',0,'success','','通知成功','1','2021-12-03 11:02:41','1','2022-02-16 13:59:13',_binary '\0'),(121,2,'通知失败','20','pay_order_notify_status',0,'danger','','通知失败','1','2021-12-03 11:02:59','1','2022-02-16 13:59:17',_binary '\0'),(122,3,'未通知','0','pay_order_notify_status',0,'info','','未通知','1','2021-12-03 11:03:10','1','2022-02-16 13:59:23',_binary '\0'),(123,1,'支付成功','10','pay_order_status',0,'success','','支付成功','1','2021-12-03 11:18:29','1','2022-02-16 15:24:25',_binary '\0'),(124,2,'支付关闭','20','pay_order_status',0,'danger','','支付关闭','1','2021-12-03 11:18:42','1','2022-02-16 15:24:31',_binary '\0'),(125,3,'未支付','0','pay_order_status',0,'info','','未支付','1','2021-12-03 11:18:18','1','2022-02-16 15:24:35',_binary '\0'),(126,1,'未退款','0','pay_order_refund_status',0,'','','未退款','1','2021-12-03 11:30:35','1','2021-12-03 11:34:05',_binary '\0'),(127,2,'部分退款','10','pay_order_refund_status',0,'','','部分退款','1','2021-12-03 11:30:44','1','2021-12-03 11:34:10',_binary '\0'),(128,3,'全部退款','20','pay_order_refund_status',0,'','','全部退款','1','2021-12-03 11:30:52','1','2021-12-03 11:34:14',_binary '\0'),(1117,1,'退款订单生成','0','pay_refund_order_status',0,'primary','','退款订单生成','1','2021-12-10 16:44:44','1','2022-02-16 14:05:24',_binary '\0'),(1118,2,'退款成功','1','pay_refund_order_status',0,'success','','退款成功','1','2021-12-10 16:44:59','1','2022-02-16 14:05:28',_binary '\0'),(1119,3,'退款失败','2','pay_refund_order_status',0,'danger','','退款失败','1','2021-12-10 16:45:10','1','2022-02-16 14:05:34',_binary '\0'),(1124,8,'退款关闭','99','pay_refund_order_status',0,'info','','退款关闭','1','2021-12-10 16:46:26','1','2022-02-16 14:05:40',_binary '\0'),(1125,0,'默认','1','bpm_model_category',0,'primary','','流程分类 - 默认','1','2022-01-02 08:41:11','1','2022-02-16 20:01:42',_binary '\0'),(1126,0,'OA','2','bpm_model_category',0,'success','','流程分类 - OA','1','2022-01-02 08:41:22','1','2022-02-16 20:01:50',_binary '\0'),(1127,0,'进行中','1','bpm_process_instance_status',0,'primary','','流程实例的状态 - 进行中','1','2022-01-07 23:47:22','1','2022-02-16 20:07:49',_binary '\0'),(1128,2,'已完成','2','bpm_process_instance_status',0,'success','','流程实例的状态 - 已完成','1','2022-01-07 23:47:49','1','2022-02-16 20:07:54',_binary '\0'),(1129,1,'处理中','1','bpm_process_instance_result',0,'primary','','流程实例的结果 - 处理中','1','2022-01-07 23:48:32','1','2022-02-16 09:53:26',_binary '\0'),(1130,2,'通过','2','bpm_process_instance_result',0,'success','','流程实例的结果 - 通过','1','2022-01-07 23:48:45','1','2022-02-16 09:53:31',_binary '\0'),(1131,3,'不通过','3','bpm_process_instance_result',0,'danger','','流程实例的结果 - 不通过','1','2022-01-07 23:48:55','1','2022-02-16 09:53:38',_binary '\0'),(1132,4,'已取消','4','bpm_process_instance_result',0,'info','','流程实例的结果 - 撤销','1','2022-01-07 23:49:06','1','2022-02-16 09:53:42',_binary '\0'),(1133,10,'流程表单','10','bpm_model_form_type',0,'','','流程的表单类型 - 流程表单','103','2022-01-11 23:51:30','103','2022-01-11 23:51:30',_binary '\0'),(1134,20,'业务表单','20','bpm_model_form_type',0,'','','流程的表单类型 - 业务表单','103','2022-01-11 23:51:47','103','2022-01-11 23:51:47',_binary '\0'),(1135,10,'角色','10','bpm_task_assign_rule_type',0,'info','','任务分配规则的类型 - 角色','103','2022-01-12 23:21:22','1','2022-02-16 20:06:14',_binary '\0'),(1136,20,'部门的成员','20','bpm_task_assign_rule_type',0,'primary','','任务分配规则的类型 - 部门的成员','103','2022-01-12 23:21:47','1','2022-02-16 20:05:28',_binary '\0'),(1137,21,'部门的负责人','21','bpm_task_assign_rule_type',0,'primary','','任务分配规则的类型 - 部门的负责人','103','2022-01-12 23:33:36','1','2022-02-16 20:05:31',_binary '\0'),(1138,30,'用户','30','bpm_task_assign_rule_type',0,'info','','任务分配规则的类型 - 用户','103','2022-01-12 23:34:02','1','2022-02-16 20:05:50',_binary '\0'),(1139,40,'用户组','40','bpm_task_assign_rule_type',0,'warning','','任务分配规则的类型 - 用户组','103','2022-01-12 23:34:21','1','2022-02-16 20:05:57',_binary '\0'),(1140,50,'自定义脚本','50','bpm_task_assign_rule_type',0,'danger','','任务分配规则的类型 - 自定义脚本','103','2022-01-12 23:34:43','1','2022-02-16 20:06:01',_binary '\0'),(1141,22,'岗位','22','bpm_task_assign_rule_type',0,'success','','任务分配规则的类型 - 岗位','103','2022-01-14 18:41:55','1','2022-02-16 20:05:39',_binary '\0'),(1142,10,'流程发起人','10','bpm_task_assign_script',0,'','','任务分配自定义脚本 - 流程发起人','103','2022-01-15 00:10:57','103','2022-01-15 21:24:10',_binary '\0'),(1143,20,'流程发起人的一级领导','20','bpm_task_assign_script',0,'','','任务分配自定义脚本 - 流程发起人的一级领导','103','2022-01-15 21:24:31','103','2022-01-15 21:24:31',_binary '\0'),(1144,21,'流程发起人的二级领导','21','bpm_task_assign_script',0,'','','任务分配自定义脚本 - 流程发起人的二级领导','103','2022-01-15 21:24:46','103','2022-01-15 21:24:57',_binary '\0'),(1145,1,'管理后台','1','infra_codegen_scene',0,'','','代码生成的场景枚举 - 管理后台','1','2022-02-02 13:15:06','1','2022-03-10 16:32:59',_binary '\0'),(1146,2,'用户 APP','2','infra_codegen_scene',0,'','','代码生成的场景枚举 - 用户 APP','1','2022-02-02 13:15:19','1','2022-03-10 16:33:03',_binary '\0'),(1147,0,'未退款','0','pay_refund_order_type',0,'info','','退款类型 - 未退款','1','2022-02-16 14:09:01','1','2022-02-16 14:09:01',_binary '\0'),(1148,10,'部分退款','10','pay_refund_order_type',0,'success','','退款类型 - 部分退款','1','2022-02-16 14:09:25','1','2022-02-16 14:11:38',_binary '\0'),(1149,20,'全部退款','20','pay_refund_order_type',0,'warning','','退款类型 - 全部退款','1','2022-02-16 14:11:33','1','2022-02-16 14:11:33',_binary '\0'),(1150,1,'数据库','1','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:25:28','1','2022-03-15 00:25:28',_binary '\0'),(1151,10,'本地磁盘','10','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:25:41','1','2022-03-15 00:25:56',_binary '\0'),(1152,11,'FTP 服务器','11','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:26:06','1','2022-03-15 00:26:10',_binary '\0'),(1153,12,'SFTP 服务器','12','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:26:22','1','2022-03-15 00:26:22',_binary '\0'),(1154,20,'S3 对象存储','20','infra_file_storage',0,'default','',NULL,'1','2022-03-15 00:26:31','1','2022-03-15 00:26:45',_binary '\0'),(1155,103,'短信登录','103','system_login_type',0,'default','',NULL,'1','2022-05-09 23:57:58','1','2022-05-09 23:58:09',_binary '\0'),(1156,1,'password','password','system_oauth2_grant_type',0,'default','','密码模式','1','2022-05-12 00:22:05','1','2022-05-11 16:26:01',_binary '\0'),(1157,2,'authorization_code','authorization_code','system_oauth2_grant_type',0,'primary','','授权码模式','1','2022-05-12 00:22:59','1','2022-05-11 16:26:02',_binary '\0'),(1158,3,'implicit','implicit','system_oauth2_grant_type',0,'success','','简化模式','1','2022-05-12 00:23:40','1','2022-05-11 16:26:05',_binary '\0'),(1159,4,'client_credentials','client_credentials','system_oauth2_grant_type',0,'default','','客户端模式','1','2022-05-12 00:23:51','1','2022-05-11 16:26:08',_binary '\0'),(1160,5,'refresh_token','refresh_token','system_oauth2_grant_type',0,'info','','刷新模式','1','2022-05-12 00:24:02','1','2022-05-11 16:26:11',_binary '\0'),(1162,1,'销售中','1','product_spu_status',0,'success','','商品 SPU 状态 - 销售中','1','2022-10-24 21:19:47','1','2022-10-24 21:20:38',_binary '\0'),(1163,0,'仓库中','0','product_spu_status',0,'info','','商品 SPU 状态 - 仓库中','1','2022-10-24 21:20:54','1','2022-10-24 21:21:22',_binary '\0'),(1164,0,'回收站','-1','product_spu_status',0,'default','','商品 SPU 状态 - 回收站','1','2022-10-24 21:21:11','1','2022-10-24 21:21:11',_binary '\0'),(1165,1,'满减','1','promotion_discount_type',0,'success','','优惠类型 - 满减','1','2022-11-01 12:46:41','1','2022-11-01 12:50:11',_binary '\0'),(1166,2,'折扣','2','promotion_discount_type',0,'primary','','优惠类型 - 折扣','1','2022-11-01 12:46:51','1','2022-11-01 12:50:08',_binary '\0'),(1167,1,'固定日期','1','promotion_coupon_template_validity_type',0,'default','','优惠劵模板的有限期类型 - 固定日期','1','2022-11-02 00:07:34','1','2022-11-04 00:07:49',_binary '\0'),(1168,2,'领取之后','2','promotion_coupon_template_validity_type',0,'default','','优惠劵模板的有限期类型 - 领取之后','1','2022-11-02 00:07:54','1','2022-11-04 00:07:52',_binary '\0'),(1169,1,'全部商品参与','1','promotion_product_scope',0,'default','','营销的商品范围 - 全部商品参与','1','2022-11-02 00:28:22','1','2022-11-02 00:28:22',_binary '\0'),(1170,2,'指定商品参与','2','promotion_product_scope',0,'default','','营销的商品范围 - 指定商品参与','1','2022-11-02 00:28:34','1','2022-11-02 00:28:40',_binary '\0'),(1171,1,'已领取','1','promotion_coupon_status',0,'primary','','优惠劵的状态 - 已领取','1','2022-11-04 00:15:08','1','2022-11-04 19:16:04',_binary '\0'),(1172,2,'已使用','2','promotion_coupon_status',0,'success','','优惠劵的状态 - 已使用','1','2022-11-04 00:15:21','1','2022-11-04 19:16:08',_binary '\0'),(1173,3,'已过期','3','promotion_coupon_status',0,'info','','优惠劵的状态 - 已过期','1','2022-11-04 00:15:43','1','2022-11-04 19:16:12',_binary '\0'),(1174,1,'直接领取','1','promotion_coupon_take_type',0,'primary','','优惠劵的领取方式 - 直接领取','1','2022-11-04 19:13:00','1','2022-11-04 19:13:25',_binary '\0'),(1175,2,'指定发放','2','promotion_coupon_take_type',0,'success','','优惠劵的领取方式 - 指定发放','1','2022-11-04 19:13:13','1','2022-11-04 19:14:48',_binary '\0'),(1176,10,'未开始','10','promotion_activity_status',0,'primary','','促销活动的状态枚举 - 未开始','1','2022-11-04 22:54:49','1','2022-11-04 22:55:53',_binary '\0'),(1177,20,'进行中','20','promotion_activity_status',0,'success','','促销活动的状态枚举 - 进行中','1','2022-11-04 22:55:06','1','2022-11-04 22:55:20',_binary '\0'),(1178,30,'已结束','30','promotion_activity_status',0,'info','','促销活动的状态枚举 - 已结束','1','2022-11-04 22:55:41','1','2022-11-04 22:55:41',_binary '\0'),(1179,40,'已关闭','40','promotion_activity_status',0,'warning','','促销活动的状态枚举 - 已关闭','1','2022-11-04 22:56:10','1','2022-11-04 22:56:18',_binary '\0'),(1180,10,'满 N 元','10','promotion_condition_type',0,'primary','','营销的条件类型 - 满 N 元','1','2022-11-04 22:59:45','1','2022-11-04 22:59:45',_binary '\0'),(1181,20,'满 N 件','20','promotion_condition_type',0,'success','','营销的条件类型 - 满 N 件','1','2022-11-04 23:00:02','1','2022-11-04 23:00:02',_binary '\0'),(1182,10,'申请售后','10','trade_after_sale_status',0,'primary','','交易售后状态 - 申请售后','1','2022-11-19 20:53:33','1','2022-11-19 20:54:42',_binary '\0'),(1183,20,'商品待退货','20','trade_after_sale_status',0,'primary','','交易售后状态 - 商品待退货','1','2022-11-19 20:54:36','1','2022-11-19 20:58:58',_binary '\0'),(1184,30,'商家待收货','30','trade_after_sale_status',0,'primary','','交易售后状态 - 商家待收货','1','2022-11-19 20:56:56','1','2022-11-19 20:59:20',_binary '\0'),(1185,40,'等待退款','40','trade_after_sale_status',0,'primary','','交易售后状态 - 等待退款','1','2022-11-19 20:59:54','1','2022-11-19 21:00:01',_binary '\0'),(1186,50,'退款成功','50','trade_after_sale_status',0,'default','','交易售后状态 - 退款成功','1','2022-11-19 21:00:33','1','2022-11-19 21:00:33',_binary '\0'),(1187,61,'买家取消','61','trade_after_sale_status',0,'info','','交易售后状态 - 买家取消','1','2022-11-19 21:01:29','1','2022-11-19 21:01:29',_binary '\0'),(1188,62,'商家拒绝','62','trade_after_sale_status',0,'info','','交易售后状态 - 商家拒绝','1','2022-11-19 21:02:17','1','2022-11-19 21:02:17',_binary '\0'),(1189,63,'商家拒收货','63','trade_after_sale_status',0,'info','','交易售后状态 - 商家拒收货','1','2022-11-19 21:02:37','1','2022-11-19 21:03:07',_binary '\0'),(1190,10,'售中退款','10','trade_after_sale_type',0,'success','','交易售后的类型 - 售中退款','1','2022-11-19 21:05:05','1','2022-11-19 21:38:23',_binary '\0'),(1191,20,'售后退款','20','trade_after_sale_type',0,'primary','','交易售后的类型 - 售后退款','1','2022-11-19 21:05:32','1','2022-11-19 21:38:32',_binary '\0'),(1192,10,'仅退款','10','trade_after_sale_way',0,'primary','','交易售后的方式 - 仅退款','1','2022-11-19 21:39:19','1','2022-11-19 21:39:19',_binary '\0'),(1193,20,'退货退款','20','trade_after_sale_way',0,'success','','交易售后的方式 - 退货退款','1','2022-11-19 21:39:38','1','2022-11-19 21:39:49',_binary '\0'),(1194,10,'微信小程序','10','terminal',0,'default','','终端 - 微信小程序','1','2022-12-10 10:51:11','1','2022-12-10 10:51:57',_binary '\0'),(1195,20,'H5 网页','20','terminal',0,'default','','终端 - H5 网页','1','2022-12-10 10:51:30','1','2022-12-10 10:51:59',_binary '\0'),(1196,11,'微信公众号','11','terminal',0,'default','','终端 - 微信公众号','1','2022-12-10 10:54:16','1','2022-12-10 10:52:01',_binary '\0'),(1197,31,'苹果 App','31','terminal',0,'default','','终端 - 苹果 App','1','2022-12-10 10:54:42','1','2022-12-10 10:52:18',_binary '\0'),(1198,32,'安卓 App','32','terminal',0,'default','','终端 - 安卓 App','1','2022-12-10 10:55:02','1','2022-12-10 10:59:17',_binary '\0'),(1199,0,'普通订单','0','trade_order_type',0,'default','','交易订单的类型 - 普通订单','1','2022-12-10 16:34:14','1','2022-12-10 16:34:14',_binary '\0'),(1200,1,'秒杀订单','1','trade_order_type',0,'default','','交易订单的类型 - 秒杀订单','1','2022-12-10 16:34:26','1','2022-12-10 16:34:26',_binary '\0'),(1201,2,'拼团订单','2','trade_order_type',0,'default','','交易订单的类型 - 拼团订单','1','2022-12-10 16:34:36','1','2022-12-10 16:34:36',_binary '\0'),(1202,3,'砍价订单','3','trade_order_type',0,'default','','交易订单的类型 - 砍价订单','1','2022-12-10 16:34:48','1','2022-12-10 16:34:48',_binary '\0'),(1203,0,'待支付','0','trade_order_status',0,'default','','交易订单状态 - 待支付','1','2022-12-10 16:49:29','1','2022-12-10 16:49:29',_binary '\0'),(1204,10,'待发货','10','trade_order_status',0,'primary','','交易订单状态 - 待发货','1','2022-12-10 16:49:53','1','2022-12-10 16:51:17',_binary '\0'),(1205,20,'已发货','20','trade_order_status',0,'primary','','交易订单状态 - 已发货','1','2022-12-10 16:50:13','1','2022-12-10 16:51:31',_binary '\0'),(1206,30,'已完成','30','trade_order_status',0,'success','','交易订单状态 - 已完成','1','2022-12-10 16:50:30','1','2022-12-10 16:51:06',_binary '\0'),(1207,40,'已取消','40','trade_order_status',0,'danger','','交易订单状态 - 已取消','1','2022-12-10 16:50:50','1','2022-12-10 16:51:00',_binary '\0'),(1208,0,'未售后','0','trade_order_item_after_sale_status',0,'info','','交易订单项的售后状态 - 未售后','1','2022-12-10 20:58:42','1','2022-12-10 20:59:29',_binary '\0'),(1209,1,'售后中','1','trade_order_item_after_sale_status',0,'primary','','交易订单项的售后状态 - 售后中','1','2022-12-10 20:59:21','1','2022-12-10 20:59:21',_binary '\0'),(1210,2,'已退款','2','trade_order_item_after_sale_status',0,'success','','交易订单项的售后状态 - 已退款','1','2022-12-10 20:59:46','1','2022-12-10 20:59:46',_binary '\0'),(1211,1,'完全匹配','1','mp_auto_reply_request_match',0,'primary','','公众号自动回复的请求关键字匹配模式 - 完全匹配','1','2023-01-16 23:30:39','1','2023-01-16 23:31:00',_binary '\0'),(1212,2,'半匹配','2','mp_auto_reply_request_match',0,'success','','公众号自动回复的请求关键字匹配模式 - 半匹配','1','2023-01-16 23:30:55','1','2023-01-16 23:31:10',_binary '\0'),(1213,1,'文本','text','mp_message_type',0,'default','','公众号的消息类型 - 文本','1','2023-01-17 22:17:32','1','2023-01-17 22:17:39',_binary '\0'),(1214,2,'图片','image','mp_message_type',0,'default','','公众号的消息类型 - 图片','1','2023-01-17 22:17:32','1','2023-01-17 14:19:47',_binary '\0'),(1215,3,'语音','voice','mp_message_type',0,'default','','公众号的消息类型 - 语音','1','2023-01-17 22:17:32','1','2023-01-17 14:20:08',_binary '\0'),(1216,4,'视频','video','mp_message_type',0,'default','','公众号的消息类型 - 视频','1','2023-01-17 22:17:32','1','2023-01-17 14:21:08',_binary '\0'),(1217,5,'小视频','shortvideo','mp_message_type',0,'default','','公众号的消息类型 - 小视频','1','2023-01-17 22:17:32','1','2023-01-17 14:19:59',_binary '\0'),(1218,6,'图文','news','mp_message_type',0,'default','','公众号的消息类型 - 图文','1','2023-01-17 22:17:32','1','2023-01-17 14:22:54',_binary '\0'),(1219,7,'音乐','music','mp_message_type',0,'default','','公众号的消息类型 - 音乐','1','2023-01-17 22:17:32','1','2023-01-17 14:22:54',_binary '\0'),(1220,8,'地理位置','location','mp_message_type',0,'default','','公众号的消息类型 - 地理位置','1','2023-01-17 22:17:32','1','2023-01-17 14:23:51',_binary '\0'),(1221,9,'链接','link','mp_message_type',0,'default','','公众号的消息类型 - 链接','1','2023-01-17 22:17:32','1','2023-01-17 14:24:49',_binary '\0'),(1222,10,'事件','event','mp_message_type',0,'default','','公众号的消息类型 - 事件','1','2023-01-17 22:17:32','1','2023-01-17 14:24:49',_binary '\0'),(1223,0,'初始化','0','system_mail_send_status',0,'primary','','邮件发送状态 - 初始化\n','1','2023-01-26 09:53:49','1','2023-01-26 16:36:14',_binary '\0'),(1224,10,'发送成功','10','system_mail_send_status',0,'success','','邮件发送状态 - 发送成功','1','2023-01-26 09:54:28','1','2023-01-26 16:36:22',_binary '\0'),(1225,20,'发送失败','20','system_mail_send_status',0,'danger','','邮件发送状态 - 发送失败','1','2023-01-26 09:54:50','1','2023-01-26 16:36:26',_binary '\0'),(1226,30,'不发送','30','system_mail_send_status',0,'info','','邮件发送状态 -  不发送','1','2023-01-26 09:55:06','1','2023-01-26 16:36:36',_binary '\0'),(1227,1,'通知公告','1','system_notify_template_type',0,'primary','','站内信模版的类型 - 通知公告','1','2023-01-28 10:35:59','1','2023-01-28 10:35:59',_binary '\0'),(1228,2,'系统消息','2','system_notify_template_type',0,'success','','站内信模版的类型 - 系统消息','1','2023-01-28 10:36:20','1','2023-01-28 10:36:25',_binary '\0');
/*!40000 ALTER TABLE `system_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dict_type`
--

DROP TABLE IF EXISTS `system_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict_type` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                    `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典名称',
                                    `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典类型',
                                    `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                    `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                    `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                    `deleted_time` datetime DEFAULT NULL COMMENT '删除时间',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    UNIQUE KEY `dict_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dict_type`
--

LOCK TABLES `system_dict_type` WRITE;
/*!40000 ALTER TABLE `system_dict_type` DISABLE KEYS */;
INSERT INTO `system_dict_type` VALUES (1,'用户性别','system_user_sex',0,NULL,'admin','2021-01-05 17:03:48','1','2022-05-16 20:29:32',_binary '\0',NULL),(6,'参数类型','infra_config_type',0,NULL,'admin','2021-01-05 17:03:48','','2022-02-01 16:36:54',_binary '\0',NULL),(7,'通知类型','system_notice_type',0,NULL,'admin','2021-01-05 17:03:48','','2022-02-01 16:35:26',_binary '\0',NULL),(9,'操作类型','system_operate_type',0,NULL,'admin','2021-01-05 17:03:48','1','2022-02-16 09:32:21',_binary '\0',NULL),(10,'系统状态','common_status',0,NULL,'admin','2021-01-05 17:03:48','','2022-02-01 16:21:28',_binary '\0',NULL),(11,'Boolean 是否类型','infra_boolean_string',0,'boolean 转是否','','2021-01-19 03:20:08','','2022-02-01 16:37:10',_binary '\0',NULL),(104,'登陆结果','system_login_result',0,'登陆结果','','2021-01-18 06:17:11','','2022-02-01 16:36:00',_binary '\0',NULL),(105,'Redis 超时类型','infra_redis_timeout_type',0,'RedisKeyDefine.TimeoutTypeEnum','','2021-01-26 00:52:50','','2022-02-01 16:50:29',_binary '\0',NULL),(106,'代码生成模板类型','infra_codegen_template_type',0,NULL,'','2021-02-05 07:08:06','1','2022-05-16 20:26:50',_binary '\0',NULL),(107,'定时任务状态','infra_job_status',0,NULL,'','2021-02-07 07:44:16','','2022-02-01 16:51:11',_binary '\0',NULL),(108,'定时任务日志状态','infra_job_log_status',0,NULL,'','2021-02-08 10:03:51','','2022-02-01 16:50:43',_binary '\0',NULL),(109,'用户类型','user_type',0,NULL,'','2021-02-26 00:15:51','','2021-02-26 00:15:51',_binary '\0',NULL),(110,'API 异常数据的处理状态','infra_api_error_log_process_status',0,NULL,'','2021-02-26 07:07:01','','2022-02-01 16:50:53',_binary '\0',NULL),(111,'短信渠道编码','system_sms_channel_code',0,NULL,'1','2021-04-05 01:04:50','1','2022-02-16 02:09:08',_binary '\0',NULL),(112,'短信模板的类型','system_sms_template_type',0,NULL,'1','2021-04-05 21:50:43','1','2022-02-01 16:35:06',_binary '\0',NULL),(113,'短信发送状态','system_sms_send_status',0,NULL,'1','2021-04-11 20:18:03','1','2022-02-01 16:35:09',_binary '\0',NULL),(114,'短信接收状态','system_sms_receive_status',0,NULL,'1','2021-04-11 20:27:14','1','2022-02-01 16:35:14',_binary '\0',NULL),(115,'错误码的类型','system_error_code_type',0,NULL,'1','2021-04-21 00:06:30','1','2022-02-01 16:36:49',_binary '\0',NULL),(116,'登陆日志的类型','system_login_type',0,'登陆日志的类型','1','2021-10-06 00:50:46','1','2022-02-01 16:35:56',_binary '\0',NULL),(117,'OA 请假类型','bpm_oa_leave_type',0,NULL,'1','2021-09-21 22:34:33','1','2022-01-22 10:41:37',_binary '\0',NULL),(122,'支付渠道微信版本','pay_channel_wechat_version',0,'支付渠道微信版本','1','2021-11-08 17:00:26','1','2021-11-08 17:00:26',_binary '\0',NULL),(127,'支付渠道支付宝算法类型','pay_channel_alipay_sign_type',0,'支付渠道支付宝算法类型','1','2021-11-18 15:39:09','1','2021-11-18 15:39:09',_binary '\0',NULL),(128,'支付渠道支付宝公钥类型','pay_channel_alipay_mode',0,'支付渠道支付宝公钥类型','1','2021-11-18 15:44:28','1','2021-11-18 15:44:28',_binary '\0',NULL),(129,'支付宝网关地址','pay_channel_alipay_server_type',0,'支付宝网关地址','1','2021-11-18 16:58:55','1','2021-11-18 17:01:34',_binary '\0',NULL),(130,'支付渠道编码类型','pay_channel_code_type',0,'支付渠道的编码','1','2021-12-03 10:35:08','1','2021-12-03 10:35:08',_binary '\0',NULL),(131,'支付订单回调状态','pay_order_notify_status',0,'支付订单回调状态','1','2021-12-03 10:53:29','1','2021-12-03 10:53:29',_binary '\0',NULL),(132,'支付订单状态','pay_order_status',0,'支付订单状态','1','2021-12-03 11:17:50','1','2021-12-03 11:17:50',_binary '\0',NULL),(133,'支付订单退款状态','pay_order_refund_status',0,'支付订单退款状态','1','2021-12-03 11:27:31','1','2021-12-03 11:27:31',_binary '\0',NULL),(134,'退款订单状态','pay_refund_order_status',0,'退款订单状态','1','2021-12-10 16:42:50','1','2021-12-10 16:42:50',_binary '\0',NULL),(135,'退款订单类别','pay_refund_order_type',0,'退款订单类别','1','2021-12-10 17:14:53','1','2021-12-10 17:14:53',_binary '\0',NULL),(138,'流程分类','bpm_model_category',0,'流程分类','1','2022-01-02 08:40:45','1','2022-01-02 08:40:45',_binary '\0',NULL),(139,'流程实例的状态','bpm_process_instance_status',0,'流程实例的状态','1','2022-01-07 23:46:42','1','2022-01-07 23:46:42',_binary '\0',NULL),(140,'流程实例的结果','bpm_process_instance_result',0,'流程实例的结果','1','2022-01-07 23:48:10','1','2022-01-07 23:48:10',_binary '\0',NULL),(141,'流程的表单类型','bpm_model_form_type',0,'流程的表单类型','103','2022-01-11 23:50:45','103','2022-01-11 23:50:45',_binary '\0',NULL),(142,'任务分配规则的类型','bpm_task_assign_rule_type',0,'任务分配规则的类型','103','2022-01-12 23:21:04','103','2022-01-12 15:46:10',_binary '\0',NULL),(143,'任务分配自定义脚本','bpm_task_assign_script',0,'任务分配自定义脚本','103','2022-01-15 00:10:35','103','2022-01-15 00:10:35',_binary '\0',NULL),(144,'代码生成的场景枚举','infra_codegen_scene',0,'代码生成的场景枚举','1','2022-02-02 13:14:45','1','2022-03-10 16:33:46',_binary '\0',NULL),(145,'角色类型','system_role_type',0,'角色类型','1','2022-02-16 13:01:46','1','2022-02-16 13:01:46',_binary '\0',NULL),(146,'文件存储器','infra_file_storage',0,'文件存储器','1','2022-03-15 00:24:38','1','2022-03-15 00:24:38',_binary '\0',NULL),(147,'OAuth 2.0 授权类型','system_oauth2_grant_type',0,'OAuth 2.0 授权类型（模式）','1','2022-05-12 00:20:52','1','2022-05-11 16:25:49',_binary '\0',NULL),(149,'商品 SPU 状态','product_spu_status',0,'商品 SPU 状态','1','2022-10-24 21:19:04','1','2022-10-24 21:19:08',_binary '\0',NULL),(150,'优惠类型','promotion_discount_type',0,'优惠类型','1','2022-11-01 12:46:06','1','2022-11-01 12:46:06',_binary '\0',NULL),(151,'优惠劵模板的有限期类型','promotion_coupon_template_validity_type',0,'优惠劵模板的有限期类型','1','2022-11-02 00:06:20','1','2022-11-04 00:08:26',_binary '\0',NULL),(152,'营销的商品范围','promotion_product_scope',0,'营销的商品范围','1','2022-11-02 00:28:01','1','2022-11-02 00:28:01',_binary '\0',NULL),(153,'优惠劵的状态','promotion_coupon_status',0,'优惠劵的状态','1','2022-11-04 00:14:49','1','2022-11-04 00:14:49',_binary '\0',NULL),(154,'优惠劵的领取方式','promotion_coupon_take_type',0,'优惠劵的领取方式','1','2022-11-04 19:12:27','1','2022-11-04 19:12:27',_binary '\0',NULL),(155,'促销活动的状态','promotion_activity_status',0,'促销活动的状态','1','2022-11-04 22:54:23','1','2022-11-04 22:54:23',_binary '\0',NULL),(156,'营销的条件类型','promotion_condition_type',0,'营销的条件类型','1','2022-11-04 22:59:23','1','2022-11-04 22:59:23',_binary '\0',NULL),(157,'交易售后状态','trade_after_sale_status',0,'交易售后状态','1','2022-11-19 20:52:56','1','2022-11-19 20:52:56',_binary '\0',NULL),(158,'交易售后的类型','trade_after_sale_type',0,'交易售后的类型','1','2022-11-19 21:04:09','1','2022-11-19 21:04:09',_binary '\0',NULL),(159,'交易售后的方式','trade_after_sale_way',0,'交易售后的方式','1','2022-11-19 21:39:04','1','2022-11-19 21:39:04',_binary '\0',NULL),(160,'终端','terminal',0,'终端','1','2022-12-10 10:50:50','1','2022-12-10 10:53:11',_binary '\0',NULL),(161,'交易订单的类型','trade_order_type',0,'交易订单的类型','1','2022-12-10 16:33:54','1','2022-12-10 16:33:54',_binary '\0',NULL),(162,'交易订单的状态','trade_order_status',0,'交易订单的状态','1','2022-12-10 16:48:44','1','2022-12-10 16:48:44',_binary '\0',NULL),(163,'交易订单项的售后状态','trade_order_item_after_sale_status',0,'交易订单项的售后状态','1','2022-12-10 20:58:08','1','2022-12-10 20:58:08',_binary '\0',NULL),(164,'公众号自动回复的请求关键字匹配模式','mp_auto_reply_request_match',0,'公众号自动回复的请求关键字匹配模式','1','2023-01-16 23:29:56','1','2023-01-16 23:29:56',_binary '\0','1970-01-01 00:00:00'),(165,'公众号的消息类型','mp_message_type',0,'公众号的消息类型','1','2023-01-17 22:17:09','1','2023-01-17 22:17:09',_binary '\0','1970-01-01 00:00:00'),(166,'邮件发送状态','system_mail_send_status',0,'邮件发送状态','1','2023-01-26 09:53:13','1','2023-01-26 09:53:13',_binary '\0','1970-01-01 00:00:00'),(167,'站内信模版的类型','system_notify_template_type',0,'站内信模版的类型','1','2023-01-28 10:35:10','1','2023-01-28 10:35:10',_binary '\0','1970-01-01 00:00:00');
/*!40000 ALTER TABLE `system_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_error_code`
--

DROP TABLE IF EXISTS `system_error_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_error_code` (
                                     `id` bigint NOT NULL AUTO_INCREMENT COMMENT '错误码编号',
                                     `type` tinyint NOT NULL DEFAULT '0' COMMENT '错误码类型',
                                     `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
                                     `code` int NOT NULL DEFAULT '0' COMMENT '错误码编码',
                                     `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '错误码错误提示',
                                     `memo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
                                     `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                     `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                     `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5833 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='错误码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_error_code`
--

LOCK TABLES `system_error_code` WRITE;
/*!40000 ALTER TABLE `system_error_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_error_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_login_log`
--

DROP TABLE IF EXISTS `system_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_login_log` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                    `log_type` bigint NOT NULL COMMENT '日志类型',
                                    `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
                                    `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户编号',
                                    `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '用户类型',
                                    `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户账号',
                                    `result` tinyint NOT NULL COMMENT '登陆结果',
                                    `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
                                    `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
                                    `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                    `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1986 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_login_log`
--

LOCK TABLES `system_login_log` WRITE;
/*!40000 ALTER TABLE `system_login_log` DISABLE KEYS */;
INSERT INTO `system_login_log` VALUES (1985,100,'',1,2,'admin',0,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36',NULL,'2023-06-10 18:02:54',NULL,'2023-06-10 18:02:54',_binary '\0',1);
/*!40000 ALTER TABLE `system_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_account`
--

DROP TABLE IF EXISTS `system_mail_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_account` (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                       `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
                                       `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
                                       `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
                                       `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SMTP 服务器域名',
                                       `port` int NOT NULL COMMENT 'SMTP 服务器端口',
                                       `ssl_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否开启 SSL',
                                       `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                       `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱账号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_account`
--

LOCK TABLES `system_mail_account` WRITE;
/*!40000 ALTER TABLE `system_mail_account` DISABLE KEYS */;
INSERT INTO `system_mail_account` VALUES (1,'7684413@qq.com','7684413@qq.com','123457','127.0.0.1',8080,_binary '\0','1','2023-01-25 17:39:52','1','2023-01-26 22:59:04',_binary '\0'),(2,'ydym_test@163.com','ydym_test@163.com','WBZTEINMIFVRYSOE','smtp.163.com',465,_binary '','1','2023-01-26 01:26:03','1','2023-01-26 01:26:03',_binary '\0'),(3,'76854114@qq.com','3335','11234','yunai1.cn',466,_binary '\0','1','2023-01-27 15:06:38','1','2023-01-27 07:08:36',_binary '');
/*!40000 ALTER TABLE `system_mail_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_log`
--

DROP TABLE IF EXISTS `system_mail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_log` (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                   `user_id` bigint DEFAULT NULL COMMENT '用户编号',
                                   `user_type` tinyint DEFAULT NULL COMMENT '用户类型',
                                   `to_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收邮箱地址',
                                   `account_id` bigint NOT NULL COMMENT '邮箱账号编号',
                                   `from_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送邮箱地址',
                                   `template_id` bigint NOT NULL COMMENT '模板编号',
                                   `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
                                   `template_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模版发送人名称',
                                   `template_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件标题',
                                   `template_content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件内容',
                                   `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件参数',
                                   `send_status` tinyint NOT NULL DEFAULT '0' COMMENT '发送状态',
                                   `send_time` datetime DEFAULT NULL COMMENT '发送时间',
                                   `send_message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送返回的消息 ID',
                                   `send_exception` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送异常',
                                   `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮件日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_log`
--

LOCK TABLES `system_mail_log` WRITE;
/*!40000 ALTER TABLE `system_mail_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_template`
--

DROP TABLE IF EXISTS `system_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_template` (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                        `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
                                        `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
                                        `account_id` bigint NOT NULL COMMENT '发送的邮箱账号编号',
                                        `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送人名称',
                                        `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板标题',
                                        `content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
                                        `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
                                        `status` tinyint NOT NULL COMMENT '开启状态',
                                        `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                        `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮件模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_template`
--

LOCK TABLES `system_mail_template` WRITE;
/*!40000 ALTER TABLE `system_mail_template` DISABLE KEYS */;
INSERT INTO `system_mail_template` VALUES (13,'后台用户短信登录','admin-sms-login',1,'奥特曼','你猜我猜','<p>您的验证码是{code}，名字是{name}</p>','[\"code\",\"name\"]',0,'3','1','2021-10-11 08:10:00','1','2023-01-26 23:22:05',_binary '\0'),(14,'测试模版','test_01',2,'芋艿','一个标题','<p>你是 {key01} 吗？</p><p><br></p><p>是的话，赶紧 {key02} 一下！</p>','[\"key01\",\"key02\"]',0,NULL,'1','2023-01-26 01:27:40','1','2023-01-27 10:32:16',_binary '\0'),(15,'3','2',2,'7','4','<p>45</p>','[]',1,'80','1','2023-01-27 15:50:35','1','2023-01-27 16:34:49',_binary '\0');
/*!40000 ALTER TABLE `system_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_menu`
--

DROP TABLE IF EXISTS `system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_menu` (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                               `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
                               `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限标识',
                               `type` tinyint NOT NULL COMMENT '菜单类型',
                               `sort` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
                               `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父菜单ID',
                               `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由地址',
                               `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
                               `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
                               `status` tinyint NOT NULL DEFAULT '0' COMMENT '菜单状态',
                               `visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可见',
                               `keep_alive` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否缓存',
                               `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_menu`
--

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;
INSERT INTO `system_menu` VALUES (1,'系统管理','',1,10,0,'/system','system',NULL,0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(2,'基础设施','',1,20,0,'/infra','monitor',NULL,0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(5,'OA 示例','',1,40,1185,'oa','people',NULL,0,_binary '',_binary '','admin','2021-09-20 16:26:19','1','2022-04-20 17:03:10',_binary '\0'),(100,'用户管理','system:user:list',2,1,1,'user','user','system/user/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(101,'角色管理','',2,2,1,'role','peoples','system/role/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(102,'菜单管理','',2,3,1,'menu','tree-table','system/menu/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(103,'部门管理','',2,4,1,'dept','tree','system/dept/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(104,'岗位管理','',2,5,1,'post','post','system/post/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(105,'字典管理','',2,6,1,'dict','dict','system/dict/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(106,'配置管理','',2,6,2,'config','edit','infra/config/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(107,'通知公告','',2,8,1,'notice','message','system/notice/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(108,'审计日志','',1,9,1,'log','log','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(109,'令牌管理','',2,2,1261,'token','online','system/oauth2/token/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-05-11 23:31:42',_binary '\0'),(110,'定时任务','',2,12,2,'job','job','infra/job/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(111,'MySQL 监控','',2,9,2,'druid','druid','infra/druid/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(112,'Java 监控','',2,11,2,'admin-server','server','infra/server/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(113,'Redis 监控','',2,10,2,'redis','redis','infra/redis/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(114,'表单构建','infra:build:list',2,2,2,'build','build','infra/build/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(115,'代码生成','infra:codegen:query',2,1,2,'codegen','code','infra/codegen/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(116,'系统接口','infra:swagger:list',2,3,2,'swagger','swagger','infra/swagger/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(500,'操作日志','',2,1,108,'operate-log','form','system/operatelog/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(501,'登录日志','',2,2,108,'login-log','logininfor','system/loginlog/index',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1001,'用户查询','system:user:query',3,1,100,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1002,'用户新增','system:user:create',3,2,100,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1003,'用户修改','system:user:update',3,3,100,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1004,'用户删除','system:user:delete',3,4,100,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1005,'用户导出','system:user:export',3,5,100,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1006,'用户导入','system:user:import',3,6,100,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1007,'重置密码','system:user:update-password',3,7,100,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1008,'角色查询','system:role:query',3,1,101,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1009,'角色新增','system:role:create',3,2,101,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1010,'角色修改','system:role:update',3,3,101,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1011,'角色删除','system:role:delete',3,4,101,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1012,'角色导出','system:role:export',3,5,101,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1013,'菜单查询','system:menu:query',3,1,102,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1014,'菜单新增','system:menu:create',3,2,102,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1015,'菜单修改','system:menu:update',3,3,102,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1016,'菜单删除','system:menu:delete',3,4,102,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1017,'部门查询','system:dept:query',3,1,103,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1018,'部门新增','system:dept:create',3,2,103,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1019,'部门修改','system:dept:update',3,3,103,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1020,'部门删除','system:dept:delete',3,4,103,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1021,'岗位查询','system:post:query',3,1,104,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1022,'岗位新增','system:post:create',3,2,104,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1023,'岗位修改','system:post:update',3,3,104,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1024,'岗位删除','system:post:delete',3,4,104,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1025,'岗位导出','system:post:export',3,5,104,'','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1026,'字典查询','system:dict:query',3,1,105,'#','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1027,'字典新增','system:dict:create',3,2,105,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1028,'字典修改','system:dict:update',3,3,105,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1029,'字典删除','system:dict:delete',3,4,105,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1030,'字典导出','system:dict:export',3,5,105,'#','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1031,'配置查询','infra:config:query',3,1,106,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1032,'配置新增','infra:config:create',3,2,106,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1033,'配置修改','infra:config:update',3,3,106,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1034,'配置删除','infra:config:delete',3,4,106,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1035,'配置导出','infra:config:export',3,5,106,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1036,'公告查询','system:notice:query',3,1,107,'#','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1037,'公告新增','system:notice:create',3,2,107,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1038,'公告修改','system:notice:update',3,3,107,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1039,'公告删除','system:notice:delete',3,4,107,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1040,'操作查询','system:operate-log:query',3,1,500,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1042,'日志导出','system:operate-log:export',3,2,500,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1043,'登录查询','system:login-log:query',3,1,501,'#','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1045,'日志导出','system:login-log:export',3,3,501,'#','#','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1046,'令牌列表','system:oauth2-token:page',3,1,109,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-05-09 23:54:42',_binary '\0'),(1048,'令牌删除','system:oauth2-token:delete',3,2,109,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-05-09 23:54:53',_binary '\0'),(1050,'任务新增','infra:job:create',3,2,110,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1051,'任务修改','infra:job:update',3,3,110,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1052,'任务删除','infra:job:delete',3,4,110,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1053,'状态修改','infra:job:update',3,5,110,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1054,'任务导出','infra:job:export',3,7,110,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','','2022-04-20 17:03:10',_binary '\0'),(1056,'生成修改','infra:codegen:update',3,2,115,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1057,'生成删除','infra:codegen:delete',3,3,115,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1058,'导入代码','infra:codegen:create',3,2,115,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1059,'预览代码','infra:codegen:preview',3,4,115,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1060,'生成代码','infra:codegen:download',3,5,115,'','','',0,_binary '',_binary '','admin','2021-01-05 17:03:48','1','2022-04-20 17:03:10',_binary '\0'),(1063,'设置角色菜单权限','system:permission:assign-role-menu',3,6,101,'','','',0,_binary '',_binary '','','2021-01-06 17:53:44','','2022-04-20 17:03:10',_binary '\0'),(1064,'设置角色数据权限','system:permission:assign-role-data-scope',3,7,101,'','','',0,_binary '',_binary '','','2021-01-06 17:56:31','','2022-04-20 17:03:10',_binary '\0'),(1065,'设置用户角色','system:permission:assign-user-role',3,8,101,'','','',0,_binary '',_binary '','','2021-01-07 10:23:28','','2022-04-20 17:03:10',_binary '\0'),(1066,'获得 Redis 监控信息','infra:redis:get-monitor-info',3,1,113,'','','',0,_binary '',_binary '','','2021-01-26 01:02:31','','2022-04-20 17:03:10',_binary '\0'),(1067,'获得 Redis Key 列表','infra:redis:get-key-list',3,2,113,'','','',0,_binary '',_binary '','','2021-01-26 01:02:52','','2022-04-20 17:03:10',_binary '\0'),(1070,'代码生成示例','infra:test-demo:query',2,1,2,'test-demo','validCode','infra/testDemo/index',0,_binary '',_binary '','','2021-02-06 12:42:49','1','2022-04-20 17:03:10',_binary '\0'),(1071,'测试示例表创建','infra:test-demo:create',3,1,1070,'','','',0,_binary '',_binary '','','2021-02-06 12:42:49','1','2022-04-20 17:03:10',_binary '\0'),(1072,'测试示例表更新','infra:test-demo:update',3,2,1070,'','','',0,_binary '',_binary '','','2021-02-06 12:42:49','1','2022-04-20 17:03:10',_binary '\0'),(1073,'测试示例表删除','infra:test-demo:delete',3,3,1070,'','','',0,_binary '',_binary '','','2021-02-06 12:42:49','1','2022-04-20 17:03:10',_binary '\0'),(1074,'测试示例表导出','infra:test-demo:export',3,4,1070,'','','',0,_binary '',_binary '','','2021-02-06 12:42:49','1','2022-04-20 17:03:10',_binary '\0'),(1075,'任务触发','infra:job:trigger',3,8,110,'','','',0,_binary '',_binary '','','2021-02-07 13:03:10','','2022-04-20 17:03:10',_binary '\0'),(1076,'数据库文档','',2,4,2,'db-doc','table','infra/dbDoc/index',0,_binary '',_binary '','','2021-02-08 01:41:47','1','2022-04-20 17:03:10',_binary '\0'),(1077,'监控平台','',2,13,2,'skywalking','eye-open','infra/skywalking/index',0,_binary '',_binary '','','2021-02-08 20:41:31','1','2022-04-20 17:03:10',_binary '\0'),(1078,'访问日志','',2,1,1083,'api-access-log','log','infra/apiAccessLog/index',0,_binary '',_binary '','','2021-02-26 01:32:59','1','2022-04-20 17:03:10',_binary '\0'),(1082,'日志导出','infra:api-access-log:export',3,2,1078,'','','',0,_binary '',_binary '','','2021-02-26 01:32:59','1','2022-04-20 17:03:10',_binary '\0'),(1083,'API 日志','',2,8,2,'log','log',NULL,0,_binary '',_binary '','','2021-02-26 02:18:24','1','2022-04-20 17:03:10',_binary '\0'),(1084,'错误日志','infra:api-error-log:query',2,2,1083,'api-error-log','log','infra/apiErrorLog/index',0,_binary '',_binary '','','2021-02-26 07:53:20','','2022-04-20 17:03:10',_binary '\0'),(1085,'日志处理','infra:api-error-log:update-status',3,2,1084,'','','',0,_binary '',_binary '','','2021-02-26 07:53:20','1','2022-04-20 17:03:10',_binary '\0'),(1086,'日志导出','infra:api-error-log:export',3,3,1084,'','','',0,_binary '',_binary '','','2021-02-26 07:53:20','1','2022-04-20 17:03:10',_binary '\0'),(1087,'任务查询','infra:job:query',3,1,110,'','','',0,_binary '',_binary '','1','2021-03-10 01:26:19','1','2022-04-20 17:03:10',_binary '\0'),(1088,'日志查询','infra:api-access-log:query',3,1,1078,'','','',0,_binary '',_binary '','1','2021-03-10 01:28:04','1','2022-04-20 17:03:10',_binary '\0'),(1089,'日志查询','infra:api-error-log:query',3,1,1084,'','','',0,_binary '',_binary '','1','2021-03-10 01:29:09','1','2022-04-20 17:03:10',_binary '\0'),(1090,'文件列表','',2,5,1243,'file','upload','infra/file/index',0,_binary '',_binary '','','2021-03-12 20:16:20','1','2022-04-20 17:03:10',_binary '\0'),(1091,'文件查询','infra:file:query',3,1,1090,'','','',0,_binary '',_binary '','','2021-03-12 20:16:20','','2022-04-20 17:03:10',_binary '\0'),(1092,'文件删除','infra:file:delete',3,4,1090,'','','',0,_binary '',_binary '','','2021-03-12 20:16:20','','2022-04-20 17:03:10',_binary '\0'),(1093,'短信管理','',1,11,1,'sms','validCode',NULL,0,_binary '',_binary '','1','2021-04-05 01:10:16','1','2022-04-20 17:03:10',_binary '\0'),(1094,'短信渠道','',2,0,1093,'sms-channel','phone','system/sms/smsChannel',0,_binary '',_binary '','','2021-04-01 11:07:15','1','2022-04-20 17:03:10',_binary '\0'),(1095,'短信渠道查询','system:sms-channel:query',3,1,1094,'','','',0,_binary '',_binary '','','2021-04-01 11:07:15','','2022-04-20 17:03:10',_binary '\0'),(1096,'短信渠道创建','system:sms-channel:create',3,2,1094,'','','',0,_binary '',_binary '','','2021-04-01 11:07:15','','2022-04-20 17:03:10',_binary '\0'),(1097,'短信渠道更新','system:sms-channel:update',3,3,1094,'','','',0,_binary '',_binary '','','2021-04-01 11:07:15','','2022-04-20 17:03:10',_binary '\0'),(1098,'短信渠道删除','system:sms-channel:delete',3,4,1094,'','','',0,_binary '',_binary '','','2021-04-01 11:07:15','','2022-04-20 17:03:10',_binary '\0'),(1100,'短信模板','',2,1,1093,'sms-template','phone','system/sms/smsTemplate',0,_binary '',_binary '','','2021-04-01 17:35:17','1','2022-04-20 17:03:10',_binary '\0'),(1101,'短信模板查询','system:sms-template:query',3,1,1100,'','','',0,_binary '',_binary '','','2021-04-01 17:35:17','','2022-04-20 17:03:10',_binary '\0'),(1102,'短信模板创建','system:sms-template:create',3,2,1100,'','','',0,_binary '',_binary '','','2021-04-01 17:35:17','','2022-04-20 17:03:10',_binary '\0'),(1103,'短信模板更新','system:sms-template:update',3,3,1100,'','','',0,_binary '',_binary '','','2021-04-01 17:35:17','','2022-04-20 17:03:10',_binary '\0'),(1104,'短信模板删除','system:sms-template:delete',3,4,1100,'','','',0,_binary '',_binary '','','2021-04-01 17:35:17','','2022-04-20 17:03:10',_binary '\0'),(1105,'短信模板导出','system:sms-template:export',3,5,1100,'','','',0,_binary '',_binary '','','2021-04-01 17:35:17','','2022-04-20 17:03:10',_binary '\0'),(1106,'发送测试短信','system:sms-template:send-sms',3,6,1100,'','','',0,_binary '',_binary '','1','2021-04-11 00:26:40','1','2022-04-20 17:03:10',_binary '\0'),(1107,'短信日志','',2,2,1093,'sms-log','phone','system/sms/smsLog',0,_binary '',_binary '','','2021-04-11 08:37:05','1','2022-04-20 17:03:10',_binary '\0'),(1108,'短信日志查询','system:sms-log:query',3,1,1107,'','','',0,_binary '',_binary '','','2021-04-11 08:37:05','','2022-04-20 17:03:10',_binary '\0'),(1109,'短信日志导出','system:sms-log:export',3,5,1107,'','','',0,_binary '',_binary '','','2021-04-11 08:37:05','','2022-04-20 17:03:10',_binary '\0'),(1110,'错误码管理','',2,12,1,'error-code','code','system/errorCode/index',0,_binary '',_binary '','','2021-04-13 21:46:42','1','2022-04-20 17:03:10',_binary '\0'),(1111,'错误码查询','system:error-code:query',3,1,1110,'','','',0,_binary '',_binary '','','2021-04-13 21:46:42','','2022-04-20 17:03:10',_binary '\0'),(1112,'错误码创建','system:error-code:create',3,2,1110,'','','',0,_binary '',_binary '','','2021-04-13 21:46:42','','2022-04-20 17:03:10',_binary '\0'),(1113,'错误码更新','system:error-code:update',3,3,1110,'','','',0,_binary '',_binary '','','2021-04-13 21:46:42','','2022-04-20 17:03:10',_binary '\0'),(1114,'错误码删除','system:error-code:delete',3,4,1110,'','','',0,_binary '',_binary '','','2021-04-13 21:46:42','','2022-04-20 17:03:10',_binary '\0'),(1115,'错误码导出','system:error-code:export',3,5,1110,'','','',0,_binary '',_binary '','','2021-04-13 21:46:42','','2022-04-20 17:03:10',_binary '\0'),(1117,'支付管理','',1,30,0,'/pay','money',NULL,1,_binary '',_binary '','1','2021-12-25 16:43:41','1','2023-06-10 18:05:19',_binary '\0'),(1118,'请假查询','',2,0,5,'leave','user','bpm/oa/leave/index',0,_binary '',_binary '','','2021-09-20 08:51:03','1','2022-04-20 17:03:10',_binary '\0'),(1119,'请假申请查询','bpm:oa-leave:query',3,1,1118,'','','',0,_binary '',_binary '','','2021-09-20 08:51:03','1','2022-04-20 17:03:10',_binary '\0'),(1120,'请假申请创建','bpm:oa-leave:create',3,2,1118,'','','',0,_binary '',_binary '','','2021-09-20 08:51:03','1','2022-04-20 17:03:10',_binary '\0'),(1126,'应用信息','',2,1,1117,'app','table','pay/app/index',0,_binary '',_binary '','','2021-11-10 01:13:30','1','2022-04-20 17:03:10',_binary '\0'),(1127,'支付应用信息查询','pay:app:query',3,1,1126,'','','',0,_binary '',_binary '','','2021-11-10 01:13:31','','2022-04-20 17:03:10',_binary '\0'),(1128,'支付应用信息创建','pay:app:create',3,2,1126,'','','',0,_binary '',_binary '','','2021-11-10 01:13:31','','2022-04-20 17:03:10',_binary '\0'),(1129,'支付应用信息更新','pay:app:update',3,3,1126,'','','',0,_binary '',_binary '','','2021-11-10 01:13:31','','2022-04-20 17:03:10',_binary '\0'),(1130,'支付应用信息删除','pay:app:delete',3,4,1126,'','','',0,_binary '',_binary '','','2021-11-10 01:13:31','','2022-04-20 17:03:10',_binary '\0'),(1131,'支付应用信息导出','pay:app:export',3,5,1126,'','','',0,_binary '',_binary '','','2021-11-10 01:13:31','','2022-04-20 17:03:10',_binary '\0'),(1132,'秘钥解析','pay:channel:parsing',3,6,1129,'','','',0,_binary '',_binary '','1','2021-11-08 15:15:47','1','2022-04-20 17:03:10',_binary '\0'),(1133,'支付商户信息查询','pay:merchant:query',3,1,1132,'','','',0,_binary '',_binary '','','2021-11-10 01:13:41','','2022-04-20 17:03:10',_binary '\0'),(1134,'支付商户信息创建','pay:merchant:create',3,2,1132,'','','',0,_binary '',_binary '','','2021-11-10 01:13:41','','2022-04-20 17:03:10',_binary '\0'),(1135,'支付商户信息更新','pay:merchant:update',3,3,1132,'','','',0,_binary '',_binary '','','2021-11-10 01:13:41','','2022-04-20 17:03:10',_binary '\0'),(1136,'支付商户信息删除','pay:merchant:delete',3,4,1132,'','','',0,_binary '',_binary '','','2021-11-10 01:13:41','','2022-04-20 17:03:10',_binary '\0'),(1137,'支付商户信息导出','pay:merchant:export',3,5,1132,'','','',0,_binary '',_binary '','','2021-11-10 01:13:41','','2022-04-20 17:03:10',_binary '\0'),(1138,'租户列表','',2,0,1224,'list','peoples','system/tenant/index',0,_binary '',_binary '','','2021-12-14 12:31:43','1','2022-04-20 17:03:10',_binary '\0'),(1139,'租户查询','system:tenant:query',3,1,1138,'','','',0,_binary '',_binary '','','2021-12-14 12:31:44','','2022-04-20 17:03:10',_binary '\0'),(1140,'租户创建','system:tenant:create',3,2,1138,'','','',0,_binary '',_binary '','','2021-12-14 12:31:44','','2022-04-20 17:03:10',_binary '\0'),(1141,'租户更新','system:tenant:update',3,3,1138,'','','',0,_binary '',_binary '','','2021-12-14 12:31:44','','2022-04-20 17:03:10',_binary '\0'),(1142,'租户删除','system:tenant:delete',3,4,1138,'','','',0,_binary '',_binary '','','2021-12-14 12:31:44','','2022-04-20 17:03:10',_binary '\0'),(1143,'租户导出','system:tenant:export',3,5,1138,'','','',0,_binary '',_binary '','','2021-12-14 12:31:44','','2022-04-20 17:03:10',_binary '\0'),(1150,'秘钥解析','',3,6,1129,'','','',0,_binary '',_binary '','1','2021-11-08 15:15:47','1','2022-04-20 17:03:10',_binary '\0'),(1161,'退款订单','',2,3,1117,'refund','order','pay/refund/index',0,_binary '',_binary '','','2021-12-25 08:29:07','1','2022-04-20 17:03:10',_binary '\0'),(1162,'退款订单查询','pay:refund:query',3,1,1161,'','','',0,_binary '',_binary '','','2021-12-25 08:29:07','','2022-04-20 17:03:10',_binary '\0'),(1163,'退款订单创建','pay:refund:create',3,2,1161,'','','',0,_binary '',_binary '','','2021-12-25 08:29:07','','2022-04-20 17:03:10',_binary '\0'),(1164,'退款订单更新','pay:refund:update',3,3,1161,'','','',0,_binary '',_binary '','','2021-12-25 08:29:07','','2022-04-20 17:03:10',_binary '\0'),(1165,'退款订单删除','pay:refund:delete',3,4,1161,'','','',0,_binary '',_binary '','','2021-12-25 08:29:07','','2022-04-20 17:03:10',_binary '\0'),(1166,'退款订单导出','pay:refund:export',3,5,1161,'','','',0,_binary '',_binary '','','2021-12-25 08:29:07','','2022-04-20 17:03:10',_binary '\0'),(1173,'支付订单','',2,2,1117,'order','pay','pay/order/index',0,_binary '',_binary '','','2021-12-25 08:49:43','1','2022-04-20 17:03:10',_binary '\0'),(1174,'支付订单查询','pay:order:query',3,1,1173,'','','',0,_binary '',_binary '','','2021-12-25 08:49:43','','2022-04-20 17:03:10',_binary '\0'),(1175,'支付订单创建','pay:order:create',3,2,1173,'','','',0,_binary '',_binary '','','2021-12-25 08:49:43','','2022-04-20 17:03:10',_binary '\0'),(1176,'支付订单更新','pay:order:update',3,3,1173,'','','',0,_binary '',_binary '','','2021-12-25 08:49:43','','2022-04-20 17:03:10',_binary '\0'),(1177,'支付订单删除','pay:order:delete',3,4,1173,'','','',0,_binary '',_binary '','','2021-12-25 08:49:43','','2022-04-20 17:03:10',_binary '\0'),(1178,'支付订单导出','pay:order:export',3,5,1173,'','','',0,_binary '',_binary '','','2021-12-25 08:49:43','','2022-04-20 17:03:10',_binary '\0'),(1179,'商户信息','',2,0,1117,'merchant','merchant','pay/merchant/index',0,_binary '',_binary '','','2021-12-25 09:01:44','1','2022-04-20 17:03:10',_binary '\0'),(1180,'支付商户信息查询','pay:merchant:query',3,1,1179,'','','',0,_binary '',_binary '','','2021-12-25 09:01:44','','2022-04-20 17:03:10',_binary '\0'),(1181,'支付商户信息创建','pay:merchant:create',3,2,1179,'','','',0,_binary '',_binary '','','2021-12-25 09:01:44','','2022-04-20 17:03:10',_binary '\0'),(1182,'支付商户信息更新','pay:merchant:update',3,3,1179,'','','',0,_binary '',_binary '','','2021-12-25 09:01:44','','2022-04-20 17:03:10',_binary '\0'),(1183,'支付商户信息删除','',3,4,1179,'','','',0,_binary '',_binary '','','2021-12-25 09:01:44','','2022-04-20 17:03:10',_binary '\0'),(1184,'支付商户信息导出','pay:merchant:export',3,5,1179,'','','',0,_binary '',_binary '','','2021-12-25 09:01:44','','2022-04-20 17:03:10',_binary '\0'),(1185,'工作流程','',1,50,0,'/bpm','tool',NULL,1,_binary '',_binary '','1','2021-12-30 20:26:36','1','2023-06-10 18:05:10',_binary '\0'),(1186,'流程管理','',1,10,1185,'manager','nested',NULL,0,_binary '',_binary '','1','2021-12-30 20:28:30','1','2022-04-20 17:03:10',_binary '\0'),(1187,'流程表单','',2,0,1186,'form','form','bpm/form/index',0,_binary '',_binary '','','2021-12-30 12:38:22','1','2022-04-20 17:03:10',_binary '\0'),(1188,'表单查询','bpm:form:query',3,1,1187,'','','',0,_binary '',_binary '','','2021-12-30 12:38:22','1','2022-04-20 17:03:10',_binary '\0'),(1189,'表单创建','bpm:form:create',3,2,1187,'','','',0,_binary '',_binary '','','2021-12-30 12:38:22','1','2022-04-20 17:03:10',_binary '\0'),(1190,'表单更新','bpm:form:update',3,3,1187,'','','',0,_binary '',_binary '','','2021-12-30 12:38:22','1','2022-04-20 17:03:10',_binary '\0'),(1191,'表单删除','bpm:form:delete',3,4,1187,'','','',0,_binary '',_binary '','','2021-12-30 12:38:22','1','2022-04-20 17:03:10',_binary '\0'),(1192,'表单导出','bpm:form:export',3,5,1187,'','','',0,_binary '',_binary '','','2021-12-30 12:38:22','1','2022-04-20 17:03:10',_binary '\0'),(1193,'流程模型','',2,5,1186,'model','guide','bpm/model/index',0,_binary '',_binary '','1','2021-12-31 23:24:58','103','2022-04-20 17:03:10',_binary '\0'),(1194,'模型查询','bpm:model:query',3,1,1193,'','','',0,_binary '',_binary '','1','2022-01-03 19:01:10','1','2022-04-20 17:03:10',_binary '\0'),(1195,'模型创建','bpm:model:create',3,2,1193,'','','',0,_binary '',_binary '','1','2022-01-03 19:01:24','1','2022-04-20 17:03:10',_binary '\0'),(1196,'模型导入','bpm:model:import',3,3,1193,'','','',0,_binary '',_binary '','1','2022-01-03 19:01:35','1','2022-04-20 17:03:10',_binary '\0'),(1197,'模型更新','bpm:model:update',3,4,1193,'','','',0,_binary '',_binary '','1','2022-01-03 19:02:28','1','2022-04-20 17:03:10',_binary '\0'),(1198,'模型删除','bpm:model:delete',3,5,1193,'','','',0,_binary '',_binary '','1','2022-01-03 19:02:43','1','2022-04-20 17:03:10',_binary '\0'),(1199,'模型发布','bpm:model:deploy',3,6,1193,'','','',0,_binary '',_binary '','1','2022-01-03 19:03:24','1','2022-04-20 17:03:10',_binary '\0'),(1200,'任务管理','',1,20,1185,'task','cascader',NULL,0,_binary '',_binary '','1','2022-01-07 23:51:48','1','2022-04-20 17:03:10',_binary '\0'),(1201,'我的流程','',2,0,1200,'my','people','bpm/processInstance/index',0,_binary '',_binary '','','2022-01-07 15:53:44','1','2022-04-20 17:03:10',_binary '\0'),(1202,'流程实例的查询','bpm:process-instance:query',3,1,1201,'','','',0,_binary '',_binary '','','2022-01-07 15:53:44','1','2022-04-20 17:03:10',_binary '\0'),(1207,'待办任务','',2,10,1200,'todo','eye-open','bpm/task/todo',0,_binary '',_binary '','1','2022-01-08 10:33:37','1','2022-04-20 17:03:10',_binary '\0'),(1208,'已办任务','',2,20,1200,'done','eye','bpm/task/done',0,_binary '',_binary '','1','2022-01-08 10:34:13','1','2022-04-20 17:03:10',_binary '\0'),(1209,'用户分组','',2,2,1186,'user-group','people','bpm/group/index',0,_binary '',_binary '','','2022-01-14 02:14:20','103','2022-04-20 17:03:10',_binary '\0'),(1210,'用户组查询','bpm:user-group:query',3,1,1209,'','','',0,_binary '',_binary '','','2022-01-14 02:14:20','','2022-04-20 17:03:10',_binary '\0'),(1211,'用户组创建','bpm:user-group:create',3,2,1209,'','','',0,_binary '',_binary '','','2022-01-14 02:14:20','','2022-04-20 17:03:10',_binary '\0'),(1212,'用户组更新','bpm:user-group:update',3,3,1209,'','','',0,_binary '',_binary '','','2022-01-14 02:14:20','','2022-04-20 17:03:10',_binary '\0'),(1213,'用户组删除','bpm:user-group:delete',3,4,1209,'','','',0,_binary '',_binary '','','2022-01-14 02:14:20','','2022-04-20 17:03:10',_binary '\0'),(1215,'流程定义查询','bpm:process-definition:query',3,10,1193,'','','',0,_binary '',_binary '','1','2022-01-23 00:21:43','1','2022-04-20 17:03:10',_binary '\0'),(1216,'流程任务分配规则查询','bpm:task-assign-rule:query',3,20,1193,'','','',0,_binary '',_binary '','1','2022-01-23 00:26:53','1','2022-04-20 17:03:10',_binary '\0'),(1217,'流程任务分配规则创建','bpm:task-assign-rule:create',3,21,1193,'','','',0,_binary '',_binary '','1','2022-01-23 00:28:15','1','2022-04-20 17:03:10',_binary '\0'),(1218,'流程任务分配规则更新','bpm:task-assign-rule:update',3,22,1193,'','','',0,_binary '',_binary '','1','2022-01-23 00:28:41','1','2022-04-20 17:03:10',_binary '\0'),(1219,'流程实例的创建','bpm:process-instance:create',3,2,1201,'','','',0,_binary '',_binary '','1','2022-01-23 00:36:15','1','2022-04-20 17:03:10',_binary '\0'),(1220,'流程实例的取消','bpm:process-instance:cancel',3,3,1201,'','','',0,_binary '',_binary '','1','2022-01-23 00:36:33','1','2022-04-20 17:03:10',_binary '\0'),(1221,'流程任务的查询','bpm:task:query',3,1,1207,'','','',0,_binary '',_binary '','1','2022-01-23 00:38:52','1','2022-04-20 17:03:10',_binary '\0'),(1222,'流程任务的更新','bpm:task:update',3,2,1207,'','','',0,_binary '',_binary '','1','2022-01-23 00:39:24','1','2022-04-20 17:03:10',_binary '\0'),(1224,'租户管理','',2,0,1,'tenant','peoples',NULL,0,_binary '',_binary '','1','2022-02-20 01:41:13','1','2022-04-20 17:03:10',_binary '\0'),(1225,'租户套餐','',2,0,1224,'package','eye','system/tenantPackage/index',0,_binary '',_binary '','','2022-02-19 17:44:06','1','2022-04-21 01:21:25',_binary '\0'),(1226,'租户套餐查询','system:tenant-package:query',3,1,1225,'','','',0,_binary '',_binary '','','2022-02-19 17:44:06','','2022-04-20 17:03:10',_binary '\0'),(1227,'租户套餐创建','system:tenant-package:create',3,2,1225,'','','',0,_binary '',_binary '','','2022-02-19 17:44:06','','2022-04-20 17:03:10',_binary '\0'),(1228,'租户套餐更新','system:tenant-package:update',3,3,1225,'','','',0,_binary '',_binary '','','2022-02-19 17:44:06','','2022-04-20 17:03:10',_binary '\0'),(1229,'租户套餐删除','system:tenant-package:delete',3,4,1225,'','','',0,_binary '',_binary '','','2022-02-19 17:44:06','','2022-04-20 17:03:10',_binary '\0'),(1237,'文件配置','',2,0,1243,'file-config','config','infra/fileConfig/index',0,_binary '',_binary '','','2022-03-15 14:35:28','1','2022-04-20 17:03:10',_binary '\0'),(1238,'文件配置查询','infra:file-config:query',3,1,1237,'','','',0,_binary '',_binary '','','2022-03-15 14:35:28','','2022-04-20 17:03:10',_binary '\0'),(1239,'文件配置创建','infra:file-config:create',3,2,1237,'','','',0,_binary '',_binary '','','2022-03-15 14:35:28','','2022-04-20 17:03:10',_binary '\0'),(1240,'文件配置更新','infra:file-config:update',3,3,1237,'','','',0,_binary '',_binary '','','2022-03-15 14:35:28','','2022-04-20 17:03:10',_binary '\0'),(1241,'文件配置删除','infra:file-config:delete',3,4,1237,'','','',0,_binary '',_binary '','','2022-03-15 14:35:28','','2022-04-20 17:03:10',_binary '\0'),(1242,'文件配置导出','infra:file-config:export',3,5,1237,'','','',0,_binary '',_binary '','','2022-03-15 14:35:28','','2022-04-20 17:03:10',_binary '\0'),(1243,'文件管理','',2,5,2,'file','download',NULL,0,_binary '',_binary '','1','2022-03-16 23:47:40','1','2022-04-20 17:03:10',_binary '\0'),(1247,'敏感词管理','',2,13,1,'sensitive-word','education','system/sensitiveWord/index',0,_binary '',_binary '','','2022-04-07 16:55:03','1','2022-04-20 17:03:10',_binary '\0'),(1248,'敏感词查询','system:sensitive-word:query',3,1,1247,'','','',0,_binary '',_binary '','','2022-04-07 16:55:03','','2022-04-20 17:03:10',_binary '\0'),(1249,'敏感词创建','system:sensitive-word:create',3,2,1247,'','','',0,_binary '',_binary '','','2022-04-07 16:55:03','','2022-04-20 17:03:10',_binary '\0'),(1250,'敏感词更新','system:sensitive-word:update',3,3,1247,'','','',0,_binary '',_binary '','','2022-04-07 16:55:03','','2022-04-20 17:03:10',_binary '\0'),(1251,'敏感词删除','system:sensitive-word:delete',3,4,1247,'','','',0,_binary '',_binary '','','2022-04-07 16:55:03','','2022-04-20 17:03:10',_binary '\0'),(1252,'敏感词导出','system:sensitive-word:export',3,5,1247,'','','',0,_binary '',_binary '','','2022-04-07 16:55:03','','2022-04-20 17:03:10',_binary '\0'),(1254,'作者动态','',1,0,0,'https://www.iocoder.cn','people',NULL,0,_binary '',_binary '','1','2022-04-23 01:03:15','1','2023-06-10 18:03:34',_binary ''),(1255,'数据源配置','',2,1,2,'data-source-config','rate','infra/dataSourceConfig/index',0,_binary '',_binary '','','2022-04-27 14:37:32','1','2022-04-27 22:42:06',_binary '\0'),(1256,'数据源配置查询','infra:data-source-config:query',3,1,1255,'','','',0,_binary '',_binary '','','2022-04-27 14:37:32','','2022-04-27 14:37:32',_binary '\0'),(1257,'数据源配置创建','infra:data-source-config:create',3,2,1255,'','','',0,_binary '',_binary '','','2022-04-27 14:37:32','','2022-04-27 14:37:32',_binary '\0'),(1258,'数据源配置更新','infra:data-source-config:update',3,3,1255,'','','',0,_binary '',_binary '','','2022-04-27 14:37:32','','2022-04-27 14:37:32',_binary '\0'),(1259,'数据源配置删除','infra:data-source-config:delete',3,4,1255,'','','',0,_binary '',_binary '','','2022-04-27 14:37:32','','2022-04-27 14:37:32',_binary '\0'),(1260,'数据源配置导出','infra:data-source-config:export',3,5,1255,'','','',0,_binary '',_binary '','','2022-04-27 14:37:32','','2022-04-27 14:37:32',_binary '\0'),(1261,'OAuth 2.0','',1,10,1,'oauth2','people',NULL,0,_binary '',_binary '','1','2022-05-09 23:38:17','1','2022-05-11 23:51:46',_binary '\0'),(1263,'应用管理','',2,0,1261,'oauth2/application','tool','system/oauth2/client/index',0,_binary '',_binary '','','2022-05-10 16:26:33','1','2022-05-11 23:31:36',_binary '\0'),(1264,'客户端查询','system:oauth2-client:query',3,1,1263,'','','',0,_binary '',_binary '','','2022-05-10 16:26:33','1','2022-05-11 00:31:06',_binary '\0'),(1265,'客户端创建','system:oauth2-client:create',3,2,1263,'','','',0,_binary '',_binary '','','2022-05-10 16:26:33','1','2022-05-11 00:31:23',_binary '\0'),(1266,'客户端更新','system:oauth2-client:update',3,3,1263,'','','',0,_binary '',_binary '','','2022-05-10 16:26:33','1','2022-05-11 00:31:28',_binary '\0'),(1267,'客户端删除','system:oauth2-client:delete',3,4,1263,'','','',0,_binary '',_binary '','','2022-05-10 16:26:33','1','2022-05-11 00:31:33',_binary '\0'),(1281,'报表管理','',1,40,0,'/visualization','chart',NULL,1,_binary '',_binary '','1','2022-07-10 20:22:15','1','2023-06-10 18:05:15',_binary '\0'),(1282,'报表设计器','',2,1,1281,'jimu-report','example','visualization/jmreport/index',0,_binary '',_binary '','1','2022-07-10 20:26:36','1','2022-07-29 12:48:05',_binary '\0'),(2000,'商品中心','',1,60,0,'/product','merchant',NULL,1,_binary '',_binary '','','2022-07-29 15:53:53','1','2023-06-10 18:05:07',_binary '\0'),(2002,'商品分类','',2,2,2000,'category','dict','mall/product/category/index',0,_binary '',_binary '','','2022-07-29 15:53:53','1','2022-07-30 22:23:37',_binary '\0'),(2003,'分类查询','product:category:query',3,1,2002,'','','',0,_binary '',_binary '','','2022-07-29 15:53:53','','2022-07-29 15:53:53',_binary '\0'),(2004,'分类创建','product:category:create',3,2,2002,'','','',0,_binary '',_binary '','','2022-07-29 15:53:53','','2022-07-29 15:53:53',_binary '\0'),(2005,'分类更新','product:category:update',3,3,2002,'','','',0,_binary '',_binary '','','2022-07-29 15:53:53','','2022-07-29 15:53:53',_binary '\0'),(2006,'分类删除','product:category:delete',3,4,2002,'','','',0,_binary '',_binary '','','2022-07-29 15:53:53','','2022-07-29 15:53:53',_binary '\0'),(2008,'商品品牌','',2,3,2000,'brand','dashboard','mall/product/brand/index',0,_binary '',_binary '','','2022-07-30 13:52:44','1','2022-10-24 22:29:30',_binary '\0'),(2009,'品牌查询','product:brand:query',3,1,2008,'','','',0,_binary '',_binary '','','2022-07-30 13:52:44','','2022-07-30 13:52:44',_binary '\0'),(2010,'品牌创建','product:brand:create',3,2,2008,'','','',0,_binary '',_binary '','','2022-07-30 13:52:44','','2022-07-30 13:52:44',_binary '\0'),(2011,'品牌更新','product:brand:update',3,3,2008,'','','',0,_binary '',_binary '','','2022-07-30 13:52:44','','2022-07-30 13:52:44',_binary '\0'),(2012,'品牌删除','product:brand:delete',3,4,2008,'','','',0,_binary '',_binary '','','2022-07-30 13:52:44','','2022-07-30 13:52:44',_binary '\0'),(2014,'商品列表','',2,1,2000,'spu','list','mall/product/spu/index',0,_binary '',_binary '','','2022-07-30 14:22:58','1','2022-10-24 22:29:25',_binary '\0'),(2015,'商品查询','product:spu:query',3,1,2014,'','','',0,_binary '',_binary '','','2022-07-30 14:22:58','','2022-07-30 14:22:58',_binary '\0'),(2016,'商品创建','product:spu:create',3,2,2014,'','','',0,_binary '',_binary '','','2022-07-30 14:22:58','','2022-07-30 14:22:58',_binary '\0'),(2017,'商品更新','product:spu:update',3,3,2014,'','','',0,_binary '',_binary '','','2022-07-30 14:22:58','','2022-07-30 14:22:58',_binary '\0'),(2018,'商品删除','product:spu:delete',3,4,2014,'','','',0,_binary '',_binary '','','2022-07-30 14:22:58','','2022-07-30 14:22:58',_binary '\0'),(2019,'商品属性','',2,3,2000,'property','eye','mall/product/property/index',0,_binary '',_binary '','','2022-08-01 14:55:35','1','2022-12-12 20:58:06',_binary '\0'),(2020,'规格查询','product:property:query',3,1,2019,'','','',0,_binary '',_binary '','','2022-08-01 14:55:35','','2022-12-12 20:26:24',_binary '\0'),(2021,'规格创建','product:property:create',3,2,2019,'','','',0,_binary '',_binary '','','2022-08-01 14:55:35','','2022-12-12 20:26:30',_binary '\0'),(2022,'规格更新','product:property:update',3,3,2019,'','','',0,_binary '',_binary '','','2022-08-01 14:55:35','','2022-12-12 20:26:33',_binary '\0'),(2023,'规格删除','product:property:delete',3,4,2019,'','','',0,_binary '',_binary '','','2022-08-01 14:55:35','','2022-12-12 20:26:37',_binary '\0'),(2025,'Banner管理','',2,100,2000,'banner','','mall/market/banner/index',0,_binary '',_binary '','','2022-08-01 14:56:14','1','2022-10-24 22:29:39',_binary '\0'),(2026,'Banner查询','market:banner:query',3,1,2025,'','','',0,_binary '',_binary '','','2022-08-01 14:56:14','','2022-08-01 14:56:14',_binary '\0'),(2027,'Banner创建','market:banner:create',3,2,2025,'','','',0,_binary '',_binary '','','2022-08-01 14:56:14','','2022-08-01 14:56:14',_binary '\0'),(2028,'Banner更新','market:banner:update',3,3,2025,'','','',0,_binary '',_binary '','','2022-08-01 14:56:14','','2022-08-01 14:56:14',_binary '\0'),(2029,'Banner删除','market:banner:delete',3,4,2025,'','','',0,_binary '',_binary '','','2022-08-01 14:56:14','','2022-08-01 14:56:14',_binary '\0'),(2030,'营销中心','',1,70,0,'/promotion','rate',NULL,1,_binary '',_binary '','1','2022-10-31 21:25:09','1','2023-06-10 18:04:55',_binary '\0'),(2032,'优惠劵','',2,2,2030,'coupon-template','textarea','mall/promotion/couponTemplate/index',0,_binary '',_binary '','','2022-10-31 22:27:14','1','2022-11-05 12:27:34',_binary '\0'),(2033,'优惠劵模板查询','promotion:coupon-template:query',3,1,2032,'','','',0,_binary '',_binary '','','2022-10-31 22:27:14','','2022-10-31 22:27:14',_binary '\0'),(2034,'优惠劵模板创建','promotion:coupon-template:create',3,2,2032,'','','',0,_binary '',_binary '','','2022-10-31 22:27:14','','2022-10-31 22:27:14',_binary '\0'),(2035,'优惠劵模板更新','promotion:coupon-template:update',3,3,2032,'','','',0,_binary '',_binary '','','2022-10-31 22:27:14','','2022-10-31 22:27:14',_binary '\0'),(2036,'优惠劵模板删除','promotion:coupon-template:delete',3,4,2032,'','','',0,_binary '',_binary '','','2022-10-31 22:27:14','','2022-10-31 22:27:14',_binary '\0'),(2038,'会员优惠劵','',2,2,2030,'coupon','','mall/promotion/coupon/index',0,_binary '\0',_binary '','','2022-11-03 23:21:31','1','2022-11-05 12:27:45',_binary '\0'),(2039,'优惠劵查询','promotion:coupon:query',3,1,2038,'','','',0,_binary '',_binary '','','2022-11-03 23:21:31','','2022-11-03 23:21:31',_binary '\0'),(2040,'优惠劵删除','promotion:coupon:delete',3,4,2038,'','','',0,_binary '',_binary '','','2022-11-03 23:21:31','','2022-11-03 23:21:31',_binary '\0'),(2041,'满减送活动','',2,10,2030,'reward-activity','radio','mall/promotion/rewardActivity/index',0,_binary '',_binary '','','2022-11-04 23:47:49','1','2022-11-05 12:27:56',_binary '\0'),(2042,'满减送活动查询','promotion:reward-activity:query',3,1,2041,'','','',0,_binary '',_binary '','','2022-11-04 23:47:49','','2022-11-04 23:47:49',_binary '\0'),(2043,'满减送活动创建','promotion:reward-activity:create',3,2,2041,'','','',0,_binary '',_binary '','','2022-11-04 23:47:49','','2022-11-04 23:47:49',_binary '\0'),(2044,'满减送活动更新','promotion:reward-activity:update',3,3,2041,'','','',0,_binary '',_binary '','','2022-11-04 23:47:50','','2022-11-04 23:47:50',_binary '\0'),(2045,'满减送活动删除','promotion:reward-activity:delete',3,4,2041,'','','',0,_binary '',_binary '','','2022-11-04 23:47:50','','2022-11-04 23:47:50',_binary '\0'),(2046,'满减送活动关闭','promotion:reward-activity:close',3,5,2041,'','','',0,_binary '',_binary '','1','2022-11-05 10:42:53','1','2022-11-05 10:42:53',_binary '\0'),(2047,'限时折扣活动','',2,7,2030,'discount-activity','time','mall/promotion/discountActivity/index',0,_binary '',_binary '','','2022-11-05 17:12:15','1','2022-11-29 22:14:56',_binary '\0'),(2048,'限时折扣活动查询','promotion:discount-activity:query',3,1,2047,'','','',0,_binary '',_binary '','','2022-11-05 17:12:15','','2022-11-05 17:12:15',_binary '\0'),(2049,'限时折扣活动创建','promotion:discount-activity:create',3,2,2047,'','','',0,_binary '',_binary '','','2022-11-05 17:12:15','','2022-11-05 17:12:15',_binary '\0'),(2050,'限时折扣活动更新','promotion:discount-activity:update',3,3,2047,'','','',0,_binary '',_binary '','','2022-11-05 17:12:16','','2022-11-05 17:12:16',_binary '\0'),(2051,'限时折扣活动删除','promotion:discount-activity:delete',3,4,2047,'','','',0,_binary '',_binary '','','2022-11-05 17:12:16','','2022-11-05 17:12:16',_binary '\0'),(2052,'限时折扣活动关闭','promotion:discount-activity:close',3,5,2047,'','','',0,_binary '',_binary '','','2022-11-05 17:12:16','','2022-11-05 17:12:16',_binary '\0'),(2059,'秒杀活动管理','',2,0,2030,'seckill-activity','time-range','mall/promotion/seckill/seckillActivity/index',0,_binary '',_binary '','','2022-11-06 22:24:49','1','2022-11-29 22:24:39',_binary '\0'),(2060,'秒杀活动查询','promotion:seckill-activity:query',3,1,2059,'','','',0,_binary '',_binary '','','2022-11-06 22:24:49','','2022-11-06 22:24:49',_binary '\0'),(2061,'秒杀活动创建','promotion:seckill-activity:create',3,2,2059,'','','',0,_binary '',_binary '','','2022-11-06 22:24:49','','2022-11-06 22:24:49',_binary '\0'),(2062,'秒杀活动更新','promotion:seckill-activity:update',3,3,2059,'','','',0,_binary '',_binary '','','2022-11-06 22:24:49','','2022-11-06 22:24:49',_binary '\0'),(2063,'秒杀活动删除','promotion:seckill-activity:delete',3,4,2059,'','','',0,_binary '',_binary '','','2022-11-06 22:24:49','','2022-11-06 22:24:49',_binary '\0'),(2064,'秒杀活动导出','promotion:seckill-activity:export',3,5,2059,'','','',0,_binary '',_binary '','','2022-11-06 22:24:49','','2022-11-06 22:24:49',_binary '\0'),(2066,'秒杀时段管理','',2,0,2030,'seckill-time','','mall/promotion/seckill/seckillTime/index',0,_binary '\0',_binary '','','2022-11-15 19:46:50','1','2022-11-29 22:09:03',_binary '\0'),(2067,'秒杀时段查询','promotion:seckill-time:query',3,1,2066,'','','',0,_binary '',_binary '','','2022-11-15 19:46:51','','2022-11-15 19:46:51',_binary '\0'),(2068,'秒杀时段创建','promotion:seckill-time:create',3,2,2066,'','','',0,_binary '',_binary '','','2022-11-15 19:46:51','','2022-11-15 19:46:51',_binary '\0'),(2069,'秒杀时段更新','promotion:seckill-time:update',3,3,2066,'','','',0,_binary '',_binary '','','2022-11-15 19:46:51','','2022-11-15 19:46:51',_binary '\0'),(2070,'秒杀时段删除','promotion:seckill-time:delete',3,4,2066,'','','',0,_binary '',_binary '','','2022-11-15 19:46:51','','2022-11-15 19:46:51',_binary '\0'),(2071,'秒杀时段导出','promotion:seckill-time:export',3,5,2066,'','','',0,_binary '',_binary '','','2022-11-15 19:46:51','','2022-11-15 19:46:51',_binary '\0'),(2072,'订单中心','',1,65,0,'/trade','order',NULL,1,_binary '',_binary '','1','2022-11-19 18:57:19','1','2023-06-10 18:04:59',_binary '\0'),(2073,'售后退款','',2,1,2072,'trade/after-sale','education','mall/trade/afterSale/index',0,_binary '',_binary '','','2022-11-19 20:15:32','1','2022-12-10 21:11:02',_binary '\0'),(2074,'售后查询','trade:after-sale:query',3,1,2073,'','','',0,_binary '',_binary '','','2022-11-19 20:15:33','1','2022-12-10 21:04:29',_binary '\0'),(2075,'秒杀活动关闭','promotion:sekill-activity:close',3,6,2059,'','','',0,_binary '',_binary '','1','2022-11-28 20:20:15','1','2022-11-28 20:20:15',_binary '\0'),(2076,'订单列表','',2,0,2072,'trade/order','list','mall/trade/order/index',0,_binary '',_binary '','1','2022-12-10 21:05:44','1','2022-12-10 21:08:44',_binary '\0'),(2077,'物流公司管理管理','',2,0,2072,'express-company','','mall/trade/expressCompany/index',0,_binary '',_binary '','','2022-12-20 23:27:55','1','2022-12-20 23:36:20',_binary '\0'),(2078,'物流公司管理查询','trade:express-company:query',3,1,2077,'','','',0,_binary '',_binary '','','2022-12-20 23:27:55','','2022-12-20 23:27:55',_binary '\0'),(2079,'物流公司管理创建','trade:express-company:create',3,2,2077,'','','',0,_binary '',_binary '','','2022-12-20 23:27:55','','2022-12-20 23:27:55',_binary '\0'),(2080,'物流公司管理更新','trade:express-company:update',3,3,2077,'','','',0,_binary '',_binary '','','2022-12-20 23:27:55','','2022-12-20 23:27:55',_binary '\0'),(2081,'物流公司管理删除','trade:express-company:delete',3,4,2077,'','','',0,_binary '',_binary '','','2022-12-20 23:27:55','','2022-12-20 23:27:55',_binary '\0'),(2082,'物流公司管理导出','trade:express-company:export',3,5,2077,'','','',0,_binary '',_binary '','','2022-12-20 23:27:55','','2022-12-20 23:27:55',_binary '\0'),(2083,'地区管理','',2,14,1,'area','row','system/area/index',0,_binary '',_binary '','1','2022-12-23 17:35:05','1','2022-12-23 17:35:48',_binary '\0'),(2084,'公众号管理','',1,100,0,'/mp','wechat',NULL,1,_binary '',_binary '','1','2023-01-01 20:11:04','1','2023-06-10 18:04:43',_binary '\0'),(2085,'账号管理','mp:account:query',2,1,2084,'account','phone','mp/account/index',0,_binary '',_binary '','1','2023-01-01 20:13:31','1','2023-01-01 20:14:39',_binary '\0'),(2086,'新增账号','mp:account:create',3,1,2085,'','','',0,_binary '',_binary '','1','2023-01-01 20:21:40','1','2023-01-07 17:32:53',_binary '\0'),(2087,'修改账号','mp:account:update',3,2,2085,'','','',0,_binary '',_binary '','1','2023-01-07 17:32:46','1','2023-01-07 17:32:46',_binary '\0'),(2088,'查询账号','mp:account:query',3,0,2085,'','','',0,_binary '',_binary '','1','2023-01-07 17:33:07','1','2023-01-07 17:33:07',_binary '\0'),(2089,'删除账号','mp:account:delete',3,3,2085,'','','',0,_binary '',_binary '','1','2023-01-07 17:33:21','1','2023-01-07 17:33:21',_binary '\0'),(2090,'生成二维码','mp:account:qr-code',3,4,2085,'','','',0,_binary '',_binary '','1','2023-01-07 17:33:58','1','2023-01-07 17:33:58',_binary '\0'),(2091,'清空 API 配额','mp:account:clear-quota',3,5,2085,'','','',0,_binary '',_binary '','1','2023-01-07 18:20:32','1','2023-01-07 18:20:59',_binary '\0'),(2092,'数据统计','mp:statistics:query',2,2,2084,'statistics','chart','mp/statistics/index',0,_binary '',_binary '','1','2023-01-07 20:17:36','1','2023-01-07 20:17:36',_binary '\0'),(2093,'标签管理','',2,3,2084,'tag','rate','mp/tag/index',0,_binary '',_binary '','1','2023-01-08 11:37:32','1','2023-01-08 11:37:40',_binary '\0'),(2094,'查询标签','mp:tag:query',3,0,2093,'','','',0,_binary '',_binary '','1','2023-01-08 11:59:03','1','2023-01-08 11:59:03',_binary '\0'),(2095,'新增标签','mp:tag:create',3,1,2093,'','','',0,_binary '',_binary '','1','2023-01-08 11:59:23','1','2023-01-08 11:59:23',_binary '\0'),(2096,'修改标签','mp:tag:update',3,2,2093,'','','',0,_binary '',_binary '','1','2023-01-08 11:59:41','1','2023-01-08 11:59:41',_binary '\0'),(2097,'删除标签','mp:tag:delete',3,3,2093,'','','',0,_binary '',_binary '','1','2023-01-08 12:00:04','1','2023-01-08 12:00:13',_binary '\0'),(2098,'同步标签','mp:tag:sync',3,4,2093,'','','',0,_binary '',_binary '','1','2023-01-08 12:00:29','1','2023-01-08 12:00:29',_binary '\0'),(2099,'粉丝管理','',2,4,2084,'user','people','mp/user/index',0,_binary '',_binary '','1','2023-01-08 16:51:20','1','2023-01-08 16:56:19',_binary '\0'),(2100,'查询粉丝','mp:user:query',3,0,2099,'','','',0,_binary '',_binary '','1','2023-01-08 17:16:59','1','2023-01-08 17:17:23',_binary '\0'),(2101,'修改粉丝','mp:user:update',3,1,2099,'','','',0,_binary '',_binary '','1','2023-01-08 17:17:11','1','2023-01-08 17:17:11',_binary '\0'),(2102,'同步粉丝','mp:user:sync',3,2,2099,'','','',0,_binary '',_binary '','1','2023-01-08 17:17:40','1','2023-01-08 17:17:40',_binary '\0'),(2103,'消息管理','',2,5,2084,'message','email','mp/message/index',0,_binary '',_binary '','1','2023-01-08 18:44:19','1','2023-01-08 18:44:19',_binary '\0'),(2104,'图文发表记录','',2,10,2084,'free-publish','education','mp/freePublish/index',0,_binary '',_binary '','1','2023-01-13 00:30:50','1','2023-01-13 00:30:50',_binary '\0'),(2105,'查询发布列表','mp:free-publish:query',3,1,2104,'','','',0,_binary '',_binary '','1','2023-01-13 07:19:17','1','2023-01-13 07:19:17',_binary '\0'),(2106,'发布草稿','mp:free-publish:submit',3,2,2104,'','','',0,_binary '',_binary '','1','2023-01-13 07:19:46','1','2023-01-13 07:19:46',_binary '\0'),(2107,'删除发布记录','mp:free-publish:delete',3,3,2104,'','','',0,_binary '',_binary '','1','2023-01-13 07:20:01','1','2023-01-13 07:20:01',_binary '\0'),(2108,'图文草稿箱','',2,9,2084,'draft','edit','mp/draft/index',0,_binary '',_binary '','1','2023-01-13 07:40:21','1','2023-01-13 07:40:21',_binary '\0'),(2109,'新建草稿','mp:draft:create',3,1,2108,'','','',0,_binary '',_binary '','1','2023-01-13 23:15:30','1','2023-01-13 23:15:44',_binary '\0'),(2110,'修改草稿','mp:draft:update',3,2,2108,'','','',0,_binary '',_binary '','1','2023-01-14 10:08:47','1','2023-01-14 10:08:47',_binary '\0'),(2111,'查询草稿','mp:draft:query',3,0,2108,'','','',0,_binary '',_binary '','1','2023-01-14 10:09:01','1','2023-01-14 10:09:01',_binary '\0'),(2112,'删除草稿','mp:draft:delete',3,3,2108,'','','',0,_binary '',_binary '','1','2023-01-14 10:09:19','1','2023-01-14 10:09:19',_binary '\0'),(2113,'素材管理','',2,8,2084,'material','skill','mp/material/index',0,_binary '',_binary '','1','2023-01-14 14:12:07','1','2023-01-14 14:13:03',_binary '\0'),(2114,'上传临时素材','mp:material:upload-temporary',3,1,2113,'','','',0,_binary '',_binary '','1','2023-01-14 15:33:55','1','2023-01-14 15:33:55',_binary '\0'),(2115,'上传永久素材','mp:material:upload-permanent',3,2,2113,'','','',0,_binary '',_binary '','1','2023-01-14 15:34:14','1','2023-01-14 15:34:14',_binary '\0'),(2116,'删除素材','mp:material:delete',3,3,2113,'','','',0,_binary '',_binary '','1','2023-01-14 15:35:37','1','2023-01-14 15:35:37',_binary '\0'),(2117,'上传图文图片','mp:material:upload-news-image',3,4,2113,'','','',0,_binary '',_binary '','1','2023-01-14 15:36:31','1','2023-01-14 15:36:31',_binary '\0'),(2118,'查询素材','mp:material:query',3,5,2113,'','','',0,_binary '',_binary '','1','2023-01-14 15:39:22','1','2023-01-14 15:39:22',_binary '\0'),(2119,'菜单管理','',2,6,2084,'menu','button','mp/menu/index',0,_binary '',_binary '','1','2023-01-14 17:43:54','1','2023-01-14 17:43:54',_binary '\0'),(2120,'自动回复','',2,7,2084,'auto-reply','eye','mp/autoReply/index',0,_binary '',_binary '','1','2023-01-15 22:13:09','1','2023-01-15 22:13:09',_binary '\0'),(2121,'查询回复','mp:auto-reply:query',3,0,2120,'','','',0,_binary '',_binary '','1','2023-01-16 22:28:41','1','2023-01-16 22:28:41',_binary '\0'),(2122,'新增回复','mp:auto-reply:create',3,1,2120,'','','',0,_binary '',_binary '','1','2023-01-16 22:28:54','1','2023-01-16 22:28:54',_binary '\0'),(2123,'修改回复','mp:auto-reply:update',3,2,2120,'','','',0,_binary '',_binary '','1','2023-01-16 22:29:05','1','2023-01-16 22:29:05',_binary '\0'),(2124,'删除回复','mp:auto-reply:delete',3,3,2120,'','','',0,_binary '',_binary '','1','2023-01-16 22:29:34','1','2023-01-16 22:29:34',_binary '\0'),(2125,'查询菜单','mp:menu:query',3,0,2119,'','','',0,_binary '',_binary '','1','2023-01-17 23:05:41','1','2023-01-17 23:05:41',_binary '\0'),(2126,'保存菜单','mp:menu:save',3,1,2119,'','','',0,_binary '',_binary '','1','2023-01-17 23:06:01','1','2023-01-17 23:06:01',_binary '\0'),(2127,'删除菜单','mp:menu:delete',3,2,2119,'','','',0,_binary '',_binary '','1','2023-01-17 23:06:16','1','2023-01-17 23:06:16',_binary '\0'),(2128,'查询消息','mp:message:query',3,0,2103,'','','',0,_binary '',_binary '','1','2023-01-17 23:07:14','1','2023-01-17 23:07:14',_binary '\0'),(2129,'发送消息','mp:message:send',3,1,2103,'','','',0,_binary '',_binary '','1','2023-01-17 23:07:26','1','2023-01-17 23:07:26',_binary '\0'),(2130,'邮箱管理','',2,11,1,'mail','email',NULL,0,_binary '',_binary '','1','2023-01-25 17:27:44','1','2023-01-25 17:27:44',_binary '\0'),(2131,'邮箱账号','',2,0,2130,'mail-account','user','system/mail/account/index',0,_binary '',_binary '','','2023-01-25 09:33:48','1','2023-01-26 16:37:37',_binary '\0'),(2132,'账号查询','system:mail-account:query',3,1,2131,'','','',0,_binary '',_binary '','','2023-01-25 09:33:48','','2023-01-25 09:33:48',_binary '\0'),(2133,'账号创建','system:mail-account:create',3,2,2131,'','','',0,_binary '',_binary '','','2023-01-25 09:33:48','','2023-01-25 09:33:48',_binary '\0'),(2134,'账号更新','system:mail-account:update',3,3,2131,'','','',0,_binary '',_binary '','','2023-01-25 09:33:48','','2023-01-25 09:33:48',_binary '\0'),(2135,'账号删除','system:mail-account:delete',3,4,2131,'','','',0,_binary '',_binary '','','2023-01-25 09:33:48','','2023-01-25 09:33:48',_binary '\0'),(2136,'邮件模版','',2,0,2130,'mail-template','education','system/mail/template/index',0,_binary '',_binary '','','2023-01-25 12:05:31','1','2023-01-26 16:38:35',_binary '\0'),(2137,'模版查询','system:mail-template:query',3,1,2136,'','','',0,_binary '',_binary '','','2023-01-25 12:05:31','','2023-01-25 12:05:31',_binary '\0'),(2138,'模版创建','system:mail-template:create',3,2,2136,'','','',0,_binary '',_binary '','','2023-01-25 12:05:31','','2023-01-25 12:05:31',_binary '\0'),(2139,'模版更新','system:mail-template:update',3,3,2136,'','','',0,_binary '',_binary '','','2023-01-25 12:05:31','','2023-01-25 12:05:31',_binary '\0'),(2140,'模版删除','system:mail-template:delete',3,4,2136,'','','',0,_binary '',_binary '','','2023-01-25 12:05:31','','2023-01-25 12:05:31',_binary '\0'),(2141,'邮件记录','',2,0,2130,'mail-log','log','system/mail/log/index',0,_binary '',_binary '','','2023-01-26 02:16:50','1','2023-01-26 16:38:27',_binary '\0'),(2142,'日志查询','system:mail-log:query',3,1,2141,'','','',0,_binary '',_binary '','','2023-01-26 02:16:50','','2023-01-26 02:16:50',_binary '\0'),(2143,'发送测试邮件','system:mail-template:send-mail',3,5,2136,'','','',0,_binary '',_binary '','1','2023-01-26 23:29:15','1','2023-01-26 23:29:15',_binary '\0'),(2144,'站内信管理','',1,11,1,'notify','message',NULL,0,_binary '',_binary '','1','2023-01-28 10:25:18','1','2023-01-28 10:25:46',_binary '\0'),(2145,'模板管理','',2,0,2144,'notify-template','education','system/notify/template/index',0,_binary '',_binary '','','2023-01-28 02:26:42','1','2023-01-28 10:27:47',_binary '\0'),(2146,'站内信模板查询','system:notify-template:query',3,1,2145,'','','',0,_binary '',_binary '','','2023-01-28 02:26:42','','2023-01-28 02:26:42',_binary '\0'),(2147,'站内信模板创建','system:notify-template:create',3,2,2145,'','','',0,_binary '',_binary '','','2023-01-28 02:26:42','','2023-01-28 02:26:42',_binary '\0'),(2148,'站内信模板更新','system:notify-template:update',3,3,2145,'','','',0,_binary '',_binary '','','2023-01-28 02:26:42','','2023-01-28 02:26:42',_binary '\0'),(2149,'站内信模板删除','system:notify-template:delete',3,4,2145,'','','',0,_binary '',_binary '','','2023-01-28 02:26:42','','2023-01-28 02:26:42',_binary '\0'),(2150,'发送测试站内信','system:notify-template:send-notify',3,5,2145,'','','',0,_binary '',_binary '','1','2023-01-28 10:54:43','1','2023-01-28 10:54:43',_binary '\0'),(2151,'消息记录','',2,0,2144,'notify-message','edit','system/notify/message/index',0,_binary '',_binary '','','2023-01-28 04:28:22','1','2023-01-28 20:59:53',_binary '\0'),(2152,'站内信消息查询','system:notify-message:query',3,1,2151,'','','',0,_binary '',_binary '','','2023-01-28 04:28:22','','2023-01-28 04:28:22',_binary '\0');
/*!40000 ALTER TABLE `system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notice`
--

DROP TABLE IF EXISTS `system_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notice` (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                                 `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
                                 `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告内容',
                                 `type` tinyint NOT NULL COMMENT '公告类型（1通知 2公告）',
                                 `status` tinyint NOT NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                                 `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                 `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notice`
--

LOCK TABLES `system_notice` WRITE;
/*!40000 ALTER TABLE `system_notice` DISABLE KEYS */;
INSERT INTO `system_notice` VALUES (1,'芋道的公众','<p>新版本内容133</p>',1,0,'admin','2021-01-05 17:03:48','1','2022-05-04 21:00:20',_binary '\0',1),(2,'维护通知：2018-07-01 若依系统凌晨维护','<p><img src=\"http://test.yudao.iocoder.cn/b7cb3cf49b4b3258bf7309a09dd2f4e5.jpg\">维护内容</p>',2,1,'admin','2021-01-05 17:03:48','1','2022-05-11 12:34:24',_binary '\0',1),(4,'我是测试标题','<p>哈哈哈哈123</p>',1,0,'110','2022-02-22 01:01:25','110','2022-02-22 01:01:46',_binary '\0',121);
/*!40000 ALTER TABLE `system_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notify_message`
--

DROP TABLE IF EXISTS `system_notify_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notify_message` (
                                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                                         `user_id` bigint NOT NULL COMMENT '用户id',
                                         `user_type` tinyint NOT NULL COMMENT '用户类型',
                                         `template_id` bigint NOT NULL COMMENT '模版编号',
                                         `template_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
                                         `template_nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版发送人名称',
                                         `template_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版内容',
                                         `template_type` int NOT NULL COMMENT '模版类型',
                                         `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版参数',
                                         `read_status` bit(1) NOT NULL COMMENT '是否已读',
                                         `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
                                         `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                         `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='站内信消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notify_message`
--

LOCK TABLES `system_notify_message` WRITE;
/*!40000 ALTER TABLE `system_notify_message` DISABLE KEYS */;
INSERT INTO `system_notify_message` VALUES (2,1,2,1,'test','123','我是 1，我开始 2 了',1,'{\"name\":\"1\",\"what\":\"2\"}',_binary '\0','2023-01-28 21:06:10','1','2023-01-28 11:44:08','1','2023-01-29 02:51:50',_binary '\0',1),(3,1,2,1,'test','123','我是 1，我开始 2 了',1,'{\"name\":\"1\",\"what\":\"2\"}',_binary '\0','2023-01-29 10:34:13','1','2023-01-28 11:45:04','1','2023-01-29 02:51:52',_binary '\0',1),(4,103,2,2,'register','系统消息','你好，欢迎 哈哈 加入大家庭！',2,'{\"name\":\"哈哈\"}',_binary '\0',NULL,'1','2023-01-28 21:02:20','1','2023-01-28 21:02:20',_binary '\0',1),(5,1,2,1,'test','123','我是 芋艿，我开始 写代码 了',1,'{\"name\":\"芋艿\",\"what\":\"写代码\"}',_binary '\0','2023-01-29 10:41:45','1','2023-01-28 22:21:42','1','2023-01-29 02:51:54',_binary '\0',1),(6,1,2,1,'test','123','我是 芋艿，我开始 写代码 了',1,'{\"name\":\"芋艿\",\"what\":\"写代码\"}',_binary '','2023-01-29 10:52:06','1','2023-01-28 22:22:07','1','2023-01-29 10:52:06',_binary '\0',1),(7,1,2,1,'test','123','我是 2，我开始 3 了',1,'{\"name\":\"2\",\"what\":\"3\"}',_binary '','2023-01-29 10:52:06','1','2023-01-28 23:45:21','1','2023-01-29 10:52:06',_binary '\0',1),(8,1,2,2,'register','系统消息','你好，欢迎 123 加入大家庭！',2,'{\"name\":\"123\"}',_binary '','2023-01-29 10:52:06','1','2023-01-28 23:50:21','1','2023-01-29 10:52:06',_binary '\0',1);
/*!40000 ALTER TABLE `system_notify_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notify_template`
--

DROP TABLE IF EXISTS `system_notify_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notify_template` (
                                          `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                          `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
                                          `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版编码',
                                          `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送人名称',
                                          `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版内容',
                                          `type` tinyint NOT NULL COMMENT '类型',
                                          `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数数组',
                                          `status` tinyint NOT NULL COMMENT '状态',
                                          `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                          `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='站内信模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notify_template`
--

LOCK TABLES `system_notify_template` WRITE;
/*!40000 ALTER TABLE `system_notify_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_notify_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_access_token`
--

DROP TABLE IF EXISTS `system_oauth2_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_access_token` (
                                              `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                              `user_id` bigint NOT NULL COMMENT '用户编号',
                                              `user_type` tinyint NOT NULL COMMENT '用户类型',
                                              `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访问令牌',
                                              `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '刷新令牌',
                                              `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
                                              `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权范围',
                                              `expires_time` datetime NOT NULL COMMENT '过期时间',
                                              `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                              `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                              `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                              PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 访问令牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_access_token`
--

LOCK TABLES `system_oauth2_access_token` WRITE;
/*!40000 ALTER TABLE `system_oauth2_access_token` DISABLE KEYS */;
INSERT INTO `system_oauth2_access_token` VALUES (1249,1,2,'de93a9433f3f470980abdbc540674a87','ec32de9904b74d73a5adea7f7269542a','default',NULL,'2023-06-10 18:32:54',NULL,'2023-06-10 18:02:54',NULL,'2023-06-10 18:33:22',_binary '',1),(1250,1,2,'75a36ada6fb14a5c96f97db82be1a82f','ec32de9904b74d73a5adea7f7269542a','default',NULL,'2023-06-10 19:03:23',NULL,'2023-06-10 18:33:23',NULL,'2023-06-10 19:04:49',_binary '',1),(1251,1,2,'f9d31048b7fd45cfb1a28f10e8edc25a','ec32de9904b74d73a5adea7f7269542a','default',NULL,'2023-06-10 19:34:49',NULL,'2023-06-10 19:04:49',NULL,'2023-06-10 19:35:22',_binary '',1),(1252,1,2,'99c99b36134a42e5a208e07bf78208d3','ec32de9904b74d73a5adea7f7269542a','default',NULL,'2023-06-10 20:05:23',NULL,'2023-06-10 19:35:23',NULL,'2023-06-10 19:35:23',_binary '\0',1);
/*!40000 ALTER TABLE `system_oauth2_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_approve`
--

DROP TABLE IF EXISTS `system_oauth2_approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_approve` (
                                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                         `user_id` bigint NOT NULL COMMENT '用户编号',
                                         `user_type` tinyint NOT NULL COMMENT '用户类型',
                                         `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
                                         `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权范围',
                                         `approved` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否接受',
                                         `expires_time` datetime NOT NULL COMMENT '过期时间',
                                         `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                         `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 批准表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_approve`
--

LOCK TABLES `system_oauth2_approve` WRITE;
/*!40000 ALTER TABLE `system_oauth2_approve` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_oauth2_approve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_client`
--

DROP TABLE IF EXISTS `system_oauth2_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_client` (
                                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                        `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
                                        `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端密钥',
                                        `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
                                        `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用图标',
                                        `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用描述',
                                        `status` tinyint NOT NULL COMMENT '状态',
                                        `access_token_validity_seconds` int NOT NULL COMMENT '访问令牌的有效期',
                                        `refresh_token_validity_seconds` int NOT NULL COMMENT '刷新令牌的有效期',
                                        `redirect_uris` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '可重定向的 URI 地址',
                                        `authorized_grant_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授权类型',
                                        `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权范围',
                                        `auto_approve_scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自动通过的授权范围',
                                        `authorities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限',
                                        `resource_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源',
                                        `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附加信息',
                                        `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 客户端表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_client`
--

LOCK TABLES `system_oauth2_client` WRITE;
/*!40000 ALTER TABLE `system_oauth2_client` DISABLE KEYS */;
INSERT INTO `system_oauth2_client` VALUES (1,'default','admin123','芋道源码','http://test.yudao.iocoder.cn/a5e2e244368878a366b516805a4aabf1.png','我是描述',0,1800,43200,'[\"https://www.iocoder.cn\",\"https://doc.iocoder.cn\"]','[\"password\",\"authorization_code\",\"implicit\",\"refresh_token\"]','[\"user.read\",\"user.write\"]','[]','[\"user.read\",\"user.write\"]','[]','{}','1','2022-05-11 21:47:12','1','2022-07-05 16:23:52',_binary '\0'),(40,'test','test2','biubiu','http://test.yudao.iocoder.cn/277a899d573723f1fcdfb57340f00379.png',NULL,0,1800,43200,'[\"https://www.iocoder.cn\"]','[\"password\",\"authorization_code\",\"implicit\"]','[\"user_info\",\"projects\"]','[\"user_info\"]','[]','[]','{}','1','2022-05-12 00:28:20','1','2022-06-19 00:26:13',_binary '\0'),(41,'yudao-sso-demo-by-code','test','基于授权码模式，如何实现 SSO 单点登录？','http://test.yudao.iocoder.cn/fe4ed36596adad5120036ef61a6d0153654544d44af8dd4ad3ffe8f759933d6f.png',NULL,0,1800,43200,'[\"http://127.0.0.1:18080\"]','[\"authorization_code\",\"refresh_token\"]','[\"user.read\",\"user.write\"]','[]','[]','[]',NULL,'1','2022-09-29 13:28:31','1','2022-09-29 13:28:31',_binary '\0'),(42,'yudao-sso-demo-by-password','test','基于密码模式，如何实现 SSO 单点登录？','http://test.yudao.iocoder.cn/604bdc695e13b3b22745be704d1f2aa8ee05c5f26f9fead6d1ca49005afbc857.jpeg',NULL,0,1800,43200,'[\"http://127.0.0.1:18080\"]','[\"password\",\"refresh_token\"]','[\"user.read\",\"user.write\"]','[]','[]','[]',NULL,'1','2022-10-04 17:40:16','1','2022-10-04 20:31:21',_binary '\0');
/*!40000 ALTER TABLE `system_oauth2_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_code`
--

DROP TABLE IF EXISTS `system_oauth2_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_code` (
                                      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                      `user_id` bigint NOT NULL COMMENT '用户编号',
                                      `user_type` tinyint NOT NULL COMMENT '用户类型',
                                      `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授权码',
                                      `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
                                      `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '授权范围',
                                      `expires_time` datetime NOT NULL COMMENT '过期时间',
                                      `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '可重定向的 URI 地址',
                                      `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
                                      `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                      `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 授权码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_code`
--

LOCK TABLES `system_oauth2_code` WRITE;
/*!40000 ALTER TABLE `system_oauth2_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_oauth2_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_oauth2_refresh_token`
--

DROP TABLE IF EXISTS `system_oauth2_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_oauth2_refresh_token` (
                                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                               `user_id` bigint NOT NULL COMMENT '用户编号',
                                               `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '刷新令牌',
                                               `user_type` tinyint NOT NULL COMMENT '用户类型',
                                               `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
                                               `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权范围',
                                               `expires_time` datetime NOT NULL COMMENT '过期时间',
                                               `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                               `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                               `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                               `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2 刷新令牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_oauth2_refresh_token`
--

LOCK TABLES `system_oauth2_refresh_token` WRITE;
/*!40000 ALTER TABLE `system_oauth2_refresh_token` DISABLE KEYS */;
INSERT INTO `system_oauth2_refresh_token` VALUES (593,1,'ec32de9904b74d73a5adea7f7269542a',2,'default',NULL,'2023-06-11 06:02:54',NULL,'2023-06-10 18:02:54',NULL,'2023-06-10 18:02:54',_binary '\0',1);
/*!40000 ALTER TABLE `system_oauth2_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_operate_log`
--

DROP TABLE IF EXISTS `system_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_operate_log` (
                                      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                      `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
                                      `user_id` bigint NOT NULL COMMENT '用户编号',
                                      `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '用户类型',
                                      `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块标题',
                                      `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作名',
                                      `type` bigint NOT NULL DEFAULT '0' COMMENT '操作分类',
                                      `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作内容',
                                      `exts` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '拓展字段',
                                      `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求方法名',
                                      `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求地址',
                                      `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户 IP',
                                      `user_agent` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '浏览器 UA',
                                      `java_method` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Java 方法名',
                                      `java_method_args` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Java 方法的参数',
                                      `start_time` datetime NOT NULL COMMENT '操作时间',
                                      `duration` int NOT NULL COMMENT '执行时长',
                                      `result_code` int NOT NULL DEFAULT '0' COMMENT '结果码',
                                      `result_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '结果提示',
                                      `result_data` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '结果数据',
                                      `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                      `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_operate_log`
--

LOCK TABLES `system_operate_log` WRITE;
/*!40000 ALTER TABLE `system_operate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_post`
--

DROP TABLE IF EXISTS `system_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_post` (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                               `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
                               `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
                               `sort` int NOT NULL COMMENT '显示顺序',
                               `status` tinyint NOT NULL COMMENT '状态（0正常 1停用）',
                               `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                               `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                               `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_post`
--

LOCK TABLES `system_post` WRITE;
/*!40000 ALTER TABLE `system_post` DISABLE KEYS */;
INSERT INTO `system_post` VALUES (1,'ceo','董事长',1,0,'','admin','2021-01-06 17:03:48','1','2022-04-19 16:53:39',_binary '\0',1),(2,'se','项目经理',2,0,'','admin','2021-01-05 17:03:48','1','2021-12-12 10:47:47',_binary '\0',1),(4,'user','普通员工',4,0,'111','admin','2021-01-05 17:03:48','1','2022-05-04 22:46:35',_binary '\0',1);
/*!40000 ALTER TABLE `system_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role`
--

DROP TABLE IF EXISTS `system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role` (
                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                               `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
                               `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
                               `sort` int NOT NULL COMMENT '显示顺序',
                               `data_scope` tinyint NOT NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                               `data_scope_dept_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据范围(指定部门数组)',
                               `status` tinyint NOT NULL COMMENT '角色状态（0正常 1停用）',
                               `type` tinyint NOT NULL COMMENT '角色类型',
                               `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                               `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                               `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role`
--

LOCK TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;
INSERT INTO `system_role` VALUES (1,'超级管理员','super_admin',1,1,'',0,1,'超级管理员','admin','2021-01-05 17:03:48','','2022-02-22 05:08:21',_binary '\0',1),(2,'普通角色','common',2,2,'',0,1,'普通角色','admin','2021-01-05 17:03:48','','2022-02-22 05:08:20',_binary '\0',1),(101,'测试账号','test',0,1,'[]',0,2,'132','','2021-01-06 13:49:35','1','2022-09-25 12:09:38',_binary '\0',1),(109,'租户管理员','tenant_admin',0,1,'',0,1,'系统自动生成','1','2022-02-22 00:56:14','1','2022-02-22 00:56:14',_binary '\0',121),(110,'测试角色','test',0,1,'[]',0,2,'嘿嘿','110','2022-02-23 00:14:34','110','2022-02-23 13:14:58',_binary '\0',121),(111,'租户管理员','tenant_admin',0,1,'',0,1,'系统自动生成','1','2022-03-07 21:37:58','1','2022-03-07 21:37:58',_binary '\0',122),(113,'租户管理员','tenant_admin',0,1,'',0,1,'系统自动生成','1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(114,'租户管理员','tenant_admin',0,1,'',0,1,'系统自动生成','1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(115,'租户管理员','tenant_admin',0,1,'',0,1,'系统自动生成','1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(116,'租户管理员','tenant_admin',0,1,'',0,1,'系统自动生成','1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(118,'租户管理员','tenant_admin',0,1,'',0,1,'系统自动生成','1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129);
/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role_menu`
--

DROP TABLE IF EXISTS `system_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role_menu` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增编号',
                                    `role_id` bigint NOT NULL COMMENT '角色ID',
                                    `menu_id` bigint NOT NULL COMMENT '菜单ID',
                                    `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                    `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role_menu`
--

LOCK TABLES `system_role_menu` WRITE;
/*!40000 ALTER TABLE `system_role_menu` DISABLE KEYS */;
INSERT INTO `system_role_menu` VALUES (263,109,1,'1','2022-02-22 00:56:14','1','2022-02-22 00:56:14',_binary '\0',121),(434,2,1,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(454,2,1093,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(455,2,1094,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(460,2,1100,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(467,2,1107,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(470,2,1110,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(476,2,1117,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(477,2,100,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(478,2,101,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(479,2,102,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(480,2,1126,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(481,2,103,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(483,2,104,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(485,2,105,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(488,2,107,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(490,2,108,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(492,2,109,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(498,2,1138,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(523,2,1224,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(524,2,1225,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(541,2,500,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(543,2,501,'1','2022-02-22 13:09:12','1','2022-02-22 13:09:12',_binary '\0',1),(675,2,2,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(689,2,1077,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(690,2,1078,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(692,2,1083,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(693,2,1084,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(699,2,1090,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(703,2,106,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(704,2,110,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(705,2,111,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(706,2,112,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(707,2,113,'1','2022-02-22 13:16:57','1','2022-02-22 13:16:57',_binary '\0',1),(1296,110,1,'110','2022-02-23 00:23:55','110','2022-02-23 00:23:55',_binary '\0',121),(1489,1,1,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1490,1,2,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1494,1,1077,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1495,1,1078,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1496,1,1083,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1497,1,1084,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1498,1,1090,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1499,1,1093,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1500,1,1094,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1501,1,1100,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1502,1,1107,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1503,1,1110,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1505,1,1117,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1506,1,100,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1507,1,101,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1508,1,102,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1509,1,1126,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1510,1,103,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1511,1,104,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1512,1,105,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1513,1,106,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1514,1,107,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1515,1,108,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1516,1,109,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1517,1,110,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1518,1,111,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1519,1,112,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1520,1,113,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1522,1,1138,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1525,1,1224,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1526,1,1225,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1527,1,500,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1528,1,501,'1','2022-02-23 20:03:57','1','2022-02-23 20:03:57',_binary '\0',1),(1578,111,1,'1','2022-03-07 21:37:58','1','2022-03-07 21:37:58',_binary '\0',122),(1604,101,1216,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1605,101,1217,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1606,101,1218,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1607,101,1219,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1608,101,1220,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1609,101,1221,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1610,101,5,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1611,101,1222,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1612,101,1118,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1613,101,1119,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1614,101,1120,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1615,101,1185,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1616,101,1186,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1617,101,1187,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1618,101,1188,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1619,101,1189,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1620,101,1190,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1621,101,1191,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1622,101,1192,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1623,101,1193,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1624,101,1194,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1625,101,1195,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1626,101,1196,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1627,101,1197,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1628,101,1198,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1629,101,1199,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1630,101,1200,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1631,101,1201,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1632,101,1202,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1633,101,1207,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1634,101,1208,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1635,101,1209,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1636,101,1210,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1637,101,1211,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1638,101,1212,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1639,101,1213,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1640,101,1215,'1','2022-03-19 21:45:52','1','2022-03-19 21:45:52',_binary '\0',1),(1641,101,2,'1','2022-04-01 22:21:24','1','2022-04-01 22:21:24',_binary '\0',1),(1642,101,1031,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1643,101,1032,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1644,101,1033,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1645,101,1034,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1646,101,1035,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1647,101,1050,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1648,101,1051,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1649,101,1052,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1650,101,1053,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1651,101,1054,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1652,101,1056,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1653,101,1057,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1654,101,1058,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1655,101,1059,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1656,101,1060,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1657,101,1066,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1658,101,1067,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1659,101,1070,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1660,101,1071,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1661,101,1072,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1662,101,1073,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1663,101,1074,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1664,101,1075,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1665,101,1076,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1666,101,1077,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1667,101,1078,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1668,101,1082,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1669,101,1083,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1670,101,1084,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1671,101,1085,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1672,101,1086,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1673,101,1087,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1674,101,1088,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1675,101,1089,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1676,101,1090,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1677,101,1091,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1678,101,1092,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1679,101,1237,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1680,101,1238,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1681,101,1239,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1682,101,1240,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1683,101,1241,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1684,101,1242,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1685,101,1243,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1687,101,106,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1688,101,110,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1689,101,111,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1690,101,112,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1691,101,113,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1692,101,114,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1693,101,115,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1694,101,116,'1','2022-04-01 22:21:37','1','2022-04-01 22:21:37',_binary '\0',1),(1712,113,1024,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1713,113,1025,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1714,113,1,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1715,113,102,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1716,113,103,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1717,113,104,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1718,113,1013,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1719,113,1014,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1720,113,1015,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1721,113,1016,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1722,113,1017,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1723,113,1018,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1724,113,1019,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1725,113,1020,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1726,113,1021,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1727,113,1022,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1728,113,1023,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(1729,109,100,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1730,109,101,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1731,109,1063,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1732,109,1064,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1733,109,1001,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1734,109,1065,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1735,109,1002,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1736,109,1003,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1737,109,1004,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1738,109,1005,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1739,109,1006,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1740,109,1007,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1741,109,1008,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1742,109,1009,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1743,109,1010,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1744,109,1011,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1745,109,1012,'1','2022-09-21 22:08:51','1','2022-09-21 22:08:51',_binary '\0',121),(1746,111,100,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1747,111,101,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1748,111,1063,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1749,111,1064,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1750,111,1001,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1751,111,1065,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1752,111,1002,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1753,111,1003,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1754,111,1004,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1755,111,1005,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1756,111,1006,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1757,111,1007,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1758,111,1008,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1759,111,1009,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1760,111,1010,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1761,111,1011,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1762,111,1012,'1','2022-09-21 22:08:52','1','2022-09-21 22:08:52',_binary '\0',122),(1763,109,100,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1764,109,101,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1765,109,1063,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1766,109,1064,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1767,109,1001,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1768,109,1065,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1769,109,1002,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1770,109,1003,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1771,109,1004,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1772,109,1005,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1773,109,1006,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1774,109,1007,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1775,109,1008,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1776,109,1009,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1777,109,1010,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1778,109,1011,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1779,109,1012,'1','2022-09-21 22:08:53','1','2022-09-21 22:08:53',_binary '\0',121),(1780,111,100,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1781,111,101,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1782,111,1063,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1783,111,1064,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1784,111,1001,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1785,111,1065,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1786,111,1002,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1787,111,1003,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1788,111,1004,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1789,111,1005,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1790,111,1006,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1791,111,1007,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1792,111,1008,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1793,111,1009,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1794,111,1010,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1795,111,1011,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1796,111,1012,'1','2022-09-21 22:08:54','1','2022-09-21 22:08:54',_binary '\0',122),(1797,109,100,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1798,109,101,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1799,109,1063,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1800,109,1064,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1801,109,1001,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1802,109,1065,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1803,109,1002,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1804,109,1003,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1805,109,1004,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1806,109,1005,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1807,109,1006,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1808,109,1007,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1809,109,1008,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1810,109,1009,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1811,109,1010,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1812,109,1011,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1813,109,1012,'1','2022-09-21 22:08:55','1','2022-09-21 22:08:55',_binary '\0',121),(1814,111,100,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1815,111,101,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1816,111,1063,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1817,111,1064,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1818,111,1001,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1819,111,1065,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1820,111,1002,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1821,111,1003,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1822,111,1004,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1823,111,1005,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1824,111,1006,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1825,111,1007,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1826,111,1008,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1827,111,1009,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1828,111,1010,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1829,111,1011,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1830,111,1012,'1','2022-09-21 22:08:56','1','2022-09-21 22:08:56',_binary '\0',122),(1831,109,103,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',_binary '\0',121),(1832,109,1017,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',_binary '\0',121),(1833,109,1018,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',_binary '\0',121),(1834,109,1019,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',_binary '\0',121),(1835,109,1020,'1','2022-09-21 22:43:23','1','2022-09-21 22:43:23',_binary '\0',121),(1836,111,103,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',_binary '\0',122),(1837,111,1017,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',_binary '\0',122),(1838,111,1018,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',_binary '\0',122),(1839,111,1019,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',_binary '\0',122),(1840,111,1020,'1','2022-09-21 22:43:24','1','2022-09-21 22:43:24',_binary '\0',122),(1841,109,1036,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',121),(1842,109,1037,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',121),(1843,109,1038,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',121),(1844,109,1039,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',121),(1845,109,107,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',121),(1846,111,1036,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',122),(1847,111,1037,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',122),(1848,111,1038,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',122),(1849,111,1039,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',122),(1850,111,107,'1','2022-09-21 22:48:13','1','2022-09-21 22:48:13',_binary '\0',122),(1851,114,1,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1852,114,1036,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1853,114,1037,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1854,114,1038,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1855,114,1039,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1856,114,100,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1857,114,101,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1858,114,1063,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1859,114,103,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1860,114,1064,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1861,114,1001,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1862,114,1065,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1863,114,1002,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1864,114,1003,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1865,114,107,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1866,114,1004,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1867,114,1005,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1868,114,1006,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1869,114,1007,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1870,114,1008,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1871,114,1009,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1872,114,1010,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1873,114,1011,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1874,114,1012,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1875,114,1017,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1876,114,1018,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1877,114,1019,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1878,114,1020,'1','2022-12-30 11:32:03','1','2022-12-30 11:32:03',_binary '\0',125),(1879,115,1,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1880,115,1036,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1881,115,1037,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1882,115,1038,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1883,115,1039,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1884,115,100,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1885,115,101,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1886,115,1063,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1887,115,103,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1888,115,1064,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1889,115,1001,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1890,115,1065,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1891,115,1002,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1892,115,1003,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1893,115,107,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1894,115,1004,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1895,115,1005,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1896,115,1006,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1897,115,1007,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1898,115,1008,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1899,115,1009,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1900,115,1010,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1901,115,1011,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1902,115,1012,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1903,115,1017,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1904,115,1018,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1905,115,1019,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1906,115,1020,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(1907,116,1,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1908,116,1036,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1909,116,1037,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1910,116,1038,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1911,116,1039,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1912,116,100,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1913,116,101,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1914,116,1063,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1915,116,103,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1916,116,1064,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1917,116,1001,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1918,116,1065,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1919,116,1002,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1920,116,1003,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1921,116,107,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1922,116,1004,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1923,116,1005,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1924,116,1006,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1925,116,1007,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1926,116,1008,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1927,116,1009,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1928,116,1010,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1929,116,1011,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1930,116,1012,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1931,116,1017,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1932,116,1018,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1933,116,1019,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1934,116,1020,'1','2022-12-30 11:33:48','1','2022-12-30 11:33:48',_binary '\0',127),(1963,118,1,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1964,118,1036,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1965,118,1037,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1966,118,1038,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1967,118,1039,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1968,118,100,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1969,118,101,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1970,118,1063,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1971,118,103,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1972,118,1064,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1973,118,1001,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1974,118,1065,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1975,118,1002,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1976,118,1003,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1977,118,107,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1978,118,1004,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1979,118,1005,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1980,118,1006,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1981,118,1007,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1982,118,1008,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1983,118,1009,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1984,118,1010,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1985,118,1011,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1986,118,1012,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1987,118,1017,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1988,118,1018,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1989,118,1019,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1990,118,1020,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129),(1991,2,1024,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(1992,2,1025,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(1993,2,1026,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(1994,2,1027,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(1995,2,1028,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(1996,2,1029,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(1997,2,1030,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(1998,2,1031,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(1999,2,1032,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2000,2,1033,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2001,2,1034,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2002,2,1035,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2003,2,1036,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2004,2,1037,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2005,2,1038,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2006,2,1039,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2007,2,1040,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2008,2,1042,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2009,2,1043,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2010,2,1045,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2011,2,1046,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2012,2,1048,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2013,2,1050,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2014,2,1051,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2015,2,1052,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2016,2,1053,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2017,2,1054,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2018,2,1056,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2019,2,1057,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2020,2,1058,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2021,2,2083,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2022,2,1059,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2023,2,1060,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2024,2,1063,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2025,2,1064,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2026,2,1065,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2027,2,1066,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2028,2,1067,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2029,2,1070,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2030,2,1071,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2031,2,1072,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2032,2,1073,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2033,2,1074,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2034,2,1075,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2035,2,1076,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2036,2,1082,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2037,2,1085,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2038,2,1086,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2039,2,1087,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2040,2,1088,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2041,2,1089,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2042,2,1091,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2043,2,1092,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2044,2,1095,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2045,2,1096,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2046,2,1097,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2047,2,1098,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2048,2,1101,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2049,2,1102,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2050,2,1103,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2051,2,1104,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2052,2,1105,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2053,2,1106,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2054,2,1108,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2055,2,1109,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2056,2,1111,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2057,2,1112,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2058,2,1113,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2059,2,1114,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2060,2,1115,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2061,2,1127,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2062,2,1128,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2063,2,1129,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2064,2,1130,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2065,2,1131,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2066,2,1132,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2067,2,1133,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2068,2,1134,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2069,2,1135,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2070,2,1136,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2071,2,1137,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2072,2,114,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2073,2,1139,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2074,2,115,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2075,2,1140,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2076,2,116,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2077,2,1141,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2078,2,1142,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2079,2,1143,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2080,2,1150,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2081,2,1161,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2082,2,1162,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2083,2,1163,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2084,2,1164,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2085,2,1165,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2086,2,1166,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2087,2,1173,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2088,2,1174,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2089,2,1175,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2090,2,1176,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2091,2,1177,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2092,2,1178,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2093,2,1179,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2094,2,1180,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2095,2,1181,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2096,2,1182,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2097,2,1183,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2098,2,1184,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2099,2,1226,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2100,2,1227,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2101,2,1228,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2102,2,1229,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2103,2,1237,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2104,2,1238,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2105,2,1239,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2106,2,1240,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2107,2,1241,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2108,2,1242,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2109,2,1243,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2110,2,1247,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2111,2,1248,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2112,2,1249,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2113,2,1250,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2114,2,1251,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2115,2,1252,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2116,2,1254,'1','2023-01-25 08:42:52','1','2023-06-10 18:03:34',_binary '',1),(2117,2,1255,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2118,2,1256,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2119,2,1257,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2120,2,1258,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2121,2,1259,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2122,2,1260,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2123,2,1261,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2124,2,1263,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2125,2,1264,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2126,2,1265,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2127,2,1266,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2128,2,1267,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2129,2,1001,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2130,2,1002,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2131,2,1003,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2132,2,1004,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2133,2,1005,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2134,2,1006,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2135,2,1007,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2136,2,1008,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2137,2,1009,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2138,2,1010,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2139,2,1011,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2140,2,1012,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2141,2,1013,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2142,2,1014,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2143,2,1015,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2144,2,1016,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2145,2,1017,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2146,2,1018,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2147,2,1019,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2148,2,1020,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2149,2,1021,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2150,2,1022,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2151,2,1023,'1','2023-01-25 08:42:52','1','2023-01-25 08:42:52',_binary '\0',1),(2152,2,1281,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2153,2,1282,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2154,2,2000,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2155,2,2002,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2156,2,2003,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2157,2,2004,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2158,2,2005,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2159,2,2006,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2160,2,2008,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2161,2,2009,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2162,2,2010,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2163,2,2011,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2164,2,2012,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2170,2,2019,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2171,2,2020,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2172,2,2021,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2173,2,2022,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2174,2,2023,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2175,2,2025,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2177,2,2027,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2178,2,2028,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2179,2,2029,'1','2023-01-25 08:42:58','1','2023-01-25 08:42:58',_binary '\0',1),(2180,2,2014,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',_binary '\0',1),(2181,2,2015,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',_binary '\0',1),(2182,2,2016,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',_binary '\0',1),(2183,2,2017,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',_binary '\0',1),(2184,2,2018,'1','2023-01-25 08:43:12','1','2023-01-25 08:43:12',_binary '\0',1);
/*!40000 ALTER TABLE `system_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sensitive_word`
--

DROP TABLE IF EXISTS `system_sensitive_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sensitive_word` (
                                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '敏感词',
                                         `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
                                         `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签数组',
                                         `status` tinyint NOT NULL COMMENT '状态',
                                         `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='敏感词';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sensitive_word`
--

LOCK TABLES `system_sensitive_word` WRITE;
/*!40000 ALTER TABLE `system_sensitive_word` DISABLE KEYS */;
INSERT INTO `system_sensitive_word` VALUES (3,'土豆','好呀','蔬菜,短信',0,'1','2022-04-08 21:07:12','1','2022-04-09 10:28:14',_binary '\0'),(4,'XXX',NULL,'短信',0,'1','2022-04-08 21:27:49','1','2022-06-19 00:36:50',_binary '\0'),(5,'白痴',NULL,'测试',0,'1','2022-12-31 19:08:25','1','2022-12-31 19:08:25',_binary '\0');
/*!40000 ALTER TABLE `system_sensitive_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sms_channel`
--

DROP TABLE IF EXISTS `system_sms_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_channel` (
                                      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                      `signature` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信签名',
                                      `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
                                      `status` tinyint NOT NULL COMMENT '开启状态',
                                      `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                      `api_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的账号',
                                      `api_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 的秘钥',
                                      `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信发送回调 URL',
                                      `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信渠道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sms_channel`
--

LOCK TABLES `system_sms_channel` WRITE;
/*!40000 ALTER TABLE `system_sms_channel` DISABLE KEYS */;
INSERT INTO `system_sms_channel` VALUES (2,'Ballcat','ALIYUN',0,'啦啦啦','LTAI5tCnKso2uG3kJ5gRav88','fGJ5SNXL7P1NHNRmJ7DJaMJGPyE55C',NULL,'','2021-03-31 11:53:10','1','2021-04-14 00:08:37',_binary '\0'),(4,'测试渠道','DEBUG_DING_TALK',0,'123','696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859','SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67',NULL,'1','2021-04-13 00:23:14','1','2022-03-27 20:29:49',_binary '\0'),(6,'测试演示','DEBUG_DING_TALK',0,NULL,'696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859','SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67',NULL,'1','2022-04-10 23:07:59','1','2022-06-19 00:33:54',_binary '\0');
/*!40000 ALTER TABLE `system_sms_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sms_code`
--

DROP TABLE IF EXISTS `system_sms_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_code` (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                   `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
                                   `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
                                   `create_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建 IP',
                                   `scene` tinyint NOT NULL COMMENT '发送场景',
                                   `today_index` tinyint NOT NULL COMMENT '今日发送的第几条',
                                   `used` tinyint NOT NULL COMMENT '是否使用',
                                   `used_time` datetime DEFAULT NULL COMMENT '使用时间',
                                   `used_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '使用 IP',
                                   `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                   `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   KEY `idx_mobile` (`mobile`) USING BTREE COMMENT '手机号'
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='手机验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sms_code`
--

LOCK TABLES `system_sms_code` WRITE;
/*!40000 ALTER TABLE `system_sms_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_sms_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sms_log`
--

DROP TABLE IF EXISTS `system_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_log` (
                                  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                  `channel_id` bigint NOT NULL COMMENT '短信渠道编号',
                                  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
                                  `template_id` bigint NOT NULL COMMENT '模板编号',
                                  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
                                  `template_type` tinyint NOT NULL COMMENT '短信类型',
                                  `template_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信内容',
                                  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信参数',
                                  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
                                  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
                                  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
                                  `user_type` tinyint DEFAULT NULL COMMENT '用户类型',
                                  `send_status` tinyint NOT NULL DEFAULT '0' COMMENT '发送状态',
                                  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
                                  `send_code` int DEFAULT NULL COMMENT '发送结果的编码',
                                  `send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送结果的提示',
                                  `api_send_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 发送结果的编码',
                                  `api_send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 发送失败的提示',
                                  `api_request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 发送返回的唯一请求 ID',
                                  `api_serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信 API 发送返回的序号',
                                  `receive_status` tinyint NOT NULL DEFAULT '0' COMMENT '接收状态',
                                  `receive_time` datetime DEFAULT NULL COMMENT '接收时间',
                                  `api_receive_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'API 接收结果的编码',
                                  `api_receive_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'API 接收结果的说明',
                                  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sms_log`
--

LOCK TABLES `system_sms_log` WRITE;
/*!40000 ALTER TABLE `system_sms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_sms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sms_template`
--

DROP TABLE IF EXISTS `system_sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_sms_template` (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                       `type` tinyint NOT NULL COMMENT '短信签名',
                                       `status` tinyint NOT NULL COMMENT '开启状态',
                                       `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
                                       `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
                                       `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
                                       `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
                                       `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                       `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
                                       `channel_id` bigint NOT NULL COMMENT '短信渠道编号',
                                       `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
                                       `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                       `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sms_template`
--

LOCK TABLES `system_sms_template` WRITE;
/*!40000 ALTER TABLE `system_sms_template` DISABLE KEYS */;
INSERT INTO `system_sms_template` VALUES (2,1,0,'test_01','测试验证码短信','正在进行登录操作{operation}，您的验证码是{code}','[\"operation\",\"code\"]',NULL,'4383920',6,'DEBUG_DING_TALK','','2021-03-31 10:49:38','1','2022-12-10 21:26:20',_binary '\0'),(3,1,0,'test_02','公告通知','您的验证码{code}，该验证码5分钟内有效，请勿泄漏于他人！','[\"code\"]',NULL,'SMS_207945135',2,'ALIYUN','','2021-03-31 11:56:30','1','2021-04-10 01:22:02',_binary '\0'),(6,3,0,'test-01','测试模板','哈哈哈 {name}','[\"name\"]','f哈哈哈','4383920',6,'DEBUG_DING_TALK','1','2021-04-10 01:07:21','1','2022-12-10 21:26:09',_binary '\0'),(7,3,0,'test-04','测试下','老鸡{name}，牛逼{code}','[\"name\",\"code\"]',NULL,'suibian',4,'DEBUG_DING_TALK','1','2021-04-13 00:29:53','1','2021-04-14 00:30:38',_binary '\0'),(8,1,0,'user-sms-login','前台用户短信登录','您的验证码是{code}','[\"code\"]',NULL,'4372216',6,'DEBUG_DING_TALK','1','2021-10-11 08:10:00','1','2022-12-10 21:25:59',_binary '\0'),(9,2,0,'bpm_task_assigned','【工作流】任务被分配','您收到了一条新的待办任务：{processInstanceName}-{taskName}，申请人：{startUserNickname}，处理链接：{detailUrl}','[\"processInstanceName\",\"taskName\",\"startUserNickname\",\"detailUrl\"]',NULL,'suibian',4,'DEBUG_DING_TALK','1','2022-01-21 22:31:19','1','2022-01-22 00:03:36',_binary '\0'),(10,2,0,'bpm_process_instance_reject','【工作流】流程被不通过','您的流程被审批不通过：{processInstanceName}，原因：{reason}，查看链接：{detailUrl}','[\"processInstanceName\",\"reason\",\"detailUrl\"]',NULL,'suibian',4,'DEBUG_DING_TALK','1','2022-01-22 00:03:31','1','2022-05-01 12:33:14',_binary '\0'),(11,2,0,'bpm_process_instance_approve','【工作流】流程被通过','您的流程被审批通过：{processInstanceName}，查看链接：{detailUrl}','[\"processInstanceName\",\"detailUrl\"]',NULL,'suibian',4,'DEBUG_DING_TALK','1','2022-01-22 00:04:31','1','2022-03-27 20:32:21',_binary '\0'),(12,2,0,'demo','演示模板','我就是测试一下下','[]',NULL,'biubiubiu',6,'DEBUG_DING_TALK','1','2022-04-10 23:22:49','1','2022-04-10 23:22:49',_binary '\0'),(13,1,0,'admin-sms-login','后台用户短信登录','您的验证码是{code}','[\"code\"]','','4372216',6,'DEBUG_DING_TALK','1','2021-10-11 08:10:00','1','2022-12-10 21:25:51',_binary '\0');
/*!40000 ALTER TABLE `system_sms_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_social_user`
--

DROP TABLE IF EXISTS `system_social_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_social_user` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
                                      `type` tinyint NOT NULL COMMENT '社交平台的类型',
                                      `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '社交 openid',
                                      `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '社交 token',
                                      `raw_token_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始 Token 数据，一般是 JSON 格式',
                                      `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
                                      `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
                                      `raw_user_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始用户数据，一般是 JSON 格式',
                                      `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最后一次的认证 code',
                                      `state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后一次的认证 state',
                                      `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                      `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社交用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_social_user`
--

LOCK TABLES `system_social_user` WRITE;
/*!40000 ALTER TABLE `system_social_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_social_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_social_user_bind`
--

DROP TABLE IF EXISTS `system_social_user_bind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_social_user_bind` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
                                           `user_id` bigint NOT NULL COMMENT '用户编号',
                                           `user_type` tinyint NOT NULL COMMENT '用户类型',
                                           `social_type` tinyint NOT NULL COMMENT '社交平台的类型',
                                           `social_user_id` bigint NOT NULL COMMENT '社交用户的编号',
                                           `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                           `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社交绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_social_user_bind`
--

LOCK TABLES `system_social_user_bind` WRITE;
/*!40000 ALTER TABLE `system_social_user_bind` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_social_user_bind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_tenant`
--

DROP TABLE IF EXISTS `system_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_tenant` (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '租户编号',
                                 `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户名',
                                 `contact_user_id` bigint DEFAULT NULL COMMENT '联系人的用户编号',
                                 `contact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人',
                                 `contact_mobile` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系手机',
                                 `status` tinyint NOT NULL DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
                                 `domain` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '绑定域名',
                                 `package_id` bigint NOT NULL COMMENT '租户套餐编号',
                                 `expire_time` datetime NOT NULL COMMENT '过期时间',
                                 `account_count` int NOT NULL COMMENT '账号数量',
                                 `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='租户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_tenant`
--

LOCK TABLES `system_tenant` WRITE;
/*!40000 ALTER TABLE `system_tenant` DISABLE KEYS */;
INSERT INTO `system_tenant` VALUES (1,'芋道源码',NULL,'芋艿','17321315478',0,'https://www.iocoder.cn',0,'2099-02-19 17:14:16',9999,'1','2021-01-05 17:03:47','1','2022-02-23 12:15:11',_binary '\0'),(121,'小租户',110,'小王2','15601691300',0,'http://www.iocoder.cn',111,'2024-03-11 00:00:00',20,'1','2022-02-22 00:56:14','1','2023-06-10 18:06:49',_binary ''),(122,'测试租户',113,'芋道','15601691300',0,'https://www.iocoder.cn',111,'2022-04-30 00:00:00',50,'1','2022-03-07 21:37:58','1','2023-06-10 18:06:47',_binary ''),(125,'测试',119,'12',NULL,0,'http://www.iocoder.cn',111,'2022-12-22 00:00:00',1,'1','2022-12-30 11:32:03','1','2023-06-10 18:06:45',_binary ''),(126,'测试',120,'12',NULL,0,'http://www.iocoder.cn',111,'2022-12-22 00:00:00',1,'1','2022-12-30 11:33:42','1','2023-06-10 18:06:43',_binary ''),(127,'测试',121,'12',NULL,0,'http://www.iocoder.cn',111,'2022-12-22 00:00:00',1,'1','2022-12-30 11:33:48','1','2023-06-10 18:06:40',_binary ''),(129,'测试',122,'12',NULL,0,'http://www.iocoder.cn',111,'2022-12-22 00:00:00',1,'1','2022-12-30 11:47:52','1','2023-06-10 18:06:38',_binary '');
/*!40000 ALTER TABLE `system_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_tenant_package`
--

DROP TABLE IF EXISTS `system_tenant_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_tenant_package` (
                                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
                                         `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '套餐名',
                                         `status` tinyint NOT NULL DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
                                         `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
                                         `menu_ids` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联的菜单编号',
                                         `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='租户套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_tenant_package`
--

LOCK TABLES `system_tenant_package` WRITE;
/*!40000 ALTER TABLE `system_tenant_package` DISABLE KEYS */;
INSERT INTO `system_tenant_package` VALUES (111,'普通套餐',0,'小功能','[1,1036,1037,1038,1039,100,101,1063,103,1064,1001,1065,1002,1003,107,1004,1005,1006,1007,1008,1009,1010,1011,1012,1017,1018,1019,1020]','1','2022-02-22 00:54:00','1','2022-09-21 22:48:12',_binary '\0');
/*!40000 ALTER TABLE `system_tenant_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_post`
--

DROP TABLE IF EXISTS `system_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_post` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                                    `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户ID',
                                    `post_id` bigint NOT NULL DEFAULT '0' COMMENT '岗位ID',
                                    `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                    `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户岗位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_post`
--

LOCK TABLES `system_user_post` WRITE;
/*!40000 ALTER TABLE `system_user_post` DISABLE KEYS */;
INSERT INTO `system_user_post` VALUES (112,1,1,'admin','2022-05-02 07:25:24','admin','2022-05-02 07:25:24',_binary '\0',1),(113,100,1,'admin','2022-05-02 07:25:24','admin','2023-06-10 18:06:06',_binary '',1),(114,114,3,'admin','2022-05-02 07:25:24','admin','2023-06-10 18:05:54',_binary '',1),(115,104,1,'1','2022-05-16 19:36:28','1','2023-06-10 18:06:00',_binary '',1),(116,117,2,'1','2022-07-09 17:40:26','1','2023-06-10 18:05:49',_binary '',1),(117,118,1,'1','2022-07-09 17:44:44','1','2023-06-10 18:05:45',_binary '',1);
/*!40000 ALTER TABLE `system_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_role`
--

DROP TABLE IF EXISTS `system_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_role` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增编号',
                                    `user_id` bigint NOT NULL COMMENT '用户ID',
                                    `role_id` bigint NOT NULL COMMENT '角色ID',
                                    `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `deleted` bit(1) DEFAULT b'0' COMMENT '是否删除',
                                    `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_role`
--

LOCK TABLES `system_user_role` WRITE;
/*!40000 ALTER TABLE `system_user_role` DISABLE KEYS */;
INSERT INTO `system_user_role` VALUES (1,1,1,'','2022-01-11 13:19:45','','2022-05-12 12:35:17',_binary '\0',1),(2,2,2,'','2022-01-11 13:19:45','','2022-05-12 12:35:13',_binary '\0',1),(4,100,101,'','2022-01-11 13:19:45','','2023-06-10 18:06:06',_binary '',1),(5,100,1,'','2022-01-11 13:19:45','','2023-06-10 18:06:06',_binary '',1),(6,100,2,'','2022-01-11 13:19:45','','2023-06-10 18:06:06',_binary '',1),(10,103,1,'1','2022-01-11 13:19:45','1','2023-06-10 18:06:03',_binary '',1),(11,107,106,'1','2022-02-20 22:59:33','1','2022-02-20 22:59:33',_binary '\0',118),(12,108,107,'1','2022-02-20 23:00:50','1','2022-02-20 23:00:50',_binary '\0',119),(13,109,108,'1','2022-02-20 23:11:50','1','2022-02-20 23:11:50',_binary '\0',120),(14,110,109,'1','2022-02-22 00:56:14','1','2022-02-22 00:56:14',_binary '\0',121),(15,111,110,'110','2022-02-23 13:14:38','110','2022-02-23 13:14:38',_binary '\0',121),(16,113,111,'1','2022-03-07 21:37:58','1','2022-03-07 21:37:58',_binary '\0',122),(17,114,101,'1','2022-03-19 21:51:13','1','2023-06-10 18:05:54',_binary '',1),(18,1,2,'1','2022-05-12 20:39:29','1','2022-05-12 20:39:29',_binary '\0',1),(19,116,113,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(20,104,101,'1','2022-05-28 15:43:57','1','2023-06-10 18:06:00',_binary '',1),(22,115,2,'1','2022-07-21 22:08:30','1','2023-06-10 18:05:52',_binary '',1),(23,119,114,'1','2022-12-30 11:32:04','1','2022-12-30 11:32:04',_binary '\0',125),(24,120,115,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(25,121,116,'1','2022-12-30 11:33:49','1','2022-12-30 11:33:49',_binary '\0',127),(26,122,118,'1','2022-12-30 11:47:53','1','2022-12-30 11:47:53',_binary '\0',129);
/*!40000 ALTER TABLE `system_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_session`
--

DROP TABLE IF EXISTS `system_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_session` (
                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                       `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会话编号',
                                       `user_id` bigint NOT NULL COMMENT '用户编号',
                                       `user_type` tinyint NOT NULL DEFAULT '0' COMMENT '用户类型',
                                       `session_timeout` datetime NOT NULL COMMENT '会话超时时间',
                                       `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
                                       `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
                                       `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
                                       `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                       `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                       `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户在线 Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_session`
--

LOCK TABLES `system_user_session` WRITE;
/*!40000 ALTER TABLE `system_user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_users`
--

DROP TABLE IF EXISTS `system_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_users` (
                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                                `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
                                `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
                                `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
                                `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                                `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
                                `post_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '岗位编号数组',
                                `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户邮箱',
                                `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
                                `sex` tinyint DEFAULT '0' COMMENT '用户性别',
                                `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
                                `status` tinyint NOT NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                                `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
                                `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
                                `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
                                `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
                                PRIMARY KEY (`id`) USING BTREE,
                                UNIQUE KEY `idx_username` (`username`,`update_time`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_users`
--

LOCK TABLES `system_users` WRITE;
/*!40000 ALTER TABLE `system_users` DISABLE KEYS */;
INSERT INTO `system_users` VALUES (1,'admin','$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm','芋道源码','管理员',103,'[1]','aoteman@126.com','15612345678',1,'http://test.yudao.iocoder.cn/e1fdd7271685ec143a0900681606406621717a666ad0b2798b096df41422b32f.png',0,'127.0.0.1','2023-06-10 18:02:54','admin','2021-01-05 17:03:47',NULL,'2023-06-10 18:02:54',_binary '\0',1),(100,'yudao','$2a$10$11U48RhyJ5pSBYWSn12AD./ld671.ycSzJHbyrtpeoMeYiw31eo8a','芋道','不要吓我',104,'[1]','yudao@iocoder.cn','15601691300',1,'',1,'127.0.0.1','2022-07-09 23:03:33','','2021-01-07 09:07:17',NULL,'2023-06-10 18:06:06',_binary '',1),(103,'yuanma','$2a$10$YMpimV4T6BtDhIaA8jSW.u8UTGBeGhc/qwXP4oxoMr4mOw9.qttt6','源码',NULL,106,NULL,'yuanma@iocoder.cn','15601701300',0,'',0,'127.0.0.1','2022-07-08 01:26:27','','2021-01-13 23:50:35',NULL,'2023-06-10 18:06:03',_binary '',1),(104,'test','$2a$10$GP8zvqHB//TekuzYZSBYAuBQJiNq1.fxQVDYJ.uBCOnWCtDVKE4H6','测试号',NULL,107,'[1,2]','111@qq.com','15601691200',1,'',0,'127.0.0.1','2022-05-28 15:43:17','','2021-01-21 02:13:53',NULL,'2023-06-10 18:06:00',_binary '',1),(107,'admin107','$2a$10$dYOOBKMO93v/.ReCqzyFg.o67Tqk.bbc2bhrpyBGkIw9aypCtr2pm','芋艿',NULL,NULL,NULL,'','15601691300',0,'',0,'',NULL,'1','2022-02-20 22:59:33','1','2022-02-27 08:26:51',_binary '\0',118),(108,'admin108','$2a$10$y6mfvKoNYL1GXWak8nYwVOH.kCWqjactkzdoIDgiKl93WN3Ejg.Lu','芋艿',NULL,NULL,NULL,'','15601691300',0,'',0,'',NULL,'1','2022-02-20 23:00:50','1','2022-02-27 08:26:53',_binary '\0',119),(109,'admin109','$2a$10$JAqvH0tEc0I7dfDVBI7zyuB4E3j.uH6daIjV53.vUS6PknFkDJkuK','芋艿',NULL,NULL,NULL,'','15601691300',0,'',0,'',NULL,'1','2022-02-20 23:11:50','1','2022-02-27 08:26:56',_binary '\0',120),(110,'admin110','$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm','小王',NULL,NULL,NULL,'','15601691300',0,'',0,'127.0.0.1','2022-09-25 22:47:33','1','2022-02-22 00:56:14',NULL,'2022-09-25 22:47:33',_binary '\0',121),(111,'test','$2a$10$mExveopHUx9Q4QiLtAzhDeH3n4/QlNLzEsM4AqgxKrU.ciUZDXZCy','测试用户',NULL,NULL,'[]','','',0,'',0,'',NULL,'110','2022-02-23 13:14:33','110','2022-02-23 13:14:33',_binary '\0',121),(112,'newobject','$2a$10$jh5MsR.ud/gKe3mVeUp5t.nEXGDSmHyv5OYjWQwHO8wlGmMSI9Twy','新对象',NULL,NULL,'[]','','',0,'',0,'',NULL,'1','2022-02-23 19:08:03','1','2023-06-10 18:05:57',_binary '',1),(113,'aoteman','$2a$10$0acJOIk2D25/oC87nyclE..0lzeu9DtQ/n3geP4fkun/zIVRhHJIO','芋道',NULL,NULL,NULL,'','15601691300',0,'',0,'127.0.0.1','2022-03-19 18:38:51','1','2022-03-07 21:37:58',NULL,'2022-03-19 18:38:51',_binary '\0',122),(114,'hrmgr','$2a$10$TR4eybBioGRhBmDBWkqWLO6NIh3mzYa8KBKDDB5woiGYFVlRAi.fu','hr 小姐姐',NULL,NULL,'[3]','','',0,'',0,'127.0.0.1','2022-03-19 22:15:43','1','2022-03-19 21:50:58',NULL,'2023-06-10 18:05:54',_binary '',1),(115,'aotemane','$2a$10$/WCwGHu1eq0wOVDd/u8HweJ0gJCHyLS6T7ndCqI8UXZAQom1etk2e','1','11',101,'[]','','',1,'',0,'',NULL,'1','2022-04-30 02:55:43','1','2023-06-10 18:05:52',_binary '',1),(116,'15601691302','$2a$10$L5C4S0U6adBWMvFv1Wwl4.DI/NwYS3WIfLj5Q.Naqr5II8CmqsDZ6','小豆',NULL,NULL,NULL,'','',0,'',0,'',NULL,'1','2022-05-17 10:07:10','1','2022-05-17 10:07:10',_binary '\0',124),(117,'admin123','$2a$10$WI8Gg/lpZQIrOEZMHqka7OdFaD4Nx.B/qY8ZGTTUKrOJwaHFqibaC','测试号','1111',100,'[2]','','15601691234',1,'',0,'',NULL,'1','2022-07-09 17:40:26','1','2023-06-10 18:05:49',_binary '',1),(118,'goudan','$2a$10$Lrb71muL.s5/AFjQ2IHkzOFlAFwUToH.zQL7bnghvTDt/QptjGgF6','狗蛋',NULL,103,'[1]','','',2,'',0,'',NULL,'1','2022-07-09 17:44:43','1','2023-06-10 18:05:45',_binary '',1),(119,'admin','$2a$10$AheSOpxeWQYhEO/gGZhDz.oifdX5zt.kprWNHptPiiStUx4mXmHb.','12',NULL,NULL,NULL,'','',0,'',0,'',NULL,'1','2022-12-30 11:32:04','1','2022-12-30 11:32:04',_binary '\0',125),(120,'admin','$2a$10$D.xFtcgma/NJ3SyYlUj3bORcs0mwOD6Zu.4I7GCI/8/25/QSn4qJC','12',NULL,NULL,NULL,'','',0,'',0,'',NULL,'1','2022-12-30 11:33:42','1','2022-12-30 11:33:42',_binary '\0',126),(121,'admin','$2a$10$R2guBf7TyERjjW9lm0Pd0Osut6vt7NuH2Vx6fkOI5.VgSvJK2Xb82','12',NULL,NULL,NULL,'','',0,'',0,'',NULL,'1','2022-12-30 11:33:49','1','2022-12-30 11:33:49',_binary '\0',127),(122,'admin','$2a$10$pwxqUUza61HBgx3FTjp2d.Mc2UKalikXxP91wUdP4bFe7Hl.lfmeq','12',NULL,NULL,NULL,'','',0,'',0,'',NULL,'1','2022-12-30 11:47:52','1','2022-12-30 11:47:52',_binary '\0',129);
/*!40000 ALTER TABLE `system_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-10 19:47:36
