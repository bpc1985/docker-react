FROM node:10.15.1-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# In order to run test build in prod with nginx (default port 80)
# docker build .
# docker run -p 8080:80 CONTAINER_ID_AFTER_BUILD
