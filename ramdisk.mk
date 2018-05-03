ifeq ($(BOARD_SOC_CLASS),IMX6)
RAMDISK_TARGET := $(PRODUCT_OUT)/boot/uramdisk.img
$(RAMDISK_TARGET): $(PRODUCT_OUT)/ramdisk.img kernelmodules
	mkdir -p $(dir $@)
	mkimage -A arm -O linux -T ramdisk -n "RAM Disk" -d $< $@
else
RAMDISK_TARGET := $(PRODUCT_OUT)/boot/uramdisk.img
$(RAMDISK_TARGET): $(PRODUCT_OUT)/ramdisk.img kernelmodules
	mkdir -p $(dir $@)
	mkimage -A arm64 -O linux -T ramdisk -n "RAM Disk" -d $< $@
endif

bootimage: $(RAMDISK_TARGET)
