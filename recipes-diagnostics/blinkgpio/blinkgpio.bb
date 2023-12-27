DESCRIPTION = "LED blink"
SECTION = "Mywork"
LICENSE="MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


SRC_URI = "file://blinkgpio.c"

S = "${WORKDIR}"

TARGET_CC_ARCH += "${LDFLAGS}"

do_compile() {
         ${CC} blinkgpio.c -o blinkgpio
}

do_install() {
         install -d ${D}${bindir}
         install -m 0755 blinkgpio ${D}${bindir}
}
