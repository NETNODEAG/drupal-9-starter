FROM drupal:10

RUN apt-get update -y

RUN apt-get install cron unzip git vim ssh rsync mariadb-client openssh-client libmagickwand-dev libxml2-dev -y

RUN pecl install imagick
RUN docker-php-ext-enable imagick
RUN docker-php-ext-install soap

# Add Drush Launcher.
RUN curl -OL https://github.com/drush-ops/drush-launcher/releases/download/0.10.1/drush.phar \
 && chmod +x drush.phar \
 && mv drush.phar /usr/local/bin/drush

RUN mkdir -p /root/.ssh
RUN chown -R root:root /root/.ssh

WORKDIR /var/www
