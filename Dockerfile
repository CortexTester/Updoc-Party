# build stage
#FROM node:9.11.1-alpine as build-stage
FROM node:9.11.1-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
# FROM nginx:1.13.12-alpine as production-stage
FROM nginx:1.13.12-alpine
# COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY --from=0 /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]