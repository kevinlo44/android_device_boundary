ifeq ($(BOARD_SOC_CLASS),IMX6)
BOOTSCRIPT_TARGET := $(PRODUCT_OUT)/boot/boot.scr
$(BOOTSCRIPT_TARGET): device/boundary/$(TARGET_PRODUCT)/bootscript.txt
	mkdir -p $(dir $@)
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "boot script" -d $< $@

UPGRADE_TARGET := $(PRODUCT_OUT)/boot/upgrade.scr
$(UPGRADE_TARGET): $(UBOOT_IMX_PATH)/uboot-imx/board/boundary/bootscripts/upgrade.txt
	mkdir -p $(dir $@)
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "upgrade script" -d $< $@
else
BOOTSCRIPT_TARGET := $(PRODUCT_OUT)/boot/boot.scr
$(BOOTSCRIPT_TARGET): device/boundary/$(TARGET_PRODUCT)/bootscript.txt
	mkdir -p $(dir $@)
	mkimage -A arm64 -O linux -T script -C none -a 0 -e 0 -n "boot script" -d $< $@
endif

.PHONY: bootscript
bootscript: $(BOOTSCRIPT_TARGET) $(UPGRADE_TARGET)

droidcore: bootscript
bootimage: bootscript
