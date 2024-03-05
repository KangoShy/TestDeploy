#!/bin/sh
# ps: 该文件编码格式必须为unix格式
echo 配置应用...
if [ -d /app ]; then
    rm -rf $TOMCAT_HOME/webapps/ROOT/* && cp -rf /app $TOMCAT_HOME/webapps/ROOT
fi

if [ -f /config/application.yaml ]; then
  cp -f /config/application.yaml $TOMCAT_HOME/webapps/ROOT/WEB-INF/classes/config/application-prod.yml
fi

echo 启动应用...
$TOMCAT_HOME/bin/catalina.sh run
