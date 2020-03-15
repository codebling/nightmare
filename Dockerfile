FROM nightmare:e2

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

ENTRYPOINT ["tini", "--"]

ENV DEBUG=nightmare,nightmare:*,electron:*
ENV DISPLAY=:9.0

COPY . .

CMD ["bash", "-c", "Xvfb -ac -screen scrn 1280x2000x24 :9.0 & ./node_modules/.bin/mocha --grep 'should return data about the response'"]
