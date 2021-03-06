# Kali on RPI Startup script

Script placed on a NTFS executed when RPI is booting. Usefull when interaction with windown is needed since this is placed on a NTFS partition. Scripts can be easily edited from any OS.

First is executed bash script then python script. All the output is saved in the *startup.log* file.

## Startup execution

Startup executing using crontab (select an editor from the list)
```
$ crontab -e
```

and append the following line to the end of crontab file:

```
@reboot /bin/bash /media/NTFS/startup/startup.sh >> /media/NTFS/startup/startup.log 2>&1
```

## Mounting NTFS partition

NTFS partition shall be created with GParted and mounted like this:

```
$ sudo mount /dev/mmcblk0p3 -t ntfs-3g -o permissions /media/NTFS
```

To automaticall mount partition at startup, use the following:

Add the following to */etc/fstab*:
```
$ /dev/mmcblk0p3  /media/NTFS     ntfs    defaults          0       2
```

PS: Make sure /media/NTFS folder exists.
