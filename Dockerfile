FROM node:alpine as builder-phage
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder-phage /app/build /usr/share/nginx/html
