FROM nginx:latest
MAINTAINER Yuelin Yang "yylbfyl@163.com"
RUN echo 'new image!' > /usr/share/nginx/html/index.html
EXPOSE 80
