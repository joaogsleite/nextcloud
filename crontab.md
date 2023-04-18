# Crontab

* Turn off disks everyday at 23:00 
* Reboot everyday at 9:00

```
sudo crontab -e
```

```
* 23 * * * /usr/sbin/hdparm -Y /dev/sda
* 9 * * * /sbin/shutdown -r now
```

> You may need to install hdparm: `sudo apt install hdparm`
