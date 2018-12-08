#!/bin/sh

chown -R tastebin:tastebin /app

su tastebin -c 'npm start'

