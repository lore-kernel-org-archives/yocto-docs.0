Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83025C678DA
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:17:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.89327.1749568619069655413
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 08:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bF+DDlMj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 842DF439DF;
	Tue, 10 Jun 2025 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749568617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CNIl35NSmrLd/c58gktpSINkBOE5pchyWt9NotMog0=;
	b=bF+DDlMjIiKeONkJXYykTvVg7wHaoFXsbmRTqAK2tsVEEk+qgctdwOu5G6GBWq5OVTlUJr
	vvAsJ2KvDjuq2AUtS0yBKZ+PIW6m7ZQBNWYrUDqvwForxGDMj/yydaqNIGiuXdowxqDSN7
	zzsQe0N04eDET9ygINbLEiCwmS63C56LwVbgTrlXsPl8s8LB6ay4juLgHUaCnb7JZjeiGZ
	QTzHquMi9Nw7v7oGns/6O3Fcd1INxGqLrvowhkcCqY09V+nNH726Y4ZYs0BC7oj3lYF+76
	TWCl98fT5PkmArfLZlqsZ/7NqKOJSGefF2t7i8EQhfFQVMrLLBtwidA3REmOyA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 17:16:56 +0200
Message-Id: <DAIYBARBPOUS.2R0ER1BVU5M3Q@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/3] ref-manual: replace kernel-fitimage by
 kernel-fit-image
References: <20250606140647.80782-1-adrian.freihofer@siemens.com>
 <20250606140647.80782-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250606140647.80782-2-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvufhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeljeefueeukeeikeegjeevffelveekgeevfeevudetteejleetjeekveejffevfeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdguvghngidruggvpdhuihhmrghgvgdrfhhithdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesshhivghmvghnshdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhpr
 hhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 15:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7052

On Fri Jun 6, 2025 at 4:06 PM CEST, Adrian Freihofer via lists.yoctoproject=
.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/classes.rst   | 126 +++++++++++++++++--------
>  documentation/ref-manual/variables.rst |  60 ++++++------
>  2 files changed, 114 insertions(+), 72 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 54a98bf24f3..7b67367438b 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1732,77 +1732,121 @@ Its behavior is mainly controlled by the followi=
ng variables:
>  -  :term:`KERNEL_DTC_FLAGS`: flags for ``dtc``, the Device Tree Compiler
>  -  :term:`KERNEL_PACKAGE_NAME`: base name of the kernel packages
> =20
> -.. _ref-classes-kernel-fitimage:
> +.. _ref-classes-kernel-fit-image:
> =20
> -``kernel-fitimage``
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +``kernel-fit-image``
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -The :ref:`ref-classes-kernel-fitimage` class provides support to pack a =
kernel image,
> -device trees, a U-boot script, an :term:`Initramfs` bundle and a RAM dis=
k
> -into a single FIT image. In theory, a FIT image can support any number
> -of kernels, U-boot scripts, :term:`Initramfs` bundles, RAM disks and dev=
ice-trees.
> -However, :ref:`ref-classes-kernel-fitimage` currently only supports
> +The :ref:`ref-classes-kernel-fit-image` class provides support to pack a=
 kernel image,
> +device trees, a U-boot script, and an :term:`Initramfs` into a single FI=
T image.
> +In theory, a FIT image can support any number of kernels, U-boot scripts=
,
> +:term:`Initramfs`, and device trees.
> +However, :ref:`ref-classes-kernel-fit-image` currently only supports
>  limited usecases: just one kernel image, an optional U-boot script,
> -an optional :term:`Initramfs` bundle, an optional RAM disk, and any numb=
er of
> -device trees.
> +an optional :term:`Initramfs`, and any number of device trees.
> =20
> -To create a FIT image, it is required that :term:`KERNEL_CLASSES`
> -is set to include ":ref:`ref-classes-kernel-fitimage`" and one of :term:=
`KERNEL_IMAGETYPE`,
> -:term:`KERNEL_ALT_IMAGETYPE` or :term:`KERNEL_IMAGETYPES` to include "fi=
tImage".
> +The FIT image is created by a recipe which inherits the
> +:ref:`ref-classes-kernel-fit-image` class.
> +One such example is the ``linux-yocto-fitimage`` recipe which creates a =
FIT
> +image for the Linux Yocto kernel.
> +Additionally, it is required that :term:`KERNEL_CLASSES` is set to inclu=
de
> +:ref:`ref-classes-kernel-fit-extra-artifacts`.

A small example would be nice here:=20

   KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts"

> +The :ref:`ref-classes-kernel-fit-extra-artifacts` class exposes the requ=
ired kernel
> +artifacts to the :term:`DEPLOY_DIR_IMAGE` which are used by the
> +:ref:`ref-classes-kernel-fit-image` class to create the FIT image.
> =20
>  The options for the device tree compiler passed to ``mkimage -D``
>  when creating the FIT image are specified using the
>  :term:`UBOOT_MKIMAGE_DTCOPTS` variable.
> =20
>  Only a single kernel can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the kernel image in FIT is mandat=
ory. The
> -address where the kernel image is to be loaded by U-Boot is
> +:ref:`ref-classes-kernel-fit-image` and the kernel image in FIT is manda=
tory.

Not by you, but I think rephrasing to "...and it is a mandatory component o=
f
the FIT image." would be slightly clearer.

> +The address where the kernel image is to be loaded by U-Boot is
>  specified by :term:`UBOOT_LOADADDRESS` and the entrypoint by
>  :term:`UBOOT_ENTRYPOINT`. Setting :term:`FIT_ADDRESS_CELLS` to "2"
>  is necessary if such addresses are 64 bit ones.
> =20
>  Multiple device trees can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the device tree is optional.
> +:ref:`ref-classes-kernel-fit-image` and the device tree is optional.
>  The address where the device tree is to be loaded by U-Boot is
>  specified by :term:`UBOOT_DTBO_LOADADDRESS` for device tree overlays
>  and by :term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
> =20
> -Only a single RAM disk can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the RAM disk in FIT is optional.
> +Only a single :term:`Initramfs` can be added to the FIT image created by
> +:ref:`ref-classes-kernel-fit-image`. The :term:`Initramfs` in FIT is opt=
ional.
>  The address where the RAM disk image is to be loaded by U-Boot
>  is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
> -:term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to the FIT image when
> -:term:`INITRAMFS_IMAGE` is specified and requires that :term:`INITRAMFS_=
IMAGE_BUNDLE`
> -is not set to 1.
> +:term:`UBOOT_RD_ENTRYPOINT`. The :term:`Initramfs` is added to the FIT i=
mage
> +when :term:`INITRAMFS_IMAGE` is specified.
> =20
> -Only a single :term:`Initramfs` bundle can be added to the FIT image cre=
ated by
> -:ref:`ref-classes-kernel-fitimage` and the :term:`Initramfs` bundle in F=
IT is optional.
> -In case of :term:`Initramfs`, the kernel is configured to be bundled wit=
h the root filesystem
> -in the same binary (example: zImage-initramfs-:term:`MACHINE`.bin).
> -When the kernel is copied to RAM and executed, it unpacks the :term:`Ini=
tramfs` root filesystem.
> -The :term:`Initramfs` bundle can be enabled when :term:`INITRAMFS_IMAGE`
> -is specified and requires that :term:`INITRAMFS_IMAGE_BUNDLE` is set to =
1.
> -The address where the :term:`Initramfs` bundle is to be loaded by U-boot=
 is specified
> -by :term:`UBOOT_LOADADDRESS` and the entrypoint by :term:`UBOOT_ENTRYPOI=
NT`.
> +It's recommended to add the :term:`Initramfs` and the kernel image as
> +independent image nodes to the FIT image.
> +Bundling a RAM disk image with the kernel image and including the bundle
> +(:term:`INITRAMFS_IMAGE_BUNDLE` set to "1") in the FIT image is possible=
.
> +However, this approach has the disadvantage that any change to the RAM
> +disk image necessitates rebuilding the kernel image.
> +This process requires the full kernel build directory, which is kind of
> +incompatible with the :term:`SSTATE_DIR` and, consequently, with SDKs.
> =20
> -Only a single U-boot boot script can be added to the FIT image created b=
y
> -:ref:`ref-classes-kernel-fitimage` and the boot script is optional.
> +Only a single U-Boot boot script can be added to the FIT image created b=
y
> +:ref:`ref-classes-kernel-fit-image`. The boot script is optional.
>  The boot script is specified in the ITS file as a text file containing
> -U-boot commands. When using a boot script the user should configure the
> -U-boot :ref:`ref-tasks-install` task to copy the script to sysroot.
> -So the script can be included in the FIT image by the :ref:`ref-classes-=
kernel-fitimage`
> -class. At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured t=
o
> -load the boot script from the FIT image and execute it.
> +U-Boot commands. When using a boot script the recipe which inherits the
> +:ref:`ref-classes-kernel-fit-image` class should add the script to
> +:term:`SRC_URI` and set the :term:`FIT_UBOOT_ENV` variable to the name o=
f the
> +file like the following::
> =20
> -The FIT image generated by the :ref:`ref-classes-kernel-fitimage` class =
is signed when the
> +   FIT_UBOOT_ENV =3D "boot.txt"
> +   SRC_URI +=3D "file://${FIT_UBOOT_ENV}"
> +
> +At run-time, U-Boot CONFIG_BOOTCOMMAND define can be configured to

s/U-Boot CONFIG_BOOTCOMMAND define/U-boot's boot command/?

> +load the boot script from the FIT image and source it.
> +
> +The FIT image generated by the :ref:`ref-classes-kernel-fit-image` class=
 is signed when the
>  variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
>  :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
>  appropriately. The default values used for :term:`FIT_HASH_ALG` and
> -:term:`FIT_SIGN_ALG` in :ref:`ref-classes-kernel-fitimage` are "sha256" =
and
> +:term:`FIT_SIGN_ALG` in :ref:`ref-classes-kernel-fit-image` are "sha256"=
 and
>  "rsa2048" respectively. The keys for signing the FIT image can be genera=
ted using
> -the :ref:`ref-classes-kernel-fitimage` class when both :term:`FIT_GENERA=
TE_KEYS` and
> +the :ref:`ref-classes-kernel-fit-image` class when both :term:`FIT_GENER=
ATE_KEYS` and
>  :term:`UBOOT_SIGN_ENABLE` are set to "1".
> =20
> +If the FIT image should be used as a replacement for the kernel image wh=
ich
> +is installed in the root filesystem, then the following variables can be=
 set
> +e.g. in the machine configuration file::
> +
> +   # Do not install the kernel image package
> +   RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
> +
> +   # Install the FIT image package
> +   MACHINE_EXTRA_RDEPENDS +=3D "${PREFERRED_PROVIDER_virtual/kernel}-fit=
image"
> +
> +   # Configure the image.bbclass to depend on the fitImage instead of on=
ly
> +   # the kernel to ensure the fitImage is built with the image
> +   KERNEL_DEPLOY_DEPEND =3D "${PREFERRED_PROVIDER_virtual/kernel}-fitima=
ge:do_deploy"
> +
> +.. _ref-classes-kernel-fit-extra-artifacts:
> +
> +``kernel-fit-extra-artifacts``
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +The :ref:`ref-classes-kernel-fit-extra-artifacts` class exposes the requ=
ired
> +kernel artifacts to the :term:`DEPLOY_DIR_IMAGE` directory.
> +These artifacts are used by the :ref:`ref-classes-kernel-fit-image` clas=
s to
> +create a FIT image that can include the kernel, device trees, an optiona=
l
> +U-Boot script, and an optional Initramfs.
> +
> +This class is typically included by adding it to the :term:`KERNEL_CLASS=
ES`
> +variable in your kernel recipe or machine configuration when building FI=
T images.
> +It ensures that all necessary files are available for packaging into the=
 FIT image,
> +such as the kernel binary, device tree blobs (DTBs), and other related f=
iles.
> +
> +For example, to enable this class, set::
> +
> +   KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts"
> +
> +This is required when using the :ref:`ref-classes-kernel-fit-image` clas=
s to
> +generate FIT images for your kernel.
> =20
>  .. _ref-classes-kernel-grub:
> =20
> @@ -3436,7 +3480,7 @@ See U-Boot's documentation for details about `verif=
ied boot
>  and the `signature process
>  <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/signa=
ture.txt>`__.
> =20
> -See also the description of :ref:`ref-classes-kernel-fitimage` class, wh=
ich this class
> +See also the description of :ref:`ref-classes-kernel-fit-image` class, w=
hich this class
>  imitates.
> =20
>  .. _ref-classes-uki:
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 9768d8f5b84..3532899cf91 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2790,7 +2790,7 @@ system and gives an overview of their function and =
contents.
>        ``meta/classes-recipe`` to see how the variable is used.
> =20
>     :term:`EXTERNAL_KERNEL_DEVICETREE`
> -      When inheriting :ref:`ref-classes-kernel-fitimage` and a
> +      When inheriting :ref:`ref-classes-kernel-fit-image` and a
>        :term:`PREFERRED_PROVIDER` for ``virtual/dtb`` set to ``devicetree=
``, the
>        variable :term:`EXTERNAL_KERNEL_DEVICETREE` can be used to specify=
 a
>        directory containing one or more compiled device tree or device tr=
ee
> @@ -3318,7 +3318,7 @@ system and gives an overview of their function and =
contents.
>        Specifies the value of the ``#address-cells`` value for the
>        description of the FIT image.
> =20
> -      The default value is set to "1" by the :ref:`ref-classes-kernel-fi=
timage`
> +      The default value is set to "1" by the :ref:`ref-classes-kernel-fi=
t-image`
>        class, which corresponds to 32 bit addresses.
> =20
>        For platforms that need to set 64 bit addresses, for example in
> @@ -3337,11 +3337,11 @@ system and gives an overview of their function an=
d contents.
>        Specifies the default device tree binary (dtb) file for a FIT imag=
e
>        when multiple ones are provided.
> =20
> -      This variable is used in the :ref:`ref-classes-kernel-fitimage` cl=
ass.
> +      This variable is used in the :ref:`ref-classes-kernel-fit-image` c=
lass.
> =20
>     :term:`FIT_DESC`
>        Specifies the description string encoded into a FIT image. The
> -      default value is set by the :ref:`ref-classes-kernel-fitimage` cla=
ss as
> +      default value is set by the :ref:`ref-classes-kernel-fit-image` cl=
ass as
>        follows::
> =20
>           FIT_DESC ?=3D "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHI=
NE}"
> @@ -3350,12 +3350,12 @@ system and gives an overview of their function an=
d contents.
>        Decides whether to generate the keys for signing the FIT image if
>        they don't already exist. The keys are created in
>        :term:`UBOOT_SIGN_KEYDIR`. The default value is set to "0"
> -      by the :ref:`ref-classes-kernel-fitimage` class.
> +      by the :ref:`ref-classes-kernel-fit-image` class.
> =20
>     :term:`FIT_HASH_ALG`
>        Specifies the hash algorithm used in creating the FIT Image.
>        This variable is set by default to "sha256" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
> =20
>     :term:`FIT_KERNEL_COMP_ALG`
>        The compression algorithm to use for the kernel image inside the F=
IT Image.
> @@ -3374,31 +3374,31 @@ system and gives an overview of their function an=
d contents.
>     :term:`FIT_KEY_GENRSA_ARGS`
>        Arguments to ``openssl genrsa`` for generating a RSA private key f=
or
>        signing the FIT image. The default value is set to "-F4" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
> =20
>     :term:`FIT_KEY_REQ_ARGS`
>        Arguments to ``openssl req`` for generating a certificate for sign=
ing
>        the FIT image. The default value is "-batch -new" by the
> -      :ref:`ref-classes-kernel-fitimage` class, "batch" for
> +      :ref:`ref-classes-kernel-fit-image` class, "batch" for
>        non interactive mode and "new" for generating new keys.
> =20
>     :term:`FIT_KEY_SIGN_PKCS`
>        Format for the public key certificate used for signing the FIT ima=
ge.
>        The default value is set to "x509" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
> =20
>     :term:`FIT_SIGN_ALG`
>        Specifies the signature algorithm used in creating the FIT Image.
>        This variable is set by default to "rsa2048" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
> =20
>     :term:`FIT_PAD_ALG`
>        Specifies the padding algorithm used in creating the FIT Image.
>        The default value is set to "pkcs-1.5" by the
> -      :ref:`ref-classes-kernel-fitimage` class.
> +      :ref:`ref-classes-kernel-fit-image` class.
> =20
>     :term:`FIT_SIGN_INDIVIDUAL`
> -      If set to "1", the :ref:`ref-classes-kernel-fitimage` class signs =
each
> +      If set to "1", the :ref:`ref-classes-kernel-fit-image` class signs=
 each
>        image node individually, including the kernel, DTB, RAM disk, and =
any
>        other image types present in the FIT image, in addition to signing=
 the
>        configuration nodes.
> @@ -3431,13 +3431,13 @@ system and gives an overview of their function an=
d contents.
>     :term:`FIT_SIGN_NUMBITS`
>        Size of the private key used in the FIT image, in number of bits.
>        The default value for this variable is set to "2048"
> -      by the :ref:`ref-classes-kernel-fitimage` class.
> +      by the :ref:`ref-classes-kernel-fit-image` class.
> =20
>     :term:`FIT_UBOOT_ENV`
>        This variable allows to add a U-Boot script as a text file to the
>        FIT image. Such a script can be sourced from the U-Boot shell.
> =20
> -      When inheriting the :ref:`ref-classes-kernel-fitimage` class a
> +      When inheriting the :ref:`ref-classes-kernel-fit-image` class a
>        script file should be included in the :term:`SRC_URI` of the Linux
>        kernel recipe.
> =20
> @@ -5082,9 +5082,7 @@ system and gives an overview of their function and =
contents.
>     :term:`KERNEL_CLASSES`
>        A list of classes defining kernel image types that the
>        :ref:`ref-classes-kernel` class should inherit. You typically
> -      append this variable to enable extended image types. An example is
> -      ":ref:`ref-classes-kernel-fitimage`", which enables
> -      FIT image support and resides in ``meta/classes-recipe/kernel-fiti=
mage.bbclass``.
> +      append this variable to enable extended image types.
>        You can register custom kernel image types with the
>        :ref:`ref-classes-kernel` class using this variable.
> =20
> @@ -10328,13 +10326,13 @@ system and gives an overview of their function =
and contents.
>     :term:`UBOOT_DTB_LOADADDRESS`
>        Specifies the load address for the dtb image used by U-Boot. Durin=
g FIT
>        image creation, the :term:`UBOOT_DTB_LOADADDRESS` variable is used=
 in
> -      :ref:`ref-classes-kernel-fitimage` class to specify the load addre=
ss to be
> +      :ref:`ref-classes-kernel-fit-image` class to specify the load addr=
ess to be
>        used in creating the dtb sections of Image Tree Source for the FIT=
 image.
> =20
>     :term:`UBOOT_DTBO_LOADADDRESS`
>        Specifies the load address for the dtbo image used by U-Boot.  Dur=
ing FIT
>        image creation, the :term:`UBOOT_DTBO_LOADADDRESS` variable is use=
d in
> -      :ref:`ref-classes-kernel-fitimage` class to specify the load addre=
ss to be
> +      :ref:`ref-classes-kernel-fit-image` class to specify the load addr=
ess to be
>        used in creating the dtbo sections of Image Tree Source for the FI=
T image.
> =20
>     :term:`UBOOT_ENTRYPOINT`
> @@ -10346,7 +10344,7 @@ system and gives an overview of their function an=
d contents.
>        -  The :term:`FIT_ADDRESS_CELLS` variable for FIT image creation.
>        -  The :term:`UBOOT_FIT_ADDRESS_CELLS` variable for U-Boot FIT ima=
ge creation.
> =20
> -      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
>        :ref:`ref-classes-kernel-uimage`, :ref:`ref-classes-kernel`,
>        :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
>        classes.
> @@ -10623,7 +10621,7 @@ system and gives an overview of their function an=
d contents.
>        -  The :term:`FIT_ADDRESS_CELLS` variable for FIT image creation.
>        -  The :term:`UBOOT_FIT_ADDRESS_CELLS` variable for U-Boot FIT ima=
ge creation.
> =20
> -      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
>        :ref:`ref-classes-kernel-uimage`, :ref:`ref-classes-kernel`,
>        :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
>        classes.
> @@ -10651,15 +10649,15 @@ system and gives an overview of their function =
and contents.
> =20
>     :term:`UBOOT_MKIMAGE`
>        Specifies the name of the mkimage command as used by the
> -      :ref:`ref-classes-kernel-fitimage` class to assemble
> +      :ref:`ref-classes-kernel-fit-image` class to assemble
>        the FIT image. This can be used to substitute an alternative comma=
nd, wrapper
>        script or function if desired. The default is "uboot-mkimage".
> =20
>     :term:`UBOOT_MKIMAGE_DTCOPTS`
>        Options for the device tree compiler passed to ``mkimage -D`` feat=
ure
> -      while creating a FIT image with the :ref:`ref-classes-kernel-fitim=
age`
> +      while creating a FIT image with the :ref:`ref-classes-kernel-fit-i=
mage`
>        class. If :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then the
> -      :ref:`ref-classes-kernel-fitimage` class will not pass the ``-D`` =
option
> +      :ref:`ref-classes-kernel-fit-image` class will not pass the ``-D``=
 option
>        to ``mkimage``.
> =20
>        This variable is also used by the :ref:`ref-classes-uboot-sign` cl=
ass.
> @@ -10670,42 +10668,42 @@ system and gives an overview of their function =
and contents.
> =20
>     :term:`UBOOT_MKIMAGE_SIGN`
>        Specifies the name of the mkimage command as used by the
> -      :ref:`ref-classes-kernel-fitimage` class to sign
> +      :ref:`ref-classes-kernel-fit-image` class to sign
>        the FIT image after it has been assembled (if enabled). This can b=
e used
>        to substitute an alternative command, wrapper script or function i=
f
>        desired. The default is "${:term:`UBOOT_MKIMAGE`}".
> =20
>     :term:`UBOOT_MKIMAGE_SIGN_ARGS`
>        Optionally specifies additional arguments for the
> -      :ref:`ref-classes-kernel-fitimage` class to pass to the
> +      :ref:`ref-classes-kernel-fit-image` class to pass to the
>        mkimage command when signing the FIT image.
> =20
>     :term:`UBOOT_RD_ENTRYPOINT`
>        Specifies the entrypoint for the RAM disk image. During FIT image
>        creation, the :term:`UBOOT_RD_ENTRYPOINT` variable is used in
> -      :ref:`ref-classes-kernel-fitimage` class to specify the entrypoint=
 to be
> +      :ref:`ref-classes-kernel-fit-image` class to specify the entrypoin=
t to be
>        used in creating the Image Tree Source for the FIT image.
> =20
>     :term:`UBOOT_RD_LOADADDRESS`
>        Specifies the load address for the RAM disk image. During FIT imag=
e
>        creation, the :term:`UBOOT_RD_LOADADDRESS` variable is used in
> -      :ref:`ref-classes-kernel-fitimage` class to specify the load addre=
ss to
> +      :ref:`ref-classes-kernel-fit-image` class to specify the load addr=
ess to
>        be used in creating the Image Tree Source for the FIT image.
> =20
>     :term:`UBOOT_SIGN_ENABLE`
>        Enable signing of FIT image. The default value is "0".
> =20
> -      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
>        :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
>        classes.
> =20
>     :term:`UBOOT_SIGN_KEYDIR`
>        Location of the directory containing the RSA key and certificate u=
sed for
> -      signing FIT image, used by the :ref:`ref-classes-kernel-fitimage` =
and
> +      signing FIT image, used by the :ref:`ref-classes-kernel-fit-image`=
 and
>        :ref:`ref-classes-uboot-sign` classes.
> =20
>     :term:`UBOOT_SIGN_KEYNAME`
> -      The name of keys used by the :ref:`ref-classes-kernel-fitimage` cl=
ass
> +      The name of keys used by the :ref:`ref-classes-kernel-fit-image` c=
lass
>        for signing U-Boot FIT image stored in the :term:`UBOOT_SIGN_KEYDI=
R`
>        directory. If we have for example a ``dev.key`` key and a ``dev.cr=
t``
>        certificate stored in the :term:`UBOOT_SIGN_KEYDIR` directory, you=
 will

thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


