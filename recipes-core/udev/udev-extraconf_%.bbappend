FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SAVE_DIR := "${THISDIR}/udev-extraconf"

S = "${WORKDIR}"

do_install () {
        install -d ${D}${sysconfdir}/udev/rules.d
        install -m 0644 ${SAVE_DIR}/automount.rules ${D}${sysconfdir}/udev/rules.d/
}




