#!/usr/bin/env bash

# Run a demo/test
cd web
php -S 127.0.0.1:8888

echo "Login: admin Password: test"
open http://127.0.0.1:8888