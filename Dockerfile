FROM drupal:10

RUN apt update
RUN apt install unzip git vim ssh rsync mariadb-client openssh-client -y

# Add Drush Launcher.
RUN curl -OL https://github.com/drush-ops/drush-launcher/releases/download/0.10.1/drush.phar \
 && chmod +x drush.phar \
 && mv drush.phar /usr/local/bin/drush

RUN mkdir -p /root/.ssh
RUN chown -R root:root /root/.ssh

WORKDIR /var/www
