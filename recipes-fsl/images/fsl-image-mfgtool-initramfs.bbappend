# meta-imx/meta-sdk/recipes-fsl/images also contains bbappend which contains:
#---------------------------------------------------#
# Replace linux-mfgtool with virtual/kernel
# DEPENDS:remove = "linux-mfgtool"
# DEPENDS:append = " virtual/kernel"
#---------------------------------------------------#

# IMAGE_INSTALL:remove = " cryptodev cryptodev-module cryptsetup libcrypto gpio-interrupt gpio-irq jailhouse"


# FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# SRC_URI:append = " file://partition.txt 
#                    file://uuu_script_comet_m.auto 
#                  "

# install_uuu_script_initramfs() {
# 	cp -r ${THISDIR}/files/partition.txt  ${TMPDIR}/deploy/images/mecha-comet-m-gen1/
# 	cp -r ${THISDIR}/files/uuu_script_comet_m.auto  ${TMPDIR}/deploy/images/mecha-comet-m-gen1/
# }

# ROOTFS_POSTPROCESS_COMMAND += "install_uuu_script_initramfs;"

