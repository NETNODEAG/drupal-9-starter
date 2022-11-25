#!/usr/bin/env bash

# Run a demo/test
cd web

echo "Login: admin Password: test"
open http://127.0.0.1:8888

php -S 127.0.0.1:8888