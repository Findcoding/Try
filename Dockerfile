# Use a base image with CentOS
 FROM centos:7


# Set proxy environment variables
ENV http_proxy=http://jpe3proxy.jaws.jio.com:8080
ENV https_proxy=http://jpe3proxy.jaws.jio.com:8080
ENV no_proxy=localhost,127.0.0.1


# Install required dependencies
RUN yum clean all
#RUN yum -y update
#RUN yum -y install epel-release
#RUN yum -y install nodejs npm

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Copy code from source directory to working directory
COPY . /app

# Install necessary dependencies
RUN tar -xJf node-v14.18.2-linux-x64.tar.xz
RUN mv node-v14.18.2-linux-x64 /usr/local/
RUN ln -s /usr/local/node-v14.18.2-linux-x64/bin/node /usr/local/bin/node
RUN ln -s /usr/local/node-v14.18.2-linux-x64/bin/npm /usr/local/bin/npm
RUN npm install -g npm@9.8.0
RUN rm -rf node-v14.18.2-linux-x64.tar.xz
#RUN rm -rf node_modules
RUN npm config set legacy-peer-deps true
RUN npm install  &&  npm run build


EXPOSE 8000

# CMD ["node", "-v"]
# npm install  &&  npm run build

