# Set environment variables
echo "Start exporting environment variables..."
export $(grep -v '^#' .env | xargs)

# Download Magento community edition
echo "\n\nStart downloading Magento CE project..."
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition project

# Run docker compose to initialize containers
# List containers: elasticsearch, httpd, mysql, php, phpmyadmin
echo "\n\nStart running docker compose..."
docker-compose up -d

# Set project file permissions
echo "\n\nStart setting project file permissions..."
cd project
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chmod u+x bin/magento
cd ..

# Install Magento
echo "\n\nStart installing Magento..."
cp .env project/.env
cp install_magento.sh project/install_magento.sh
docker exec mgt_php bash install_magento.sh

echo "\n\nDone!"