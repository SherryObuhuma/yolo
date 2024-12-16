FROM node:16-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

#Add multi-stage build
FROM node:16-alpine

WORKDIR /app

RUN apk update && apk add --update nodejs

COPY --from=build /usr/src/app /app

EXPOSE 5000

CMD ["node", "server.js"]