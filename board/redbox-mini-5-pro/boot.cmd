part uuid ${devtype} ${devnum}:${bootpart} uuid

setenv bootargs console=tty0 earlyprintk root=PARTUUID=${uuid} rootwait
setenv fdtfile sun50i-h5-redbox-mini-5-pro.dtb

load ${devtype} ${devnum}:${bootpart} ${kernel_addr_r} /boot/Image
load ${devtype} ${devnum}:${bootpart} ${fdt_addr_r} /boot/${fdtfile}

booti ${kernel_addr_r} - ${fdt_addr_r};
