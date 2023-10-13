do_install:append(){

        rm ${D}${systemd_system_unitdir}/systemd-backlight@.service
}
