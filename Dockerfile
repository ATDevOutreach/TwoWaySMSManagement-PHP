#Choose base image
FROM ubuntu:16.04

#Update base image
RUN apt-get update

#Install hhvm
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update && apt-get -y install hhvm && apt-get -y install nano

#Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

#Install Lumen & Dependencies using Composer
RUN composer global require "laravel/lumen-installer"

#Create working directory
RUN mkdir /twoway
WORKDIR /twoway

#Create the Lumen App
RUN lumen new twowaysms

#Copy ussd app
COPY . /twoway

#Create a logs file for hhvm
RUN cd && mkdir /var/log/hhvm
RUN touch /var/log/hhvm/hhvm.log

#Make changes to the file hhvm.log
RUN sed -i -e 's/hhvm.log.use_log_file = false/hhvm.log.use_log_file = true/g' /etc/hhvm/server.ini
RUN sed '/hhvm.log.use_log_file = true/ a hhvm.log.file = /var/log/hhvm/hhvm.log' /etc/hhvm/server.ini