SUMMARY = "Mecha default boot animation for easysplash"
LICENSE = "Apache-2.0|MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://bootanimation.zip;unpack=0"

S = "${WORKDIR}"

#inherit easysplash-animation

do_install() {
    install -d ${D}/lib/easysplash/
    install -m 0775 ${WORKDIR}/bootanimation.zip  ${D}/lib/easysplash/bootanimation.zip
}
#INSANE_SKIP_${PN}:append = "already-stripped"
FILES:${PN} += "/lib/easysplash/*"