FROM centos:7 AS envirenment
# 作者
MAINTAINER root0day<KangoShy@gmail.com>

ENV TZ Asia/Shanghai

# 修改时区文件
#COPY --from=envirenment /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#ENV TZ Asia/Shanghai

# 定义环境变量
ENV SPRING_PROFILES_ACTIVE dev
ENV TOMCAT_HOME /usr/local/tomcat

# 隐藏错误堆栈和服务器版本号
#RUN sed -i 's/<\/Host>/  <Valve className="org.apache.catalina.valves.ErrorReportValve" showReport="false" showServerInfo="false" \/>\n      <\/Host>/' $TOMCAT_HOME/conf/server.xml

RUN rm -rf $TOMCAT_HOME/webapps/*

# 拷贝执行文件
COPY ./docker/startup.sh $TOMCAT_HOME/startup.sh
COPY ./target/vpn-0.0.1-SNAPSHOT.war $TOMCAT_HOME/webapps/
RUN cd /$TOMCAT_HOME && chmod +x ./startup.sh
EXPOSE 8080
WORKDIR $TOMCAT_HOME

CMD ["./startup.sh"]

