FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --force

COPY . .

EXPOSE 8080

RUN npm run build

CMD [ "npm", "start"]
