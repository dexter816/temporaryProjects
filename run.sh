#!/bin/sh

python3 hello.py
sleep 5;
nodejs hello2.js

#optional
exec "$@"

