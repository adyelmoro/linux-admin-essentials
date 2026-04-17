# 1. Using the PHP-Apache base
FROM php:8.2-apache

# 2. Copying my files into the container
COPY . /var/www/html/

# 3. FIX: Changing ownership so Apache can read the files
# '-R' means Recursive (apply to all files and folders)
RUN chown -R www-data:www-data /var/www/html

# 4. Opening Port 80
EXPOSE 80
