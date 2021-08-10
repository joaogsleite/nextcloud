CREATE USER IF NOT EXISTS 'nextcloud'@'%';
SET PASSWORD FOR 'nextcloud'@'%' = PASSWORD('password');
CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'%';
FLUSH PRIVILEGES;