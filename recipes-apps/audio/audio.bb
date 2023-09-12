SUMMARY = "audio recipe"
DESCRIPTION = "Custom recipe to build audio related application"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
DEPENDS = "alsa-lib"

FILES:${PN} += " /* "
FILES:${PN} += " /home/root/* "

INCLUDE_DIR = "-I${STAGING_INCDIR_IMX}"
FILESEXTRAPATHS:prepend := "${THISDIR}/files/src:"

# Where to find source files (can be local, GitHub, etc.)
# SAVE_DIR := "${THISDIR}/files/src"
SRC_URI = "file://src/sound_playback.c \
	   file://src/audiosample.wav \
	   file://src/.asoundrc"

DES_DIR = "${D}/mechbin/audio"
# Where to keep downloaded source files (in tmp/work/...)
S = "${WORKDIR}/src"

# Pass arguments to linker
TARGET_CC_ARCH += "${LDFLAGS}"

# Cross-compile source code
do_compile() {
    ${CC} -o sound_playback sound_playback.c -lasound
}

# Create /usr/bin in rootfs and copy program to it
do_install() {
    install -d ${D}/MECHA_TEST/audio
    install -m 0755 sound_playback ${D}/MECHA_TEST/audio

    cp audiosample.wav ${D}/MECHA_TEST/audio

    install -d ${D}/home/root
    cp .asoundrc ${D}/home/root
}
