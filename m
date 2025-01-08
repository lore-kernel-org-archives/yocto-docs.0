Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5093DE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:31:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.22424.1736350272314332499
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 07:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IczA/hVb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 168C640011;
	Wed,  8 Jan 2025 15:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736350270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YARO3puIWvfnN0PLn2ZytTjnYuzVz1bRFmjGkMSj5BI=;
	b=IczA/hVbGoQBpsLTQXb2U16U4PK/Om3/tkt6CCyP4rWT8QFBcAliBi1nsacLO+bDvejj6N
	X1gNhLHa3CL7IRzpHfa2jq2tZm24g69eVk8PBSR7I/jyiCH8LpDqUht1oRUcK8BzcRO+T7
	7TafT5DoW1BzIdPVIC0HTt0vdm31duiWtT27SjVKqK7nd5nyyQyg6b9B5IfJ6rk/6LcCuU
	9tY3lqFHVRnZm79hzPmWn+3bWKulBvVrh5eFX8KG2KWbmaRfQgmbVlSh5N6JvK+/728Isb
	3UlX6wd6vDRUEkdNdOUPN/nnqVUVwG5IcLlAwrxpuAZMcGiEiQJChQ9i1Ef7AA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 16:31:09 +0100
Message-Id: <D6WSSTWDW44E.3VZKMQHM8HZLN@bootlin.com>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mark Hatle" <mark.hatle@kernel.crashing.org>,
 <docs@lists.yoctoproject.org>
Subject: Re: Best practices documentation for multiconfigs
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <cb8cda4b-4b71-4896-b355-d628336b11a4@kernel.crashing.org>
In-Reply-To: <cb8cda4b-4b71-4896-b355-d628336b11a4@kernel.crashing.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jan 2025 15:31:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6065

Hi Mark,

Thanks for this. I can help with formatting as well as where to put this bi=
t of
documentation.

I already created a bug for this, you can add yourself to CC if you want to
track it: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15709.

First thought: compared to what we currently have [1], your doc seems to br=
ing
better details on multiconfigs. I'm thinking we could merge both to have a
complete document on multiconfigs (and also make it its own document instea=
d of
a "Building" subsection).

Other comments below.

[1]: https://docs.yoctoproject.org/dev-manual/building.html#building-images=
-for-multiple-targets-using-multiple-configurations

On Wed Jan 8, 2025 at 12:07 AM CET, Mark Hatle wrote:
> I was talking to Richard on IRC and we think that we need to start collec=
ting=20
> and documenting examples and/or best practices for multiconfig usage.  Be=
low is=20
> my question attempt at starting this.  Hopefully we can expand this to so=
mething=20
> generally useful.  What follows is a bit rough, and will likely need edit=
ing...
>
>
> A common use for multiconfig is to use the default configuration as the r=
egular=20
> Linux build, while one or more multiconfigs can be used to build special=
=20
> components (often baremetal firmware.)  Enabling this workflow requires u=
s to do=20
> three primary actions:
>
>    1) Configure the multiconfig builds
>    2) Use multiconfig dependencies to trigger builds of necessary compone=
nts
>    3) Pick up the output of the multiconfig build and bring it into a dif=
ferent=20
> config
>
> In order to successfully do the above, the following could be considered =
to be=20
> best practices.
>
> Configuration:
>
> All of the (user) configuration starts with the local.conf file.  A defau=
lt=20
> value of:
>
> TMPDIR ?=3D "${TOPDIR}/tmp"
>
> is used to control the location for temporary build items, where componen=
ts are=20
> stored and built components are deployed.  For the deployed items the set=
tings are:
>
> DEPLOY_DIR ?=3D "${TMPDIR}/deploy"
> DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
>
>
> Each multiconfig requires a separate multiconfig configuration file.
>
> See:=20
> https://docs.yoctoproject.org/dev-manual/building.html#building-images-fo=
r-multiple-targets-using-multiple-configurations
>
>
> At a minimum a different TMPDIR is required for each multiconfig.  As a b=
est=20
> practice, instead of defining each TMPDIR separately, if they are defined=
 as an=20
> append (.=3D operation) with an expected format, later steps can use this=
=20
> information to find the output of the build.  For example:
>
> TMPDIR .=3D "-${BB_CURRENT_MC}"
>
>
> This also has the side effect that if the user changes the default TMPDIR=
=20
> location in local.conf, all of the multiconfigs will follow with the same=
 change=20
> automatically.
>
>
> For example:
>
> conf/multiconfig/baremetal-firmware.conf:
>
> TMPDIR .=3D "-${BB_CURRENT_MC}"

I assumed the `:append` override to be better practice in configuration fil=
es.

> TCLIBC =3D "newlib"
>
>
> and a custom recipe called 'my-firmware.bb' that uses newlib to build bar=
emetal=20
> firmware for the device.  my-firmware.bb should define a do_deploy functi=
on that=20
> deploys the baremetal firmware to ${DEPLOYDIR} with a specific name, such=
 as=20
> "my-firmware.elf".
>
>
> Building:
>
> Using an 'mcdepend' a recipe in one multiconfig can trigger the build in =
another=20
> multiconfig, such as:
>
>
> my-special-firmware.bb:
>
> do_compile[mcdepends] =3D "mc::baremetal-firmware:my-firmware:do_deploy"
>
>
> The above will ensure when do_compile is triggered, it further triggers t=
he=20
> multiconfig build which will deploy the built firmware.

Yes and actually this is lacking in the current documentation: this is the
way to add a dependency on a multiconfig from the default ("" empty string)
config, which is a common use-case of multiconfigs I believe.

>
>
>
> Using the output of the build:
>
> However, just because we've built the item using mcdepends, we need to us=
e the=20
> output in some way.   We can make a series of assumptions, based on the d=
efault=20
> Yocto Project variables in order to get the binary for packaging.
>
> Adding a do_install task to the example above:
>
> my-special-firmware.bb:
>
> do_install() {
>     install -Dm 0644 ${TMPDIR}-baremetal-firmware/deploy/my-firmware.elf=
=20
> ${D}/lib/firmware/my-firmware.elf
> }

In my-firmware.bb, is deploying to DEPLOYDIR (defined as "${WORKDIR}/deploy=
-my-firmware"
for the recipe) enough for my-special-firmware to pick up the firmware in
baremetal-firmware's DEPLOY_DIR ("${TMPDIR}-baremetal-firmware/deploy") her=
e?
Shouldn't it pick it up in baremetal-firmware's DEPLOY_DIR_IMAGE instead?

>
>
> Doing the above will allow the firmware binary to be transfered and packa=
ged=20
> into the Linux context and rootfs.  However, this only works if we are ca=
reful=20
> to not affect TMPDIR outside of specific places, and we use the default=
=20
> DEPLOY_DIR (or other) deployment variables.
>
>
> Suggested best practices:
>
> TMPDIR (other then the default set in bitbake.conf) is only set in local.=
conf by=20
> the user.  This means that we should NOT manipulate TMPDIR in any way wit=
hin the=20
> machine or distro .conf files.
>
> A multiconfig must specify a TMPDIR, and should specify it by appending t=
he=20
> multiconfig name via "-${BB_CURRENT_MC}".
>
> All recipes should following the best practices for do_install and do_dep=
loy.
>
> Recipes that are used to transfer the output from a multiconfig target sh=
ould=20
> use task[mcdepends] to trigger the build of the component, and then trans=
fer the=20
> item to the current configuration in do_install or do_deploy, assuming th=
e value=20
> of the deployed item based on the TMPDIR.
>
> Suggested that the dependency and path are specific in a variable to make=
 it=20
> easier to adjust as assumptions change, or the user has specific environm=
ent needs.

Not sure I got this sentence, could you explain what you meant here?

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

Suggestion: "bberror" for visibility?

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


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

