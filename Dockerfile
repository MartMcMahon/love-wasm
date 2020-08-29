FROM ubuntu:latest
RUN apt update
RUN apt upgrade -y
RUN apt install -y build-essential curl git-core git libreadline-dev vim

# install lua
RUN mkdir lua_build
WORKDIR lua_build
RUN curl -R -O http://www.lua.org/ftp/lua-5.4.0.tar.gz
RUN tar -zxf lua-5.4.0.tar.gz
WORKDIR lua-5.4.0
RUN make linux test
RUN make install

# emscripten
WORKDIR /
RUN apt install -y python3 cmake default-jre
RUN git clone https://github.com/emscripten-core/emsdk.git
WORKDIR emsdk
RUN git pull && ./emsdk install latest && ./emsdk activate latest
# RUN source ./emsdk_env.sh

RUN apt install -y npm
RUN npm install -g npx
WORKDIR /
COPY ./test.c ./test.c
COPY ./index.html ./index.html

# RUN git clone https://github.com/vvanders/wasm_lua.git
CMD bash
