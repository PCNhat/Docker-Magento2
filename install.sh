# Set environment variables
echo "Start exporting environment variables..."
export $(grep -v '^#' .env | xargs)



# Run docker compose to initialize containers
# List containers: elasticsearch, httpd, mysql, php, phpmyadmin
echo "\n\nStart running docker compose..."
docker-compose up -d

# Install Magento
echo "\n\nStart installing Magento..."
cp .env project/.env
cp install_magento.sh project/install_magento.sh
docker exec mgt_php bash install_magento.sh

echo "\n\nDone!"