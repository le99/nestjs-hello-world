# https://nodejs.org/fr/docs/guides/nodejs-docker-webapp/

FROM node:10 as build

WORKDIR /usr/src/app
COPY ./package*.json ./
RUN npm install --loglevel verbose

COPY . .
RUN npm run build


FROM node:10
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/package*.json ./
COPY --from=build /usr/src/app/node_modules/ ./node_modules/
COPY --from=build /usr/src/app/dist/ ./dist/

EXPOSE 3000

CMD [ "node", "./dist/main.js" ]
