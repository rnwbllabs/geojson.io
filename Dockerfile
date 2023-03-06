FROM node:14-alpine

RUN apk add --no-cache curl \
    && curl -o- -L https://yarnpkg.com/install.sh | sh

ENV PATH="/root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH"

WORKDIR /app

COPY package*.json ./

RUN yarn install --production

COPY . .

EXPOSE 8080

RUN yarn run build

CMD [ "yarn", "start"]
