FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PATCHTOOL = "git"

DEPENDS:append = " dtc-native bison-native"

SRC_URI += " file://0001-Set-imx8mm-mecha-comet-m-gen1.dtb-as-default.patch \
			 file://0002-Remove-unwanted-nodes-imx8mm-evk-dtsi.patch \
			 file://0003-Added-bq27xxx-fuel-gauge-support-mickledore.patch \
			 file://0005-Add-st7701-display-controller-and-backlight-support.patch \
			"

SRC_URI:append = "${@bb.utils.contains('DDRSIZE', '1', ' file://0004-Add-Support-for-4GB-DRAM-mickledore.patch', '', d)}"




# do_configure:append () {
# 	echo "############ Writing MECHA configs ############### "
# 	#May produce warning
# 	config="${B}/configs/imx8mm_evk_defconfig"

# 	# echo "############  4GB-SOM Changes  ############### "

# 	sed -i "/CONFIG_USB_TCPC[=]/d" $config
# 	echo "CONFIG_USB_TCPC=n" >> $config

# }