FROM nginx:1.13.3-alpine
WORKDIR /usr/local/app

## Copy our nginx config
COPY nginx/ /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

RUN cd /usr/local/app/dist/

RUN ls -la

## copy over the artifacts in dist folder to default nginx public folder
COPY /usr/local/app/dist/ /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
