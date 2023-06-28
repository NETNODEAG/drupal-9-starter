<?php

// Check PHP requirements for this project
if (substr(phpversion(), 0,3) == '8.2') {
  echo 'OK: PHP 8.2 found';
} else {
  echo "ERROR: This project needs PHP 8.1\nFix it with:\n\n";
  echo "brew unlink php@7.4
brew link php@8.2
brew unlink php@8.0";
  exit();
}
echo "\n";
