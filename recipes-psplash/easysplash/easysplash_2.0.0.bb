# Auto-Generated by cargo-bitbake 0.3.16-alpha.0
#

DESCRIPTION = "EasySplash is an application that runs early the OS boot for showing graphical \
animation while the boot process itself happens in the background. \
The app is built on Rust and binds to GStreamer, so it can run in any backend that supports both."

require easysplash-common-2.0.inc

inherit cargo pkgconfig systemd update-rc.d

# If this is git based prefer versioned ones if they exist
# DEFAULT_PREFERENCE = "-1"

CARGO_SRC_DIR = ""
PV:append = ".AUTOINC+724e1c7edc"

# please note if you have entries that do not begin with crate://
# you must change them to how that package can be fetched
SRC_URI += " \
    crate://crates.io/anyhow/1.0.59 \
    crate://crates.io/argh/0.1.8 \
    crate://crates.io/argh_derive/0.1.8 \
    crate://crates.io/argh_shared/0.1.8 \
    crate://crates.io/async-attributes/1.1.2 \
    crate://crates.io/async-channel/1.6.1 \
    crate://crates.io/async-executor/1.4.1 \
    crate://crates.io/async-global-executor/2.2.0 \
    crate://crates.io/async-io/1.7.0 \
    crate://crates.io/async-lock/2.5.0 \
    crate://crates.io/async-process/1.4.0 \
    crate://crates.io/async-std/1.12.0 \
    crate://crates.io/async-task/4.3.0 \
    crate://crates.io/atomic-waker/1.0.0 \
    crate://crates.io/autocfg/1.1.0 \
    crate://crates.io/bitflags/1.3.2 \
    crate://crates.io/blocking/1.2.0 \
    crate://crates.io/build-env/0.3.1 \
    crate://crates.io/bumpalo/3.10.0 \
    crate://crates.io/cache-padded/1.2.0 \
    crate://crates.io/cc/1.0.73 \
    crate://crates.io/cfg-expr/0.10.3 \
    crate://crates.io/cfg-if/1.0.0 \
    crate://crates.io/concurrent-queue/1.2.4 \
    crate://crates.io/crossbeam-utils/0.8.11 \
    crate://crates.io/cstr-argument/0.1.2 \
    crate://crates.io/ctor/0.1.23 \
    crate://crates.io/derive_more/0.99.17 \
    crate://crates.io/event-listener/2.5.3 \
    crate://crates.io/fastrand/1.8.0 \
    crate://crates.io/foreign-types-macros/0.2.2 \
    crate://crates.io/foreign-types-shared/0.3.1 \
    crate://crates.io/foreign-types/0.5.0 \
    crate://crates.io/futures-channel/0.3.21 \
    crate://crates.io/futures-core/0.3.21 \
    crate://crates.io/futures-executor/0.3.21 \
    crate://crates.io/futures-io/0.3.21 \
    crate://crates.io/futures-lite/1.12.0 \
    crate://crates.io/futures-task/0.3.21 \
    crate://crates.io/futures-util/0.3.21 \
    crate://crates.io/glib-macros/0.15.11 \
    crate://crates.io/glib-sys/0.15.10 \
    crate://crates.io/glib/0.15.12 \
    crate://crates.io/gloo-timers/0.2.4 \
    crate://crates.io/gobject-sys/0.15.10 \
    crate://crates.io/gstreamer-sys/0.18.0 \
    crate://crates.io/gstreamer/0.18.8 \
    crate://crates.io/heck/0.3.3 \
    crate://crates.io/heck/0.4.0 \
    crate://crates.io/hermit-abi/0.1.19 \
    crate://crates.io/instant/0.1.12 \
    crate://crates.io/js-sys/0.3.59 \
    crate://crates.io/kv-log-macro/1.0.7 \
    crate://crates.io/lazy_static/1.4.0 \
    crate://crates.io/libc/0.2.126 \
    crate://crates.io/libsystemd-sys/0.9.3 \
    crate://crates.io/log/0.4.17 \
    crate://crates.io/memchr/2.5.0 \
    crate://crates.io/muldiv/1.0.0 \
    crate://crates.io/num-integer/0.1.45 \
    crate://crates.io/num-rational/0.4.1 \
    crate://crates.io/num-traits/0.2.15 \
    crate://crates.io/num_cpus/1.13.1 \
    crate://crates.io/once_cell/1.13.0 \
    crate://crates.io/option-operations/0.4.1 \
    crate://crates.io/parking/2.0.0 \
    crate://crates.io/paste/1.0.7 \
    crate://crates.io/pin-project-lite/0.2.9 \
    crate://crates.io/pin-utils/0.1.0 \
    crate://crates.io/pkg-config/0.3.25 \
    crate://crates.io/polling/2.2.0 \
    crate://crates.io/pretty-hex/0.3.0 \
    crate://crates.io/proc-macro-crate/1.1.3 \
    crate://crates.io/proc-macro-error-attr/1.0.4 \
    crate://crates.io/proc-macro-error/1.0.4 \
    crate://crates.io/proc-macro2/1.0.42 \
    crate://crates.io/quote/1.0.20 \
    crate://crates.io/redox_syscall/0.1.57 \
    crate://crates.io/serde/1.0.141 \
    crate://crates.io/serde_derive/1.0.141 \
    crate://crates.io/signal-hook-registry/1.4.0 \
    crate://crates.io/signal-hook/0.3.14 \
    crate://crates.io/simple-logging/2.0.2 \
    crate://crates.io/slab/0.4.7 \
    crate://crates.io/smallvec/1.9.0 \
    crate://crates.io/socket2/0.4.4 \
    crate://crates.io/syn/1.0.98 \
    crate://crates.io/system-deps/6.0.2 \
    crate://crates.io/systemd/0.10.0 \
    crate://crates.io/thiserror-impl/1.0.31 \
    crate://crates.io/thiserror/1.0.31 \
    crate://crates.io/thread-id/3.3.0 \
    crate://crates.io/toml/0.5.9 \
    crate://crates.io/unicode-ident/1.0.2 \
    crate://crates.io/unicode-segmentation/1.9.0 \
    crate://crates.io/utf8-cstr/0.1.6 \
    crate://crates.io/value-bag/1.0.0-alpha.9 \
    crate://crates.io/version-compare/0.1.0 \
    crate://crates.io/version_check/0.9.4 \
    crate://crates.io/waker-fn/1.1.0 \
    crate://crates.io/wasm-bindgen-backend/0.2.82 \
    crate://crates.io/wasm-bindgen-futures/0.4.32 \
    crate://crates.io/wasm-bindgen-macro-support/0.2.82 \
    crate://crates.io/wasm-bindgen-macro/0.2.82 \
    crate://crates.io/wasm-bindgen-shared/0.2.82 \
    crate://crates.io/wasm-bindgen/0.2.82 \
    crate://crates.io/web-sys/0.3.59 \
    crate://crates.io/wepoll-ffi/0.1.2 \
    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
    crate://crates.io/winapi/0.3.9 \
"

LICENSE = "Apache-2.0|MIT"
LIC_FILES_CHKSUM = "file://LICENSE-APACHE-2.0;md5=1836efb2eb779966696f473ee8540542"
LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"

DEPENDS = "glib-2.0 gstreamer1.0"

INITSCRIPT_NAME = "${PN}-start"
INITSCRIPT_PARAMS:${PN} = "start 5 S ."

SYSTEMD_SERVICE:${PN} = "${PN}-start.service ${PN}-quit.service"

EXTRA_CARGO_FLAGS += " \
    ${@bb.utils.contains('PACKAGECONFIG', 'systemd', '--features systemd', '', d)} \
"

PACKAGECONFIG ?= "\
    ${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)} \
    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
"

PACKAGECONFIG[sysvinit] = "INIT=1, INIT=0,"
PACKAGECONFIG[systemd] = "SYSTEMD=1, SYSTEM=0, systemd"

do_install:append() {
    (cd ${S} ; oe_runmake install-service DESTDIR=${D})
    rm ${D}${sysconfdir}/default/easysplash
}

RDEPENDS:${PN} += "easysplash-config"