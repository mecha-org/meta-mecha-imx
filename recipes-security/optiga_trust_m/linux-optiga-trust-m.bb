SUMMARY = " linux-optiga-trust-m recipe"
DESCRIPTION = "Custom recipe to build SDK of linux-optiga-trust-m"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}:"

SRC_URI = "file://linux-optiga-trust-m \
	"
PACKAGES = "${PN}"

DEPENDS = " openssl"

S = "${WORKDIR}/linux-optiga-trust-m"

do_configure[noexec] = "1"

FILES:${PN} += "${libdir} \
                 /* "

SOLIBS = ".so.*"

FILES_SOLIBSDEV = ""

FILES:${PN} += "/MECHA_TEST/optiga_trust_m "
#FILES:${PN}-dbg += "/MECHA_TEST/optiga_trust_m/.debug/* "
FILES:${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"

#INSANE_SKIP:${PN} = "debug-files file-rdeps installed-vs-shipped dev-elf dev-so already-stripped staticdev "
#INSANE_SKIP:${PN} = "already-stripped file-rdeps debug-files staticdev "
INSANE_SKIP:${PN} = "debug-files file-rdeps already-stripped "
 
do_compile() {
        oe_runmake -C ${S}
}

do_install () {
        install -d ${D}${libdir}
        install -m 0755 ${S}/bin/libtrustm.so ${D}${libdir}/
        install -m 0755 ${S}/bin/trustm_engine.so ${D}${libdir}/
        install -m 0755 ${S}/trustm_lib/lib_arm64/*.so.* ${D}${libdir}/
 	echo "### MECHA: install -m 0755 ${S}/bin/libtrustm.so ${D}${libdir} " 	
	install -d ${D}/MECHA_TEST/optiga_trust_m
	install -m 0755 ${S}/bin/* ${D}/MECHA_TEST/optiga_trust_m
}

