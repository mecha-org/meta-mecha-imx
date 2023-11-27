FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PATCHTOOL = "git"
SRC_URI:append = " file://0001-Add-Changes-to-enable-wifi-in-imx8mmlpd4.patch \
	file://0002-Add-dts-for-mecha-imx8mmlpdr4.patch \
	file://0003-Add-fuel-gauge-support.patch \
	file://0004-Modify-dts-for-mc-ci8mm-kirkstone.patch \
	file://0005-Added-panel-sitronix-st7701-support.patch \
	file://0006-Added-support-of-ethernet-PHY.patch \
	file://0007-Added-support-of-edt-ft5x06-touchscreen.patch \
	file://0008-Config-gpio-for-security-chip.patch \
	file://0009-Added-default-gpio-configuration.patch \
	file://0010-Enabled-mikrobus-pwm.patch \
	file://0011-Added-support-for-max98090-91-audio-codec.patch \
	file://0012-Added-changes-related-to-display.patch \
	file://0013-Add-icm42605-channel-to-WR-register.patch \
	file://0014-added-support-for-multiple-sample-rate.patch \
	file://0015-Fix-cpu-governor-issue.patch \
	file://0016-Fix-audio-sample-rate-and-tempo-issue.patch \
	file://0017-Change-linux-logo.patch \
	file://0018-Etnaviv-debug-logs-etnaviv_drv-etnaviv_gpu.patch \
	file://0019-Etnaviv-driver-enable-in-imx8mm-dtsi.patch \
	file://0020-Resolve-GPU-issue-in-4GB-RAM-with-sway.patch \
	file://0021-Add-fuel-guage-bq27441-calibration.patch \
	"

#  	file://0025-Update-config-of-fuel-gauge.patch 

#	file://0023-Dts-Overlay-Complie-with-symbols.patch 
#	file://0024-Compile-dtb-with-symbols-for-overlay-support.patch 

#	file://0001-Working-GPU-Sway-Fix.patch 
#	file://0002-GPU-with-4GB-RAM-Dts-Changes-Working.patch 

#	file://0013-Add-Support-for-IRQ-Trigger-in-INV-ICM42600.patch


do_configure:append () {
	echo "############ Writing MECHA configs ############### "
	#May produce warning
	config="${B}/.config"

	# echo "############  4GB-SOM Changes  ############### "

	sed -i "/CONFIG_PCI_LAYERSCAPE[=]/d" $config
	echo "CONFIG_PCI_LAYERSCAPE=n" >> $config

	sed -i "/CONFIG_PCI_IMX6[=]/d" $config
	echo "CONFIG_PCI_IMX6=n" >> $config

	sed -i "/CONFIG_PCI_IMX6_HOST[=]/d" $config
	echo "CONFIG_PCI_IMX6_HOST=n" >> $config

	sed -i "/CONFIG_PCI_IMX6_EP[=]/d" $config
	echo "CONFIG_PCI_IMX6_EP=n" >> $config

	############ For MECHA ##############
	echo "############ etnaviv enable configs ############" >> $config

	sed -i "/CONFIG_DRM_ETNAVIV[ =]/d" $config
	echo "CONFIG_DRM_ETNAVIV=y" >> $config

	sed -i "/CONFIG_DRM_ETNAVIV_THERMAL[ =]/d" $config
	echo "CONFIG_DRM_ETNAVIV_THERMAL=y" >> $config

	echo "# MECHA configs " >> $config

	sed -i "/CONFIG_MXC_CAMERA_OV5640_MIPI_V2[ =]/d" $config
	echo "CONFIG_MXC_CAMERA_OV5640_MIPI_V2=m" >> $config

	sed -i "/CONFIG_GPIO_SYSFS[ =]/d" $config
	echo "CONFIG_GPIO_SYSFS=y" >> $config
	
	sed -i "/CONFIG_DRM_PANEL_SITRONIX_ST7701[ =]/d" $config
	echo "CONFIG_DRM_PANEL_SITRONIX_ST7701=y" >> $config

	sed -i "/CONFIG_TOUCHSCREEN_EDT_FT5X06[ =]/d" $config
	echo "CONFIG_TOUCHSCREEN_EDT_FT5X06=y" >> $config

	sed -i "/CONFIG_SND_SOC_MAX98090[ =]/d" $config
	echo "CONFIG_SND_SOC_MAX98090=y" >> $config

	sed -i "/CONFIG_TI_ADS1015[ =]/d" $config
	echo "CONFIG_TI_ADS1015=y" >> $config

	sed -i "/CONFIG_INV_ICM42600_I2C[ =]/d" $config
	echo "CONFIG_INV_ICM42600_I2C=y" >> $config

	sed -i "/CONFIG_BRCMUTIL[ =]/d" $config
	echo "CONFIG_BRCMUTIL=y" >> $config

	sed -i "/CONFIG_BRCMFMAC[ =]/d" $config
	echo "CONFIG_BRCMFMAC=y" >> $config

	sed -i "/CONFIG_BRCMFMAC_PROTO_BCDC[ =]/d" $config
	echo "CONFIG_BRCMFMAC_PROTO_BCDC=y" >> $config

	sed -i "/CONFIG_BRCMFMAC_PROTO_MSGBUF[ =]/d" $config
	echo "CONFIG_BRCMFMAC_PROTO_MSGBUF=y" >> $config

	sed -i "/CONFIG_BRCMFMAC_SDIO[ =]/d" $config
	echo "CONFIG_BRCMFMAC_SDIO=y" >> $config

	sed -i "/CONFIG_BRCMFMAC_PCIE[ =]/d" $config
	echo "CONFIG_BRCMFMAC_PCIE=y" >> $config

	sed -i "/CONFIG_WLAN_VENDOR_BROADCOM[ =]/d" $config
	echo "CONFIG_WLAN_VENDOR_BROADCOM=y" >> $config

	sed -i "/CONFIG_WLAN[ =]/d" $config
	echo "CONFIG_WLAN=y" >> $config

	sed -i "/CONFIG_CHARGER_BQ25890[ =]/d" $config
	echo "CONFIG_CHARGER_BQ25890=y" >> $config

	sed -i "/CONFIG_RTC_DRV_PCF8563[ =]/d" $config
	echo "CONFIG_RTC_DRV_PCF8563=y" >> $config

	sed -i "/# CONFIG_CRYPTO_DEV_FSL_CAAM[ =]/d" $config
	echo "CONFIG_CRYPTO_DEV_FSL_CAAM=y" >> $config

	sed -i "/CONFIG_CRYPTO_TLS[ =]/d" $config
	echo "CONFIG_CRYPTO_TLS=y" >> $config

	sed -i "/CONFIG_DM_CRYPT[ =]/d" $config
	echo "CONFIG_DM_CRYPT=y" >> $config

	sed -i "/# CONFIG_CRYPTO_DEV_FSL_CAAM_DMA[ =]/d" $config
	echo "CONFIG_CRYPTO_DEV_FSL_CAAM_DMA=y" >> $config

	sed -i "/# CONFIG_TLS[ =]/d" $config
	echo "CONFIG_TLS=y" >> $config

	sed -i "/CONFIG_CRYPTO_USER_API_AEAD[ =]/d" $config
	echo "CONFIG_CRYPTO_USER_API_AEAD=y" >> $config

	sed -i "/# CONFIG_PKCS8_PRIVATE_KEY_PARSER[ =]/d" $config
	echo "CONFIG_PKCS8_PRIVATE_KEY_PARSER=y" >> $config

	sed -i "/# CONFIG_PKCS7_TEST_KEY[ =]/d" $config
	echo "CONFIG_PKCS7_TEST_KEY=y" >> $config

	sed -i "/CONFIG_CRYPTO_TEST=m/d" $config
	echo "CONFIG_CRYPTO_TEST=y" >> $config

	sed -i "/CONFIG_BLK_DEV_DM[ =]/d" $config
	echo "CONFIG_BLK_DEV_DM=y" >> $config

	sed -i "/CONFIG_CRYPTO_USER_API[ =]/d" $config
	echo "CONFIG_CRYPTO_USER_API=y" >> $config

	sed -i "/CONFIG_CRYPTO_USER_API_HASH[ =]/d" $config
	echo "CONFIG_CRYPTO_USER_API_HASH=y" >> $config

	sed -i "/CONFIG_CRYPTO_USER_API_SKCIPHER[ =]/d" $config
	echo "CONFIG_CRYPTO_USER_API_SKCIPHER=y" >> $config

	sed -i "/CONFIG_CRYPTO_USER_API_RNG[ =]/d" $config
	echo "CONFIG_CRYPTO_USER_API_RNG=y" >> $config

	sed -i "/CONFIG_CRYPTO_USER_API_RNG[ =]/d" $config
	echo "CONFIG_CRYPTO_USER_API_RNG=y" >> $config

	sed -i "/CONFIG_CRYPTO_DEV_FSL_CAAM_TK_API[ =]/d" $config
	echo "CONFIG_CRYPTO_DEV_FSL_CAAM_TK_API=y" >> $config

	sed -i "/CONFIG_RTC_DRV_PCF8563[ =]/d" $config
	echo "CONFIG_RTC_DRV_PCF8563=y" >> $config

	sed -i "/CONFIG_GPIO_SYSFS[ =]/d" $config
	echo "CONFIG_GPIO_SYSFS=y" >> $config
	
	############ Default CPU Governer ##############
	sed -i "/# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE[ =]/d" $config
	echo "CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y" >> $config

}
