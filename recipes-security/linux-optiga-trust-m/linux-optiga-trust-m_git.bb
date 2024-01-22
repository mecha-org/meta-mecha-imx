SUMMARY = "Linux tools and examples for OPTIGA™ Trust M1/M3 security solution"
SECTION = "support"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=fc1a86d5b2e9230b6e718647d5ea1252"

SRC_URI = "\
	gitsm://github.com/shoaibmerchant/linux-optiga-trust-m.git;protocol=https;branch=provider_dev \
	file://0001-adds-mecha-comet-m-target-for-pal_ifx_i2c_config.patch \
"

SRCREV = "c4371f903eb9aec0d2b17ef5cadc8bd890a9cc9b"

S = "${WORKDIR}/git"

DEPENDS += " openssl"

CFLAGS += " -fPIC"
EXTRA_OEMAKE += " BUILD_FOR_MCOMETM='YES'"

TARGET_CC_ARCH += "${LDFLAGS}"

do_compile () {
	oe_runmake -C ${S}
}

do_install () {
	oe_runmake install 'DESTDIR=${D}'
}

PACKAGES = ""
PACKAGES += "\
	${PN}-dbg \
	${PN}-libtrustm \
	${PN}-apps \
	${PN}-openssl \
"

# debug package
FILES:${PN}-dbg += "${libdir}/.debug/*.so"

# libtrustm library
FILES:${PN}-libtrustm = "${libdir}/*.so"

# trustm apps
FILES:${PN}-apps = "${bindir}/*"
RDEPENDS:${PN}-apps = "${PN}-libtrustm"

# openssl plugin
FILES:${PN}-openssl = "${libdir}/ossl-modules/*.so"
RDEPENDS:${PN}-openssl ="${PN}-libtrustm"

