FROM ghifari160/apache:17.04

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

# switch locale to UTF-8 and add ppa for php56
RUN export LC_ALL=en_US.UTF-8 && add-apt-repository -y ppa:ondrej/php

# install php56
RUN apt update && apt install -y php5.6 php5.6-mysql php-gettext php5.6-mbstring \
php-xdebug libapache2-mod-php5.6

# cleanup after apt
RUN rm -rf /var/lib/apt/lists/*

# add the custom default page
ADD index.php /var/www/html/index.php

# restart apache2 and remove the Ubuntu default page
RUN service apache2 restart && rm /var/www/html/index.html
