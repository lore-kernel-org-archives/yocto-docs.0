Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7723C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:23:19 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.5544.1741688597047747150
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 03:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bSBtTrvx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB02144280;
	Tue, 11 Mar 2025 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741688595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCR9nzHuZmC+r2e3vahtaxIwXKF8kgf4BepnEotSQDo=;
	b=bSBtTrvxiCtA1Pld+lni77newGUv/d1BBqGgpw0WieO2RlsbfgXFpHEwOFuo9O8wff0FOg
	txrNuXbkrfXyW9VG06d5YptWOzBrEKv1Iu0c8xnXI8pexsk/jMJ1ET1QJMjcwauiS83z+P
	5oUYe+zmhP8lLxhjkYFZqeGG440GFlbJH30lx5GDCcmxp9aiET62wDA5ipRPlux7YbBlEA
	NvqdJL9xvM8aBWxgxy8vKBXCaSiwXUdF0bngojemDy9EuK5zzYJluv6SXwn2ZojXDTMHrB
	/7kxOV2EOA1AxPaJU+ao+MLas+ofCAvZgEnw3y9zOQM3aXHdg1eoANMXctWamQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 11:23:12 +0100
Message-Id: <D8DD2THTA6OT.2RNM0A3UISNVQ@bootlin.com>
Subject: Re: [PATCH v3] ref-manual: uboot-sign: Add how to enable ATF, TEE
 and User defined snippet ITS for U-Boot FIT image
Cc: <troy_lee@aspeedtech.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Jamin Lin" <jamin_lin@aspeedtech.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250307081422.718699-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20250307081422.718699-1-jamin_lin@aspeedtech.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdduleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtffdtvdevheetffeiffekveffgeehfeffgfeigeelkeejjeelkeejudeftdelieenucffohhmrghinhepuggvnhigrdguvgdpuhhimhgrghgvrdhfihhtpdgvlhhinhhugidrohhrghdpthhruhhsthgvughfihhrmhifrghrvgdrohhrghdpohhsfhifrdhfohhunhgurghtihhonhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjr
 ghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 10:23:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6529

Hi Jamin,

On Fri Mar 7, 2025 at 9:14 AM CET, Jamin Lin wrote:
> Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image gene=
ration.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  documentation/ref-manual/classes.rst   |  13 ++++
>  documentation/ref-manual/variables.rst | 102 +++++++++++++++++++++++++
>  2 files changed, 115 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index b93279ff6..02749df3d 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3401,6 +3401,19 @@ The variables used by this class are:
>  -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT =
image.
>  -  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` whe=
n
>     rebuilding the FIT image containing the kernel.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`: include the Trusted Firmware-=
A (TF-A) image
> +   in the U-Boot FIT image.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`: specifies the path to t=
he
> +   Trusted Firmware-A (TF-A) image.
> +-  :term:`UBOOT_FIT_TEE`: include the Trusted Execution Environment (TEE=
) image in the
> +   U-Boot FIT image.
> +-  :term:`UBOOT_FIT_TEE_IMAGE`: specifies the path to the Trusted Execut=
ion Environment
> +   (TEE) image.
> +-  :term:`UBOOT_FIT_USER_SETTINGS`: adds a user-specific snippet to the =
ITS. Users can
> +   include their custom ITS snippet in this variable.
> +-  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds one or more user-defined =
images to the
> +   loadables property of the configuration node. It should be a comma-se=
parated list of
> +   strings and each string needs to be surrounded by quotes too.
> =20
>  See U-Boot's documentation for details about `verified boot
>  <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verif=
ied-boot.txt>`__
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 60984cc8f..3c7e627f5 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9826,6 +9826,28 @@ system and gives an overview of their function and=
 contents.
> =20
>        See `more details about #address-cells <https://elinux.org/Device_=
Tree_Usage#How_Addressing_Works>`__.
> =20
> +   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`
> +      Trusted Firmware-A (TF-A) <https://www.trustedfirmware.org/project=
s/tf-a> is a reference implementation of

Can you use the hyperlink syntax instead:

  `Trusted Firmware-A (TF-A) <https://www.trustedfirmware.org/projects/tf-a=
>`__

Also when possible try to wrap the lines to 80 chars, as per our standards.=
md
file.

> +      secure world software for Arm A-Profile architectures
> +      (Armv8-A and Armv7-A), including an Exception Level 3 (EL3) Secure=
 Monitor. This variable enables the
> +      generation of a U-Boot FIT image with an Trusted Firmware-A (TF-A)=
 image.
> +
> +      Its default value is "0", so set it to "1" to enable this function=
ality::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE =3D "1"
> +
> +   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`
> +      Specifies the path to the Trusted Firmware-A (TF-A) image. Its def=
ault value is "bl31.bin"::

I suppose this path is relative to $DEPLOY_DIR_IMAGE? Or $B? Can you maybe
specify this here?

Same for the UBOOT_*_IMAGE variables added by this patch.

> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?=3D "bl31.bin"
> +
> +   :term:`UBOOT_FIT_CONF_USER_LOADABLES`
> +      Adds one or more user-defined images to the ``loadables`` property=
 of the configuration node
> +      of the U-Boot Image Tree Source (ITS). It should be a comma-separa=
ted list of strings and
> +      each string needs to be surrounded by quotes too, e.g.::
> +
> +         UBOOT_FIT_CONF_USER_LOADABLES =3D '\"fwa\", \"fwb\"'
> +
>     :term:`UBOOT_FIT_DESC`
>        Specifies the description string encoded into a U-Boot fitImage. T=
he default
>        value is set by the :ref:`ref-classes-uboot-sign` class as follows=
::
> @@ -9874,6 +9896,86 @@ system and gives an overview of their function and=
 contents.
>        of bits. The default value for this variable is set to "2048"
>        by the :ref:`ref-classes-uboot-sign` class.
> =20
> +   :term:`UBOOT_FIT_TEE`
> +      A Trusted Execution Environment (TEE) is a secure environment for =
executing
> +      code, ensuring high levels of trust in asset management within the
> +      surrounding system. This variable enables the generation of a U-Bo=
ot FIT
> +      image with a Trusted Execution Environment (TEE) image.
> +
> +      Its default value is "0", so set it to "1" to enable this function=
ality::
> +
> +         UBOOT_FIT_TEE =3D "1"
> +
> +   :term:`UBOOT_FIT_TEE_IMAGE`
> +      Specifies the path to the Trusted Execution Environment (TEE) imag=
e. Its
> +      default value is "tee-raw.bin"::
> +
> +         UBOOT_FIT_TEE_IMAGE ?=3D "tee-raw.bin"
> +
> +   :term:`UBOOT_FIT_USER_SETTINGS`
> +      Add a user-specific snippet to the U-Boot Image Tree Source (ITS).=
 This variable
> +      allows the user to add one or more user-defined ``/images`` node t=
o the U-Boot
> +      Image Tree Source (ITS). For more details, please refer to <https:=
//fitspec.osfw.foundation/>.

You can remove <> surrounding the link here

> +
> +      The original contents of the U-Boot Image Tree Source (ITS) are as=
 follows::
> +
> +         images {
> +             uboot {
> +                 description =3D "U-Boot image";
> +                 data =3D /incbin/("u-boot-nodtb.bin");
> +                 type =3D "standalone";
> +                 os =3D "u-boot";
> +                 arch =3D "";
> +                 compression =3D "none";
> +                 load =3D <0x80000000>;
> +                 entry =3D <0x80000000>;
> +             };
> +         };
> +
> +      Users can include their custom ITS snippet in this variable, e.g.:=
:
> +
> +         UBOOT_FIT_FWA_ITS =3D '\
> +             fwa {\n\
> +                 description =3D \"FW A\";\n\
> +                 data =3D /incbin/(\"fwa.bin\");\n\
> +                 type =3D \"firmware\";\n\
> +                 arch =3D \"\";\n\
> +                 os =3D \"\";\n\
> +                 load =3D <0xb2000000>;\n\
> +                 entry =3D <0xb2000000>;\n\
> +                 compression =3D \"none\";\n\
> +             };\n\
> +         '
> +
> +         UBOOT_FIT_USER_SETTINGS =3D "${UBOOT_FIT_FWA_ITS}"
> +
> +      Newlines are stripped, and if they need to be included, they must =
be explicitly added using ``\n``.
> +
> +      The generated contents of the U-Boot Image Tree Source (ITS) are a=
s follows::
> +
> +          images {
> +              uboot {
> +                  description =3D "U-Boot image";
> +                  data =3D /incbin/("u-boot-nodtb.bin");
> +                  type =3D "standalone";
> +                  os =3D "u-boot";
> +                  arch =3D "";
> +                  compression =3D "none";
> +                  load =3D <0x80000000>;
> +                  entry =3D <0x80000000>;
> +              };
> +              fwa {
> +                  description =3D "FW A";
> +                  data =3D /incbin/("fwa.bin");
> +                  type =3D "firmware";
> +                  arch =3D "";
> +                  os =3D "";
> +                  load =3D <0xb2000000>;
> +                  entry =3D <0xb2000000>;
> +                  compression =3D "none";
> +              };
> +          };
> +
>     :term:`UBOOT_FITIMAGE_ENABLE`
>        This variable allows to generate a FIT image for U-Boot, which is =
one
>        of the ways to implement a verified boot process.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

