Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.11109.1619896279927657183
 for <docs@lists.yoctoproject.org>;
 Sat, 01 May 2021 12:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.100.75
Received: from [127.0.0.1] (80-110-100-75.cgn.dynamic.surfer.at [80.110.100.75])
	(Authenticated sender: foss@0leil.net)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9CF6B1BF209;
	Sat,  1 May 2021 19:11:15 +0000 (UTC)
Date: Sat, 01 May 2021 19:11:13 +0000
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org, "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] sdk-manual: various cleanups to intro.rst
In-Reply-To: <f8833f4-34ab-98d2-ede1-881bf279ee60@crashcourse.ca>
References: <f8833f4-34ab-98d2-ede1-881bf279ee60@crashcourse.ca>
Message-ID: <BB89D528-4B9B-4E2A-808E-F679154865B2@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Robert

On May 1, 2021 6:09:36 PM UTC, "Robert P=2E J=2E Day" <rpjday@crashcourse=
=2Eca> wrote:
>
>Minutiae including grammar fixes, increased brevity and adding a
>proper link to another SDK manual section=2E
>
>Signed-off-by: Robert P=2E J=2E Day <rpjday@crashcourse=2Eca>
>
>---
>
>diff --git a/documentation/sdk-manual/intro=2Erst b/documentation/sdk-man=
ual/intro=2Erst
>index d966efea7=2E=2E22af4bec1 100644
>--- a/documentation/sdk-manual/intro=2Erst
>+++ b/documentation/sdk-manual/intro=2Erst
>@@ -8,8 +8,8 @@ eSDK Introduction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Welcome to the Yocto Project Application Development and the Extensible
>-Software Development Kit (eSDK) manual=2E This manual provides informati=
on
>-that explains how to use both the Yocto Project extensible and standard
>+Software Development Kit (eSDK) manual=2E This manual
>+explains how to use both the Yocto Project extensible and standard
> SDKs to develop applications and images=2E
>
> =2E=2E note::
>@@ -25,12 +25,13 @@ SDKs to develop applications and images=2E
> All SDKs consist of the following:
>
> -  *Cross-Development Toolchain*: This toolchain contains a compiler,
>-   debugger, and various miscellaneous tools=2E
>+   debugger, and various associated tools=2E
>
> -  *Libraries, Headers, and Symbols*: The libraries, headers, and
>-   symbols are specific to the image (i=2Ee=2E they match the image)=2E
>+   symbols are specific to the image (i=2Ee=2E they match the image
>+   against which the SDK was built)=2E
>
>--  *Environment Setup Script*: This ``*=2Esh`` file, once run, sets up t=
he
>+-  *Environment Setup Script*: This ``*=2Esh`` file, once sourced, sets =
up the
>    cross-development environment by defining variables and preparing for
>    SDK use=2E
>
>@@ -48,14 +49,14 @@ time since that path cannot be dynamically altered=2E=
 This is the reason
> for a wrapper around the ``populate_sdk`` and ``populate_sdk_ext``
> archives=2E
>
>-Another feature for the SDKs is that only one set of cross-compiler
>+Another feature of the SDKs is that only one set of cross-compiler
> toolchain binaries are produced for any given architecture=2E This featu=
re
> takes advantage of the fact that the target hardware can be passed to
> ``gcc`` as a set of compiler options=2E Those options are set up by the
> environment script and contained in variables such as
> :term:`CC` and
> :term:`LD`=2E This reduces the space needed
>-for the tools=2E Understand, however, that every target still needs a
>+for the tools=2E Understand, however, that every target still needs its =
own
> sysroot because those binaries are target-specific=2E
>
> The SDK development environment consists of the following:
>@@ -118,8 +119,8 @@ The Cross-Development Toolchain
>
> The :term:`Cross-Development Toolchain` consists
> of a cross-compiler, cross-linker, and cross-debugger that are used to
>-develop user-space applications for targeted hardware=2E Additionally, f=
or
>-an extensible SDK, the toolchain also has built-in ``devtool``
>+develop user-space applications for targeted hardwarer; in addition,

Small typo here, should be hardware and not hardwarer I think=2E

For the rest,
Reviewed-by: Quentin Schulz <foss@0leil=2Enet>

Thanks!
Quentin

>+the extensible SDK comes with built-in ``devtool``
> functionality=2E This toolchain is created by running a SDK installer
> script or through a :term:`Build Directory` that is based on
> your metadata configuration or extension for your targeted device=2E The
>@@ -138,21 +139,19 @@ The QEMU Emulator
> -----------------
>
> The QEMU emulator allows you to simulate your hardware while running
>-your application or image=2E QEMU is not part of the SDK but is made
>-available a number of different ways:
>+your application or image=2E QEMU is not part of the SDK but is
>+automatically installed and available if you have done any one of
>+the following:
>
>--  If you have cloned the ``poky`` Git repository to create a
>-   :term:`Source Directory` and you have
>-   sourced the environment setup script, QEMU is installed and
>-   automatically available=2E
>+-  cloned the ``poky`` Git repository to create a
>+   :term:`Source Directory` and sourced the environment setup script=2E
>
>--  If you have downloaded a Yocto Project release and unpacked it to
>-   create a Source Directory and you have sourced the environment setup
>-   script, QEMU is installed and automatically available=2E
>+-  downloaded a Yocto Project release and unpacked it to
>+   create a Source Directory and sourced the environment setup
>+   script=2E
>
>--  If you have installed the cross-toolchain tarball and you have
>-   sourced the toolchain's setup environment script, QEMU is also
>-   installed and automatically available=2E
>+-  installed the cross-toolchain tarball and
>+   sourced the toolchain's setup environment script=2E
>
> SDK Development Model
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>@@ -202,10 +201,9 @@ You just need to follow these general steps:
>
>    =2E=2E note::
>
>-      To use the root filesystem in QEMU, you need to extract it=2E See
>-      the "
>-      Extracting the Root Filesystem
>-      " section for information on how to extract the root filesystem=2E
>+      To use the root filesystem in QEMU, you need to extract it=2E See =
the
>+      ":ref:`sdk-manual/appendix-obtain:extracting the root filesystem`"
>+      section for information on how to do this extraction=2E
>
> 3=2E *Develop and Test your Application:* At this point, you have the
>    tools to develop your application=2E If you need to separately instal=
l
>
>
>--=20
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>Robert P=2E J=2E Day                                 Ottawa, Ontario, CAN=
ADA
>                         http://crashcourse=2Eca
>
>LinkedIn:                               http://ca=2Elinkedin=2Ecom/in/rpj=
day
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
