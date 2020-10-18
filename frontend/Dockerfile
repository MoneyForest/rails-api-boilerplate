# frontend
FROM node:12.19.0-alpine

RUN mkdir -p /usr/src/frontend/
WORKDIR /usr/src/frontend/

COPY . /usr/src/frontend/

RUN yarn install
RUN yarn build

EXPOSE 8081
CMD [ "yarn", "start" ]
