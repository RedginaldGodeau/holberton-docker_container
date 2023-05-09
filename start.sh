#!/bin/bash
docker build . -t holberton_container && echo 'Y' && docker run -it holberton_container