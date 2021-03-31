## Buildroot external template

This is a small example on how to keep modifications outside buildoot's working tree.

### Why?

Well, in the process of creating firmware you will have a ton of customizations - some patches, configs, custom packages, etc... Stuffing that inside the main tree is not a good idea:
+ it's harder to use version control systems;
+ it's harder to rebuild everything from scratch when needed;
+ it's basically impossible to update buildroot to a newer version;

So this makefile provides a nice way of doing out-of-tree managemement using BR2_EXTERNAL

### How-to

`make` will download specified buildroot release, unpack it and try to build. You need to configure it, either by running `make menuconfig` or by adding your configs to `configs/` directory. I've included a sample configuration for custom board (Allwinner H5-based IPTV box). Also there is an example of a custom package in `package/`

Some targets:
+ all defconfig menuconfig savedefconfig clean - matches buildroot targets
+ br-clean - clean buildroot bundle (not including download cache)
+ full-clean - removes everything downloaded and created
