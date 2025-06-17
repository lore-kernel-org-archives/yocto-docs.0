Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F18DC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 12:33:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.17430.1750163577178562382
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 05:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=wJYuKZDE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RE9vVfRDJTb6o8Yr+9PVTzv9WArSkyy168o1BW2yrsQ=; b=wJYuKZDES8zENVoSvBMc96Nz5u
	cv0WqUhPorEhuqsLU6eDLdUmjS3qYKoZ5rdOvvc/hUZEg70sDLwZ13EJUCY2mJ8FflzWSmyhs4h78
	VEL+3g27PicSN6DWa0tmmY6APPWc///ZdIMKW61QD3cFTKccAmMlLUmCtQoMOQXgpbzvKh7Rvrt5y
	qhfAaQyFAIUxtIC67/IgtZY4iy/jZ7UuB8EIzAnICMHOD8cn3XStQ2ezFDVjd4gwQsFoCdM4/G0wZ
	xI8CK/twd/K+8qOADXr8t7MfvYRP3rgt+3RYNwZQsjzK4JosxmSoojJcHngBE4B7VLfd69d22+wxT
	KjDqywfA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:42870 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRVUk-0000000HY7P-2pJD;
	Tue, 17 Jun 2025 08:32:56 -0400
Date: Tue, 17 Jun 2025 08:32:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] bsp-guide: shorten contents of meta-raspberrypi
 layer
In-Reply-To: <DAOSRZNTWZPG.39BPC2BOM11M2@bootlin.com>
Message-ID: <8af19792-5d8b-65b1-b5e2-3144bd753baa@crashcourse.ca>
References: <77b2c035-7eec-2c34-e433-55d0e713234c@crashcourse.ca> <DAOSRZNTWZPG.39BPC2BOM11M2@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-806441173-1750163574=:1411176"
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
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 12:33:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7084

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-806441173-1750163574=:1411176
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 17 Jun 2025, Antonin Godard wrote:

> Hi,
>
> On Tue Jun 17, 2025 at 11:52 AM CEST, Robert P. J. Day wrote:
> >
> > It seems overly verbose to list the entire contents of the
> > meta-raspberrypi layer, so this replaces all of that output with a
> > shortened version displaying only the more top-level directories,
> > which still gives the reader a good idea of the overall structure of a
> > BSP layer.
> >
> > If the reader wants more detail, they're free to check out the layer
> > itself.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> > index 35972f172..97c9c1bf2 100644
> > --- a/documentation/bsp-guide/bsp.rst
> > +++ b/documentation/bsp-guide/bsp.rst
> > @@ -288,163 +288,82 @@ individual BSPs could differ. ::
> >     meta-bsp_root_name/recipes-graphics/*
> >     meta-bsp_root_name/recipes-kernel/linux/linux-yocto_kernel_rev.bbappend
> >
> > -Below is an example of the Raspberry Pi BSP layer that is available from
> > -the :yocto_git:`Source Repositories <>`:
> > +Below is the abbreviated content of the higher levels of the
> > +``meta-raspberrypi`` BSP layer that is available from the
> > +:yocto_git:`Source Repositories <>`:
> >
> >  .. code-block:: none
> >
> > -   meta-raspberrypi/COPYING.MIT
> > -   meta-raspberrypi/README.md
> > -   meta-raspberrypi/classes
> > -   meta-raspberrypi/classes/sdcard_image-rpi.bbclass
> > -   meta-raspberrypi/conf/
> > -   meta-raspberrypi/conf/layer.conf
> > -   meta-raspberrypi/conf/machine/
> > -   meta-raspberrypi/conf/machine/raspberrypi-cm.conf
> > -   meta-raspberrypi/conf/machine/raspberrypi-cm3.conf
> > -   meta-raspberrypi/conf/machine/raspberrypi.conf
> > -   meta-raspberrypi/conf/machine/raspberrypi0-wifi.conf
> > -   meta-raspberrypi/conf/machine/raspberrypi0.conf
> > -   meta-raspberrypi/conf/machine/raspberrypi2.conf
> > -   meta-raspberrypi/conf/machine/raspberrypi3-64.conf
> > -   meta-raspberrypi/conf/machine/raspberrypi3.conf
> > -   meta-raspberrypi/conf/machine/include
> > -   meta-raspberrypi/conf/machine/include/rpi-base.inc
> > -   meta-raspberrypi/conf/machine/include/rpi-default-providers.inc
> > -   meta-raspberrypi/conf/machine/include/rpi-default-settings.inc
> > -   meta-raspberrypi/conf/machine/include/rpi-default-versions.inc
> > -   meta-raspberrypi/conf/machine/include/tune-arm1176jzf-s.inc
> > -   meta-raspberrypi/docs
> > -   meta-raspberrypi/docs/Makefile
> > -   meta-raspberrypi/docs/conf.py
> > -   meta-raspberrypi/docs/contributing.md
> > -   meta-raspberrypi/docs/extra-apps.md
> > -   meta-raspberrypi/docs/extra-build-config.md
> > -   meta-raspberrypi/docs/index.rst
> > -   meta-raspberrypi/docs/layer-contents.md
> > -   meta-raspberrypi/docs/readme.md
> > -   meta-raspberrypi/files
> > -   meta-raspberrypi/files/custom-licenses
> > -   meta-raspberrypi/files/custom-licenses/Broadcom
> > -   meta-raspberrypi/recipes-bsp
> > -   meta-raspberrypi/recipes-bsp/bootfiles
> > -   meta-raspberrypi/recipes-bsp/bootfiles/bcm2835-bootfiles.bb
> > -   meta-raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bb
> > -   meta-raspberrypi/recipes-bsp/common
> > -   meta-raspberrypi/recipes-bsp/common/firmware.inc
> > -   meta-raspberrypi/recipes-bsp/formfactor
> > -   meta-raspberrypi/recipes-bsp/formfactor/formfactor
> > -   meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi
> > -   meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi/machconfig
> > -   meta-raspberrypi/recipes-bsp/formfactor/formfactor_%.bbappend
> > -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src
> > -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files
> > -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files/boot.cmd.in
> > -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/rpi-u-boot-scr.bb
> > -   meta-raspberrypi/recipes-bsp/u-boot
> > -   meta-raspberrypi/recipes-bsp/u-boot/u-boot
> > -   meta-raspberrypi/recipes-bsp/u-boot/u-boot/*.patch
> > -   meta-raspberrypi/recipes-bsp/u-boot/u-boot_%.bbappend
> > -   meta-raspberrypi/recipes-connectivity
> > -   meta-raspberrypi/recipes-connectivity/bluez5
> > -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5
> > -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5/*.patch
> > -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5/BCM43430A1.hcd
> > -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5brcm43438.service
> > -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5_%.bbappend
> > -   meta-raspberrypi/recipes-core
> > -   meta-raspberrypi/recipes-core/images
> > -   meta-raspberrypi/recipes-core/images/rpi-basic-image.bb
> > -   meta-raspberrypi/recipes-core/images/rpi-hwup-image.bb
> > -   meta-raspberrypi/recipes-core/images/rpi-test-image.bb
> > -   meta-raspberrypi/recipes-core/packagegroups
> > -   meta-raspberrypi/recipes-core/packagegroups/packagegroup-rpi-test.bb
> > -   meta-raspberrypi/recipes-core/psplash
> > -   meta-raspberrypi/recipes-core/psplash/files
> > -   meta-raspberrypi/recipes-core/psplash/files/psplash-raspberrypi-img.h
> > -   meta-raspberrypi/recipes-core/psplash/psplash_git.bbappend
> > -   meta-raspberrypi/recipes-core/udev
> > -   meta-raspberrypi/recipes-core/udev/udev-rules-rpi
> > -   meta-raspberrypi/recipes-core/udev/udev-rules-rpi/99-com.rules
> > -   meta-raspberrypi/recipes-core/udev/udev-rules-rpi.bb
> > -   meta-raspberrypi/recipes-devtools
> > -   meta-raspberrypi/recipes-devtools/bcm2835
> > -   meta-raspberrypi/recipes-devtools/bcm2835/bcm2835_1.52.bb
> > -   meta-raspberrypi/recipes-devtools/pi-blaster
> > -   meta-raspberrypi/recipes-devtools/pi-blaster/files
> > -   meta-raspberrypi/recipes-devtools/pi-blaster/files/*.patch
> > -   meta-raspberrypi/recipes-devtools/pi-blaster/pi-blaster_git.bb
> > -   meta-raspberrypi/recipes-devtools/python
> > -   meta-raspberrypi/recipes-devtools/python/python-rtimu
> > -   meta-raspberrypi/recipes-devtools/python/python-rtimu/*.patch
> > -   meta-raspberrypi/recipes-devtools/python/python-rtimu_git.bb
> > -   meta-raspberrypi/recipes-devtools/python/python-sense-hat_2.2.0.bb
> > -   meta-raspberrypi/recipes-devtools/python/rpi-gpio
> > -   meta-raspberrypi/recipes-devtools/python/rpi-gpio/*.patch
> > -   meta-raspberrypi/recipes-devtools/python/rpi-gpio_0.6.3.bb
> > -   meta-raspberrypi/recipes-devtools/python/rpio
> > -   meta-raspberrypi/recipes-devtools/python/rpio/*.patch
> > -   meta-raspberrypi/recipes-devtools/python/rpio_0.10.0.bb
> > -   meta-raspberrypi/recipes-devtools/wiringPi
> > -   meta-raspberrypi/recipes-devtools/wiringPi/files
> > -   meta-raspberrypi/recipes-devtools/wiringPi/files/*.patch
> > -   meta-raspberrypi/recipes-devtools/wiringPi/wiringpi_git.bb
> > -   meta-raspberrypi/recipes-graphics
> > -   meta-raspberrypi/recipes-graphics/eglinfo
> > -   meta-raspberrypi/recipes-graphics/eglinfo/eglinfo-fb_%.bbappend
> > -   meta-raspberrypi/recipes-graphics/eglinfo/eglinfo-x11_%.bbappend
> > -   meta-raspberrypi/recipes-graphics/mesa
> > -   meta-raspberrypi/recipes-graphics/mesa/mesa-gl_%.bbappend
> > -   meta-raspberrypi/recipes-graphics/mesa/mesa_%.bbappend
> > -   meta-raspberrypi/recipes-graphics/userland
> > -   meta-raspberrypi/recipes-graphics/userland/userland
> > -   meta-raspberrypi/recipes-graphics/userland/userland/*.patch
> > -   meta-raspberrypi/recipes-graphics/userland/userland_git.bb
> > -   meta-raspberrypi/recipes-graphics/vc-graphics
> > -   meta-raspberrypi/recipes-graphics/vc-graphics/files
> > -   meta-raspberrypi/recipes-graphics/vc-graphics/files/egl.pc
> > -   meta-raspberrypi/recipes-graphics/vc-graphics/files/vchiq.sh
> > -   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics-hardfp.bb
> > -   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics.bb
> > -   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics.inc
> > -   meta-raspberrypi/recipes-graphics/wayland
> > -   meta-raspberrypi/recipes-graphics/wayland/weston_%.bbappend
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf.d
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf.d/10-evdev.conf
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf.d/98-pitft.conf
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rpi/xorg.conf.d/99-calibration.conf
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
> > -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
> > -   meta-raspberrypi/recipes-kernel
> > -   meta-raspberrypi/recipes-kernel/linux-firmware
> > -   meta-raspberrypi/recipes-kernel/linux-firmware/files
> > -   meta-raspberrypi/recipes-kernel/linux-firmware/files/brcmfmac43430-sdio.bin
> > -   meta-raspberrypi/recipes-kernel/linux-firmware/files/brcfmac43430-sdio.txt
> > -   meta-raspberrypi/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> > -   meta-raspberrypi/recipes-kernel/linux
> > -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi-dev.bb
> > -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi.inc
> > -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.14.bb
> > -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb
> > -   meta-raspberrypi/recipes-multimedia
> > -   meta-raspberrypi/recipes-multimedia/gstreamer
> > -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx
> > -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx/*.patch
> > -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx_%.bbappend
> > -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
> > -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx-1.12
> > -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx-1.12/*.patch
> > -   meta-raspberrypi/recipes-multimedia/omxplayer
> > -   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer
> > -   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer/*.patch
> > -   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer_git.bb
> > -   meta-raspberrypi/recipes-multimedia/x264
> > -   meta-raspberrypi/recipes-multimedia/x264/x264_git.bbappend
> > -   meta-raspberrypi/wic meta-raspberrypi/wic/sdimage-raspberrypi.wks
> > +  ├── classes/
> > +  │   └── sdcard_image-rpi.bbclass
> > +  ├── conf/
> > +  │   ├── layer.conf
> > +  │   └── machine/
> > +  ├── COPYING.MIT
> > +  ├── docs/
> > +  ├── dynamic-layers/
> > +  │   ├── meta-python/
> > +  │   ├── multimedia-layer/
> > +  │   ├── networking-layer/
> > +  │   ├── openembedded-layer/
> > +  │   └── qt5-layer/
> > +  ├── files/
> > +  │   └── custom-licenses/
> > +  ├── kas-poky-rpi.yml
> > +  ├── lib/
> > +  │   └── oeqa/
> > +  ├── README.md
> > +  ├── recipes-bsp/
> > +  │   ├── armstubs/
> > +  │   ├── bootfiles/
> > +  │   ├── common/
> > +  │   ├── formfactor/
> > +  │   ├── gpio-shutdown/
> > +  │   ├── rpi-eeprom/
> > +  │   ├── rpi-u-boot-scr/
> > +  │   └── u-boot/
> > +  ├── recipes-connectivity/
> > +  │   ├── bluez5/
> > +  │   └── pi-bluetooth/
> > +  ├── recipes-core/
> > +  │   ├── images/
> > +  │   ├── packagegroups/
> > +  │   ├── psplash/
> > +  │   └── udev/
> > +  ├── recipes-devtools/
> > +  │   ├── bcm2835/
> > +  │   ├── pi-blaster/
> > +  │   ├── python/
> > +  │   ├── raspi-gpio/
> > +  │   └── raspi-utils/
> > +  ├── recipes-graphics/
> > +  │   ├── cairo/
> > +  │   ├── kmscube/
> > +  │   ├── libsdl2/
> > +  │   ├── libva/
> > +  │   ├── mesa/
> > +  │   ├── piglit/
> > +  │   ├── raspidmx/
> > +  │   ├── userland/
> > +  │   ├── vc-graphics/
> > +  │   ├── wayland/
> > +  │   └── xorg-xserver/
> > +  ├── recipes-kernel/
> > +  │   ├── bluez-firmware-rpidistro/
> > +  │   ├── linux/
> > +  │   └── linux-firmware-rpidistro/
> > +  ├── recipes-multimedia/
> > +  │   ├── gstreamer/
> > +  │   ├── omxplayer/
> > +  │   ├── picamera-libs/
> > +  │   ├── python3-picamera/
> > +  │   ├── rpidistro-ffmpeg/
> > +  │   └── x264/
> > +  ├── recipes-sato/
> > +  │   └── libwpe_%.bbappend
> > +  ├── SECURITY.md
> > +  └── wic/
> > +      └── sdimage-raspberrypi.wks
>
> Code blocks need to be indented with three spaces (here two).
>
> I think it would be good to keep at least one directory showing the
> structure for a recipe (the bb file, a patch, etc), like
> python-rtimu in the previous code block for example.

  ok, i'll hold off until others have a chance to opine on this.

rday
--8323329-806441173-1750163574=:1411176--

