#!/bin/bash
set -e

# Copy environment file if it doesn't exist
if [ ! -f /var/www/html/.env ]; then
    cp /var/www/html/.env.example /var/www/html/.env
fi

# Set environment variables in .env
sed -i "s|APP_ENV=.*|APP_ENV=${APP_ENV:-staging}|g" /var/www/html/.env
sed -i "s|APP_URL=.*|APP_URL=${APP_URL:-http://localhost:8080}|g" /var/www/html/.env
sed -i "s|DB_CONNECTION=.*|DB_CONNECTION=${DB_CONNECTION:-mysql}|g" /var/www/html/.env
sed -i "s|DB_HOST=.*|DB_HOST=${DB_HOST:-db}|g" /var/www/html/.env
sed -i "s|DB_PORT=.*|DB_PORT=${DB_PORT:-3306}|g" /var/www/html/.env
sed -i "s|DB_DATABASE=.*|DB_DATABASE=${DB_DATABASE:-invoiceshelf}|g" /var/www/html/.env
sed -i "s|DB_USERNAME=.*|DB_USERNAME=${DB_USERNAME:-invoiceshelf_user}|g" /var/www/html/.env
sed -i "s|DB_PASSWORD=.*|DB_PASSWORD=${DB_PASSWORD:-invoiceshelf_pass}|g" /var/www/html/.env

# Generate app key if not set
php artisan key:generate --force

# Wait for database to be ready
echo "Waiting for database connection..."
until php artisan migrate --force 2>/dev/null; do
    echo "Database not ready yet, retrying in 5 seconds..."
    sleep 5
done

# Cache configuration
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "InvoiceShelf is ready!"

# Start Apache
apache2-foreground
