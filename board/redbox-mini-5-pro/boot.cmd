part uuid ${devtype} ${devnum}:${bootpart} uuid

setenv bootargs console=tty0 earlyprintk root=/dev/mmcblk0p2 rootwait
setenv fdtfile sun50i-h5-redbox-mini-5-pro.dtb

load ${devtype} ${devnum}:${bootpart} ${kernel_addr_r} Image
load ${devtype} ${devnum}:${bootpart} ${fdt_addr_r} ${fdtfile}

booti ${kernel_addr_r} - ${fdt_addr_r};
