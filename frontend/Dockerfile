FROM node:16 AS builder

WORKDIR /app

COPY app/ .

RUN npm install

RUN npm i -g @angular/cli

RUN ng build

FROM nginx:alpine

COPY --from=builder /app/dist/letscodebyada-app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]