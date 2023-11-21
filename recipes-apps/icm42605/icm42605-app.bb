DESCRIPTION = "icm42605-app for IMU interrupt test"
SECTION = "Test"
LICENSE="MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


SRC_URI = "file://icm42605-app.c"

S = "${WORKDIR}"

TARGET_CC_ARCH += "${LDFLAGS}"

do_compile() {
         ${CC} icm42605-app.c -o icm42605-app
}

do_install() {
         install -d ${D}${bindir}
         install -m 0755 icm42605-app ${D}${bindir}
}
