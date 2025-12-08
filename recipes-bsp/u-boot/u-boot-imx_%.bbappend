FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PATCHTOOL = "git"

DEPENDS:append = " dtc-native bison-native"

SRC_URI += " file://0001-power-bq27xxx-add-support-for-fuel-gauge.patch \
	     file://0002-video-panel-add-support-for-CH13726A-DDIC-panel.patch \
	     file://0003-Resolved-full-image-flash-issue.patch \
	     file://0004-Removed-the-pins-using-the-sai-pad.patch \
	     file://0005-added-default-fdtfile-for-comet.patch \
	     file://0006-feat-add-panel-support-in-u-boot.patch \
	   "
