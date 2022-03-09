# Set environment variables for php container
export $(grep -v '^#' .env | xargs)

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