DESCRIPTION = "Enable fw_printenv command in userspace"
LICENSE="MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI =   "file://fw_env.config \
             file://u-boot-initial-env \
            "

S = "${WORKDIR}"

FILES_${PN} = " ${systemd_unitdir}/system/greetd.service"

do_install() {
    install -d ${D}/etc
    install -c -m 0644 ${WORKDIR}/fw_env.config ${D}/etc/
    install -c -m 0644 ${WORKDIR}/u-boot-initial-env ${D}/etc/
}

FILES:${PN} += "/etc/*"

# Tow files to enable fw_printenv command in userspace
# /mecha_comet_m_gen1-poky-linux/u-boot-imx/2023.04-r0/build/imx8mm_evk_defconfig/u-boot-initial-env
# fw_env.config contains values of CONFIG_ENV_SIZE=0x4000
# 								   CONFIG_ENV_OFFSET=0x700000