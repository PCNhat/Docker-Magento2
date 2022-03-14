# Set environment variables for php container
export $(grep -v '^#' .env | xargs)

rm .env
rm install_magento.sh

composer config --global http-basic.repo.magento.com ${MAGENTO_PUBLIC_KEY} ${MAGENTO_PRIVATE_KEY}

# Download Magento community edition
echo "\n\nStart downloading Magento CE project..."
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition ./



# Set project file permissions
echo "\n\nStart setting project file permissions..."
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chmod u+x bin/magento



# Perform install Magento
bin/magento setup:install \
--base-url=http://localhost \
--db-host=${CONTAINER_PREFIX}mysql \
--db-name=${MYSQL_DB_NAME} \
--db-user=${MYSQL_USER} \
--db-password=${MYSQL_PASSWORD} \
--admin-firstname=${MAGENTO_ADMIN_FIRSTNAME} \
--admin-lastname=${MAGENTO_ADMIN_LASTNAME} \
--admin-email=${MAGENTO_ADMIN_EMAIL} \
--admin-user=${MAGENTO_ADMIN_USER} \
--admin-password=${MAGENTO_ADMIN_PASSWORD} \
--language=${MAGENTO_LANGUAGE} \
--currency=${MAGENTO_CURRENCY} \
--timezone=${MAGENTO_TIMEZONE} \
--use-rewrites=1 \
--search-engine=elasticsearch7 \
--elasticsearch-host=${CONTAINER_PREFIX}elasticsearch \
--elasticsearch-port=9200