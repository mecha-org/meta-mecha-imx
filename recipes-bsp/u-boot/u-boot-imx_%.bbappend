FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PATCHTOOL = "git"

DEPENDS:append = " dtc-native bison-native"

SRC_URI += " file://0001-Set-imx8mm-mecha-comet-m-gen1.dtb-as-default.patch \
			 file://0002-Remove-unwanted-nodes-imx8mm-evk-dtsi.patch \
			 file://0003-Added-bq27xxx-fuel-gauge-support-mickledore.patch \
			 file://0005-Add-st7701-display-controller-and-backlight-support.patch \
			 file://0006-Shutdown-from-uboot-on-battery-state.patch \
			 file://0007-Change-U-boot-logo.patch \
			 file://logo.bmp \ 
			 file://low_battery.bmp \
			 file://0008-Add-env-for-u-boot-logo.patch \
			 file://0009-Add-Support-for-dtbo-imx8mm-evk-h.patch \
			"

SRC_URI:append = "${@bb.utils.contains('DDRSIZE', '1', ' file://0004-Add-Support-for-4GB-DRAM-mickledore.patch', '', d)}"
# IMAGE_BOOT_FILES:append = " logo.bmp low_battery.bmp"

# else {run_command("mmc dev 2", 0); run_command("mmc rescan", 0);run_command("load mmc 2 ${loadaddr} logo.bmp", 0);run_command("bmp display ${loadaddr}", 0);}

# do_install:append() {
#     install -d ${D}/boot/
#     install -m 0775 ${WORKDIR}/logo.bmp ${D}/boot
#     install -m 0775 ${WORKDIR}/low_battery.bmp ${D}/boot
# }

#	file://0006-ADD-support-for-dtb-overlay.patch 
# Tow files to enable fw_printenv command in userspace
# /mecha_comet_m_gen1-poky-linux/u-boot-imx/2023.04-r0/build/imx8mm_evk_defconfig/u-boot-initial-env
# fw_env.config contains values of CONFIG_ENV_SIZE=0x4000
# 								   CONFIG_ENV_OFFSET=0x700000

# do_install:append () {
#     echo "/dev/mmcblk2 0x400000 0x2000" > ${D}/${sysconfdir}/fw_env.config
#     echo "/dev/mmcblk2 0x402000 0x2000" >> ${D}/${sysconfdir}/fw_env.config
#     echo "${MACHINE} ${HW_REV}" > ${D}/${sysconfdir}/hwrevision
# }


do_configure:append () {

	echo "########## modifying the mech configs ###############"
	config="${B}/imx8mm_evk_defconfig/.config"

	sed -i "/# CONFIG_CMD_IMPORTENV is not set/d" $config
	echo "CONFIG_CMD_IMPORTENV=y" >> $config

	sed -i "/# CONFIG_SPLASH_SOURCE is not set/d" $config
	echo "CONFIG_SPLASH_SOURCE=y" >> $config

}

#CONFIG_SPLASH_SOURCE=y