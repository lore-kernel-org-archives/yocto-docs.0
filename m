Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9992E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 23:37:26 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.6928.1736293045941530137
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 15:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wfy/pck2;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so17056959e87.0
        for <docs@lists.yoctoproject.org>; Tue, 07 Jan 2025 15:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736293044; x=1736897844; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtF9eYKeij0xIGGDxRVHtNLpLC8wHbNBzdU+72AZwjk=;
        b=Wfy/pck2LvldWXjMvqFW+729cyu4L6RrTvyOShL2XFnmYPorlz6ZrP1BTPQN4xS0+8
         hlum/PlZ2YWl814hlrzERJ75SbSIr6B50RAPZF0mzp71tePRkYc2qOkKn1o7Y9pIXAbI
         tiJR29w9jhu5E0fCHjhDqhMpP1kQWqJNrTEXjBNlqIcYZMmxou7GV4hpiZlYVaEyNVDp
         rWN1CyFy8oKwruexLHd0PRHWxKoZUuog5MZWIn4ifnRrCFWXePjlyXjP1CvCbd0vKD/j
         73g5yKCC9a9OAUAmyffAozfJdJyqBc4EGPGzCHE2DCvV/LoYRUnGgcYZv+Y43AZ81BJV
         W0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736293044; x=1736897844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtF9eYKeij0xIGGDxRVHtNLpLC8wHbNBzdU+72AZwjk=;
        b=rarmJkYAz6buhWUaJ/ZfjmHXNVA3enK0ZB3fBwpYzdC3X7V22l4wFw/XLfjLb4ja70
         iLLQNIPKNxc+D7TTF52mAJJJD6bmPkerCp4oOht6pU6wk4IlD9k4uufcPhx/amh9rmIc
         1wDdkq4ehSNrSBGf76Der+LiLf5/SqguW8JeRIWYilTc1LGjLZvlGL56plfIl5PvkyYm
         l8GocGKKYMWgEKqBgOw6eC9MQ8/mTR80VJ7lxSdgGvB0sfNTpdCfI50tVS4LOdkXYx78
         MHUnvfQQgFwSSYdClsjSI112P3jTjdkvx7XMM4Dg/ZQdJq9ZXmHPbumKa5trenP6LfVr
         0hmw==
X-Gm-Message-State: AOJu0YxPng9752AYTAoEE4hoMCNHkSEHUMN40pJHFs+dHIkC0r87fKEK
	ErcBosRG1RFzK0VBn6YYoR7uEdPCWjQ73toRA6pOvR+scf5MEAp0nRzxQCdLMhy3S/F7Q/pX+9m
	GzerL/WAAntdmyHxGGWnUc+fAeAM=
X-Gm-Gg: ASbGncsMAvdbDVlfrXxSm0KnCDeX/W6uYerWT0H5X0ds2a/DJJu/Ne3sjmYy8HzRRKb
	ILzSongxOr6VTdR+HYosqy3NwL/Z92UQQRjn+dJtOY1czVc+Ua2uS
X-Google-Smtp-Source: AGHT+IG9l0xHJGalAz6iM7Tx48MmqqxnO6WGAd22bhthr5w3ZhIXqBXlaUMI6sJu8htaJQulRw3yMoYBaDtzEem3meQ=
X-Received: by 2002:a05:6512:68e:b0:53f:232e:31ea with SMTP id
 2adb3069b0e04-5428481c6a3mr141628e87.54.1736293043707; Tue, 07 Jan 2025
 15:37:23 -0800 (PST)
MIME-Version: 1.0
References: <cb8cda4b-4b71-4896-b355-d628336b11a4@kernel.crashing.org>
In-Reply-To: <cb8cda4b-4b71-4896-b355-d628336b11a4@kernel.crashing.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 7 Jan 2025 16:37:11 -0700
X-Gm-Features: AbW1kvb_FBYttJ0hf7j67wGW1OnPfJc0rwYl4aGdaH23szabB-SZWFBoMs48M-8
Message-ID: <CAJdd5GZY6-QwiJQM1KjQN1=GpSL_po4ay_hahvx4+Miz59vJVg@mail.gmail.com>
Subject: Re: [docs] Best practices documentation for multiconfigs
To: mark.hatle@kernel.crashing.org
Cc: docs@lists.yoctoproject.org, antonin.godard@bootlin.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Jan 2025 23:37:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6063

This seems good to me and is inline with how we use multiconfig

FWIW, we also use "inter-multiconfig" dependencies also (where one
multiconfig pulls in deployed files from another), but I don't think
anything in the proposal prevents that from working.

On Tue, Jan 7, 2025 at 4:09=E2=80=AFPM Mark Hatle via lists.yoctoproject.or=
g
<mark.hatle=3Dkernel.crashing.org@lists.yoctoproject.org> wrote:
>
> I was talking to Richard on IRC and we think that we need to start collec=
ting
> and documenting examples and/or best practices for multiconfig usage.  Be=
low is
> my question attempt at starting this.  Hopefully we can expand this to so=
mething
> generally useful.  What follows is a bit rough, and will likely need edit=
ing...
>
>
> A common use for multiconfig is to use the default configuration as the r=
egular
> Linux build, while one or more multiconfigs can be used to build special
> components (often baremetal firmware.)  Enabling this workflow requires u=
s to do
> three primary actions:
>
>    1) Configure the multiconfig builds
>    2) Use multiconfig dependencies to trigger builds of necessary compone=
nts
>    3) Pick up the output of the multiconfig build and bring it into a dif=
ferent
> config
>
> In order to successfully do the above, the following could be considered =
to be
> best practices.
>
> Configuration:
>
> All of the (user) configuration starts with the local.conf file.  A defau=
lt
> value of:
>
> TMPDIR ?=3D "${TOPDIR}/tmp"
>
> is used to control the location for temporary build items, where componen=
ts are
> stored and built components are deployed.  For the deployed items the set=
tings are:
>
> DEPLOY_DIR ?=3D "${TMPDIR}/deploy"
> DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
>
>
> Each multiconfig requires a separate multiconfig configuration file.
>
> See:
> https://docs.yoctoproject.org/dev-manual/building.html#building-images-fo=
r-multiple-targets-using-multiple-configurations
>
>
> At a minimum a different TMPDIR is required for each multiconfig.  As a b=
est
> practice, instead of defining each TMPDIR separately, if they are defined=
 as an
> append (.=3D operation) with an expected format, later steps can use this
> information to find the output of the build.  For example:
>
> TMPDIR .=3D "-${BB_CURRENT_MC}"
>
>
> This also has the side effect that if the user changes the default TMPDIR
> location in local.conf, all of the multiconfigs will follow with the same=
 change
> automatically.
>
>
> For example:
>
> conf/multiconfig/baremetal-firmware.conf:
>
> TMPDIR .=3D "-${BB_CURRENT_MC}"
> TCLIBC =3D "newlib"
>
>
> and a custom recipe called 'my-firmware.bb' that uses newlib to build bar=
emetal
> firmware for the device.  my-firmware.bb should define a do_deploy functi=
on that
> deploys the baremetal firmware to ${DEPLOYDIR} with a specific name, such=
 as
> "my-firmware.elf".
>
>
> Building:
>
> Using an 'mcdepend' a recipe in one multiconfig can trigger the build in =
another
> multiconfig, such as:
>
>
> my-special-firmware.bb:
>
> do_compile[mcdepends] =3D "mc::baremetal-firmware:my-firmware:do_deploy"
>
>
> The above will ensure when do_compile is triggered, it further triggers t=
he
> multiconfig build which will deploy the built firmware.
>
>
>
> Using the output of the build:
>
> However, just because we've built the item using mcdepends, we need to us=
e the
> output in some way.   We can make a series of assumptions, based on the d=
efault
> Yocto Project variables in order to get the binary for packaging.
>
> Adding a do_install task to the example above:
>
> my-special-firmware.bb:
>
> do_install() {
>     install -Dm 0644 ${TMPDIR}-baremetal-firmware/deploy/my-firmware.elf
> ${D}/lib/firmware/my-firmware.elf
> }
>
>
> Doing the above will allow the firmware binary to be transfered and packa=
ged
> into the Linux context and rootfs.  However, this only works if we are ca=
reful
> to not affect TMPDIR outside of specific places, and we use the default
> DEPLOY_DIR (or other) deployment variables.
>
>
> Suggested best practices:
>
> TMPDIR (other then the default set in bitbake.conf) is only set in local.=
conf by
> the user.  This means that we should NOT manipulate TMPDIR in any way wit=
hin the
> machine or distro .conf files.
>
> A multiconfig must specify a TMPDIR, and should specify it by appending t=
he
> multiconfig name via "-${BB_CURRENT_MC}".
>
> All recipes should following the best practices for do_install and do_dep=
loy.
>
> Recipes that are used to transfer the output from a multiconfig target sh=
ould
> use task[mcdepends] to trigger the build of the component, and then trans=
fer the
> item to the current configuration in do_install or do_deploy, assuming th=
e value
> of the deployed item based on the TMPDIR.
>
> Suggested that the dependency and path are specific in a variable to make=
 it
> easier to adjust as assumptions change, or the user has specific environm=
ent needs.
>
>
> (we should have some proper examples for this.... i.e.)
>
> conf/multiconfig/baremetal-firmware.conf:
>
> TMPDIR .=3D "-${BB_CURRENT_MC}"
> TCLIBC =3D "newlib"
>
> recipes-firmware/firmware/my-firmware.bb:
>
> do_compile() {
>     echo "testing" > ${B}/my-firmware.bin
>
> do_install() {
>     install -mD 0644 ${B}/my-firmware.bin ${D}/lib/firmware/my-firmware.b=
in
> }
>
> do_deploy() {
>     install -mD 0644 ${B}/my-firmware.bin ${DEPLOYDIR}/my-firmware.bin
> }
>
> recipes-firmware/firmware/my-special-firmware.bb:
>
> INHIBIT_DEFAULT_DEPS =3D "1"
>
> FIRMWARE_DEPENDS   ??=3D ""
> FIRMWARE_MCDEPENDS ??=3D "mc::baremetal-firmware:my-firmware:do_deploy"
> FIRMWARE_FILE      ??=3D "${TMPDIR}-baremetal-firmware/deploy/my-firmware=
.elf"
> FIRMWARE_FILE[vardepsexclude] +=3D "TMPDIR"
>
> do_install() {
>      if [ ! -e ${FIRMWARE_FILE} ]; then
>          echo "Unable to find FIRMWARE_FILE (${FIRMWARE_FILE})"
>          exit 1
>      fi
>
>      install -Dm 0644 ${FIRMWARE_FILE} ${D}/lib/firmware/${FIRMWARE_FILE}
> }
>
> do_deploy() {
>      if [ ! -e ${FIRMWARE_FILE} ]; then
>          echo "Unable to find FIRMWARE_FILE (${FIRMWARE_FILE})"
>          exit 1
>      fi
>
>      install -Dm 0644 ${FIRMWARE_FILE} ${DEPLOYDIR}/${FIRMWARE_FILE}
> }
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6062): https://lists.yoctoproject.org/g/docs/message/=
6062
> Mute This Topic: https://lists.yoctoproject.org/mt/110487932/3616693
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmai=
l.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

