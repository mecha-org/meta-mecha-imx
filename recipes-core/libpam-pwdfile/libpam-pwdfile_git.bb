# Unable to find any files that looked like license statements. Check the accompanying
# documentation and source headers and set LICENSE and LIC_FILES_CHKSUM accordingly.
#
# NOTE: LICENSE is being set to "CLOSED" to allow you to at least start building - if
# this is not accurate with respect to the licensing of the software being built (it
# will not be in most cases) you must specify the correct value before using this
# recipe for anything other than initial testing/development!
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI = "git://github.com/tiwe-de/libpam-pwdfile;protocol=https;branch=master"

# Modify these as desired
PV = "1.0+git${SRCPV}"
SRCREV = "e29d26e77d8577ea272211c20240b3c39dff6bf0"

S = "${WORKDIR}/git"

DEPENDS += " libpam virtual/crypt"

do_compile () {
	# You will almost certainly need to add additional arguments here
	oe_runmake
}

do_install () {
	# This is a guess; additional arguments may be required
	oe_runmake install 'DESTDIR=${D}'
}
INSANE_SKIP_${PN}:append = "already-stripped"

FILES:${PN} = "${base_libdir}/security/pam*"
#FILES:${PN}-dev += "${base_libdir}/security/pam*"

# FILES:${PN} = "${base_libdir}/security/pam*${SOLIBS}"
# FILES:${PN}-dev += "${base_libdir}/security/pam*${SOLIBSDEV}"

# install -d ${base_libdir}/security/
# install -m pam_pwdfile.so ${base_libdir}/security/