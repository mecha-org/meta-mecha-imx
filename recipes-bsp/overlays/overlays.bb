DESCRIPTION = "Overlays File and u-boot logos Upload"
DEPEND = ""
LICENSE = "CLOSED"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SAVE_DIR := "${THISDIR}/files"

FILES:${PN} += " \
		/boot \
		/boot/overlays.txt \
	"

do_install(){
	install -d ${D}/boot/
	install -m 644 ${SAVE_DIR}/overlays.txt ${D}/boot/overlays.txt
}

UBOOT_ENV = "overlays"
UBOOT_ENV_SUFFIX = "txt"
