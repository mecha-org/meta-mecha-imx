SUMMARY = "Linux tools and examples for OPTIGA™ Trust M1/M3 security solution"
SECTION = "support"
LICENSE="MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit cargo_bin

# Enable network for the compile task allowing cargo to download dependencies
do_compile[network] = "1"

SRC_URI = "\
	gitsm://github.com/shoaibmerchant/linux-optiga-trust-m.git;protocol=https;branch=provider_dev_rust \
"

BINDGEN_EXTRA_CLANG_ARGS += " -I${WORKDIR}/recipe-sysroot/usr/include/"

SRCREV = "534cd36bfd2e2d3f3a6483564ec043ddb9f98d04"

S = "${WORKDIR}/git/libtrustm-rs"

DEPENDS += " linux-optiga-trust-m openssl"
RDEPENDS:${PN} += " linux-optiga-trust-m-libtrustm"

