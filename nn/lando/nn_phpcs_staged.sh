#!/bin/bash
echo "Running Code Sniffer. Code standard Drupal."
# php files that are staged in git but not deleted

ROOT=.
PHP_FILES=$(git diff --diff-filter=d --cached --name-only $ROOT/web/modules)

errors_found=0

for file in $PHP_FILES
do
    echo $file

    ./vendor/bin/phpcs --encoding=utf-8 -n -p $ROOT/$file
    if [ $? -ne 0 ]; then
        echo "Fix the error before commit please"
        echo "Run lando phpcbf $ROOT/$file for an automatic fix on this file"
        echo "or fix it manually."
        errors_found=1
    fi
done

# Exit with the appropriate status depending on whether any errors were found
if [ $errors_found -eq 1 ]; then
    echo -e "\nRun lando phpcbf for an automatic fix on all files"
    echo -e "In an emergency you can commit with --no-verify but don't make a habit of it!"
    exit 1
else
    exit 0
fi
