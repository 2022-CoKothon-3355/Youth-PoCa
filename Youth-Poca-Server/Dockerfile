FROM node:16.15.1

WORKDIR /myfolder/
COPY ./package.json /myfolder/
COPY ./package-lock.json /myfolder/
RUN npm install

COPY . /myfolder/
CMD npm run dev