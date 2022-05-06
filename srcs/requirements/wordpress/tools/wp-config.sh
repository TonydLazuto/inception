#create wp-config.php
wp-cli config create --dbname=YOUR_DB_NAME --dbuser=YOUR_DB_USERNAME --dbpass=YOUR_DB_PASSWORD --locale=en_DB --allow-root \ 
wp-cli core install --url=YOUR_DOMAIN_NAME --title=YOUR_BLOG_TITLE --admin_user=ADMIN_USERNAME --admin_password=ADMIN_PASSWORD --admin_email=ADMIN_EMAIL --allow-root
#wp-cli config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWD --locale=en_DB \
#wp-cli core install --url=$DOMAIN_NAME --title=$BLOG_TITLE --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWD --admin_email=$ADMIN_EMAIL