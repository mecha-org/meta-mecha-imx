LICENSE = "CLOSED"
inherit systemd

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE_${PN} = "camera_module.service"

SRC_URI:append = " file://camera_module.service \
		   file://camera_module_load.sh \ 
		   file://camera.conf "

FILES_${PN} += "${systemd_unitdir}/system/camera_module.service"

do_install:append() {

  install -d ${D}/etc/modprobe.d
  install -m 0664  ${WORKDIR}/camera.conf ${D}/etc/modprobe.d
  install -d ${D}/etc/systemd/system
  install -m 0644 ${WORKDIR}/camera_module.service ${D}/etc/systemd/system
  install -d ${D}/etc/init.d
  install -m 0777 ${WORKDIR}/camera_module_load.sh ${D}/etc/init.d
}
