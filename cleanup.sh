#!/bin/bash

# Stop and remove Docker containers, volumes, and images
echo "Cleaning up Docker resources..."
docker-compose down -v
docker-compose rm -f
docker system prune -f

# Remove generated files
echo "Removing generated files..."
rm -rf vendor/
rm -f output.xml
rm -f input.xml

echo "Cleanup complete! You can now start fresh with either:"
echo "1. Local installation: composer install"
echo "2. Docker installation: docker-compose up -d" 