FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_install:append() {
        install -d ${D}${sysconfdir}/init.d
        install -m 0755 ${WORKDIR}/firewalld.init ${D}${sysconfdir}/init.d/firewalld
}