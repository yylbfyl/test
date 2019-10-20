FROM nginx:latest
MAINTAINER Yuelin Yang "yylbfyl@163.com"
RUN echo '<h1>This is first page !</h1>' > /usr/share/nginx/html/index.html
EXPOSE 80
