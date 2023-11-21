DESCRIPTION = "battery - Fual-gauge data"
SECTION = "Diagnostics"
LICENSE="MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"


SRC_URI = "file://battery.c \
           file://battery_5min.c "

S = "${WORKDIR}"

TARGET_CC_ARCH += "${LDFLAGS}"

do_compile() {
        ${CC} battery.c -o battery
        ${CC} battery_5min.c -o battery_5min
}

do_install() {
         install -d ${D}${bindir}
         install -m 0755 battery ${D}${bindir}
         install -m 0755 battery_5min ${D}${bindir}
}
