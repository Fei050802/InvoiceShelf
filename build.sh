#!/bin/bash
echo "=== 1. Resolving Dependencies  ==="
composer install --no-dev --optimize-autoloader

echo "=== 2. Compiling Source Code  ==="
npm install
npm run build

echo "=== 3. Ensuring Build Reproducibility  ==="
cp .env.example .env
php artisan key:generate --force

echo "=== 4. Packaging the Application [cite: 29] ==="
tar -czf invoiceshelf-build.tar.gz .
echo ""
echo "Build and packaging completed successfully!"