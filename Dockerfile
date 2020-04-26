# PickANum docker file

# For the following commands, we expect that your user is part of the "docker" usergroup
# (then you can run the docker command without "sudo")

# use the following command to build
# docker build -t rajeshinf/pickanum .

# start the container with interactive shell
# docker run -i -t rajeshinf/pickanum /bin/bash

# start the container locally in detached mode
# docker run -p 3000:3000 -d rajeshinf/pickanum

FROM node:lts-jessie

# Create app directory
RUN mkdir -p /usr/src/pickanum/public
RUN mkdir -p /usr/src/pickanum/lib
WORKDIR /usr/src/pickanum

# Bundle app source
COPY deploy/public /usr/src/pickanum/public
COPY deploy/lib /usr/src/pickanum/lib
COPY deploy/resources /usr/src/pickanum/resources
COPY deploy/package.json /usr/src/pickanum/

# install app dependencies
RUN npm install --production

# expose port 3000
EXPOSE 3000

CMD npm start
