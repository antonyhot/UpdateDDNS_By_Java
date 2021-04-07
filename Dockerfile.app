FROM 593746919636.dkr.ecr.cn-northwest-1.amazonaws.com.cn/platform/tomcat:8.5-jre8

ENV COMPANY_ENVIRONMENT local

COPY DDNS/build/distributions/ddns-*.zip /tmp/ddns.zip

RUN unzip /tmp/ddns.zip -d /tmp/ \
  && cp /tmp/ddns-*/ddns-*.jar $CATALINA_HOME/webapps/ROOT/WEB-INF/lib/ \
  && cp /tmp/ddns-*/lib/* $CATALINA_HOME/webapps/ROOT/WEB-INF/lib/ \
  && rm -rf /tmp/ddns*

RUN echo "spring.jndi.ignore=true" > $CATALINA_HOME/webapps/ROOT/WEB-INF/classes/spring.properties

CMD ["catalina.sh", "run"]
