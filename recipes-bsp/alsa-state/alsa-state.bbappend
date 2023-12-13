FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PATCHTOOL = "git"

SRC_URI += "file://asound.state"
SAVE_DIR := "${THISDIR}/${PN}"


do_postcompile(){
        install -m 0644 ${SAVE_DIR}/asound.state ${D}${localstatedir}/lib/alsa/
}

addtask postcompile after do_install before do_package

