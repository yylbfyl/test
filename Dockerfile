FROM nginx:latest
MAINTAINER Yuelin Yang "yylbfyl@163.com"
RUN echo 'old image!' > /usr/share/nginx/html/index.html
EXPOSE 80
