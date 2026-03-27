Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678AC10ED655
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 10:13:28 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69563.1774606403389242303
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 03:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sLieeHzM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 137044E42823;
	Fri, 27 Mar 2026 10:13:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC9E360230;
	Fri, 27 Mar 2026 10:13:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BADA910450D9E;
	Fri, 27 Mar 2026 11:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774606400; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W92PAUXwC/1hjAVA5YCtNRAydPiOgu0BjiV9bdLmSxA=;
	b=sLieeHzMzu8vCJlPQbYY1b9xDaPpfkEumcFuuMBPuc2VjjTsrWw8jc44BaON+lzTSbdM/V
	jvjd0E7ugJ3e1j6deZDkKX+To7jwcKyfMvcGe/au/rN6a5JCKVqbFnaILoyTUZdbj43xCQ
	I/PmcSL3yu04/Cxk356eJKxF6tHhlWPf5P2cwgdMbOmyEzV3M7EsbiFYunzGZeQAO9bDD0
	8zr2l648hV4TACrV3A+33HZkTF/rIzQRESVOTiN5A4YR0htJrS4Xn31BNTBJeIXI+dDLSw
	jTB4Bzi7sq4kQOHXWZsiL0UJuKBiFrziiIuILlMY/hILnfMjWMDURkJm1GbBcQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 11:13:17 +0100
Message-Id: <DHDHGSFNUECR.2761C2T6HHM67@bootlin.com>
To: "Francesco Valla" <francesco@valla.it>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH] ref-manual: document the usage of FIT_LOADABLES
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>, "Trevor Gamblin"
 <tgamblin@baylibre.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260327091028.284799-1-francesco@valla.it>
In-Reply-To: <20260327091028.284799-1-francesco@valla.it>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Mar 2026 10:13:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9138

Hi,

First, let me say that this is really nice and clear documentation, and I t=
hink
covers exactly what is needed, thanks!

I've added comments below.

On Fri Mar 27, 2026 at 10:10 AM CET, Francesco Valla wrote:
> Add documentation for the new logic and variables that can be used to
> add additional arbitrary loadables to a FIT image.
>
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  documentation/ref-manual/classes.rst   |  16 +-
>  documentation/ref-manual/variables.rst | 193 +++++++++++++++++++++++++
>  2 files changed, 207 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index dc131be9fb93..ec30d6417cb0 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1420,12 +1420,13 @@ Its behavior is mainly controlled by the followin=
g variables:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  The :ref:`ref-classes-kernel-fit-image` class provides support to pack a=
 kernel image,
> -device trees, a U-boot script, and an :term:`Initramfs` into a single FI=
T image.
> +device trees, a U-boot script, an :term:`Initramfs` and additional loada=
bles into a
> +single FIT image.
>  In theory, a FIT image can support any number of kernels, U-boot scripts=
,
>  :term:`Initramfs`, and device trees.
>  However, :ref:`ref-classes-kernel-fit-image` currently only supports
>  limited usecases: just one kernel image, an optional U-boot script,
> -an optional :term:`Initramfs`, and any number of device trees.
> +an optional :term:`Initramfs`, and any number of device trees and loadab=
les.
> =20
>  The FIT image is created by a recipe which inherits the
>  :ref:`ref-classes-kernel-fit-image` class.
> @@ -1535,6 +1536,17 @@ allow configuration:
>     At run-time, U-boot's boot command can be configured to load the boot=
 script
>     from the FIT image and source it.
> =20
> +-  Multiple additional loadables (e.g.: firmwares for auxiliary processo=
rs) can
> +   be added to the FIT image created by :ref:`ref-classes-kernel-fit-ima=
ge`.
> +   The addition of loadables is optional. The loadables are specified us=
ing the
> +   :term:`FIT_LOADABLES` variable; each of them can then be configured t=
hrough
> +   flags on the following variables: :term:`FIT_LOADABLE_ARCH`,
> +   :term:`FIT_LOADABLE_COMPRESSION`, :term:`FIT_LOADABLE_DESCRIPTION`,
> +   :term:`FIT_LOADABLE_ENTRYPOINT`, :term:`FIT_LOADABLE_FILENAME`,
> +   :term:`FIT_LOADABLE_LOADADDRESS`, :term:`FIT_LOADABLE_OS` and
> +   :term:`FIT_LOADABLE_TYPE`. All loadables specified in this way will b=
e added
> +   to all configurations present in the FIT image.
> +
>  -  The FIT image generated by the :ref:`ref-classes-kernel-fit-image` cl=
ass is signed when the
>     variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
>     :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 9e0c5b0835a2..35c54130e7f6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3510,6 +3510,199 @@ system and gives an overview of their function an=
d contents.
>        The default value is set to "x509" by the
>        :ref:`ref-classes-kernel-fit-image` class.
> =20
> +   :term:`FIT_LOADABLE_ARCH`
> +      Architecture the loadables defined in :term:`FIT_LOADABLES`; the v=
alue
> +      will be used for the ``arch`` property of the loadable.
> +      If no value is defined for a specific loadable, the kernel archite=
cture
> +      will be used.
> +
> +      This variable cannot be used directly, but only defining flags on =
it.
> +
> +      Example::
> +
> +         FIT_LOADABLES =3D "foo"
> +         FIT_LOADABLE_ARCH[foo] =3D "arm"
> +
> +   :term:`FIT_LOADABLE_COMPRESSION`
> +      Compresssion for the loadables defined in :term:`FIT_LOADABLES`; t=
he

s/Compresssion/Compression type/

> +      value will be used for the ``compression`` property of the loadabl=
e.
> +      If no value is defined for a specific loadable, its ``compression`=
`
> +      property will be set to ``none``.
> +
> +      This variable cannot be used directly, but only defining flags on =
it.
> +
> +      Example::
> +
> +         FIT_LOADABLES =3D "foo"
> +         FIT_LOADABLE_COMPRESSION[foo] =3D "gzip"
> +
> +      .. note::
> +
> +         The binary to be included will be considered as already compres=
sed, no
> +         operation will be performed on it.

How about "The binary should already be compressed, as no compression is
performed by the :ref:`ref-classes-kernel-fit-image` class."?

> +
> +   :term:`FIT_LOADABLE_DESCRIPTION`
> +      Description for the loadables defined in :term:`FIT_LOADABLES`; th=
e value
> +      will be used for the ``description`` property of the loadable.
> +      If no value is defined for a specific loadable, its description wi=
ll be
> +      set to the loadable name followed by a space plus the string ``loa=
dable``.
> +
> +      This variable cannot be used directly, but only defining flags on =
it.
> +
> +      Example::
> +
> +         FIT_LOADABLES =3D "foo"
> +         FIT_LOADABLE_DESCRIPTION[foo] =3D "Foo firmware binary"
> +
> +   :term:`FIT_LOADABLE_ENTRYPOINT`
> +      Entry point for the loadables defined in :term:`FIT_LOADABLES`; th=
e value
> +      will be used for the ``entry`` property of the loadable.
> +      If no value is defined for a specific loadable, the ``entry`` prop=
erty
> +      will be omitted.
> +
> +      This variable cannot be used directly, but only defining flags on =
it.
> +
> +      Example::
> +
> +         FIT_LOADABLES =3D "foo"
> +         FIT_LOADABLE_ENTRYPOINT[foo] =3D "0x80234000"
> +
> +   :term:`FIT_LOADABLE_FILENAME`
> +      Filename (or relative path) for the loadables defined in
> +      :term:`FIT_LOADABLES`; this will be used to search for the binary =
to
> +      include and is therefore mandatory for each loadable. Binary files=
 to be
> +      included need to be located in :term:`DEPLOY_DIR_IMAGE`.
> +
> +      This variable cannot be used directly, but only defining flags on =
it.
> +
> +      Example::
> +
> +         FIT_LOADABLES =3D "foo"
> +         FIT_LOADABLE_FILENAME[foo] =3D "foo-firmware.bin"
> +
> +   :term:`FIT_LOADABLE_LOADADDRESS`
> +      Load address for the loadables defined in :term:`FIT_LOADABLES`; t=
he
> +      value will be used for the ``load`` property of the loadable.
> +      This is mandatory for each loadable.
> +
> +      This variable cannot be used directly, but only defining flags on =
it.
> +
> +      Example::
> +
> +         FIT_LOADABLES =3D "foo"
> +         FIT_LOADABLE_LOADADDRESS[foo] =3D "foo-firmware.bin"

I think there's a copy-paste error here, the example should show an address=
 :)

> +
> +   :term:`FIT_LOADABLE_OS`
> +      Operating system for the loadables defined in :term:`FIT_LOADABLES=
`; the
> +      value will be used for the ``os`` property of the loadable.
> +      If no value is defined for a specific loadable, the ``os`` propert=
y will
> +      be set to ``linux``.
> +
> +      This variable cannot be used directly, but only defining flags on =
it.
> +
> +      Example::
> +
> +         FIT_LOADABLES =3D "foo"
> +         FIT_LOADABLE_OS[foo] =3D "linux"
> +
> +   :term:`FIT_LOADABLE_TYPE`
> +      Type for the loadables defined in :term:`FIT_LOADABLES`; the value=
 will
> +      be used for the ``type`` property of the loadable.
> +      If no value is defined for a specific loadable, the ``type`` prope=
rty
> +      will be set to ``firmware``.
> +
> +      This variable cannot be used directly, but only defining flags on =
it.
> +
> +      Example::
> +
> +         FIT_LOADABLES =3D "foo"
> +         FIT_LOADABLE_TYPE[foo] =3D "firmware"
> +
> +   :term:`FIT_LOADABLES`
> +      Space-separated list of loadables to add to a FIT image in additio=
n to
> +      regular ones (kernel, initramfs, dtsb etc.).
> +      Values specified here will be used as node names inside the FIT im=
age;
> +      all of them will be included in all configurations by using the
> +      ``loadables`` property.
> +
> +      For each loadable specified in this variable, additional parameter=
s can be
> +      defined using :term:`FIT_LOADABLE_ARCH`, :term:`FIT_LOADABLE_COMPR=
ESSION`,
> +      :term:`FIT_LOADABLE_DESCRIPTION`, :term:`FIT_LOADABLE_ENTRYPOINT`,
> +      :term:`FIT_LOADABLE_FILENAME`, :term:`FIT_LOADABLE_LOADADDRESS`,
> +      :term:`FIT_LOADABLE_OS` and :term:`FIT_LOADABLE_TYPE`.
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass and
> +      is empty by default.
> +
> +      For example, the following configuration adds as loadables a TF-A =
BL31
> +      firmware and a (compressed) TEE firmware, to be loaded respectivel=
y at
> +      0x204E0000 and 0x96000000::
> +
> +         FIT_LOADABLES =3D "atf tee"
> +
> +         FIT_LOADABLE_FILENAME[atf] =3D "bl31.bin"
> +         FIT_LOADABLE_DESCRIPTION[atf] =3D "TF-A Firmware"
> +         FIT_LOADABLE_TYPE[atf] =3D "tfa-bl31"
> +         FIT_LOADABLE_ARCH[atf] =3D "arm64"
> +         FIT_LOADABLE_OS[atf] =3D "arm-trusted-firmware"
> +         FIT_LOADABLE_LOADADDRESS[atf] =3D "0x204E0000"
> +         FIT_LOADABLE_ENTRYPOINT[atf] =3D "0x204E0000"
> +
> +         FIT_LOADABLE_FILENAME[tee] =3D "tee.bin.gz"
> +         FIT_LOADABLE_COMPRESSSION[tee] =3D "gzip"

s/FIT_LOADABLE_COMPRESSSION/FIT_LOADABLE_COMPRESSION/

> +         FIT_LOADABLE_TYPE[tee] =3D "tee"
> +         FIT_LOADABLE_OS[tee] =3D "tee"
> +         FIT_LOADABLE_LOADADDRESS[tee] =3D "0x96000000"
> +
> +      and will be converted to the following FIT source::
> +
> +         images {
> +                 atf {
> +                         description =3D "TF-A Firmware";
> +                         type =3D "tfa-bl31";
> +                         compression =3D "none";
> +                         data =3D /incbin/("<DEPLOY_DIR_IMAGE>/bl31.bin"=
);
> +                         arch =3D "arm64";
> +                         os =3D "arm-trusted-firmware";
> +                         load =3D <0x204E0000>;
> +                         entry =3D <0x204E0000>;
> +                         hash-1 {
> +                                 algo =3D "sha256";
> +                         };
> +                 };
> +                 tee {
> +                         description =3D "tee loadable";
> +                         type =3D "tee";
> +                         compression =3D "gzip";
> +                         data =3D /incbin/("<DEPLOY_DIR_IMAGE>/tee.bin.g=
z");
> +                         arch =3D "arm64";
> +                         os =3D "tee";
> +                         load =3D <0x96000000>;
> +                         hash-1 {
> +                                 algo =3D "sha256";
> +                         };
> +                 };
> +         };
> +
> +         configurations {
> +                 default =3D "<my-board>.dtb";
> +                 <my-board>.dtb {
> +                         description =3D "1 Linux kernel, FDT blob, load=
ables";
> +                         kernel =3D "kernel-1";
> +                         fdt =3D "<my-board>.dtb";
> +                         loadables =3D "atf", "tee";
> +                         hash-1 {
> +                                 algo =3D "sha256";
> +                         };
> +                         signature-1 {
> +                                 algo =3D "sha256,rsa2048";
> +                                 key-name-hint =3D "temp";
> +                                 padding =3D "pkcs-1.5";
> +                                 sign-images =3D "kernel", "fdt", "loada=
bles";
> +                         };

For this example I think we can omit the signature/hash nodes to make it ea=
sier
to read

> +                 };
> +         };
> +
>     :term:`FIT_MKIMAGE_EXTRA_OPTS`
>        When inheriting the :ref:`ref-classes-kernel-fit-image`, the
>        :term:`FIT_MKIMAGE_EXTRA_OPTS` variable allows passing extra optio=
ns to

Antonin

