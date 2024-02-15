FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PATCHTOOL = "git"

SRC_URI:append = "  file://0001-Add-imx8mm-mecha-som-gen1-dtb.patch \
				    file://0002-Add-imx8mm-mecha-comet-m-gen1-dtb.patch \
					file://0003-Change-gpu-drm-panel-sitronix-st7701-c.patch \
					file://0004-Fix-cpu-governer-issue.patch \
					file://0005-Resolve-LCD-issue-in-weston.patch \
					file://0006-Add-support-of-edt-ft5x06-touchscreen-mickledore.patch \
					file://0007-Fix-default-gpio-configuration-mickledore.patch \
					file://0008-Add-support-for-max98090-91-audio-codec-mickledore.patch \
					file://0009-Etnaviv-driver-enable-in-imx8mm-dtsi-mickledore.patch \
					file://0011-Add-imx8mm-mecha-som-gen1-ramfs-dts.patch \
					file://0012-Update-fual-gauge-calibration.patch \ 
					file://0013-Resolve-camera-invert-preview-issue.patch \
					file://0014-Added-support-to-compile-dtbs-with-symbols.patch \
					file://0015-Resolved-issue-of-display-with-overlay.patch \
					file://0017-Change-linux-logo.patch \
			  	 "

do_configure:append () {
	echo "############ Writing MECHA configs ############### "
	#May produce warning
	config="${B}/.config"

	echo "############ Writing MECHA configs ############" >> $config
	#############  4GB-SOM Changes  ############### 

	sed -i "/CONFIG_PCI_LAYERSCAPE[=]/d" $config
	echo "CONFIG_PCI_LAYERSCAPE=n" >> $config

	sed -i "/CONFIG_PCI_IMX6[=]/d" $config
	echo "CONFIG_PCI_IMX6=n" >> $config

	sed -i "/CONFIG_PCI_IMX6_HOST[=]/d" $config
	echo "CONFIG_PCI_IMX6_HOST=n" >> $config

	sed -i "/CONFIG_PCI_IMX6_EP[=]/d" $config
	echo "CONFIG_PCI_IMX6_EP=n" >> $config

	############ etnaviv enable configs ############
	echo "############ etnaviv enable configs ############" >> $config

	sed -i "/CONFIG_DRM_ETNAVIV[ =]/d" $config
	echo "CONFIG_DRM_ETNAVIV=y" >> $config

	sed -i "/CONFIG_DRM_ETNAVIV_THERMAL[ =]/d" $config
	echo "CONFIG_DRM_ETNAVIV_THERMAL=y" >> $config

	############ ############ ############

	sed -i "/CONFIG_GPIO_SYSFS[ =]/d" $config
	echo "CONFIG_GPIO_SYSFS=y" >> $config
	
	sed -i "/CONFIG_DRM_PANEL_SITRONIX_ST7701[ =]/d" $config
	echo "CONFIG_DRM_PANEL_SITRONIX_ST7701=y" >> $config

	sed -i "/CONFIG_TOUCHSCREEN_EDT_FT5X06[ =]/d" $config
	echo "CONFIG_TOUCHSCREEN_EDT_FT5X06=y" >> $config

	sed -i "/CONFIG_TI_ADS1015[ =]/d" $config
	echo "CONFIG_TI_ADS1015=y" >> $config

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
	
	############ Default CPU Governer ##############
	sed -i "/# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE[ =]/d" $config
	echo "CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y" >> $config

	############ Portable Kernel Modules ###########
	sed -i "/CONFIG_MXC_CAMERA_OV5640_MIPI_V2[ =]/d" $config
	echo "CONFIG_MXC_CAMERA_OV5640_MIPI_V2=m" >> $config

	sed -i "/CONFIG_SND_SOC_MAX98090[ =]/d" $config
	echo "CONFIG_SND_SOC_MAX98090=y" >> $config

	sed -i "/CONFIG_BATTERY_BQ27XXX[ =]/d" $config
	echo "CONFIG_BATTERY_BQ27XXX=m" >> $config

	sed -i "/CONFIG_BATTERY_BQ27XXX_I2C[ =]/d" $config
	echo "CONFIG_BATTERY_BQ27XXX_I2C=m" >> $config

	sed -i "/CONFIG_INV_ICM42600_I2C[ =]/d" $config
	echo "CONFIG_INV_ICM42600_I2C=m" >> $config

	sed -i "/CONFIG_CHARGER_BQ25890[ =]/d" $config
	echo "CONFIG_CHARGER_BQ25890=y" >> $config

	sed -i "/CONFIG_STRICT_DEVMEM[ =]/d" $config
	echo "CONFIG_STRICT_DEVMEM=n" >> $config

	sed -i "/CONFIG_DEVMEM[ =]/d" $config
	echo "CONFIG_DEVMEM=n" >> $config

}

# echo "############ Kernel configs for firewall ############" >> $config

# sed -i "/CONFIG_NFT_REJECT[ =]/d" $config
# echo "CONFIG_NFT_REJECT=m" >> $config

# sed -i "/CONFIG_NFT_REJECT_INET[ =]/d" $config
# echo "CONFIG_NFT_REJECT_INET=m" >> $config

# sed -i "/CONFIG_NFT_REJECT_IPV4[ =]/d" $config
# echo "CONFIG_NFT_REJECT_IPV4=m" >> $config

# sed -i "/CONFIG_NFT_REJECT_IPV6[ =]/d" $config
# echo "CONFIG_NFT_REJECT_IPV6=m" >> $config

# sed -i "/CONFIG_NFT_COUNTER[ =]/d" $config
# echo "CONFIG_NFT_COUNTER=m" >> $config

# sed -i "/CONFIG_NFT_CONNLIMIT[ =]/d" $config
# echo "CONFIG_NFT_CONNLIMIT=m" >> $config	

# sed -i "/CONFIG_NFT_LOG[ =]/d" $config
# echo "CONFIG_NFT_LOG=m" >> $config	

# sed -i "/CONFIG_NFT_LIMIT[ =]/d" $config
# echo "CONFIG_NFT_LIMIT=m" >> $config	
	
# sed -i "/CONFIG_NFT_REDIR[ =]/d" $config
# echo "CONFIG_NFT_REDIR=m" >> $config	

# sed -i "/CONFIG_NFT_TUNNEL[ =]/d" $config
# echo "CONFIG_NFT_TUNNEL=m" >> $config	

# sed -i "/CONFIG_NFT_OBJREF[ =]/d" $config
# echo "CONFIG_NFT_OBJREF=m" >> $config	

# sed -i "/CONFIG_NFT_QUEUE[ =]/d" $config
# echo "CONFIG_NFT_QUEUE=m" >> $config	

# sed -i "/CONFIG_NFT_QUOTA[ =]/d" $config
# echo "CONFIG_NFT_QUOTA=m" >> $config	

# CONFIG_NFT_REJECT=m
# CONFIG_NFT_REJECT_INET=m
# CONFIG_NFT_REJECT_IPV4=m
# CONFIG_NFT_REJECT_IPV6=m
# CONFIG_NFT_COUNTER=m
# CONFIG_NFT_CONNLIMIT=m
# CONFIG_NFT_LOG=m
# CONFIG_NFT_LIMIT=m
# CONFIG_NFT_REDIR=m
# CONFIG_NFT_TUNNEL=m
# CONFIG_NFT_OBJREF=m
# CONFIG_NFT_QUEUE=m
# CONFIG_NFT_QUOTA=m


# echo "############ CAAM configs ############" >> $config
# echo "CONFIG_CRYPTO_DEV_FSL_CAAM_DESC=y" >> $config
# echo "CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLACK_KEY=y" >> $config
# echo "CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLOB=y" >> $config
# echo "CONFIG_CAAM_KEYS=y" >> $config

# echo "############ CAAM-configs ############" >> $config

# sed -i "/# CONFIG_BLK_DEV_DM[ =]/d" $config
# echo "CONFIG_BLK_DEV_DM=y" >> $config
# sed -i "/# CONFIG_BLK_DEV_MD[ =]/d" $config
# echo "CONFIG_BLK_DEV_MD=y" >> $config
# sed -i "/# CONFIG_MD[ =]/d" $config
# echo "CONFIG_MD=y" >> $config
# sed -i "/# CONFIG_DM_CRYPT[ =]/d" $config
# echo "CONFIG_DM_CRYPT=y" >> $config


# sed -i "/# CONFIG_CRYPTO_DEV_FSL_CAAM_TK_API[ =]/d" $config
# echo "CONFIG_CRYPTO_DEV_FSL_CAAM_TK_API=y" >> $config

# sed -i "/# CONFIG_CRYPTO_DEV_FSL_CAAM_DESC[ =]/d" $config
# echo "CONFIG_CRYPTO_DEV_FSL_CAAM_DESC=y" >> $config
# sed -i "/# CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLACK_KEY[ =]/d" $config
# echo "CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLACK_KEY=y" >> $config
# sed -i "/# CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLOB[ =]/d" $config
# echo "CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLOB=y" >> $config
# sed -i "/# CONFIG_CAAM_KEYS[ =]/d" $config
# echo "CONFIG_CAAM_KEYS=y" >> $config

# sed -i "/# CONFIG_CRYPTO_USER_API[ =]/d" $config
# echo "CONFIG_CRYPTO_USER_API=y" >> $config
# sed -i "/# CONFIG_CRYPTO_USER_API_HASH[ =]/d" $config
# echo "CONFIG_CRYPTO_USER_API_HASH=y" >> $config
# sed -i "/# CONFIG_CRYPTO_USER_API_AEAD[ =]/d" $config
# echo "CONFIG_CRYPTO_USER_API_AEAD=y" >> $config
# sed -i "/# CONFIG_CRYPTO_USER_API_SKCIPHER[ =]/d" $config
# echo "CONFIG_CRYPTO_USER_API_SKCIPHER=y" >> $config
# sed -i "/# CONFIG_CRYPTO_USER_API_RNG[ =]/d" $config
# echo "CONFIG_CRYPTO_USER_API_RNG=y" >> $config

# Following is the minimal kernel parameters list, which should be enabled to include DM-Crypt with CAAM secure key:
# Enable DM-Crypt and its dependencies
# CONFIG_BLK_DEV_DM=y
# CONFIG_BLK_DEV_MD=y
# CONFIG_MD=y
# CONFIG_DM_CRYPT=y
# CONFIG_DM_MULTIPATH=y
# CONFIG_DM_UEVENT=y
  
# Enable CAAM black key/blob driver and its dependencies
# CONFIG_CRYPTO_DEV_FSL_CAAM_SECVIO=m
# CONFIG_CRYPTO_DEV_FSL_CAAM=m
# CONFIG_CRYPTO_DEV_FSL_CAAM_SM_TEST=m

# CONFIG_CRYPTO_DEV_FSL_CAAM_DESC=y
# CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLACK_KEY=y
# CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLOB=y
# CONFIG_CRYPTO_DEV_FSL_CAAM_TK_API=y
# CONFIG_CAAM_KEYS=y

# User-space interface for hash, AEAD, and symmetric key cipher algorithms.
# CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH=y
# CONFIG_CRYPTO_USER_API_AEAD=y
# CONFIG_CRYPTO_USER_API_SKCIPHER=y
# CONFIG_CRYPTO_USER_API_RNG=y

# CONFIG_CRYPTO_DEV_FSL_CAAM_DESC=y
# CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLACK_KEY=y
# CONFIG_CRYPTO_DEV_FSL_CAAM_UTIL_BLOB=y
# CONFIG_CAAM_KEYS=y