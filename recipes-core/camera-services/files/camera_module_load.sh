#!/bin/sh

sleep 15
echo "Camera module loading after boot"

/sbin/modprobe ov5640_camera_mipi_v2

exit 0

