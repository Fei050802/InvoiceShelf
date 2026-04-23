#!/bin/bash
# build.sh - InvoiceShelf Automated Build Script

# Exit on any error
set -e

echo "=== 1. Resolving Dependencies ==="
composer install --no-dev --optimize-autoloader
npm install

echo "=== 2. Compiling Source Code ==="
npm run build

echo "=== 3. Ensuring Build Reproducibility ==="
cp .env.example .env 2>/dev/null || true
php artisan key:generate --force

echo "=== 4. Caching Configuration ==="
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "=== 5. Packaging the Application ==="
tar -czf invoiceshelf-build.tar.gz --exclude='node_modules' --exclude='.git' .

echo ""
echo "=== Build Completed Successfully! ==="
echo "Artifact: invoiceshelf-build.tar.gz"