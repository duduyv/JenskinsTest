# 使用官方 JDK 镜像
FROM openjdk:21-jdk-slim

# 工作目录
WORKDIR /app

# 将构建好的 jar 拷贝到镜像中
COPY target/JenkinsTest-0.0.1-SNAPSHOT.jar app.jar

# 暴露应用端口（你可以根据 Spring Boot 配置改端口）
EXPOSE 8888

# 设置容器启动命令
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar", "--spring.profiles.active=prd"]
