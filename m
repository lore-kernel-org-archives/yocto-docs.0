Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771EDCA6C9A
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6057.1769501980931976013
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=yL01k95A;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5F9774E422CB
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37FF5606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89012119A8693;
	Tue, 27 Jan 2026 09:19:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZoF1sPPHHwRFe6EoL9wucp23JWNhVAsDGE7NY1M4qPA=;
	b=yL01k95Ari6+k33wq+T6QzptNaVPYaMObojRgk9WLshS0/vTB1aRy4WdBO+Gpkbd7gagQs
	n44eUHu7WAlDc6iLqN72x5Jc9meGVteUboJIhfOh28U9qoQmYi66Nmi1+gzWH4JOA1OiI+
	t9Wp17N2jO4sYujpggSuHZeqBDKCtbJuKwu5+VIKh0RMpD7iFS4SfJRQd5pL7GKfyqumOS
	jB1bmNN6B9fgJBU46sr7sbIius6XzpLFxBWN8ogMKzBx6uvTDdn59UL8KoYXyc1zI94kq+
	odshUNV2C9OMLWFLWS+M64AJr+X5KfGOvrGCuni0K8o7wOC76LSO+xqf1TZnZQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:21 +0100
Subject: [PATCH v2 26/56] ref-manual/structure.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260127-remove-poky-references-v2-26-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16251;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Vzw4kCBx53zjuXaBr/EgWCDsQCNyh3rI8Z5Yl+phl7Q=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUCkJd3wMKrz92BUiyIFgeZUIt3iKZVuITfp
 4C9VSER0UaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AgAKCRDRgEFAKaOo
 NhoID/0ZRJPmhpn8I7JxPD+s2iERDnbz3HH84FuvndkSWEZB7TvgRxJZk2vk4tWs/m0OiDXSWkJ
 73YNfgsJ3L8wBy9Ha2gl0xTZPvjdInoTDFQtynCJ35ql4BycmOo2l8WFnccKPnCEXDa7cdFAwKF
 GPZX+hAAwv1pYcORQR+ujcS9GI7T6yha2c/anpgVTIzfI1/beyMW9lxLZYKsLurB08h/4iGRwtU
 /MbRzapHHrwQmFZ4sREGhLLvneemXfStYySp2pv43rXY3dzMuPs+zfqhhx4oO00zdx4df33/fEq
 O3gcefZ8IDv6JHrBvlqrl2DSv86y9nkE8xlZh/6GbeS4NBIfah/bqSmgZdalZ26Lfb9w9UApByY
 SZAKePNjs1+51Kj/2GoLGLPpvGHdOxLmYI+5kg85sGVqGv9MSKaaje1oP1XppYWjPNpVfZMdNoh
 N0mVFeaJ2HDJrCpDRJZXDWleZ+smliGnNMxmMmTj9iCeg8MPoQqufDYI+rFAjDbNn9pvEF4Hbsk
 ebAiIaAupGQkvsyBHnaIjdCFsgEr5JdL60n2Z3qxN2Lf5RxIQx0x1Le2SU3iZw10+rbzUotfpv3
 FLvUEfsMFLgevh89VdDUYmiPPrTmvWZ7O/CcekUxFA1kVZVBgMj1AZuabXo8vpefSod4sUWdCVj
 JUMot4yOlcCWMjg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8687

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
 documentation/ref-manual/structure.rst | 169 ++++++++++++++++++++-------=
------
 documentation/ref-manual/terms.rst     |   2 +-
 3 files changed, 105 insertions(+), 70 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bs=
p.rst
index 4c0939ab0..67f61b7b2 100644
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
-run the :ref:`ref-manual/structure:``oe-init-build-env``` environment se=
tup
+run the :ref:`structure-core-script` environment setup
 script located in :term:`OpenEmbedded-Core (OE-Core)` to define the Open=
Embedded
 build environment on your build host. ::
=20
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
index d567cade0..86f3109e1 100644
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
@@ -76,37 +89,28 @@ versions of the manuals. Each manual is contained in =
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
-``meta/``
----------
+``layers/openembedded-core/meta/``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 This directory adds additional recipes and append files used by the
 OpenEmbedded selftests to verify the behavior of the build system. You
@@ -115,15 +119,15 @@ want to run the selftests.
=20
 .. _structure-meta-skeleton:
=20
-``meta-skeleton/``
-------------------
+``layers/openembedded-core/meta-skeleton/``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 This directory contains template recipes for BSP and kernel development.
=20
 .. _structure-core-scripts:
=20
-``scripts/``
-------------
+``layers/openembedded-core/scripts/``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 This directory contains various integration scripts that implement extra
 functionality in the Yocto Project environment (e.g. QEMU scripts). The
@@ -136,8 +140,8 @@ back to the Yocto Project, such as ``create-pull-requ=
est`` and
=20
 .. _structure-core-script:
=20
-``oe-init-build-env``
----------------------
+``layers/openembedded-core/oe-init-build-env``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 This script sets up the OpenEmbedded build environment. Running this
 script with the ``source`` command in a shell makes changes to ``PATH``
@@ -166,16 +170,27 @@ targets to build. Here is an example::
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
@@ -188,8 +203,8 @@ your choice. For example, the following command creat=
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
@@ -198,17 +213,35 @@ information.
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
+
+.. _structure-core-meta-poky:
+
+``layers/meta-yocto/meta-poky/``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Dependent on the :term:`OpenEmbedded-Core (OE-Core)` metadata, this dire=
ctory
+adds just enough metadata to define the Poky reference distribution.
=20
-``LICENSE, README, and README.hardware``
-----------------------------------------
+Namely, it contains the distro :term:`configuration file` for Poky:
+``conf/distro/poky.conf``.
=20
-These files are standard top-level files.
+.. _structure-core-meta-yocto-bsp:
+
+``layers/meta-yocto/meta-yocto-bsp/``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This directory contains the Yocto Project reference hardware Board
+Support Packages (BSPs). For more information on BSPs, see the
+:doc:`/bsp-guide/index`.
=20
 .. _structure-build:
=20
@@ -257,7 +290,7 @@ This directory should not be shared between builds.
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
@@ -275,14 +308,14 @@ file, it is recommended to put them into a distro :=
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
@@ -298,9 +331,9 @@ file, it uses ``sed`` to substitute final
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
@@ -319,9 +352,9 @@ when you ``source`` the top-level build environment s=
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
@@ -329,13 +362,13 @@ variable in the top-level build environment setup s=
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
@@ -351,8 +384,9 @@ You could for example edit this file to limit the num=
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
@@ -757,11 +791,12 @@ space if they were to be shared with the standard :=
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


