# 🚀 Laravel Docker CRUD Application

A simple and fully containerized Task Manager CRUD application built with **Laravel**, running seamlessly inside **Docker**. This project eliminates the need for local XAMPP/WAMP installations by providing a consistent, isolated, and reproducible development environment.

## ✨ Features
- ✅ **Task Management**: Create, View, and Delete tasks.
- 🐳 **Fully Dockerized**: PHP 8.2, Apache, MySQL 8.0, and phpMyAdmin.
- 🔄 **Hot Reload**: Code changes reflect immediately via Docker Volumes.
- 🛡️ **Isolated Environment**: No version conflicts or system-wide installations required.

## 🛠️ Tech Stack
- **Backend**: Laravel 11 (PHP 8.2)
- **Web Server**: Apache 2.4
- **Database**: MySQL 8.0
- **Database GUI**: phpMyAdmin
- **Containerization**: Docker & Docker Compose

## 📋 Prerequisites
Before you begin, ensure you have the following installed on your system:
1. [Docker Desktop](https://www.docker.com/products/docker-desktop) (with WSL 2 backend enabled on Windows).
2. Git (for cloning the repository).

## ⚙️ Installation & Setup

Follow these steps to get the project up and running on your local machine:

### 1. Clone the Repository
```bash
git clone https://github.com/AbdulBasitx19/laravel-docker-crud.git
cd laravel-docker-crud
```

### 2. Environment Configuration:
```bash
cp .env.example .env
```
### 3. Build and Start Containers
```bash
docker compose build --no-cache
docker compose up -d
```
### 4. Install Dependencies & Setup Laravel
```bash
docker compose run --rm app composer install
docker compose exec app php artisan key:generate
```

### 5. Run Database Migrations
```bash
docker compose exec app php artisan migrate
```

### 6. 💡 Useful Docker Commands

# Start all containers in the background
docker compose up -d

# Stop all containers
docker compose down

# View real-time logs for the Laravel app
docker compose logs -f app

# Run artisan commands inside the container
docker compose exec app php artisan <command>

# Open a bash shell inside the Laravel container
docker compose exec app bash

# Rebuild the Docker image (if Dockerfile is changed)
docker compose build --no-cache