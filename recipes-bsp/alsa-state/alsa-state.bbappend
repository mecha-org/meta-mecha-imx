FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PATCHTOOL = "git"

SRC_URI:append = "file://asound_max98091.state" 

do_postcompile(){
        install -m 0644 ${WORKDIR}/asound_max98091.state ${D}${localstatedir}/lib/alsa/asound.state
}

addtask postcompile after do_install before do_package
