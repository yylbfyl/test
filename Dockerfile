# Dockerfile for sysmodule:8020

FROM java:8
MAINTAINER weigs "tao.jiang@51tgt.com"
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /home
EXPOSE 8020
CMD ["java","-jar","/home/sysmodule/*.jar","sleep infinity"]
