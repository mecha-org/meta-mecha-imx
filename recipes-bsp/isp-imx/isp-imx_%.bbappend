DESCRIPTION = "Add IMX219 Camera Module enablement in isp-imx"

inherit fsl-eula-unpack

SRC_IMX219 = "git://github.com/nxp-imx-support/imx-camera-sw-pack-source.git;protocol=https"
SRC_BRANCH = "LF6.6.52_P24.4"

SRC_URI += " \
	${SRC_IMX219};branch=${SRC_BRANCH};destsuffix=src_imx219;fsl-eula=true;name=imx219;subpath=imx8mp-camera-sw-pack-imx219\
"
SRCREV_FORMAT = "imx219"
SRCREV_imx219 = "8b8c433bf388de41763aa04834dce7f131f31ed9"

FILES_SOLIBS_VERSIONED += " \
    ${libdir}/libimx219.so \
"

S_IMX219 = "${WORKDIR}/src_imx219/isp-imx"
PATCHTOOL = "git"
do_compile:append () {
	
        cp -r ${S_IMX219}/*  ${S}/
	cd ${S}/
	git apply imx219_isp-imx.patch 
	
        cd ${B}/
        cmake_do_compile
}

