# InvoiceShelf Deployment Guide

## Prerequisites
- Docker Desktop installed
- Git installed

## Services
| Service      | Port | Description              |
|--------------|------|--------------------------|
| App (Apache) | 8080 | InvoiceShelf application |
| MySQL        | 3306 | Database                 |
| phpMyAdmin   | 8081 | Database management UI   |

## Steps to Deploy

### 1. Clone the repository
git clone https://github.com/Fei050802/InvoiceShelf.git
cd InvoiceShelf

### 2. Build and start all containers
docker-compose up --build -d

### 3. Access the application
- App: http://localhost:8080
- phpMyAdmin: http://localhost:8081

### 4. Stop the environment
docker-compose down
