DESCRIPTION = "Add IMX219 Camera Module enablement in isp-vvcam"

SRC_IMX219 = "git://github.com/nxp-imx-support/imx-camera-sw-pack-source.git;protocol=https"
SRC_BRANCH = "LF6.6.52_P24.4"

SRC_URI += " \
        ${SRC_IMX219};branch=${SRC_BRANCH};destsuffix=src_imx219;fsl-eula=true;name=imx219;subpath=imx8mp-camera-sw-pack-imx219\
"
SRCREV_FORMAT = "imx219"
SRCREV_imx219 = "8b8c433bf388de41763aa04834dce7f131f31ed9"

S_IMX219 = "${WORKDIR}/src_imx219/isp-vvcam"
PATCHTOOL = "git"

do_compile:append () {
        
        cp -r ${S_IMX219}/v4l2/* ${S}/
        cp ${S_IMX219}/imx219_kernel-module-isp-vvcam.patch ${S}/

        cd ${S}/
        git apply imx219_kernel-module-isp-vvcam.patch
        module_do_compile
}

