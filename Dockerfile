FROM node:18.8-alpine as base

FROM base as builder

WORKDIR /home/node/app

COPY ./package*.json ./

COPY . .

RUN yarn install

RUN yarn build

FROM base as runtime

ENV NODE_ENV=production

WORKDIR /home/node/app

COPY package*.json ./

RUN yarn install --production

COPY --from=builder /home/node/app/dist ./dist

COPY --from=builder /home/node/app/build ./build

EXPOSE 8080

CMD ["node", "dist/server.js"]
