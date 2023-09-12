FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PATCHTOOL = "git"

DEPENDS:append = " dtc-native bison-native"

#SRCREV = "ffc3fbe7e5418d16f492c78693c3c4fa41f06f27"

SRC_URI += " file://0001-Set-mecha-mc-ci8mm.dtb-as-default.patch \
	     file://0002-Remove-unwanted-nodes.patch \
	     file://0003-Added-bq27xxx-fuel-gauge-support.patch \
	     file://0004-Added-st7701-display-controller-and-backlight-suppor.patch \
	     file://0006-Change-u-boot-logo.patch \
	   "

#SRC_URI:append = "${@bb.utils.contains('DDRSIZE', '1', ' file://0001-Add-Support-for-4GB-DRAM.patch', '', d)}"

#file://0005-Added-RAUC-support.patch 