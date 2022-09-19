#!/bin/bash
app="docker.test"
docker build -t dangnk/swarmtest:python .
docker run -p 8085:80 -it --rm dangnk/swarmtest:python