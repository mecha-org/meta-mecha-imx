DESCRIPTION = "Scripts to detect SDcard"
DEPEND = ""
LICENSE = "CLOSED"

FILES:${PN} += "${libdir}/*"
RDEPENDS:${PN} += "bash"
FILES:${PN} += " \
            /home/root/* \
         "

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

INSANE_SKIP:${PN} = "file-rdeps dev-so"


SAVE_DIR := "${THISDIR}/files"

do_install() {
        install -d ${D}/etc/init.d
	
	install -d ${D}/home/root/apps
	
	install -d ${D}/home/root/mechaApp
	
	install -d ${D}/usr/libexec/

	install  ${SAVE_DIR}/sdDetect.sh ${D}/usr/libexec/

	install  ${SAVE_DIR}/sdRem.sh ${D}/usr/libexec/

}

