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
             file://etc-profiled/sway.sh \
             file://etc/fw_env.config \
             file://etc/u-boot-initial-env \
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
    install -c -m 0644 ${WORKDIR}/etc-greetd/config.toml ${D}/etc/greetd
    install -c -m 0644 ${WORKDIR}/etc-greetd/sway-config ${D}/etc/greetd

    install -d ${D}/etc/pam.d
    install -c -m 0644 ${WORKDIR}/etc-pamd/greetd ${D}/etc/pam.d

    install -d ${D}/etc/profile.d
    install -c -m 0644 ${WORKDIR}/etc-profiled/sway.sh ${D}/etc/profile.d

    install -d ${D}/etc 
    install -c -m 0644 ${WORKDIR}/etc/fw_env.config ${D}/etc/
    install -c -m 0644 ${WORKDIR}/etc/u-boot-initial-env ${D}/etc/
}

INSANE_SKIP_${PN}:append = "already-stripped"
FILES:${PN} += "/lib/systemd/system/*"

# Tow files to enable fw_printenv command in userspace
# /mecha_comet_m_gen1-poky-linux/u-boot-imx/2023.04-r0/build/imx8mm_evk_defconfig/u-boot-initial-env
# fw_env.config contains values of CONFIG_ENV_SIZE=0x4000
# 								   CONFIG_ENV_OFFSET=0x700000