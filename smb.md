
# SMB

0. Place disk on fstab:

```
sudo vim /etc/fstab
```

```
/dev/sda1 /mnt/volume01 ext4 defaults 0 0
```

```
sudo mount -a
```

1. Install

```
sudo apt-get install samba samba-common-bin
```

2. Edit config

```
sudo vim /etc/samba/smb.conf
```

> Add this to the bottom of the file

```
[nextcloud]
path = /mnt/volume01/nextcloud
writeable=Yes
create mask=0777
directory mask=0777
public=no
```

3. Create user for folder

```
sudo adduser <user>
```

4. Set SMB password for created user

```
sudo smbpasswd -a <user>
```

5. Restart SMB server

```
sudo systemctl restart smbd
```
