# OAuth2.0

[https://tools.ietf.org/html/rfc6749](https://tools.ietf.org/html/rfc6749)

# Spring Security OAuth

[https://spring.io/projects/spring-security-oauth](https://spring.io/projects/spring-security-oauth)

[https://github.com/spring-projects/spring-security-oauth](https://github.com/spring-projects/spring-security-oauth)

[https://docs.spring.io/spring-security-oauth2-boot/docs/current/reference/html5/](https://docs.spring.io/spring-security-oauth2-boot/docs/current/reference/html5/)

[https://projects.spring.io/spring-security-oauth/docs/oauth2.html](https://projects.spring.io/spring-security-oauth/docs/oauth2.html)

# Code

## AS and RS

1. 执行数据库初始化脚本[code/oauth-as-rs/oauth-as-rs.sql](code/oauth-as-rs/oauth-as-rs.sql)

2. 根据实际情况修改配置文件[code/oauth-as-rs/src/main/resources/application.yaml](code/oauth-as-rs/src/main/resources/application.yaml)

3. 使用maven打包应用后启动应用或者使用IDE启动应用

## Client

1. 根据实际情况修改配置文件[code/oauth-client/src/main/resources/application.yaml](code/oauth-client/src/main/resources/application.yaml)

2. 使用maven打包应用后启动应用或者使用IDE启动应用

## 补充说明

### 密码加密

demo中涉及的密码均使用bcrypt加密，明文为`pass`

### 自动授权

demo中配置了自动授权，因此会跳过授权页面，如需展示授权页面，可修改数据库中的表`oauth_client_details`的`autoapprove`字段

### Client的redirect uri

Client的redirect uri存储在数据库中的表`oauth_client_details`的`web_server_redirect_uri`字段，需要根据实际情况来调整

### Client的token超时时间

Client的token超时时间存储在数据库中的表`oauth_client_details`的`access_token_validity`字段，单位为秒

## 注意事项

### Cookie问题

[https://tools.ietf.org/html/rfc6265](https://tools.ietf.org/html/rfc6265)

需要使用不同的IP来访问Client与AS和RS，否则会反复刷新session，导致获取token的流程失败
