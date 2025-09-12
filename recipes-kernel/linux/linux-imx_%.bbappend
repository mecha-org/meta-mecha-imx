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
		   file://0011-Added-power-button-support.patch \
		   file://0012-Added-HDMI-Support.patch \
		   file://0013-drivers-extcon-Added-support-for-vbus-switch.patch \
		   file://0014-usb-typec-add-tps25750-USB-PD-controller-driver.patch \
		   file://0015-arm64-dts-added-usb-node-and-pca9535-IO-expander.patch \
		   file://0016-arm64-dts-Add-TUSB320-Type-C-CC-logic-controller.patch \
		   file://0017-dts-arm64-Add-TPS25751-USB-PD-controller.patch \
		   file://0018-usb-typec-Add-driver-for-TPS25751-PD-for-USB-1.patch \
		   file://0019-usb-typec-Makefile-added-tps25751-driver.patch \
		   file://0020-arm64-dts-added-support-for-USB-1-PD.patch \
		   file://0021-gpio-keys-Add-keypad-slide-switch-event-support.patch \
		   file://config.cfg \
		   file://display-conf.cfg \
		   file://nxp-imx95.cfg \
		   file://tps25751.bin \
		   file://tps25751-v1.bin \
		"

do_configure:prepend() {
	install -d ${S}/drivers/usb/typec/
	install -m 0644 ${WORKDIR}/tps25751.bin ${S}/drivers/usb/typec/
	install -m 0644 ${WORKDIR}/tps25751-v1.bin ${S}/drivers/usb/typec/
}

DELTA_KERNEL_DEFCONFIG:prepend = " config.cfg \
				display-conf.cfg \
				"
