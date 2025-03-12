Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35ABFC28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 09:23:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.32772.1741771384506365515
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 02:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qz/IUqzx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA62844401;
	Wed, 12 Mar 2025 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741771382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4mc6en+zCV+Bcz+hrkwFNNyi3F0mCJaW8cmiu7LzJ84=;
	b=Qz/IUqzxn6kQehzJRa2+Svn2KEaEpY1MYXlUWjfo0Imj6V+Jj0iTe7expOS2tkgfevZRI7
	pPSnrExN7q/bH+e6IdPdBEPFie3mdUBvcXL/6SwyK3WWveG8tt5UvYjKR6vkYZ16Ds+Mac
	B1WslON+nHcWFB8DGzY0knmqCsz60K0disw2lze1+QfbdfP9Di4dGZHxHGBHSm/r7iTMJt
	7jHA+RfCzPyS9A6CZH7m4O99LUhkLrdOPICk+hL4fu75XcHwcui6NM0wckIMseOLOR8sy5
	3qr6kPChhhqECDdxl32zfgnk3nz8wpcj3Vc8wN7qfxmPnkktuIAyBiiT7cGvww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Mar 2025 10:22:59 +0100
Message-Id: <D8E6F9DTQFXL.1F77UGAHEV4Z4@bootlin.com>
Subject: Re: [PATCH v4] ref-manual: uboot-sign: Add how to enable ATF, TEE
 and User defined snippet ITS for U-Boot FIT image
Cc: <troy_lee@aspeedtech.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Jamin Lin" <jamin_lin@aspeedtech.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250312024235.2154311-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20250312024235.2154311-1-jamin_lin@aspeedtech.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdegjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgudfggfelhffgudegveetueelgeehfeejieduueehudfhuefhueeihfffjeekheenucffohhmrghinhepuggvnhigrdguvgdpuhhimhgrghgvrdhfihhtpdgvlhhinhhugidrohhrghdpthhruhhsthgvughfihhrmhifrghrvgdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdhoshhffidrfhhouhhnuggrthhiohhnpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggpr
 hgtphhtthhopeefpdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Mar 2025 09:23:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6547

Hi Jamin,

On Wed Mar 12, 2025 at 3:42 AM CET, Jamin Lin wrote:
> Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image gene=
ration.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  documentation/ref-manual/classes.rst   |  14 +++
>  documentation/ref-manual/variables.rst | 131 +++++++++++++++++++++++++
>  2 files changed, 145 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index b93279ff6..4b02daa58 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3401,6 +3401,20 @@ The variables used by this class are:
>  -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT =
image.
>  -  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` whe=
n
>     rebuilding the FIT image containing the kernel.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`: include the Trusted Firmware-=
A (TF-A)
> +   image in the U-Boot FIT image.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`: specifies the path to t=
he
> +   Trusted Firmware-A (TF-A) image.
> +-  :term:`UBOOT_FIT_TEE`: include the Trusted Execution Environment (TEE=
) image
> +   in the U-Boot FIT image.
> +-  :term:`UBOOT_FIT_TEE_IMAGE`: specifies the path to the Trusted Execut=
ion
> +   Environment (TEE) image.
> +-  :term:`UBOOT_FIT_USER_SETTINGS`: adds a user-specific snippet to the =
ITS.
> +   Users can include their custom ITS snippet in this variable.
> +-  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds one or more user-defined =
images
> +   to the loadables property of the configuration node. It should be a
> +   comma-separated list of strings and each string needs to be surrounde=
d by
> +   quotes too.
> =20
>  See U-Boot's documentation for details about `verified boot
>  <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verif=
ied-boot.txt>`__
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 861b04eaa..5dbff68cc 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9949,6 +9949,42 @@ system and gives an overview of their function and=
 contents.
> =20
>        See `more details about #address-cells <https://elinux.org/Device_=
Tree_Usage#How_Addressing_Works>`__.
> =20
> +   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`
> +      `Trusted Firmware-A (TF-A) <https://www.trustedfirmware.org/projec=
ts/tf-a>`__
> +      is a reference implementation of secure world software for Arm A-P=
rofile
> +      architectures (Armv8-A and Armv7-A), including an Exception Level =
3 (EL3)
> +      Secure Monitor. This variable enables the generation of a U-Boot F=
IT image
> +      with an Trusted Firmware-A (TF-A) image.
> +
> +      Its default value is "0", so set it to "1" to enable this function=
ality::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE =3D "1"
> +
> +   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`
> +      Specifies the path to the Trusted Firmware-A (TF-A) image. Its def=
ault
> +      value is "bl31.bin"::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?=3D "bl31.bin"
> +
> +      It is estimated that the image is placed in U-Boot's ``$B`` direct=
ory.

Actually you can use :term:`B`, so it will create a link to the variable's
definition. Could have mentioned that in my comment in the previous version=
,
sorry!

> +      Users can specify an alternative location for the image by setting
> +      ``$DEPLOY_DIR_IMAGE``. Additionally, the Trusted Firmware-A (TF-A)=
 image

Same here, :term:`DEPLOY_DIR_IMAGE`.

"By setting DEPLOY_DIR_IMAGE" sounds like we instruct to override the varia=
ble.
How about:

"""
Users can specify an alternative location for the image, for example using
:term:`DEPLOY_DIR_IMAGE`::

   UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?=3D "${DEPLOY_DIR_IMAGE}/bl31.bin"
"""

> +      is built in a separate recipe. To successfully generate the U-Boot=
 FIT
> +      image, users must add the necessary dependencies in the U-Boot

I would simplify the sentence a bit, to:

"""
If the Trusted Firmware-A (TF-A) image is built in a separate recipe, you m=
ust
add the necessary dependency in the U-boot ``.bbappend`` file.
"""

All of these comments apply to UBOOT_FIT_TEE_IMAGE below of course.

Looking good otherwise, thanks!

Antonin

> +      ``.bbappend`` file. The recipe name for Trusted Firmware-A (TF-A) =
image
> +      is ``trusted-firmware-a``, which comes from the `meta-arm <https:/=
/git.yoctoproject.org/meta-arm/>`__
> +      layer::
> +
> +          do_compile[depends] +=3D "trusted-firmware-a:do_deploy"


> +
> +   :term:`UBOOT_FIT_CONF_USER_LOADABLES`
> +      Adds one or more user-defined images to the ``loadables`` property=
 of the
> +      configuration node of the U-Boot Image Tree Source (ITS). It shoul=
d be a
> +      comma-separated list of strings and each string needs to be surrou=
nded by
> +      quotes too, e.g.::
> +
> +         UBOOT_FIT_CONF_USER_LOADABLES =3D '\"fwa\", \"fwb\"'
> +
>     :term:`UBOOT_FIT_DESC`
>        Specifies the description string encoded into a U-Boot fitImage. T=
he default
>        value is set by the :ref:`ref-classes-uboot-sign` class as follows=
::
> @@ -9997,6 +10033,101 @@ system and gives an overview of their function a=
nd contents.
>        of bits. The default value for this variable is set to "2048"
>        by the :ref:`ref-classes-uboot-sign` class.
> =20
> +   :term:`UBOOT_FIT_TEE`
> +      A Trusted Execution Environment (TEE) is a secure environment for
> +      executing code, ensuring high levels of trust in asset management =
within
> +      the surrounding system. This variable enables the generation of a =
U-Boot
> +      FIT image with a Trusted Execution Environment (TEE) image.
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
> +      It is estimated that the image is placed in U-Boot's ``$B`` direct=
ory.
> +      Users can specify an alternative location for the image by setting
> +      ``$DEPLOY_DIR_IMAGE``. Additionally, the Trusted Execution Environ=
ment
> +      (TEE) image is built in a separate recipe. To successfully generat=
e the
> +      U-Boot FIT image, users must add the necessary dependencies in the=
 U-Boot
> +      ``.bbappend`` file. The recipe name for Trusted Execution Environm=
ent
> +      (TEE) image is ``optee-os``, which comes from the `meta-arm <https=
://git.yoctoproject.org/meta-arm/>`__
> +      layer::
> +
> +          do_compile[depends] +=3D "optee-os:do_deploy"
> +
> +   :term:`UBOOT_FIT_USER_SETTINGS`
> +      Add a user-specific snippet to the U-Boot Image Tree Source (ITS).=
 This
> +      variable allows the user to add one or more user-defined ``/images=
`` node
> +      to the U-Boot Image Tree Source (ITS). For more details, please re=
fer to=20
> +      https://fitspec.osfw.foundation/.
> +
> +      The original contents of the U-Boot Image Tree Source (ITS) are as
> +      follows::
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
be
> +      explicitly added using ``\n``.
> +
> +      The generated contents of the U-Boot Image Tree Source (ITS) are a=
s
> +      follows::
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
> +             fwa {
> +                 description =3D "FW A";
> +                 data =3D /incbin/("fwa.bin");
> +                 type =3D "firmware";
> +                 arch =3D "";
> +                 os =3D "";
> +                 load =3D <0xb2000000>;
> +                 entry =3D <0xb2000000>;
> +                 compression =3D "none";
> +             };
> +         };
> +
>     :term:`UBOOT_FITIMAGE_ENABLE`
>        This variable allows to generate a FIT image for U-Boot, which is =
one
>        of the ways to implement a verified boot process.


--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

