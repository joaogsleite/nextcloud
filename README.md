# Nextcloud

Ubuntu/Debian [Nextcloud](https://nextcloud.com/) setup using [MariaDB](https://mariadb.org/), [PHP8](https://www.php.net/releases/8.0/en.php), [Nginx](https://www.nginx.com/) and [Certbot](https://certbot.eff.org/)

> Update *password* on `create-db.sql` file


### After installation

* Enable app: External storage support: https://nextcloud.example.com/settings/apps/installed/files_external


### Backup

```
restic -r rclone:gdrive:Backups backup /mnt/volume01/nextcloud -v
```
