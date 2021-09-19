from node:latest as build

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN npm i
RUN npm run build

from nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf