Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ACAD6B068
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17202.1769700263441572566
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=e4bxEAzD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DDDA04E42325
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3CE3606FD
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8DF4119A886D;
	Thu, 29 Jan 2026 16:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TFvQLQs+MC8uMNVx/wBlAujV+BfiJckgBuxWIBoWOus=;
	b=e4bxEAzDnWYMaRewX3LEI/iL4V1xTaCeHOvCBGXjUPjx0+wjH5q4Z71JZxIoDwaqseXC6p
	MovTGf4/dm01oZbDANpW+1zSaSLS/SIETrMi0Zd2R3+6Aq+l2OR4nlmSTh3MPws3XPa+LM
	AEuN5Tbum06CNvps76bEA3Sjx7h6gafrzcgo8XI/hukf9TSqwQnK/ohIE8+1S9LQnSPMW7
	IQt+66OzyiB2wbWujdhyfaiuHlFKMW7uJsJHrXdLEur87g7A33koeBiL2Ae1bbsIjNIb0f
	IA7b9zPt+7TTiEHORAa7EddqzdwmVZAwxK+KkPfuzSC8HUGEiq8i1Oxl43rPJQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:17 +0100
Subject: [PATCH v3 26/57] ref-manual/structure.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260129-remove-poky-references-v3-26-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16077;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=CRBdkl2WAy920g5OtRoJP9/E9+MeRbI8Dj9NcW/ZpVE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uN1NwiDgSiQL7Di2e7fHtQDks5Cis1huZJx
 sUVRFLuofCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jQAKCRDRgEFAKaOo
 NqmHD/0Rc3pabcwxd5xF1r4ESxA6oXc9o2nfgr2cG7Vp4r2oosVkymW3et9MqHLP4WTxm5MS08/
 JqCBBfdHEyFP1aALqhFL0JngUl+R5Jckb9pPePXNB7RtzFcJze7oatiwaac1lauO+5rsZnsSuNc
 ykyGhH/ggmtzo4QVV1jtyRon8iYrUgXvMXXEzj/kXVkZTBc39TGaPLrkGzAhcHclOayWvOaaUy5
 N4zZVbeCTT5uF62stgOCpjfZtxDGsu61Lb7zDTRuQv/I/Dc+MxkeTDnhlmswuDpQi+n3ItdXz+T
 NBAByS1GADspRLdvAt4zTg4TZ5j8UfKIjKzlHPwh99UImY/1Hs2GtyhrEmN6wnavzIHThtL0wU0
 140Fl5C1DS1nBGLw2NSGSnxkXTGp2Pwi3Iuf76L/GThT7/BowADEkqPRlKLxkuha0ABSg0mPm3l
 13jFN/gyYRb54BYq+jYAfaTIj25Xu2xDEVPTWUtu0nM1xNT8JaL9iHZia6u/nQ2RS72KKWg+k1J
 NfosxnImwziq1b0hxxnM6UxhhyhehqKJ/DEZoB6iFf61EiJIKhbV6tjUvfbrDpb7HrcX/yzvJSk
 U8vUKcE+GLKjL2J7M5NTU5cFwkyvLeY9Ms1hDwNVtSKIYJ0DQZxce/TkZZLA2KSDzwFU+LGQa2L
 +0APy5U2UKKZXLA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8812

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases.

Add a introductory directory layout at the top that is reflected in the
following section. This document no longer uses Poky as its source
directory, so all paths are explicitly mentioned, to highlight the
separation between core components. This lead to some re-organization of
some sections.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/bsp-guide/bsp.rst        |   4 +-
 documentation/ref-manual/structure.rst | 165 ++++++++++++++++++++-------=
------
 documentation/ref-manual/terms.rst     |   2 +-
 3 files changed, 104 insertions(+), 67 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bs=
p.rst
index 4a89d691a..a3b57d29f 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -81,7 +81,7 @@ directory of that Layer. This directory is what you add=
 to the
 ``conf/bblayers.conf`` file found in your
 :term:`Build Directory`, which is
 established after you run the OpenEmbedded build environment setup
-script (i.e. :ref:`ref-manual/structure:``oe-init-build-env```).
+script (i.e. :ref:`structure-core-script`).
 Adding the root directory allows the :term:`OpenEmbedded Build System`
 to recognize the BSP
 layer and from it build an image. Here is an example::
@@ -221,7 +221,7 @@ section.
       Checking connectivity... done.
=20
 #. *Initialize the Build Environment:* While in the :term:`Source Direct=
ory`,
-   run the :ref:`ref-manual/structure:``oe-init-build-env``` environment=
 setup
+   run the :ref:`structure-core-script` environment setup
    script located in :term:`OpenEmbedded-Core (OE-Core)` to define the O=
penEmbedded
    build environment on your build host. ::
=20
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
index d567cade0..06cd2b770 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -16,6 +16,19 @@ and directories.
    names that contain spaces. Be sure that the Source Directory you use
    does not contain these types of names.
=20
+For the following sections, we assume the core components of the :term:`=
Source
+Directory` are organized as follows:
+
+.. code-block:: text
+
+   =E2=94=9C=E2=94=80=E2=94=80 build/
+   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 ...
+   =E2=94=94=E2=94=80=E2=94=80 layers/
+       =E2=94=9C=E2=94=80=E2=94=80 bitbake/
+       =E2=94=9C=E2=94=80=E2=94=80 meta-yocto/
+       =E2=94=9C=E2=94=80=E2=94=80 openembedded-core/
+       =E2=94=94=E2=94=80=E2=94=80 yocto-docs/
+
 .. _structure-core:
=20
 Top-Level Core Components
@@ -67,8 +80,10 @@ about the contents of the :term:`Build Directory`.
=20
 .. _handbook:
=20
-``documentation/``
-------------------
+``layers/yocto-docs/``
+----------------------
+
+The Yocto documentation repository is hosted at :yocto_git:`/yocto-docs`=
.
=20
 This directory holds the source for the Yocto Project documentation as
 well as templates and tools that allow you to generate PDF and HTML
@@ -76,37 +91,28 @@ versions of the manuals. Each manual is contained in =
its own sub-folder;
 for example, the files for this reference manual reside in the
 ``ref-manual/`` directory.
=20
+This directory is not mandatory for building with :term:`BitBake`.
+
+``layers/openembedded-core/``
+-----------------------------
+
+The :term:`OpenEmbedded-Core (OE-Core)` repository is hosted at
+:oe_git:`/openembedded-core`.
+
 .. _structure-core-meta:
=20
 ``meta/``
----------
+~~~~~~~~~
=20
-This directory contains the minimal, underlying OpenEmbedded-Core
-metadata. The directory holds recipes, common classes, and machine
+This directory contains the minimal, underlying :term:`OpenEmbedded-Core
+(OE-Core)` metadata. The directory holds recipes, common classes, and ma=
chine
 configuration for strictly emulated targets (``qemux86``, ``qemuarm``,
 and so forth.)
=20
-.. _structure-core-meta-poky:
-
-``meta-poky/``
---------------
-
-Designed above the ``meta/`` content, this directory adds just enough
-metadata to define the Poky reference distribution.
-
-.. _structure-core-meta-yocto-bsp:
-
-``meta-yocto-bsp/``
--------------------
-
-This directory contains the Yocto Project reference hardware Board
-Support Packages (BSPs). For more information on BSPs, see the
-:doc:`/bsp-guide/index`.
-
 .. _structure-meta-selftest:
=20
 ``meta-selftest/``
-------------------
+~~~~~~~~~~~~~~~~~~
=20
 This directory adds additional recipes and append files used by the
 OpenEmbedded selftests to verify the behavior of the build system. You
@@ -116,14 +122,14 @@ want to run the selftests.
 .. _structure-meta-skeleton:
=20
 ``meta-skeleton/``
-------------------
+~~~~~~~~~~~~~~~~~~
=20
 This directory contains template recipes for BSP and kernel development.
=20
 .. _structure-core-scripts:
=20
 ``scripts/``
-------------
+~~~~~~~~~~~~
=20
 This directory contains various integration scripts that implement extra
 functionality in the Yocto Project environment (e.g. QEMU scripts). The
@@ -137,7 +143,7 @@ back to the Yocto Project, such as ``create-pull-requ=
est`` and
 .. _structure-core-script:
=20
 ``oe-init-build-env``
----------------------
+~~~~~~~~~~~~~~~~~~~~~
=20
 This script sets up the OpenEmbedded build environment. Running this
 script with the ``source`` command in a shell makes changes to ``PATH``
@@ -166,16 +172,27 @@ targets to build. Here is an example::
=20
    You can also run generated QEMU images with a command like 'runqemu q=
emux86-64'
=20
+.. note::
+
+   When using :doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-u=
ser-manual-environment-setup>`,
+   this script is indirectly sourced when sourcing the ``init-build-env`=
`
+   located in the :term:`bitbake:Setup`'s build directory. However, comp=
ared to
+   ``oe-init-build-env``, the bitbake-setup ``init-build-env`` does not =
take any
+   argument, as it is already located in a :term:`Build Directory`.
+
+   See :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-environment=
-setup`
+   for more information.
+
 The default output of the ``oe-init-build-env`` script is from the
-``conf-summary.txt`` and ``conf-notes.txt`` files, which are found in th=
e ``meta-poky`` directory
-within the :term:`Source Directory`. If you design a
-custom distribution, you can include your own versions of these
-configuration files where you can provide a brief summary and detailed u=
sage
-notes, such as a list of the targets defined by your distribution.
-See the
-":ref:`dev-manual/custom-template-configuration-directory:creating a cus=
tom template configuration directory`"
-section in the Yocto Project Development Tasks Manual for more
-information.
+``conf-summary.txt`` and ``conf-notes.txt`` files, which are found in th=
e
+``meta/conf/templates/default`` directory of :term:`OpenEmbedded-Core
+(OE-Core)`. If you design a custom distribution, you can include your ow=
n
+versions of these configuration files where you can provide a brief summ=
ary and
+detailed usage notes, such as a list of the targets defined by your
+distribution. See the
+":ref:`dev-manual/custom-template-configuration-directory:creating a cus=
tom
+template configuration directory`" section in the Yocto Project Developm=
ent
+Tasks Manual for more information.
=20
 By default, running this script without a :term:`Build Directory` argume=
nt
 creates the ``build/`` directory in your current working directory. If
@@ -188,8 +205,8 @@ your choice. For example, the following command creat=
es a
    $ source oe-init-build-env ~/mybuilds
=20
 The OpenEmbedded build system uses the template configuration files, whi=
ch
-are found by default in the ``meta-poky/conf/templates/default`` directo=
ry in the Source
-Directory. See the
+are found by default in the ``meta/conf/templates/default`` directory in
+:term:`OpenEmbedded-Core (OE-Core)`. See the
 ":ref:`dev-manual/custom-template-configuration-directory:creating a cus=
tom template configuration directory`"
 section in the Yocto Project Development Tasks Manual for more
 information.
@@ -198,17 +215,35 @@ information.
=20
    The OpenEmbedded build system does not support file or directory
    names that contain spaces. If you attempt to run the ``oe-init-build-=
env``
-   script from a Source Directory that contains spaces in either the
+   script from a :term:`Source Directory` that contains spaces in either=
 the
    filenames or directory names, the script returns an error indicating
-   no such file or directory. Be sure to use a Source Directory free of
+   no such file or directory. Be sure to use a :term:`Source Directory` =
free of
    names containing spaces.
=20
-.. _structure-basic-top-level:
+``layers/meta-yocto/``
+----------------------
+
+The ``meta-yocto`` repository is hosted at :yocto_git:`/meta-yocto`.
=20
-``LICENSE, README, and README.hardware``
-----------------------------------------
+.. _structure-core-meta-poky:
+
+``meta-poky/``
+~~~~~~~~~~~~~~
+
+Dependent on the :term:`OpenEmbedded-Core (OE-Core)` metadata, this dire=
ctory
+adds just enough metadata to define the Poky reference distribution.
+
+Namely, it contains the distro :term:`configuration file` for Poky:
+``conf/distro/poky.conf``.
+
+.. _structure-core-meta-yocto-bsp:
=20
-These files are standard top-level files.
+``meta-yocto-bsp/``
+~~~~~~~~~~~~~~~~~~~
+
+This directory contains the Yocto Project reference hardware Board
+Support Packages (BSPs). For more information on BSPs, see the
+:doc:`/bsp-guide/index`.
=20
 .. _structure-build:
=20
@@ -257,7 +292,7 @@ This directory should not be shared between builds.
    you need to share the :ref:`overview-manual/concepts:Hash Equivalence=
`
    database, don't share this file and instead refer to the
    :doc:`/dev-manual/hashequivserver` document of the Yocto Project Deve=
lopment
-   Tasks Manual to setup Hash Equivalence server.
+   Tasks Manual to setup a Hash Equivalence server.
=20
 .. _structure-build-conf-local.conf:
=20
@@ -275,14 +310,14 @@ file, it is recommended to put them into a distro :=
term:`configuration file`, or
 to create layer :term:`configuration fragments <Configuration Fragment>`=
 from
 changes made here.
=20
-The :term:`OpenEmbedded Build System` can create it from a ``local.conf.=
sample``
-file when you ``source`` the top-level build environment setup script
-:ref:`structure-core-script`.
+The :term:`OpenEmbedded Build System` can create the ``local.conf`` file=
 from a
+``local.conf.sample`` file when you ``source`` the top-level build envir=
onment
+setup script :ref:`structure-core-script`.
=20
 The source ``local.conf.sample`` file used depends on the
-:term:`TEMPLATECONF` script variable, which defaults to ``meta-poky/conf=
/templates/default``
+:term:`TEMPLATECONF` script variable, which defaults to ``layers/meta-yo=
cto/meta-poky/conf/templates/default``
 when you are building from the Yocto Project development environment,
-and to ``meta/conf/templates/default`` when you are building from the Op=
enEmbedded-Core
+and to ``layers/openembedded-core/meta/conf/templates/default`` when you=
 are building from the OpenEmbedded-Core
 environment. Because the script variable points to the source of the
 ``local.conf.sample`` file, this implies that you can configure your
 build environment from any layer by setting the variable in the
@@ -298,9 +333,9 @@ file, it uses ``sed`` to substitute final
 .. note::
=20
    You can see how the :term:`TEMPLATECONF` variable is used by looking =
at the
-   ``scripts/oe-setup-builddir`` script in the :term:`Source Directory`.
-   You can find the Yocto Project version of the ``local.conf.sample`` f=
ile in
-   the ``meta-poky/conf/templates/default`` directory.
+   ``layers/openembedded-core/scripts/oe-setup-builddir`` script in :ter=
m:`OpenEmbedded-Core (OE-Core)`.
+   You can find the :term:`Poky` version of the ``local.conf.sample`` fi=
le in
+   the ``layers/meta-yocto/meta-poky/conf/templates/default`` directory.
=20
 .. _structure-build-conf-bblayers.conf:
=20
@@ -319,9 +354,9 @@ when you ``source`` the top-level build environment s=
etup script (i.e.
=20
 As with the :ref:`structure-build-conf-local.conf` file, the source ``bb=
layers.conf.sample``
 file used depends on the :term:`TEMPLATECONF` script variable, which
-defaults to ``meta-poky/conf/templates/default`` when you are building f=
rom the Yocto
-Project development environment, and to ``meta/conf/templates/default`` =
when you are
-building from the OpenEmbedded-Core environment. Because the script
+defaults to ``meta-poky/conf/templates/default`` when you are building u=
sing the
+:term:`Poky` reference distro, and to ``meta/conf/templates/default`` wh=
en you are
+building from the OpenEmbedded-Core environment (default). Because the s=
cript
 variable points to the source of the ``bblayers.conf.sample`` file, this
 implies that you can base your build from any layer by setting the
 variable in the top-level build environment setup script as follows::
@@ -329,13 +364,13 @@ variable in the top-level build environment setup s=
cript as follows::
    TEMPLATECONF=3Dyour_layer/conf/templates/your_template_name
=20
 Once the build process gets the sample file, it uses ``sed`` to substitu=
te final
-``${``\ :term:`OEROOT`\ ``}`` values for all ``##OEROOT##`` values.
+``${``\ :term:`OEROOT`\ ``}`` values for all ``##OEROOT##`` occurrences.
=20
 .. note::
=20
    You can see how the :term:`TEMPLATECONF` variable is defined by the `=
`scripts/oe-setup-builddir``
-   script in the :term:`Source Directory`. You can find the Yocto Projec=
t
-   version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/=
templates/default``
+   script in :term:`OpenEmbedded-Core (OE-Core)`. You can find the :term=
:`Poky`
+   version of the ``bblayers.conf.sample`` file in the ``layers/meta-yoc=
to/meta-poky/conf/templates/default``
    directory.
=20
 .. _structure-build-conf-site.conf:
@@ -351,8 +386,9 @@ You could for example edit this file to limit the num=
ber of threads used by
 want to access downloaded files (:term:`DL_DIR`).
=20
 This file can be shared for multiple build directories. For example,
-``bitbake-setup`` makes the :ref:`structure-build-conf-site.conf` file a
-symbolic link to a common ``site.conf`` file::
+:doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-env=
ironment-setup>`
+makes the :ref:`structure-build-conf-site.conf` file a symbolic link to =
a common
+``site.conf`` file::
=20
    =E2=94=9C=E2=94=80=E2=94=80 poky-master-poky-distro_poky-machine_qemu=
x86-64/
    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 build/
@@ -757,11 +793,12 @@ space if they were to be shared with the standard :=
term:`Sysroot` mechanism.
=20
 .. _structure-meta:
=20
-The Metadata --- ``meta/``
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+The OpenEmbedded-Core (OE-Core) Metadata --- ``meta/``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
-As mentioned previously, :term:`Metadata` is the core of the
-Yocto Project. Metadata has several important subdivisions:
+As mentioned previously, the :term:`OpenEmbedded-Core (OE-Core)`
+:term:`metadata` is the core of the Yocto Project. This metadata has sev=
eral
+important subdivisions:
=20
 .. _structure-meta-classes:
=20
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
index 22f2c4f79..cbe7c88e6 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -63,7 +63,7 @@ universal, the list includes them just in case:
       This term refers to the area used by the OpenEmbedded build system=
 for
       builds. The area is created when you ``source`` the setup environm=
ent
       script that is found in the Source Directory
-      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```, or
+      (i.e. :ref:`structure-core-script`, or
       ``init-build-env`` when using :doc:`bitbake-setup
       <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup=
>`). The
       :term:`TOPDIR` variable points to the :term:`Build Directory`.

--=20
2.52.0


