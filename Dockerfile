FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# EXPOSE TO AWS means Port Mapping , map Container Port 80 to Local VM Port 80
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
