FROM node:16-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

#Multi-stage build
FROM node:16-alpine

WORKDIR /app

RUN apk update && apk add npm

COPY --from=build /usr/src/app /app

EXPOSE 3000

CMD ["npm", "start"]
