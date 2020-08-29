# love-wasm

## from inside the docker container
### load emscripten path
* `source /emsdk/emsdk_env.sh` (can't use source inside Dockerfile)
### compile to webassembly
* `emcc test.c -o test.js`
### start webserver
* npx http-server

run the container with port 8080 exposed
