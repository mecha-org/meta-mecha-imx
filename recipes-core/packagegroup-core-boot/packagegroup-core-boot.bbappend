# Remove init-ifupdown from this packagegroup 
# It creats interface file in etc/network whick conflicts with networkmanager-nmcli

RDEPENDS:packagegroup-core-boot:remove = "init-ifupdown"
RRECOMMENDS:${PN}:remove = "init-ifupdown"