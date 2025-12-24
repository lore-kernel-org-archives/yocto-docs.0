Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB39E776F0
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123729.1766593927358459602
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fxMJW8Uz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B2FDA1A23E4
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83F5E6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D41310AB1382;
	Wed, 24 Dec 2025 17:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cdpcN/U81r2664r47pxtl4brbK7USOLYrt90PEyF5jk=;
	b=fxMJW8UzlNCotN+blWDwDyIMym5ikZsdqgMSJM/6D4cqHSmWQ9MvFNiTB/slvcZy7j92pH
	fd7KIzU0718+hibMB+AoYauHFrFVmVtKXjdw/oKgw6I9mV4dF+yw7s1HXlRL9uRHh8MGlJ
	/lGA7eA0H48y6E1dwRVp6KIrWTbevfQEFYU9xN52xYN+uUWcP1PRchhgCDN6+iBJPvFyVj
	IUBOHy6XK200LZ+IhgIwMiJe86Ap6DwKfavbieVVmKTbV4DuPDLTOylWzL1F5b6E2pw82H
	Wh0bU1CBuSdJRcNyxVDPP0QvLHMrx5hyrp40efitGkJMVWx4ScbyRYFGxXgk7w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:52 +0100
Subject: [PATCH 26/53] ref-manual/structure.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251224-remove-poky-references-v1-26-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=15141;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KX5JlF81HFtZ+GqIXWw9Sc0fHs88iUQQjxhxS7YNMlY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVrssszfEub9xU7yl3HWHpquouPZUMXAQDax
 OVpuw3Aw9uJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVawAKCRDRgEFAKaOo
 NmuEEACwOzq7TbeHqlaoTiWd9tXdt3wyvXvbn8uLrzD2QqR8d0RVAUF1zMi8npxbOv/pxjcH5fw
 4MTUzKqsFmBzsANN+R2seYQ/SLoc/Ag8gIsisNwUFMNmkDFel1PaXy0HePAWYmFORi2BujEQ9KM
 6mAcdlq5HiEt+Fm/1i6TMVcbgtjYeibV5AHLIRq6ksK2k9EKUl3cdabPv4bcLoXllFAgTbKixza
 i9+x6MMOwPobv/dEJBszNjnfFN13inwpAdr0g2b4u5H+ul5NmU2HSDyef+ibzJ3SlpCk7lxkVIv
 RdiPmDwZjTYnma8CYCLBW4WOjpsfBtwphMPxL5CiAQY7Qcdv54vTHo6dCCrYFUgre7JJhl6qSSR
 qNyBailMbxYmQc0SOT89ukSISyC51m2T/0/MiVeZi9q2ZdCH/zlSFxXy/QXhyUP9ckiYfhmnHsL
 wGXbMyktEtK1uSC5dKtpr/F1LAcFK50LLTVPAxzPK3QFp1HmboAOAcgXaehKzQYsO0kkqvdGYDv
 tA+dIFHmejDniveSzuU5OZxSa79FXjiAaiUWI1eDUIjvKSTi7khHL4mwhd6KjWeqI+AnQOlNTjc
 1K6PD60w8UUhQpJN+PXoCuHEUgU9GGX5d4BkcdkQs+SV9q5345hCNadIDSZ2Ew4vXDVZc1sXwcj
 Tv1qotzb55MJhUQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8355

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
 documentation/ref-manual/structure.rst | 150 +++++++++++++++++++--------=
------
 documentation/ref-manual/terms.rst     |   2 +-
 3 files changed, 90 insertions(+), 66 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bs=
p.rst
index 8e332aec0..9da8400d2 100644
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
 #. *Initialize the Build Environment:* While in the directory where the
-   different layers are cloned, run the :ref:`ref-manual/structure:``oe-=
init-build-env```
+   different layers are cloned, run the :ref:`structure-core-script`
    environment setup script located in :term:`OpenEmbedded-Core (OE-Core=
)` to
    define the OpenEmbedded build environment on your build host. ::
=20
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
index d567cade0..3b8fb0263 100644
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
@@ -67,8 +80,8 @@ about the contents of the :term:`Build Directory`.
=20
 .. _handbook:
=20
-``documentation/``
-------------------
+``layers/yocto-docs/``
+----------------------
=20
 This directory holds the source for the Yocto Project documentation as
 well as templates and tools that allow you to generate PDF and HTML
@@ -76,37 +89,22 @@ versions of the manuals. Each manual is contained in =
its own sub-folder;
 for example, the files for this reference manual reside in the
 ``ref-manual/`` directory.
=20
+This directory is not mandatory for building with :term:`BitBake`.
+
 .. _structure-core-meta:
=20
-``meta/``
----------
+``layers/openembedded-core/meta/``
+----------------------------------
=20
 This directory contains the minimal, underlying OpenEmbedded-Core
 metadata. The directory holds recipes, common classes, and machine
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
-``meta-selftest/``
-------------------
+``layers/openembedded-core/meta-selftest/``
+-------------------------------------------
=20
 This directory adds additional recipes and append files used by the
 OpenEmbedded selftests to verify the behavior of the build system. You
@@ -115,15 +113,15 @@ want to run the selftests.
=20
 .. _structure-meta-skeleton:
=20
-``meta-skeleton/``
-------------------
+``layers/openembedded-core/meta-skeleton/``
+-------------------------------------------
=20
 This directory contains template recipes for BSP and kernel development.
=20
 .. _structure-core-scripts:
=20
-``scripts/``
-------------
+``layers/openembedded-core/scripts/``
+-------------------------------------
=20
 This directory contains various integration scripts that implement extra
 functionality in the Yocto Project environment (e.g. QEMU scripts). The
@@ -136,8 +134,8 @@ back to the Yocto Project, such as ``create-pull-requ=
est`` and
=20
 .. _structure-core-script:
=20
-``oe-init-build-env``
----------------------
+``layers/openembedded-core/oe-init-build-env``
+----------------------------------------------
=20
 This script sets up the OpenEmbedded build environment. Running this
 script with the ``source`` command in a shell makes changes to ``PATH``
@@ -166,16 +164,27 @@ targets to build. Here is an example::
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
@@ -188,8 +197,8 @@ your choice. For example, the following command creat=
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
@@ -198,17 +207,30 @@ information.
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
+.. _structure-core-meta-poky:
+
+``layers/meta-yocto/meta-poky/``
+--------------------------------
+
+Dependent on the :term:`OpenEmbedded-Core (OE-Core)` metadata, this dire=
ctory
+adds just enough metadata to define the Poky reference distribution.
=20
-``LICENSE, README, and README.hardware``
-----------------------------------------
+Namely, it contains the distro :term:`configuration file` for Poky:
+``conf/distro/poky.conf``.
+
+.. _structure-core-meta-yocto-bsp:
=20
-These files are standard top-level files.
+``layers/meta-yocto/meta-yocto-bsp/``
+-------------------------------------
+
+This directory contains the Yocto Project reference hardware Board
+Support Packages (BSPs). For more information on BSPs, see the
+:doc:`/bsp-guide/index`.
=20
 .. _structure-build:
=20
@@ -257,7 +279,7 @@ This directory should not be shared between builds.
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
@@ -275,9 +297,9 @@ file, it is recommended to put them into a distro :te=
rm:`configuration file`, or
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
 :term:`TEMPLATECONF` script variable, which defaults to ``meta-poky/conf=
/templates/default``
@@ -298,8 +320,8 @@ file, it uses ``sed`` to substitute final
 .. note::
=20
    You can see how the :term:`TEMPLATECONF` variable is used by looking =
at the
-   ``scripts/oe-setup-builddir`` script in the :term:`Source Directory`.
-   You can find the Yocto Project version of the ``local.conf.sample`` f=
ile in
+   ``scripts/oe-setup-builddir`` script in :term:`OpenEmbedded-Core (OE-=
Core)`.
+   You can find the :term:`Poky` version of the ``local.conf.sample`` fi=
le in
    the ``meta-poky/conf/templates/default`` directory.
=20
 .. _structure-build-conf-bblayers.conf:
@@ -319,9 +341,9 @@ when you ``source`` the top-level build environment s=
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
@@ -329,12 +351,12 @@ variable in the top-level build environment setup s=
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
+   script in the :term:`Source Directory`. You can find the :term:`Poky`
    version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/=
templates/default``
    directory.
=20
@@ -351,8 +373,9 @@ You could for example edit this file to limit the num=
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
@@ -757,11 +780,12 @@ space if they were to be shared with the standard :=
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
index ea674eff6..729c9746c 100644
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
2.51.0


