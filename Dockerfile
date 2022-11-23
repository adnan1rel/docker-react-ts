# Specify a base image
FROM node:alpine as base

#install dependencies 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 

#default command 
RUN npm run build

FROM nginx
COPY --from=base /app/build /usr/share/nginx/html