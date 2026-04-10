Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09C2F459E7
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158230.1775832231319811189
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=eEH/GY+Y;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 643DAC5C1A4
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36D4E603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A9AB10450077;
	Fri, 10 Apr 2026 16:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KgQ57R74jPK2thA1putXZ6+JcMtfBM0YVeNZO6dWxHA=;
	b=eEH/GY+YGst12bEnMSQJV6Iic/M8eEhXTZzN+lHwHYPK1ZAv7EQ055uyD87waFb5jrZuey
	XeyecePCx0fyzVP5t+JkSig+SU6qahpCZXpgS4cWmdTbO/F0E6TJDz6pGoDV7tL4BUzkh1
	Uh8P2WPn/JOJHUGFDXAmkteSS8u1iqei+CjfMYnqnoweAWBdWYDSnlNKDr9m4GStX/ThvB
	gyRVI7KMLm/6K2ZgU40wW6+AyzwcDMDRa9R/bylc0EIcM+Xa9cgiPZYXPz1q+DYQK1vIIW
	092KTx05iGmgENccSUYgGzcFrL++m4FPl5avtWIHERET4Rbnhk/NnhP1LFXS+A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:41 +0200
Subject: [PATCH 17/18] migration-guides: update 6.0 (Wrynose) release notes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260410-second-release-notes-6-0-v1-17-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=26379;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XcB0z+WXgOD4PEKn2AU8ond7Sl2kdmEWRfgyqHh9+Lc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyZ/jvX9bZcNcbUynTWmobpiFqPdS5KPOM6H
 cc++4okpWmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMmQAKCRDRgEFAKaOo
 NoicD/93bzANlekfwuUW8kCTG13NZSo1EMJ2YlrXeWvr5i2eRRX1oAzYtRUgLHvv7X/h2JN3Idx
 QQqr4TRk1DcYbby0PNKGv6wK39PQnI5JqXT2qvL/B4/KT7EyOFvCfueuMl78RTNz0CkqkdOTCJ1
 IwIaoDKKWa+ID9Vc5GGYzrcFFXRkz+PIbzkemEmh/Ymgo1sglINdV87CIASOCiAYSYF/N+tFFdM
 iTivYGJub8oQGFP/lJTVCpemJWbhu8GRz0bWRveJIYn51AWfR1njkdHm+1CrmODjQJGu0o2b05M
 lnVWkuQzAKahA937eGYZjyXA1Qqx9WOHBLuvT3Q1Qe+ezxpA/I5cFr5blTAfY9UoL+IhY3O0uoP
 plRBPtqTBWPToll8U6gflwNg8yj/0PfwomApbZ27xh7VSKPnRCcbfKYRqS+8JM68t6FuFnSzYTF
 ml1AVYqpo5EQIIxAM2gX0Kyf4lWQvtfXxxWNuTHjL4usyIinT4iu5eb6v0k7P1t0Lq5gEvpTqb7
 Xuh5Mu5lImNsw0dFAU3aIWibg67gDpXmDUmp2C2/xj6zw9hK0M3X8Akz4DmjIY6PGyg+N4nBVvd
 nmxo5vNKTbHrukO0iZU2Dzz9rrU1zBQOwl0YHQBD3KMcRGwbQqj46D4LmpPqlYkPhmyhSFh9t5Y
 O48dsNEomqGPmgw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9248

Update documentation/migration-guides/migration-6.0.rst and
documentation/migration-guides/release-notes-6.0.rst to include
important changes between:

- bitbake: a3ad577439d11 and 5d722b5d65e
- openembedded-core: be8cdcf13a65 and 853baa702e3
- meta-yocto: 0a4ce9dd7fdd and 49cbb01d5252

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst   |  98 ++++++++
 .../migration-guides/release-notes-6.0.rst         | 256 +++++++++++++++=
++++--
 2 files changed, 340 insertions(+), 14 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documenta=
tion/migration-guides/migration-6.0.rst
index 18cb62f1d..8008c547d 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -165,6 +165,19 @@ The following :term:`DISTRO_FEATURES` are now enable=
d by default in
=20
 See commit :oecore_rev:`2e1e7c86064ce36580953650b27cca9ae7c269c4` for mo=
re information.
=20
+Default configuration templates removed from :yocto_git:`meta-poky </met=
a-yocto/tree/meta-poky>`
+------------------------------------------------------------------------=
------------------------
+
+The configuration templates located in ``meta-poky/conf/templates/defaul=
t`` have
+been removed as they are now provided in a single location:
+:term:`OpenEmbedded-Core (OE-Core)` :oecore_path:`meta/conf/templates/de=
fault`.
+
+These files were duplicating themselves but were mostly similar.
+
+See commit :meta_yocto_rev:`ac300baea7314ea3c80f2330b2a993f729f32150` fo=
r more
+information on the differences there are between the two sets of default
+templates.
+
 :ref:`ref-classes-native` and :ref:`ref-classes-cross` classes :term:`DE=
BUG_BUILD` change
 ------------------------------------------------------------------------=
-----------------
=20
@@ -240,6 +253,38 @@ class, meaning recipes using these variables that no=
t yet inheriting the
=20
 See commit :oecore_rev:`68d2d38483efada7bc2409e10508b03a7431caff` for mo=
re information.
=20
+:ref:`ref-classes-vex` output JSON document extension change
+------------------------------------------------------------
+
+Image recipes that inherit the :ref:`ref-classes-vex` class have an extr=
a JSON
+document generated which was previous ending with the ``.json`` suffix. =
For
+example, a build for the ``core-image-minimal`` image recipe with this c=
lass
+would have resulted in a file named::
+
+   core-image-minimal-qemuarm64.rootfs.json
+
+The suffix of this file is now ``.vex.json``. Taking the above example, =
the same
+file is now named::
+
+   core-image-minimal-qemuarm64.rootfs.vex.json
+
+Support for SPDX 2.2 removed
+----------------------------
+
+Support for generating SPDX 2.2 document through the ``create-spdx-2.2``=
 class
+was removed:
+
+.. code-block::
+
+   Removes SPDX 2.2 support in favor of SPDX 3 support being the only
+   option. The SPDX 3 data is far superior to SPDX 2.2 and thus more use=
ful
+   for SBoM uses cases.
+
+See commit :oecore_rev:`12abd0574c267bade0962ecb39d9e8da8c56842b` for mo=
re
+information.
+
+Users are advised to transition to SDPX 3.0, which is provided by the
+:ref:`ref-classes-create-spdx` class.
=20
 .. _ref-migration-6-0-wic-sector-size-change:
=20
@@ -270,6 +315,39 @@ Should be replaced by::
 See commit :oecore_rev:`b50d6debf7baa555fbfb3521c4f952675bba2d37` for mo=
re
 information.
=20
+:doc:`WIC </dev-manual/wic>` files to be moved under ``files/wic``
+------------------------------------------------------------------
+
+:doc:`WIC </dev-manual/wic>` related files such as :doc:`WKS
+</ref-manual/kickstart>` files or custom WIC plugins should be moved to =
the
+``files/wic/`` directory of the layer containing them.
+
+If not done, the build will fail with errors indicating how to move thes=
e files,
+for example::
+
+   wic/wks files at ../meta-custom/wic need to be moved to files/wic wit=
hin the layer to be found/used
+   wic/wks files at ../meta-custom/scripts/lib/wic/canned-wks need to be=
 moved to files/wic within the layer to be found/used
+
+For example, here is the content of the :term:`OpenEmbedded-Core (OE-Cor=
e)`
+"meta" layer as of writing::
+
+   meta/files/wic
+   =E2=94=9C=E2=94=80=E2=94=80 common.wks.inc
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk-bootloader-config.cfg
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk-bootloader-config.wks
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk-gpt.wks
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk-multi-rootfs.wks
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk.wks
+   =E2=94=9C=E2=94=80=E2=94=80 efi-bootdisk.wks.in
+   =E2=94=9C=E2=94=80=E2=94=80 efi-uki-bootdisk.wks.in
+   =E2=94=9C=E2=94=80=E2=94=80 mkefidisk.wks
+   =E2=94=9C=E2=94=80=E2=94=80 mkhybridiso.wks
+   =E2=94=9C=E2=94=80=E2=94=80 qemuloongarch.wks
+   =E2=94=9C=E2=94=80=E2=94=80 qemuriscv.wks
+   =E2=94=9C=E2=94=80=E2=94=80 qemux86-directdisk.wks
+   =E2=94=9C=E2=94=80=E2=94=80 sdimage-bootpart.wks
+   =E2=94=94=E2=94=80=E2=94=80 systemd-bootdisk.wks
+
 Rust language changes
 ---------------------
=20
@@ -314,6 +392,18 @@ The following recipes have been removed in this rele=
ase:
 -  ``systemd-compat-units``: Dropped as a consequence of removing
    :wikipedia:`SysVinit <UNIX_System_V>` support in :wikipedia:`systemd
    <Systemd>`
+   (:oecore_rev:`d9ec9e20eebc062d084dd76b59d665994e0cb51b`)
+
+-  ``gstreamer1.0-vaapi``: removed as it was already provided by the ``v=
a``
+   :term:`PACKAGECONFIG` item of ``gstreamer1.0-plugins-bad``.
+   (:oecore_rev:`9e2d2a5b0c9e062f13651093bb1e459f210618e6`)
+
+-  ``pkgconfig``: replaced by the ``pkgconf`` recipe
+   (:oecore_rev:`e32bf38fab8b2ae417022a4dbd36f7e1ce52c206`)
+
+-  ``python3-pyzstd``: there were no users of this in :term:`OpenEmbedde=
d-Core
+   (OE-Core)` and Python 3.14 now has built-in support for zstd
+   (:oecore_rev:`55061de857657ea01babc5652caa062e8d292c44`)
=20
 Removed :term:`PACKAGECONFIG` options
 -------------------------------------
@@ -321,6 +411,8 @@ Removed :term:`PACKAGECONFIG` options
 -  ``mesa``: ``freedreno-fdperf`` (:oecore_rev:`293edd0d3d077d0fde7ba667=
1dc9a26d5b4cf5e4`)
 -  ``libcxx``: ``no-atomics`` (:oecore_rev:`ccc585f94c51ebaef863f116bcd2=
b41b2d958666`)
 -  ``systemd``: ``sysvinit`` (:oecore_rev:`e00d5d6eac65e2cd88e34c2790469=
c7325bfb37d`)
+-  ``gstreamer1.0-plugins-good``: ``soup2`` (:oecore_rev:`61d653562a5b39=
03aa4e79791b58a75e4dc74236`)
+-  ``webkitgtk``: ``soup2`` (:oecore_rev:`69af43387e809e595b992b3576dde8=
9e700cc711`)
=20
 Removed classes
 ---------------
@@ -340,3 +432,9 @@ Miscellaneous changes
=20
 -  :ref:`ref-classes-meson`: drop ``meson_do_qa_configure`` as it was
    non-functional (:oecore_rev:`0514b451b5d96135c6d24e75e0afa8b5aea513dd=
`)
+
+-  Drop VSCode setup support from the ``oe-init-build-env`` script. User=
s are
+   advised to use :doc:`bitbake-setup
+   <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
+   instead (:oecore_rev:`4e781c6618ae8ba1a3d2c1242a92017dbe44caaf`)
+
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/docum=
entation/migration-guides/release-notes-6.0.rst
index 461a9bc95..a4fd7a169 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -30,10 +30,13 @@ See also the list of new features and enhancements of=
 the previous releases:
 New Features / Enhancements in |yocto-ver|
 ------------------------------------------
=20
--  Linux kernel XXX, gcc XXX, glibc XXX, LLVM XXX, and over XXX other
+-  Linux kernel 6.18, gcc 15.2, glibc 2.43, LLVM 22.1.2, and over 300 ot=
her
    recipe upgrades
=20
--  Minimum Python version required on the host: XXX.
+..
+   Found in meta/classes-global/sanity.bbclass:check_sanity_everybuild
+
+-  Minimum Python version required on the host: 3.9.
=20
 -  New variables:
=20
@@ -61,6 +64,10 @@ New Features / Enhancements in |yocto-ver|
       :ref:`ref-classes-create-spdx` class
       (:oecore_rev:`874b2d301d3cac617b1028bc6ce91b1f916a6508`)
=20
+   -  The :term:`SPDX_GIT_PURL_MAPPINGS` variable allows mapping domain =
names to
+      PURLs (Package URLs) in SPDX documents
+      (:oecore_rev:`9f1825e74d0f70917676201286b148aea84cc660`)
+
    -  The :term:`SPDX_CONCLUDED_LICENSE` allows specifying the
       ``hasConcludedLicense`` object of individual SBOM packages when us=
ing the
       :ref:`ref-classes-create-spdx` class
@@ -86,8 +93,26 @@ New Features / Enhancements in |yocto-ver|
       partition created with the ``extra_partition`` plugin
       (:oecore_rev:`e1526079d205dac6e3cff6d8e5cb37f68b631009`)
=20
+   -  The :term:`FIT_LOADABLES`, :term:`FIT_LOADABLE_FILENAME`,
+      :term:`FIT_LOADABLE_TYPE`, :term:`FIT_LOADABLE_ARCH`,
+      :term:`FIT_LOADABLE_OS` and :term:`FIT_LOADABLE_LOADADDRESS` varia=
bles can
+      be used to specify arbitrary ``loadables`` in a FIT image
+      (:oecore_rev:`2535427d8de07f6e432d08cbdc046bdfd8788911`)
+
 -  Kernel-related changes:
=20
+   -  :ref:`ref-classes-kernel-fit-image`: Support arbitrary loadables
+      (:oecore_rev:`2535427d8de07f6e432d08cbdc046bdfd8788911`)
+
+   -  :ref:`ref-classes-kernel-yocto`: Allow enabling Rust in the kernel=
 by
+      adding ``rust`` to the :term:`KERNEL_FEATURES` (for Linux kernel r=
ecipes
+      inheriting this class)
+      (:oecore_rev:`6719ed4a34051cf3dcbb67984ee15613512c061a`)
+
+   -  Disable :ref:`ref-classes-ccache` support when Linux kernel Rust s=
upport
+      is enabled
+      (:oecore_rev:`d80d006ae85172eb5125b7e1b44d4dee48615c92`)
+
 -  New core recipes:
=20
    -  ``libconfig``: Import recipe from :oe_git:`/meta-openembedded/`, n=
eeded by
@@ -106,8 +131,63 @@ New Features / Enhancements in |yocto-ver|
    -  ``blueprint-compiler``: Add the recipe as it became a dependency o=
f the
       ``epiphany`` recipe after its upgrade to 49.2 (:oecore_rev:`421239=
2ca7ebf890e1e192ddd0e7dbe1f8dabcf2`)
=20
+   -  ``python3-sbom-cve-check``: New recipe for building and using
+      `sbom-cve-check <https://github.com/bootlin/sbom-cve-check>`__, a
+      lightweight SBOM CVE analysis tool
+      (:oecore_rev:`0fdacec2d7101d3fe638b430c43b1e14acd148ae`)
+
+   -  ``python3-shacl2code``, ``python3-hatch-build-scripts``,
+      ``python3-spdx-python-model``: Added as dependencies of
+      ``python3-sbom-cve-check``
+      (:oecore_rev:`48622216cb1a80f9cc127ebb08e13cc455d09240`,
+      :oecore_rev:`41591afd51ddbdaf1779799f4258a81afcff238d`,
+      :oecore_rev:`a83eaca5d9f3e2eb76a5d3c6bb42cf3b3bfe92fb`)
+
+   -  ``libfyaml``: Added as a dependency of ``appstream``
+      (:oecore_rev:`b8b7b5873fecef4040c5f35d5a0e857f8f9fc907`)
+
+   -  ``meta-world-recipe-sbom``: Building this recipe will produce SBOM
+      documents for each recipe present in the build environment, using =
the
+      :ref:`ref-classes-create-spdx` class. This is different from the i=
mage
+      SBOM which can also be generated using the :ref:`ref-classes-creat=
e-spdx`
+      class after building an image. See :doc:`/dev-manual/sbom` for mor=
e
+      information
+      (:oecore_rev:`d999ac407c86b462134008818d5863ecb577f3c6`)
+
+   -  ``python3-kirk``: The Kirk application is a fork of ``runltp-ng`` =
and
+      became the official `LTP <https://linux-test-project.readthedocs.i=
o/en/latest/>`__
+      tests executor
+      (:oecore_rev:`c33fd4e50a66ace990f3820f980876bfbfc07baa`)
+
+   -  ``wic``: This recipe builds the :doc:`WIC </dev-manual/wic>` comma=
nd-line
+      tool. This used to be part of :term:`OpenEmbedded-Core (OE-Core)` =
but is
+      now externally managed
+      (:oecore_rev:`25ca1cb46dd6d0c57f61f2dc3b649601dc81b50c`,
+      :oecore_rev:`b9e2a2f584376076c4552bef7309c81b9fe986c0`)
+
 -  New core classes:
=20
+   -  :ref:`ref-classes-kernel-yocto-rust`: Adds the required dependenci=
es to
+      build the Rust components of the Linux kernel
+      (:oecore_rev:`6c90097bebeffe7c5be35fc56e61b1994f03d6a9`)
+
+   -  :ref:`ref-classes-module-rust`: Support for building out-of-tree R=
ust
+      kernel modules. An example recipe using this class can be found in
+      :oecore_path:`meta-skeleton/recipes-kernel/rust-out-of-tree-module=
`
+      (:oecore_rev:`76fd22f09fab6c1de339dac310f9b31cb5e4ad69`,
+      :oecore_rev:`76fd22f09fab6c1de339dac310f9b31cb5e4ad69`)
+
+   -  :ref:`ref-classes-sbom-cve-check`: Class for post-build CVE analys=
is of an
+      image, which uses the `sbom-cve-check <github.com/bootlin/sbom-cve=
-check>`__
+      tool internally
+      (:oecore_rev:`8ef22ad9e302f86b2da4fa81541a464e95b9ef3c`)
+
+   -  :ref:`ref-classes-sbom-cve-check-recipe`: Class for post-build CVE
+      analysis of recipes (using the recipe SBOM, meaning building the
+      software provided by the recipe is not needed), which uses the
+      `sbom-cve-check <github.com/bootlin/sbom-cve-check>`__ tool intern=
ally
+      (:oecore_rev:`e2518b1eaabef13c9f8d44b52b8ec9d4dd4ed916`)
+
 -  Global configuration changes:
=20
    -  ``base-passwd``: Add a ``clock`` group as `systemd` version v258 i=
ntroduces
@@ -177,8 +257,17 @@ New Features / Enhancements in |yocto-ver|
    -  ``runqemu``: Support ``.tar.zst``, ``.tar,xz``, ``.tar`` rootfs ar=
chive
       types (:oecore_rev:`3a6172fbb6d3866b84627bcbf13e0a96837a85b1`)
=20
+   -  ``runqemu``: Allow VNC to be used as a fallback when there is no
+      ``DISPLAY`` set
+      (:oecore_rev:`df9e9f382eb27f15cee4f3f77023646dcc1273fa`)
+
 -  Documentation changes:
=20
+   -  The documentation build now fetches the list of active and inactiv=
e
+      version of the documentation from the remote `releases.json
+      <dashboard.yoctoproject.org/releases.json>`__ file. This also appl=
ies to
+      the :term:`BitBake` documentation.
+
 -  Go changes:
=20
    -  :ref:`ref-classes-go`: Disable workspaces when building
@@ -194,11 +283,20 @@ New Features / Enhancements in |yocto-ver|
       ``libLLVM.so`` instead of linking statically
       (:oecore_rev:`74ba238ff1ba1e9b612aece1989b828f3a8f8770`)
=20
+   -  Install Rust library sources for ``make rustavailable`` support
+      (:oecore_rev:`2912ca3b341a5c5f6a658cde332ccd87368bd39d`)
+
+   -  Enable dynamic LLVM linking by default
+      (:oecore_rev:`d0671c3dad87a063b3a41dd07cde89b5684e692c`)
+
 -  Wic Image Creator changes:
=20
    -  ``wic/engine``: Fix copying directories into wic image with ``ext*=
``
       partitions (:oecore_rev:`1ed38aff5f810d064c87aff9cbd310906833b6ba`=
)
=20
+   -  Re-implement sector-size support
+      (:oecore_rev:`b50d6debf7baa555fbfb3521c4f952675bba2d37`)
+
 -  SDK-related changes:
=20
 -  Testing-related changes:
@@ -211,6 +309,7 @@ New Features / Enhancements in |yocto-ver|
       -  ``libconfig`` (:oecore_rev:`f3e9d1326bf37361ff94dc4eef52de13b64=
651b2`)
       -  ``libksba`` (:oecore_rev:`f50a2005dda8cecf3a9db44edb131e7e332fa=
42d`)
       -  ``libmd`` (:oecore_rev:`4c0a41389bdab30e3b349fef8df6ca0ef4893b8=
9`)
+      -  ``libpcre2`` (:oecore_rev:`a7b79bf6ab86cb3ca82234e80f31c5f0208c=
d92d`)
       -  ``libsolv`` (:oecore_rev:`f5432d1c45f9eb47182049c6930cfc6d5b26b=
c8d`)
       -  ``libyaml`` (:oecore_rev:`ed2a3459829bb3b6c10143cceaef0147a0cb2=
b98`)
       -  ``utfcpp`` (:oecore_rev:`49314caa7eb8efd86577121337a0b0d7472eab=
1b`)
@@ -233,7 +332,22 @@ New Features / Enhancements in |yocto-ver|
    -  ``selftest``: Test installation of recipes with complex packaging
       (:oecore_rev:`6f3aab6bfa754ecaeee0acc013cb6be1f07c1ec0`)
=20
--  Utility script changes:
+   -  Add ``test_sdk_runqemu`` to test the execution of ``runqemu`` from=
 an SDK
+      (:oecore_rev:`7fbb281cc16b6a0071777df5a6ed988463dda263`)
+
+   -  Add tests for Rust support in the Linux kernel
+      (:oecore_rev:`01ea2b2add3c0e87a4a23c9d2dabee8a46b60702`,
+      :oecore_rev:`10dff9f0ed2a87512d96c9419f3b4b35db41dd8b`)
+
+   -  Replace ``runltp`` with ``kirk``, as it became the new official LT=
P test
+      executor
+      (:oecore_rev:`c1e5ed4133729212e6ce3e135a2e4d1d624de20b`)
+
+   -  :doc:`WIC </dev-manual/wic>` related tests were updated after wic =
was
+      moved to its own repository and is externally managed
+      (:oecore_rev:`b9e2a2f584376076c4552bef7309c81b9fe986c0`)
+
+-  Utility script changes:classes
=20
    -  ``bitbake-config-build``: It is now possible to disable all fragme=
nts
       starting with a prefix by issuing ``bitbake-config-build disable-f=
ragment
@@ -253,6 +367,14 @@ New Features / Enhancements in |yocto-ver|
    -  ``yocto-check-layer``: Add messages in ``test_readme`` assertions
       (:oecore_rev:`9fe883ce4c6284f1b75031adafeeafb47e56958c`)
=20
+   -  ``improve_kernel_cve_report``:
+
+      -  Sort ``kernel_compiled_files`` (:oecore_rev:`682e5beb0ce100ddc8=
413296334dfdbe0426dd38`)
+      -  Correct the description for fixed version (:oecore_rev:`b76da20=
48bf3d72708d0d26215b959d09de17da0`)
+      -  Update data if CVE exists (:oecore_rev:`9ea6d9209b95f8d31975d71=
315fb52343e6aa729`)
+      -  Validate that cve details field exists (:oecore_rev:`80ff4903ea=
1b839f9cd9393b314c3adfbb80b765`)
+
+
 -  BitBake changes:
=20
    -  ``bitbake-layers``:
@@ -305,6 +427,30 @@ New Features / Enhancements in |yocto-ver|
          :ref:`bitbake:ref-bbsetup-command-status` or
          :ref:`bitbake:ref-bbsetup-command-update` commands
=20
+      -  The :ref:`bitbake:ref-bbsetup-command-update` now behaves in a
+         non-destructive way: local commits and modifications to layers =
are
+         taken into account, and the tool will either stop or warn the u=
ser that
+         the update is possible or not
+         (:bitbake_rev:`2ee3a195bbe1b7458f44a712a271abd9686f90c7`)
+
+      -  Share :ref:`overview-manual/concepts:Shared State` by default b=
etween
+         builds, by adding a definition for :term:`SSTATE_DIR` and
+         :term:`BB_HASHSERVE_DB_DIR` in the ``site.conf`` file created b=
y
+         :ref:`bitbake:ref-bbsetup-command-init`
+         (:bitbake_rev:`a70c336790a9188aae67975fac6ca13579ad1d3e`)
+
+      -  Generate config files for VSCode by default, unless
+         ``--no-init-vscode`` is passed to :ref:`bitbake:ref-bbsetup-com=
mand-init`
+         (:bitbake_rev:`92fd721941fd17d1febc7205739e9f9ce1bb3aee`)
+
+   -  The ``unpack()`` function (the one containing the logic of the
+      :ref:`ref-tasks-unpack` task), can now take an ``update`` argument=
 to
+      allow updating a Git repository in-place rather than deleting it a=
nd
+      re-creating it. An alias function named ``unpack_update()`` was cr=
eated
+      for this unpack mode. See :ref:`bitbake:bb-the-unpack-update` for =
more
+      information
+      (:bitbake_rev:`e7d5e156275782948d3346f299780389ab263ab6`)
+
    -  ``cooker``: Use :term:`bitbake:BB_HASHSERVE_DB_DIR` as hash server
       database location. If unset, the existing behavior is preserved
       (:bitbake_rev:`b339d05ad2b69a6518522ee4c46dd5f5a6e33f65`)
@@ -312,6 +458,11 @@ New Features / Enhancements in |yocto-ver|
    -  ``bitbake-getvar``: Show close matches when no providers are found
       (:bitbake_rev:`1f8fa7c25e71cd0f230a2f6bfd9d5153c694da81`)
=20
+   -  The ``GIT_CONFIG_GLOBAL`` environment variable will now be taken i=
nto
+      account by the Git fetcher, to allow passing a different set of Gi=
t
+      configuration options when fetching Git repositories
+      (:bitbake_rev:`4c378445969853d6aff4694d937b9af47c7f7300`)
+
 -  Packaging changes:
=20
 -  Clang/LLVM related changes:
@@ -332,6 +483,9 @@ New Features / Enhancements in |yocto-ver|
=20
 -  SPDX-related changes:
=20
+   -  Output SBOM documents now include recipe metadata
+      (:oecore_rev:`d999ac407c86b462134008818d5863ecb577f3c6`)
+
    -  ``spdx30_tasks``: Fix :term:`SPDX_CUSTOM_ANNOTATION_VARS` implemen=
tation
       (:oecore_rev:`52ab3b640c6bb7ece34cb4ea6026fd6375f17af4`)
=20
@@ -348,17 +502,44 @@ New Features / Enhancements in |yocto-ver|
       to the list of fixed CVEs in the output SBOM
       (:oecore_rev:`f8525224cb825b1aad2be240731eabafdde7612d`)
=20
+   -  The :ref:`ref-classes-create-spdx` class used to include `VEX
+      <https://cyclonedx.org/capabilities/vex/>`__ statements in the SPD=
X documents
+      tied to each packages. This is no longer the case, as these statem=
ents are
+      now found in the SPDX documents for recipes directly. This was don=
e to
+      decrease the duplication of these statements for packages that wer=
e generated
+      by the same recipe.
+
+      The output SPDX document for an image recipe will still include th=
e VEX
+      statements, as the SPDX document for the image also include the re=
cipe SPDX
+      metadata.
+
+      The inclusion of VEX statements in SPDX documents can be controlle=
d with the
+      :term:`SPDX_INCLUDE_VEX` variable
+      (:oecore_rev:`d999ac407c86b462134008818d5863ecb577f3c6`)
+
+
 -  ``devtool`` changes:
=20
-   -  ``ide-sdk``: Find ``bitbake-setup``'s ``init-build-env``
-      first, and ``oe-init-build-env`` if not found
-      (:oecore_rev:`6ab7e9e8e52fa123551438820c59b8c5e0c9c8a5`)
+   -  ``ide-sdk``:
+
+      -  Find ``bitbake-setup``'s ``init-build-env`` first, and
+         ``oe-init-build-env`` if not found
+         (:oecore_rev:`6ab7e9e8e52fa123551438820c59b8c5e0c9c8a5`)
+
+      -  Add `gdbserver` attach mode support
+         (:oecore_rev:`119171087681bd47842865d6451868c1127f1149`)
=20
-   -  ``ide-sdk``: Add `gdbserver` attach mode support
-      (:oecore_rev:`119171087681bd47842865d6451868c1127f1149`)
+      -  Support GDB pretty-printing for C++ STL types
+         (:oecore_rev:`a69e2baba81b0cd88d58b164433c72e1156424b1`)
=20
-   -  ``ide-sdk``: Support GDB pretty-printing for C++ STL types
-      (:oecore_rev:`a69e2baba81b0cd88d58b164433c72e1156424b1`)
+      -  Support kernel module development
+         (:oecore_rev:`aaf15d656db0f83b440de3b22a817355dd8dfebb`)
+
+   -  Add new patches in correct order when running ``devtool finish``
+      (:oecore_rev:`fa7877d25826f58a74909908148b6b963dfe6908`)
+
+   -  Prevent ``devtool modify -n`` from corrupting Linux kernel Git rep=
os
+      (:oecore_rev:`d383ea37e4987ecabe011226f1a8e658a52ede12`)
=20
 -  Patchtest-related changes:
=20
@@ -374,6 +555,17 @@ New Features / Enhancements in |yocto-ver|
=20
 -  :ref:`ref-classes-insane` / :ref:`ref-classes-sanity` classes related=
 changes:
=20
+   -  Reject :term:`TMPDIR` containing redundant slashes to avoid errors=
 in
+      executions of :ref:`ref-tasks-populate_sysroot`
+      (:oecore_rev:`3e72ebe9ed4e2e5f34eb89cd460e75a9242e296f`)
+
+   -  :ref:`ref-classes-sanity`: Warn when the
+      :ref:`overview-manual/concepts:Shared State` cache directory
+      (:term:`SSTATE_DIR`) is outside of the build directory (:term:`BUI=
LDDIR`),
+      but the :ref:`overview-manual/concepts:Hash Equivalence` database =
is
+      inside it
+      (:oecore_rev:`491de0db64a0decd616a9e1c035f105faa14cc3c`)
+
 -  Security changes:
=20
    -  A new document was added to the Yocto Project documentation:
@@ -385,14 +577,21 @@ New Features / Enhancements in |yocto-ver|
    -  ``cve-update-nvd2-native``: Use maximum CVSS score when extracting=
 it from
       multiple sources (:oecore_rev:`4f6192f3165de0bc2499e045607c7e7ffd8=
78a4b`)
=20
+   -  Escape special characters in CPE 2.3 strings
+      (:oecore_rev:`9dd9c0038907340ba08ff4c8ee06a8748c1ac00a`)
+
 -  New :term:`PACKAGECONFIG` options for individual recipes:
=20
    -  ``curl``: ``schannel``
    -  ``gstreamer1.0-plugins-good``: ``qt6``
    -  ``libinput``: ``lua``, ``libwacom``, ``mtdev``
+   -  ``librepo``: ``sequoia``
    -  ``mesa``: ``expat``, ``zlib``
    -  ``openssl``: ``legacy``
    -  ``opkg``: ``acl``, ``xattr``
+   -  ``orc``: ``hotdoc``
+   -  ``python3``: ``freethreading`` (experimental, see
+      :oecore_rev:`c56990178b31b893fbf695eaf6b67de501e9d2e9`)
    -  ``python3-cryptography``: ``legacy-openssl``
=20
 -  systemd related changes:
@@ -476,8 +675,13 @@ New Features / Enhancements in |yocto-ver|
       remove ``keactrl`` from the recipe
       (:oecore_rev:`08c3877f4df8392ae347b03ac5334b170b1a4fec`)
=20
-   -  ``initramfs-framework``: Add handover of PID 1's arguments to modu=
les
-      (:oecore_rev:`a0ab3d1c4f9ed34d1d17e6534f42d17b3387ebb3`)
+   -  ``initramfs-framework``:
+
+      -  Add handover of PID 1's arguments to modules
+         (:oecore_rev:`a0ab3d1c4f9ed34d1d17e6534f42d17b3387ebb3`)
+
+      -  Fix Linux kernel command line parsing when passing in double qu=
otes
+         (:oecore_rev:`f9acaf1c130220859150bb4c0a0635fca2ad8487`)
=20
    -  ``perl``: Provide ``pod2man`` (in the recipe's :term:`PROVIDES`
       definition). This is used by many other recipes to produce :wikipe=
dia:`man
@@ -502,12 +706,36 @@ New Features / Enhancements in |yocto-ver|
       installing extra configuration files in ``${sysconfdir}/ssl/openss=
l.cnf.d/``
       (:oecore_rev:`34bafcf3d8cdaa87506df30ef554d18981454c5e`)
=20
-   -  ``busybox``: Enable SELinux support if :term:`DISTRO_FEATURES` con=
tains
-      ``selinux`` (:oecore_rev:`c544f12073ea712c3d3ce08105d52640a7a322b9=
`)
+   -  ``busybox``:
+
+      -  Enable SELinux support if :term:`DISTRO_FEATURES` contains
+         ``selinux`` (:oecore_rev:`c544f12073ea712c3d3ce08105d52640a7a32=
2b9`)
+
+      -  Do not build SUID binary without an applet
+         (:oecore_rev:`1406f9523c104d5357ce9594737c3bd32625b068`)
=20
    -  ``coreutils``: ``kill`` and ``uptime`` are no longer provided by t=
he
       recipe (:oecore_rev:`cedeb958dfa892e409bdce8525030c20b3400332`)
=20
+   -  ``tcl8``: Skip timing-sensitive :ref:`ptests <ref-classes-ptest>`
+      (:oecore_rev:`1b93479f7b5ae4e2a62f929386e516adabbce46b`)
+
+   -  ``license_image.bbclass``: Report all packages with incompatible l=
icense
+      (when using :term:`INCOMPATIBLE_LICENSE`)
+      (:oecore_rev:`57fe3e411faec8cc60853f2e499661f9ede4f453`)
+
+   -  ``python3``: Package all of the compression module into
+      ``python3-compression``
+      (:oecore_rev:`5f346802198f14d4c315783dea6a55743e34a2e8`)
+
+   -  ``gobject-introspection``: Disable cache for the scanner during
+      the :ref:`ref-tasks-compile` task (``GI_SCANNER_DISABLE_CACHE=3D1`=
`), to fix
+      an intermittent build failure
+      (:oecore_rev:`2b55dd12fc9593beba20d684c8b143483e212bc6`)
+
+   -  :ref:`ref-classes-archiver`: Don't try to preserve all attributes =
when
+      copying files (:oecore_rev:`6e8313688fa994c82e4c846993ed8da0d1f4db=
0e`)
+
 Known Issues in |yocto-ver|
 ---------------------------
=20

--=20
2.53.0


