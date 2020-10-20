Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.2043.1603219561286313102
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 11:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.8
Received: from [192.168.13.190] (80-110-110-8.cgn.dynamic.surfer.at [80.110.110.8])
	(Authenticated sender: foss@0leil.net)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C34731BF205;
	Tue, 20 Oct 2020 18:45:58 +0000 (UTC)
Date: Tue, 20 Oct 2020 20:45:59 +0200
In-Reply-To: <20201020170326.14313-1-JPEWhacker@gmail.com>
References: <20201020170326.14313-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: Re: [docs][PATCH] kernel-dev: Add FAQ for how to use a vanilla kernel
To: docs@lists.yoctoproject.org,Joshua Watt <JPEWhacker@gmail.com>
CC: bruce.ashfield@gmail.com,pbarker@konsulko.com
From: "Quentin Schulz" <foss@0leil.net>
Message-ID: <47371CB3-77B4-4811-8911-2D3A0E03E19D@0leil.net>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Joshua,



On October 20, 2020 7:03:26 PM GMT+02:00, Joshua Watt <JPEWhacker@gmail=2E=
com> wrote:
>Adds a FAQ with explicit directions about how to build a vanilla kernel
>for a machine=2E
>
>Signed-off-by: Joshua Watt <JPEWhacker@gmail=2Ecom>
>---
> documentation/kernel-dev/kernel-dev-faq=2Erst | 49 +++++++++++++++++++++
> 1 file changed, 49 insertions(+)
>
>diff --git a/documentation/kernel-dev/kernel-dev-faq=2Erst
>b/documentation/kernel-dev/kernel-dev-faq=2Erst
>index 70bf4a2d4=2E=2E929cc4aad 100644
>--- a/documentation/kernel-dev/kernel-dev-faq=2Erst
>+++ b/documentation/kernel-dev/kernel-dev-faq=2Erst
>@@ -79,3 +79,52 @@ following:
>=20
>    APPEND +=3D "printk=2Etime=3Dy initcall_debug debug"
>=20
>+How do I use a vanilla Linux kernel with my machine?
>+----------------------------------------------------
>+
>+The simplest way to use a vanilla kernel is with the ``linux-yocto``
>kernel
>+maintained by openembedded-core=2E Using this kernel is as simple as
>adding the
>+following to your machine=2Econf file:
>+::
>+
>+   # Use a defconfig provided by the kernel=2E If you are going to
>provide your
>+   # own defconfig in SRC_URI as show below, you'll need to omit this

s/show/shown/

>line
>+   KBUILD_DEFCONFIG =3D "multi_v7_defconfig"
>+
>+   # Use default value for all symbols=2E This is usually what you want
>when
>+   # providing a defconfig
>+   KCONFIG_MODE =3D "alldefconfig"
>+

KCONFIG_MODE is not explained in the Variables Glossary, could you please =
fix that?

>+   # Make linux-yocto provide the kernel
>+   PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
>+
>+   # If you want to use a specific version of the upstream kernel,
>uncomment
>+   # and set this line, otherwise omit it to use the latest stable
>kernel

Here's to hoping that no layer with a higher priority provide their own li=
nux-yocto :)

>+   #PREFERRED_VERSION_linux-yocto =3D "5=2E8=2E%"
>+
>+You will also need to add a =2Ebbappend in your BSP layer to amend the
>+linux-yocto recipe (e=2Eg=2E recipes-kernel/linux/linux-yocto_%=2Ebbappe=
nd):

``linux-yocto`` and the path in double tick too=2E

>+::
>+
>+    FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>+
>+    # Uncomment this line to provide your own defconfig file in your
>BSP layer:
>+    # SRC_URI_append_my-machine =3D " file://defconfig"
>+
>+    # Marks the recipe as compatible with your machine=2E Be sure to
>replace
>+    # my-machine with the name of your machine
>+    COMPATIBLE_MACHINE =2E=3D "|my-machine"
>+

I don't think spaces matter in COMPATIBLE_MACHINE but happy to be proven o=
therwise=2E In that case, probably +=3D would be better as it's usually wha=
t's used throughout the docs? As to not confuse beginners?

>+You can also apply patches and config fragements in the bbappend if
s/fragements/fragments/
>desired,
>+see :ref:`kernel-dev/kernel-dev-common:applying patches` and
>+:ref:`kernel-dev/kernel-dev-common:changing the configuration` in the
>Kernel
>+dev manual=2E It is recommended that you use ``_append_my-machine`` to
>prevent
>+these changes from inadverently leaking into other machine
>configurations

Missing dot at the end of the sentence=2E

>+
>+=2E=2E note::
>+    You will notice that this is will still pull the kernel source

Not a native, but my doubts on "you will notice" being correct?

s/is//

>from `the
>+    Yocto Kernel git repo
>+    <https://git=2Eyoctoproject=2Eorg/cgit/cgit=2Ecgi/linux-yocto/>`_,

:yocto_git:`the Yocto Kernel git repo </cgit/cgit=2Ecgi/linux-yocto/>`

Thanks,
Quentin
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
