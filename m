Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF086C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 09:52:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.14865.1750153957245903563
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 02:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xgmBiKTl;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pKJH4Xh58kiEoDq+BCcxCjF3dVXrOpD9LpR6kmxbCdQ=; b=xgmBiKTl8eGHkPZq290M0j+rLI
	Tc3Nq/htwcAYM/QuNoxdDwYMDJNHbp4Plp9IeUANfYqH2v7D+r4K99njTbCkJn7/ghrY1BEcI+t2F
	t40eUKJhW7+WWmaHYNVuZjvkvgAHKAAhrd81XgBYzsXnwIU99W3yL2vbZQQWav8PUrs4FJXb66IuO
	YRX9Ogv8m2UyRIiR7HyhN2NJUHjGVTaJy2K0RdlN4FjCecwXq9jBJwQwxurEgdyrFodAOwxhAlgdl
	Vp8riGH9OImXJVhEP8S1D0G4YpY7QEY/pzqMurG0A2RPiiTPJvLJ/LtN6lP1b61KAW7jnNIYR+Qe1
	wplJdwtQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:60748 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRSzV-0000000HBwI-3WVo
	for docs@lists.yoctoproject.org;
	Tue, 17 Jun 2025 05:52:36 -0400
Date: Tue, 17 Jun 2025 05:52:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp-guide: shorten contents of meta-raspberrypi layer
Message-ID: <77b2c035-7eec-2c34-e433-55d0e713234c@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-902231337-1750153950=:1385638"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 09:52:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7081

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-902231337-1750153950=:1385638
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8BIT


It seems overly verbose to list the entire contents of the
meta-raspberrypi layer, so this replaces all of that output with a
shortened version displaying only the more top-level directories,
which still gives the reader a good idea of the overall structure of a
BSP layer.

If the reader wants more detail, they're free to check out the layer
itself.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 35972f172..97c9c1bf2 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -288,163 +288,82 @@ individual BSPs could differ. ::
    meta-bsp_root_name/recipes-graphics/*
    meta-bsp_root_name/recipes-kernel/linux/linux-yocto_kernel_rev.bbappend

-Below is an example of the Raspberry Pi BSP layer that is available from
-the :yocto_git:`Source Repositories <>`:
+Below is the abbreviated content of the higher levels of the
+``meta-raspberrypi`` BSP layer that is available from the
+:yocto_git:`Source Repositories <>`:

 .. code-block:: none

-   meta-raspberrypi/COPYING.MIT
-   meta-raspberrypi/README.md
-   meta-raspberrypi/classes
-   meta-raspberrypi/classes/sdcard_image-rpi.bbclass
-   meta-raspberrypi/conf/
-   meta-raspberrypi/conf/layer.conf
-   meta-raspberrypi/conf/machine/
-   meta-raspberrypi/conf/machine/raspberrypi-cm.conf
-   meta-raspberrypi/conf/machine/raspberrypi-cm3.conf
-   meta-raspberrypi/conf/machine/raspberrypi.conf
-   meta-raspberrypi/conf/machine/raspberrypi0-wifi.conf
-   meta-raspberrypi/conf/machine/raspberrypi0.conf
-   meta-raspberrypi/conf/machine/raspberrypi2.conf
-   meta-raspberrypi/conf/machine/raspberrypi3-64.conf
-   meta-raspberrypi/conf/machine/raspberrypi3.conf
-   meta-raspberrypi/conf/machine/include
-   meta-raspberrypi/conf/machine/include/rpi-base.inc
-   meta-raspberrypi/conf/machine/include/rpi-default-providers.inc
-   meta-raspberrypi/conf/machine/include/rpi-default-settings.inc
-   meta-raspberrypi/conf/machine/include/rpi-default-versions.inc
-   meta-raspberrypi/conf/machine/include/tune-arm1176jzf-s.inc
-   meta-raspberrypi/docs
-   meta-raspberrypi/docs/Makefile
-   meta-raspberrypi/docs/conf.py
-   meta-raspberrypi/docs/contributing.md
-   meta-raspberrypi/docs/extra-apps.md
-   meta-raspberrypi/docs/extra-build-config.md
-   meta-raspberrypi/docs/index.rst
-   meta-raspberrypi/docs/layer-contents.md
-   meta-raspberrypi/docs/readme.md
-   meta-raspberrypi/files
-   meta-raspberrypi/files/custom-licenses
-   meta-raspberrypi/files/custom-licenses/Broadcom
-   meta-raspberrypi/recipes-bsp
-   meta-raspberrypi/recipes-bsp/bootfiles
-   meta-raspberrypi/recipes-bsp/bootfiles/bcm2835-bootfiles.bb
-   meta-raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bb
-   meta-raspberrypi/recipes-bsp/common
-   meta-raspberrypi/recipes-bsp/common/firmware.inc
-   meta-raspberrypi/recipes-bsp/formfactor
-   meta-raspberrypi/recipes-bsp/formfactor/formfactor
-   meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi
-   meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi/machconfig
-   meta-raspberrypi/recipes-bsp/formfactor/formfactor_%.bbappend
-   meta-raspberrypi/recipes-bsp/rpi-u-boot-src
-   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files
-   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files/boot.cmd.in
-   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/rpi-u-boot-scr.bb
-   meta-raspberrypi/recipes-bsp/u-boot
-   meta-raspberrypi/recipes-bsp/u-boot/u-boot
-   meta-raspberrypi/recipes-bsp/u-boot/u-boot/*.patch
-   meta-raspberrypi/recipes-bsp/u-boot/u-boot_%.bbappend
-   meta-raspberrypi/recipes-connectivity
-   meta-raspberrypi/recipes-connectivity/bluez5
-   meta-raspberrypi/recipes-connectivity/bluez5/bluez5
-   meta-raspberrypi/recipes-connectivity/bluez5/bluez5/*.patch
-   meta-raspberrypi/recipes-connectivity/bluez5/bluez5/BCM43430A1.hcd
-   meta-raspberrypi/recipes-connectivity/bluez5/bluez5brcm43438.service
-   meta-raspberrypi/recipes-connectivity/bluez5/bluez5_%.bbappend
-   meta-raspberrypi/recipes-core
-   meta-raspberrypi/recipes-core/images
-   meta-raspberrypi/recipes-core/images/rpi-basic-image.bb
-   meta-raspberrypi/recipes-core/images/rpi-hwup-image.bb
-   meta-raspberrypi/recipes-core/images/rpi-test-image.bb
-   meta-raspberrypi/recipes-core/packagegroups
-   meta-raspberrypi/recipes-core/packagegroups/packagegroup-rpi-test.bb
-   meta-raspberrypi/recipes-core/psplash
-   meta-raspberrypi/recipes-core/psplash/files
-   meta-raspberrypi/recipes-core/psplash/files/psplash-raspberrypi-img.h
-   meta-raspberrypi/recipes-core/psplash/psplash_git.bbappend
-   meta-raspberrypi/recipes-core/udev
-   meta-raspberrypi/recipes-core/udev/udev-rules-rpi
-   meta-raspberrypi/recipes-core/udev/udev-rules-rpi/99-com.rules
-   meta-raspberrypi/recipes-core/udev/udev-rules-rpi.bb
-   meta-raspberrypi/recipes-devtools
-   meta-raspberrypi/recipes-devtools/bcm2835
-   meta-raspberrypi/recipes-devtools/bcm2835/bcm2835_1.52.bb
-   meta-raspberrypi/recipes-devtools/pi-blaster
-   meta-raspberrypi/recipes-devtools/pi-blaster/files
-   meta-raspberrypi/recipes-devtools/pi-blaster/files/*.patch
-   meta-raspberrypi/recipes-devtools/pi-blaster/pi-blaster_git.bb
-   meta-raspberrypi/recipes-devtools/python
-   meta-raspberrypi/recipes-devtools/python/python-rtimu
-   meta-raspberrypi/recipes-devtools/python/python-rtimu/*.patch
-   meta-raspberrypi/recipes-devtools/python/python-rtimu_git.bb
-   meta-raspberrypi/recipes-devtools/python/python-sense-hat_2.2.0.bb
-   meta-raspberrypi/recipes-devtools/python/rpi-gpio
-   meta-raspberrypi/recipes-devtools/python/rpi-gpio/*.patch
-   meta-raspberrypi/recipes-devtools/python/rpi-gpio_0.6.3.bb
-   meta-raspberrypi/recipes-devtools/python/rpio
-   meta-raspberrypi/recipes-devtools/python/rpio/*.patch
-   meta-raspberrypi/recipes-devtools/python/rpio_0.10.0.bb
-   meta-raspberrypi/recipes-devtools/wiringPi
-   meta-raspberrypi/recipes-devtools/wiringPi/files
-   meta-raspberrypi/recipes-devtools/wiringPi/files/*.patch
-   meta-raspberrypi/recipes-devtools/wiringPi/wiringpi_git.bb
-   meta-raspberrypi/recipes-graphics
-   meta-raspberrypi/recipes-graphics/eglinfo
-   meta-raspberrypi/recipes-graphics/eglinfo/eglinfo-fb_%.bbappend
-   meta-raspberrypi/recipes-graphics/eglinfo/eglinfo-x11_%.bbappend
-   meta-raspberrypi/recipes-graphics/mesa
-   meta-raspberrypi/recipes-graphics/mesa/mesa-gl_%.bbappend
-   meta-raspberrypi/recipes-graphics/mesa/mesa_%.bbappend
-   meta-raspberrypi/recipes-graphics/userland
-   meta-raspberrypi/recipes-graphics/userland/userland
-   meta-raspberrypi/recipes-graphics/userland/userland/*.patch
-   meta-raspberrypi/recipes-graphics/userland/userland_git.bb
-   meta-raspberrypi/recipes-graphics/vc-graphics
-   meta-raspberrypi/recipes-graphics/vc-graphics/files
-   meta-raspberrypi/recipes-graphics/vc-graphics/files/egl.pc
-   meta-raspberrypi/recipes-graphics/vc-graphics/files/vchiq.sh
-   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics-hardfp.bb
-   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics.bb
-   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics.inc
-   meta-raspberrypi/recipes-graphics/wayland
-   meta-raspberrypi/recipes-graphics/wayland/weston_%.bbappend
-   meta-raspberrypi/recipes-graphics/xorg-xserver
-   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config
-   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi
-   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf
-   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf.d
-   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf.d/10-evdev.conf
-   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf.d/98-pitft.conf
-   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf.d/99-calibration.conf
-   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
-   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
-   meta-raspberrypi/recipes-kernel
-   meta-raspberrypi/recipes-kernel/linux-firmware
-   meta-raspberrypi/recipes-kernel/linux-firmware/files
-   meta-raspberrypi/recipes-kernel/linux-firmware/files/brcmfmac43430-sdio.bin
-   meta-raspberrypi/recipes-kernel/linux-firmware/files/brcfmac43430-sdio.txt
-   meta-raspberrypi/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
-   meta-raspberrypi/recipes-kernel/linux
-   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi-dev.bb
-   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi.inc
-   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.14.bb
-   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb
-   meta-raspberrypi/recipes-multimedia
-   meta-raspberrypi/recipes-multimedia/gstreamer
-   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx
-   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx/*.patch
-   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx_%.bbappend
-   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
-   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx-1.12
-   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx-1.12/*.patch
-   meta-raspberrypi/recipes-multimedia/omxplayer
-   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer
-   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer/*.patch
-   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer_git.bb
-   meta-raspberrypi/recipes-multimedia/x264
-   meta-raspberrypi/recipes-multimedia/x264/x264_git.bbappend
-   meta-raspberrypi/wic meta-raspberrypi/wic/sdimage-raspberrypi.wks
+  ��� classes/
+  ��� ��� sdcard_image-rpi.bbclass
+  ��� conf/
+  ��� ��� layer.conf
+  ��� ��� machine/
+  ��� COPYING.MIT
+  ��� docs/
+  ��� dynamic-layers/
+  ��� ��� meta-python/
+  ��� ��� multimedia-layer/
+  ��� ��� networking-layer/
+  ��� ��� openembedded-layer/
+  ��� ��� qt5-layer/
+  ��� files/
+  ��� ��� custom-licenses/
+  ��� kas-poky-rpi.yml
+  ��� lib/
+  ��� ��� oeqa/
+  ��� README.md
+  ��� recipes-bsp/
+  ��� ��� armstubs/
+  ��� ��� bootfiles/
+  ��� ��� common/
+  ��� ��� formfactor/
+  ��� ��� gpio-shutdown/
+  ��� ��� rpi-eeprom/
+  ��� ��� rpi-u-boot-scr/
+  ��� ��� u-boot/
+  ��� recipes-connectivity/
+  ��� ��� bluez5/
+  ��� ��� pi-bluetooth/
+  ��� recipes-core/
+  ��� ��� images/
+  ��� ��� packagegroups/
+  ��� ��� psplash/
+  ��� ��� udev/
+  ��� recipes-devtools/
+  ��� ��� bcm2835/
+  ��� ��� pi-blaster/
+  ��� ��� python/
+  ��� ��� raspi-gpio/
+  ��� ��� raspi-utils/
+  ��� recipes-graphics/
+  ��� ��� cairo/
+  ��� ��� kmscube/
+  ��� ��� libsdl2/
+  ��� ��� libva/
+  ��� ��� mesa/
+  ��� ��� piglit/
+  ��� ��� raspidmx/
+  ��� ��� userland/
+  ��� ��� vc-graphics/
+  ��� ��� wayland/
+  ��� ��� xorg-xserver/
+  ��� recipes-kernel/
+  ��� ��� bluez-firmware-rpidistro/
+  ��� ��� linux/
+  ��� ��� linux-firmware-rpidistro/
+  ��� recipes-multimedia/
+  ��� ��� gstreamer/
+  ��� ��� omxplayer/
+  ��� ��� picamera-libs/
+  ��� ��� python3-picamera/
+  ��� ��� rpidistro-ffmpeg/
+  ��� ��� x264/
+  ��� recipes-sato/
+  ��� ��� libwpe_%.bbappend
+  ��� SECURITY.md
+  ��� wic/
+      ��� sdimage-raspberrypi.wks

 The following sections describe each part of the proposed BSP format.

--8323329-902231337-1750153950=:1385638--

