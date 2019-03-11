# base image
FROM circleci/node:10.14-browsers
USER root
# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm config set registry https://registry.npm.taobao.org

# install and cache app dependencies
COPY package*.json /usr/src/app/
RUN npm install
RUN npm install -g @angular/cli

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# add app
COPY . /usr/src/app

# start app
# CMD ng serve --host 0.0.0.0
# please change this
CMD ng serve --port=4201 --proxy-config=proxy.conf.json --configuration=local --host 0.0.0.0
