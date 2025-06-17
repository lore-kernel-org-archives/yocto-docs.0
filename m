Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60659C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 12:12:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.17271.1750162360868191431
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 05:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WXILruc4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 899DA432C9;
	Tue, 17 Jun 2025 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750162358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V5U7tYoAOPonO5tKWuzlLAnlPtpthsMaFe649UtS1hM=;
	b=WXILruc42QwbgmNrk5Uu4fvGEsZQMEuEj8rFyR3OI/ywy4WfF5soYOulGwCF7UsYoQ7Z0i
	8yB/JJ+IrES1Q3q9K6/VU2rVowKrTx/7pkop5c1oxY2TGWzYECvC61XYfISRGMVmYApZb7
	zDxn47D4GpC8GCOdvVxM+Ll9mGNZvUEenZj2goKFF7CD8835VIeLTW52rDrXxXqHTQR4Bj
	bvGui75Uc9NTMLu01u3Ss2yxw8Kjiia3kxq8ueplfwlDaQa9tQBQpKmqtNcq143hFzIee4
	N0vyu0dhyUp9itYJuVC3nPjR9d6JULwQbNATPXjiPBGsEceMiH4ddwOYYXV/DA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 14:12:37 +0200
Message-Id: <DAOSRZNTWZPG.39BPC2BOM11M2@bootlin.com>
Subject: Re: [docs] [PATCH] bsp-guide: shorten contents of meta-raspberrypi
 layer
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <77b2c035-7eec-2c34-e433-55d0e713234c@crashcourse.ca>
In-Reply-To: <77b2c035-7eec-2c34-e433-55d0e713234c@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiudffvdfhgeduhfefkeetueeggefhieefheellefghfevhfdutdektedtgfdvnecuffhomhgrihhnpegtmhgurdhinhdphedvrdgssgdpudegrdgssgdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdro
 hhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 12:12:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7082

Hi,

On Tue Jun 17, 2025 at 11:52 AM CEST, Robert P. J. Day wrote:
>
> It seems overly verbose to list the entire contents of the
> meta-raspberrypi layer, so this replaces all of that output with a
> shortened version displaying only the more top-level directories,
> which still gives the reader a good idea of the overall structure of a
> BSP layer.
>
> If the reader wants more detail, they're free to check out the layer
> itself.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bs=
p.rst
> index 35972f172..97c9c1bf2 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -288,163 +288,82 @@ individual BSPs could differ. ::
>     meta-bsp_root_name/recipes-graphics/*
>     meta-bsp_root_name/recipes-kernel/linux/linux-yocto_kernel_rev.bbappe=
nd
>
> -Below is an example of the Raspberry Pi BSP layer that is available from
> -the :yocto_git:`Source Repositories <>`:
> +Below is the abbreviated content of the higher levels of the
> +``meta-raspberrypi`` BSP layer that is available from the
> +:yocto_git:`Source Repositories <>`:
>
>  .. code-block:: none
>
> -   meta-raspberrypi/COPYING.MIT
> -   meta-raspberrypi/README.md
> -   meta-raspberrypi/classes
> -   meta-raspberrypi/classes/sdcard_image-rpi.bbclass
> -   meta-raspberrypi/conf/
> -   meta-raspberrypi/conf/layer.conf
> -   meta-raspberrypi/conf/machine/
> -   meta-raspberrypi/conf/machine/raspberrypi-cm.conf
> -   meta-raspberrypi/conf/machine/raspberrypi-cm3.conf
> -   meta-raspberrypi/conf/machine/raspberrypi.conf
> -   meta-raspberrypi/conf/machine/raspberrypi0-wifi.conf
> -   meta-raspberrypi/conf/machine/raspberrypi0.conf
> -   meta-raspberrypi/conf/machine/raspberrypi2.conf
> -   meta-raspberrypi/conf/machine/raspberrypi3-64.conf
> -   meta-raspberrypi/conf/machine/raspberrypi3.conf
> -   meta-raspberrypi/conf/machine/include
> -   meta-raspberrypi/conf/machine/include/rpi-base.inc
> -   meta-raspberrypi/conf/machine/include/rpi-default-providers.inc
> -   meta-raspberrypi/conf/machine/include/rpi-default-settings.inc
> -   meta-raspberrypi/conf/machine/include/rpi-default-versions.inc
> -   meta-raspberrypi/conf/machine/include/tune-arm1176jzf-s.inc
> -   meta-raspberrypi/docs
> -   meta-raspberrypi/docs/Makefile
> -   meta-raspberrypi/docs/conf.py
> -   meta-raspberrypi/docs/contributing.md
> -   meta-raspberrypi/docs/extra-apps.md
> -   meta-raspberrypi/docs/extra-build-config.md
> -   meta-raspberrypi/docs/index.rst
> -   meta-raspberrypi/docs/layer-contents.md
> -   meta-raspberrypi/docs/readme.md
> -   meta-raspberrypi/files
> -   meta-raspberrypi/files/custom-licenses
> -   meta-raspberrypi/files/custom-licenses/Broadcom
> -   meta-raspberrypi/recipes-bsp
> -   meta-raspberrypi/recipes-bsp/bootfiles
> -   meta-raspberrypi/recipes-bsp/bootfiles/bcm2835-bootfiles.bb
> -   meta-raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bb
> -   meta-raspberrypi/recipes-bsp/common
> -   meta-raspberrypi/recipes-bsp/common/firmware.inc
> -   meta-raspberrypi/recipes-bsp/formfactor
> -   meta-raspberrypi/recipes-bsp/formfactor/formfactor
> -   meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi
> -   meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi/machco=
nfig
> -   meta-raspberrypi/recipes-bsp/formfactor/formfactor_%.bbappend
> -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src
> -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files
> -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files/boot.cmd.in
> -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/rpi-u-boot-scr.bb
> -   meta-raspberrypi/recipes-bsp/u-boot
> -   meta-raspberrypi/recipes-bsp/u-boot/u-boot
> -   meta-raspberrypi/recipes-bsp/u-boot/u-boot/*.patch
> -   meta-raspberrypi/recipes-bsp/u-boot/u-boot_%.bbappend
> -   meta-raspberrypi/recipes-connectivity
> -   meta-raspberrypi/recipes-connectivity/bluez5
> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5
> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5/*.patch
> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5/BCM43430A1.hcd
> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5brcm43438.service
> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5_%.bbappend
> -   meta-raspberrypi/recipes-core
> -   meta-raspberrypi/recipes-core/images
> -   meta-raspberrypi/recipes-core/images/rpi-basic-image.bb
> -   meta-raspberrypi/recipes-core/images/rpi-hwup-image.bb
> -   meta-raspberrypi/recipes-core/images/rpi-test-image.bb
> -   meta-raspberrypi/recipes-core/packagegroups
> -   meta-raspberrypi/recipes-core/packagegroups/packagegroup-rpi-test.bb
> -   meta-raspberrypi/recipes-core/psplash
> -   meta-raspberrypi/recipes-core/psplash/files
> -   meta-raspberrypi/recipes-core/psplash/files/psplash-raspberrypi-img.h
> -   meta-raspberrypi/recipes-core/psplash/psplash_git.bbappend
> -   meta-raspberrypi/recipes-core/udev
> -   meta-raspberrypi/recipes-core/udev/udev-rules-rpi
> -   meta-raspberrypi/recipes-core/udev/udev-rules-rpi/99-com.rules
> -   meta-raspberrypi/recipes-core/udev/udev-rules-rpi.bb
> -   meta-raspberrypi/recipes-devtools
> -   meta-raspberrypi/recipes-devtools/bcm2835
> -   meta-raspberrypi/recipes-devtools/bcm2835/bcm2835_1.52.bb
> -   meta-raspberrypi/recipes-devtools/pi-blaster
> -   meta-raspberrypi/recipes-devtools/pi-blaster/files
> -   meta-raspberrypi/recipes-devtools/pi-blaster/files/*.patch
> -   meta-raspberrypi/recipes-devtools/pi-blaster/pi-blaster_git.bb
> -   meta-raspberrypi/recipes-devtools/python
> -   meta-raspberrypi/recipes-devtools/python/python-rtimu
> -   meta-raspberrypi/recipes-devtools/python/python-rtimu/*.patch
> -   meta-raspberrypi/recipes-devtools/python/python-rtimu_git.bb
> -   meta-raspberrypi/recipes-devtools/python/python-sense-hat_2.2.0.bb
> -   meta-raspberrypi/recipes-devtools/python/rpi-gpio
> -   meta-raspberrypi/recipes-devtools/python/rpi-gpio/*.patch
> -   meta-raspberrypi/recipes-devtools/python/rpi-gpio_0.6.3.bb
> -   meta-raspberrypi/recipes-devtools/python/rpio
> -   meta-raspberrypi/recipes-devtools/python/rpio/*.patch
> -   meta-raspberrypi/recipes-devtools/python/rpio_0.10.0.bb
> -   meta-raspberrypi/recipes-devtools/wiringPi
> -   meta-raspberrypi/recipes-devtools/wiringPi/files
> -   meta-raspberrypi/recipes-devtools/wiringPi/files/*.patch
> -   meta-raspberrypi/recipes-devtools/wiringPi/wiringpi_git.bb
> -   meta-raspberrypi/recipes-graphics
> -   meta-raspberrypi/recipes-graphics/eglinfo
> -   meta-raspberrypi/recipes-graphics/eglinfo/eglinfo-fb_%.bbappend
> -   meta-raspberrypi/recipes-graphics/eglinfo/eglinfo-x11_%.bbappend
> -   meta-raspberrypi/recipes-graphics/mesa
> -   meta-raspberrypi/recipes-graphics/mesa/mesa-gl_%.bbappend
> -   meta-raspberrypi/recipes-graphics/mesa/mesa_%.bbappend
> -   meta-raspberrypi/recipes-graphics/userland
> -   meta-raspberrypi/recipes-graphics/userland/userland
> -   meta-raspberrypi/recipes-graphics/userland/userland/*.patch
> -   meta-raspberrypi/recipes-graphics/userland/userland_git.bb
> -   meta-raspberrypi/recipes-graphics/vc-graphics
> -   meta-raspberrypi/recipes-graphics/vc-graphics/files
> -   meta-raspberrypi/recipes-graphics/vc-graphics/files/egl.pc
> -   meta-raspberrypi/recipes-graphics/vc-graphics/files/vchiq.sh
> -   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics-hardfp.bb
> -   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics.bb
> -   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics.inc
> -   meta-raspberrypi/recipes-graphics/wayland
> -   meta-raspberrypi/recipes-graphics/wayland/weston_%.bbappend
> -   meta-raspberrypi/recipes-graphics/xorg-xserver
> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config
> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rp=
i
> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rp=
i/xorg.conf
> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rp=
i/xorg.conf.d
> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rp=
i/xorg.conf.d/10-evdev.conf
> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rp=
i/xorg.conf.d/98-pitft.conf
> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/rp=
i/xorg.conf.d/99-calibration.conf
> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config_0.=
1.bbappend
> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappen=
d
> -   meta-raspberrypi/recipes-kernel
> -   meta-raspberrypi/recipes-kernel/linux-firmware
> -   meta-raspberrypi/recipes-kernel/linux-firmware/files
> -   meta-raspberrypi/recipes-kernel/linux-firmware/files/brcmfmac43430-sd=
io.bin
> -   meta-raspberrypi/recipes-kernel/linux-firmware/files/brcfmac43430-sdi=
o.txt
> -   meta-raspberrypi/recipes-kernel/linux-firmware/linux-firmware_%.bbapp=
end
> -   meta-raspberrypi/recipes-kernel/linux
> -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi-dev.bb
> -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi.inc
> -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.14.bb
> -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb
> -   meta-raspberrypi/recipes-multimedia
> -   meta-raspberrypi/recipes-multimedia/gstreamer
> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx
> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx/*.patc=
h
> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx_%.bbap=
pend
> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
d_%.bbappend
> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx-1.12
> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx-1.12/*=
.patch
> -   meta-raspberrypi/recipes-multimedia/omxplayer
> -   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer
> -   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer/*.patch
> -   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer_git.bb
> -   meta-raspberrypi/recipes-multimedia/x264
> -   meta-raspberrypi/recipes-multimedia/x264/x264_git.bbappend
> -   meta-raspberrypi/wic meta-raspberrypi/wic/sdimage-raspberrypi.wks
> +  =E2=94=9C=E2=94=80=E2=94=80 classes/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 sdcard_image-rpi.bbc=
lass
> +  =E2=94=9C=E2=94=80=E2=94=80 conf/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 layer.conf
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 machine/
> +  =E2=94=9C=E2=94=80=E2=94=80 COPYING.MIT
> +  =E2=94=9C=E2=94=80=E2=94=80 docs/
> +  =E2=94=9C=E2=94=80=E2=94=80 dynamic-layers/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-python/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 multimedia-layer/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 networking-layer/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 openembedded-layer/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 qt5-layer/
> +  =E2=94=9C=E2=94=80=E2=94=80 files/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 custom-licenses/
> +  =E2=94=9C=E2=94=80=E2=94=80 kas-poky-rpi.yml
> +  =E2=94=9C=E2=94=80=E2=94=80 lib/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 oeqa/
> +  =E2=94=9C=E2=94=80=E2=94=80 README.md
> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-bsp/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 armstubs/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bootfiles/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 common/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 formfactor/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 gpio-shutdown/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 rpi-eeprom/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 rpi-u-boot-scr/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 u-boot/
> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-connectivity/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bluez5/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 pi-bluetooth/
> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-core/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 images/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 packagegroups/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 psplash/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 udev/
> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-devtools/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bcm2835/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pi-blaster/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 python/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 raspi-gpio/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 raspi-utils/
> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-graphics/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 cairo/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 kmscube/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 libsdl2/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 libva/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 mesa/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 piglit/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 raspidmx/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 userland/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 vc-graphics/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 wayland/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 xorg-xserver/
> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-kernel/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bluez-firmware-rpidi=
stro/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 linux/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 linux-firmware-rpidi=
stro/
> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-multimedia/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 gstreamer/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 omxplayer/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 picamera-libs/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 python3-picamera/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 rpidistro-ffmpeg/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 x264/
> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-sato/
> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libwpe_%.bbappend
> +  =E2=94=9C=E2=94=80=E2=94=80 SECURITY.md
> +  =E2=94=94=E2=94=80=E2=94=80 wic/
> +      =E2=94=94=E2=94=80=E2=94=80 sdimage-raspberrypi.wks

Code blocks need to be indented with three spaces (here two).

I think it would be good to keep at least one directory showing the structu=
re
for a recipe (the bb file, a patch, etc), like python-rtimu in the previous=
 code
block for example.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


