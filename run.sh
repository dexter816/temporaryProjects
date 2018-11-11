#!/bin/sh

python3 hello.py
sleep 1500;
nodejs hello2.js

#optional
exec "$@"

