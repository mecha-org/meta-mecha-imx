DESCRIPTION = "SWAY auto login configs"
SUMMARY = "greetd greetd.services 60-drm.rules udev-rules"
LICENSE="MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI =   "file://bin/sway-greetd \
             file://bin/sway-greetd-systemd \
             file://bin/sway-systemd \
             file://lib-systemd-system/greetd.service \
             file://lib-udev-rulesd/60-drm.rules \
             file://etc-greetd/config.toml \
             file://etc-greetd/sway-config \
             file://etc-pamd/greetd \
            "

S = "${WORKDIR}"

inherit systemd

SYSTEMD_SERVICE:${PN} = "greetd.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"
FILES_${PN} = " ${systemd_unitdir}/system/greetd.service"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/bin/sway-greetd ${D}${bindir}
    install -m 0755 ${WORKDIR}/bin/sway-greetd-systemd ${D}${bindir}
    install -m 0755 ${WORKDIR}/bin/sway-systemd ${D}${bindir}
    
    install -d ${D}${systemd_unitdir}/system
    install -c -m 0644 ${WORKDIR}/lib-systemd-system/greetd.service ${D}${systemd_unitdir}/system

    install -d ${D}/lib/udev/rules.d
    install -c -m 0644 ${WORKDIR}/lib-udev-rulesd/60-drm.rules ${D}/lib/udev/rules.d

    install -d ${D}/etc/greetd
    install -c -m go+r ${WORKDIR}/etc-greetd/config.toml ${D}/etc/greetd
    install -c -m go+r ${WORKDIR}/etc-greetd/sway-config ${D}/etc/greetd

    install -d ${D}/etc/pam.d
    install -c -m 0644 ${WORKDIR}/etc-pamd/greetd ${D}/etc/pam.d


}
INSANE_SKIP_${PN}:append = "already-stripped"
FILES:${PN} += "/lib/systemd/system/*"
#   FILES:${PN} += "${ROOT_HOME}/*"

#    rm -f ${IMAGE_ROOTFS}/lib/systemd/system/getty@.service
#    rm -f ${IMAGE_ROOTFS}/etc/systemd/system/getty.target.wants/getty@tty1.service