#!/bin/sh

# Set WAYLAND_DISPLAY manually.
# It will cause app failures if this variable is not set for ssh login.
if test -z "$WAYLAND_DISPLAY"; then
	export WAYLAND_DISPLAY="wayland-1"
fi
