#stage 1
FROM node:19 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
#stage 2
FROM nginx:1.23
COPY --from=node /app/dist/test-docker /usr/share/nginx/html