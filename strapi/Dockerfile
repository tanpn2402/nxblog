FROM node:14.19

ENV NODE_ENV=development

WORKDIR /app

COPY ["./package.json", "/app"]

RUN npm install

CMD [ "npm", "run", "develop" ]
# CMD [ "/bin/ls", "-l" ]