FROM nginx:latest
MAINTAINER Yuelin Yang "yylbfyl@163.com"
RUN echo '<h1> Hello! 0005P1EFGW </h1>' > /usr/share/nginx/html/index.html
EXPOSE 80
