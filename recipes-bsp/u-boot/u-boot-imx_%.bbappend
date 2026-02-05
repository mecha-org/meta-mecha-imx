FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PATCHTOOL = "git"

DEPENDS:append = " dtc-native bison-native"

SRC_URI += " file://0001-power-bq27xxx-add-support-for-fuel-gauge.patch \
	     file://0002-video-panel-add-support-for-CH13726A-DDIC-panel.patch \
	     file://0003-Resolved-full-image-flash-issue.patch \
	     file://0004-Removed-the-pins-using-the-sai-pad.patch \
	     file://0005-added-default-fdtfile-for-comet.patch \
	     file://0006-feat-add-panel-support-in-u-boot.patch \
	     file://0007-fix-panel-config-and-handle-panel-absent-case.patch \
	   "
## For 4GB DDR Mecha Board ##
## Set DDRSIZE = "4gb" in layer.conf file ##

SRC_URI:append = " ${@bb.utils.contains('DDRSIZE', '4gb', \
    'file://feat-support-for-4GB-LPDDR-variant.patch', \
    '', d)}"

## For 8GB DDR Mecha Board ##
## Set DDRSIZE = "8gb" in layer.conf file ##

SRC_URI:append = " ${@bb.utils.contains('DDRSIZE', '8gb', \
    'file://feat-support-for-8GB-LPDDR-variant.patch', \
    '', d)}"
