# U-Boot scripts

## Add U-Boot image header to script `my_script.scr` -> `my_script.scr.uimg` (requires mkimage on the host)
```shell
cd /path/to/{sd-card,tftp-root,usb-stick}/u-boot_scripts
./scr2uimg.sh stm32mp15/my_script.scr
```

## Load in U-Boot shell

### TFTP server
```shell
setenv autoload no
dhcp
setenv serverip 192.168.xxx.xxx
tftp ${scriptaddr} ${serverip}:u-boot_scripts/stm32mp15/my_script.scr.uimg
```

### SD card
```shell
load mmc 0:4 ${scriptaddr} u-boot_scripts/stm32mp15/my_script.scr.uimg
```

### USB stick
```shell
usb start
load usb 0 ${scriptaddr} u-boot_scripts/stm32mp15/my_script.scr.uimg
```

## Run U-Boot script in shell
```shell
source ${scriptaddr}
```
