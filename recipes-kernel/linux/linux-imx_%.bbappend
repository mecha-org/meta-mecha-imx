FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PATCHTOOL = "git"

SRC_URI:append = " file://0001-Added-ft3519-touchscreen-driver.patch \
		   file://0002-Added-firmware-files-required-by-the-touchpanel.patch \
		   file://0003-drivers-added-support-for-panel-DDIC-CH13726A.patch \
		   file://0004-arm64-dts-imx8mp-add-Mecha-Comet-board-support.patch \
		   file://0005-dts-added-usdhc3-reset-pinmux.patch \
		   file://0006-dts-usdhc2-Add-VSEL-GPIO-regulator.patch \
		   file://0007-dts-pmic-Update-regulator-voltages-per-schematic.patch \
		   file://0008-Added-peripheral-support-version-1.patch \
		   file://0009-Added-fsl-sai-configuration-support.patch \
		   file://0010-Camera-Audiocodec-wifi-BT-and-SD-card-changes.patch \
		   file://config.cfg \
		   file://display-conf.cfg \
		   file://nxp-imx95.cfg \
		"

DELTA_KERNEL_DEFCONFIG:prepend = " config.cfg \
				display-conf.cfg \
				"
