FILESEXTRAPATHS:prepend := "${THISDIR}/imx-atf:"
 
PATCHTOOL = "git"
 
DEPENDS:append = " dtc-native bison-native"
 
#SRCREV = "ffc3fbe7e5418d16f492c78693c3c4fa41f06f27"
 
SRC_URI += " file://0001-Resolve-poweroff-issue.patch \
            "

