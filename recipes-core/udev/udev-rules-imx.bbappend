FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SAVE_DIR := "${THISDIR}/udev-rules-imx"

S = "${WORKDIR}"

do_install () {
        install -d ${D}${sysconfdir}/udev/rules.d
        install -m 0644 ${SAVE_DIR}/10-imx.rules ${D}${sysconfdir}/udev/rules.d/
}




