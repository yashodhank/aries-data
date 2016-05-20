# Start with official node image.
FROM node:6.1.0
MAINTAINER astronomer <greg@astronomer.io>

# Install task-runner globally.
RUN ["npm", "install", "-g", "aries-data/aries-data#airflow"]

# Execute task-runner with arguments provided from CMD.
ENTRYPOINT ["aries-data"]

# Add standard files on downstream builds.
ONBUILD ADD lib /usr/local/src/lib
ONBUILD ADD package.json /usr/local/src/
ONBUILD ADD .babelrc /usr/local/src/

# Switch to src dir and install node modules.
ONBUILD WORKDIR /usr/local/src
ONBUILD RUN ["npm", "install"]
