FROM centos:7 AS envirenment
# 作者
MAINTAINER root0day<KangoShy@gmail.com>

# 定义环境变量
ENV SPRING_PROFILES_ACTIVE dev

ENV TZ Asia/Shanghai
EXPOSE 8080

