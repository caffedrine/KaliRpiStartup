# Kali on RPI Startup script

Script placed on a NTFS executed when RPI is booting. Usefull when interaction with windown is needed since this is placed on a NTFS partition. Scripts can be easily edited from any OS.

First is executed bash script then python script. All the output is saved in the *startup.log* file.

## Startup execution

1. Add script to /etc/init.d/<script_name>.sh

2. Make script executable
```
$ chmod +x /etc/init.d/<script_name>.sh
```

3. Register script
```
$ sudo update-rc.d <script_name>.sh defaults
```

**Script**:
```
# Execute script and append output to file
printf "\n\n" >> /media/NTFS/startup/sartup.log
./media/NTFS/startup/startup.sh >> /media/NTFS/startup/startup.log
```


## Mounting NTFS partition

NTFS partition shall be created with GParted and mounted like this:

```
$ sudo mount /dev/mmcblk0p3 -t ntfs-3g -o permissions /media/NTFS
```

To automaticall mount partition at startup, use the following:

Add the following to */etc/fstab*:
```
$ /dev/mmcblk0p3  /media/NTFS     NTFS    defaults          0       0
```
