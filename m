Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F88C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:30:19 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.51266.1699266609342168529
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id AFD812816B;
	Mon,  6 Nov 2023 05:30:08 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id D58CC2879E;
	Mon,  6 Nov 2023 05:30:07 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 09/12] release-notes-4.3: feature additions
Date: Mon,  6 Nov 2023 23:29:39 +1300
Message-Id: <dab7f691e3716938a7f05d62f0ff1a6026bc5ac8.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:30:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4595

Some additional feature items from combing through commits (not 100%
complete yet.)

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/release-notes-4.3.rst    | 98 ++++++++++++++++++-
 1 file changed, 96 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
index dc689c30ada..07317888a7e 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -65,6 +65,8 @@ New Features / Enhancements in 4.3
       :yocto_git:`1 </poky/commit/?id=3De4be03be5be62e367a40437a389121ef=
97d6cff3>`,
       :yocto_git:`2 </poky/commit/?id=3D8cd5d264af4c346730531cb98ae945ab=
862dbd69>`.
=20
+   -  Many changes to support 64-bit ``time_t`` on 32-bit architectures
+
 -  Kernel-related enhancements:
=20
    - The default kernel is the current stable (6.5), and there is also s=
upport
@@ -78,23 +80,75 @@ New Features / Enhancements in 4.3
=20
 -  New core recipes:
=20
+   -  `appstream <https://github.com/ximion/appstream>`__: a collaborati=
ve effort
+      for making machine-readable software metadata easily available
+      (from meta-oe)
+
+   -  `cargo-c-native <https://crates.io/crates/cargo-c>`__: cargo apple=
t to build
+      and install C-ABI compatible dynamic and static libraries
+
+   -  `libadwaita <https://gitlab.gnome.org/GNOME/libadwaita>`__: Buildi=
ng blocks
+      for modern GNOME applications (from meta-gnome)
+
+   -  `libtraceevent <https://git.kernel.org/pub/scm/libs/libtrace/libtr=
acefs.git/>`__:
+      API to access the kernel tracefs directory (from meta-openembedded=
)
+
+   -  `libxmlb <https://github.com/hughsie/libxmlb>`__: A library to hel=
p create
+       and query binary XML blobs (from meta-oe)
+
    -  ``musl-legacy-error``: glibc ``error()`` API implementation still =
needed
       by a few packages.
=20
-   -  `python3-beartype <https://beartype.readthedocs.io>`, unbearably f=
ast
+   -  `python3-beartype <https://beartype.readthedocs.io>`__, unbearably=
 fast
       runtime type checking in pure Python.
=20
+   -  `python3-booleanpy <https://github.com/bastikr/boolean.py>`__: Def=
ine boolean
+      algebras, create and parse boolean expressions and create custom b=
oolean DSL
+      (from meta-python)
+
+   -  `python3-calver <https://github.com/di/calver>`__: Setuptools exte=
nsion for
+      CalVer package versions
+
+   -  `python3-click <http://click.pocoo.org/>`__: A simple wrapper arou=
nd optparse
+      for powerful command line utilities (from meta-python)
+
+   -  ``python3-dtc``: Python Library for the Device Tree Compiler (from
+      meta-virtualization)
+
+   -  `python3-isodate <https://github.com/gweis/isodate/>`__: ISO 8601 =
date/time
+      parser (from meta-python)
+
+   -  `python3-license-expression <https://github.com/nexB/license-expre=
ssion>`__:
+      Utility library to parse, compare, simplify and normalize license =
expressions
+      (from meta-python)
+
+   -  `python3-rdflib <https://github.com/RDFLib/rdflib>`__: a pure Pyth=
on package
+      for working with RDF (from meta-python)
+
    -  `python3-spdx-tools <https://github.com/spdx/tools-python>`__,
       tools for SPDX validation and conversion.
=20
+   -  `python3-trove-classifiers <https://github.com/pypa/trove-classifi=
ers>`__:
+      Canonical source for classifiers on PyPI (pypi.org)
+
    -  `python3-uritools <https://github.com/tkem/uritools/>`__, replacem=
ent for
       the ``urllib.parse`` module.
=20
+   -  `python3-xmltodict <https://github.com/martinblech/xmltodict>`__: =
Makes
+      working with XML feel like you are working with JSON (from meta-py=
thon)
+
    -  `ttyrun <https://github.com/ibm-s390-linux/s390-tools>`__, starts
       ``getty`` programs only when a terminal exists, preventing respawn=
s
       through the ``init`` program. This enabled removing the
       ``SERIAL_CONSOLES_CHECK`` variable.
=20
+   -  ``vulkan-validation-layers``: Khronos official validation layers t=
o assist in
+      verifying that applications correctly use the
+      `Vulkan API <https://www.khronos.org/vulkan>`__.
+
+   -  `xcb-util-cursor <http://xcb.freedesktop.org/XcbUtil/>`__: XCB por=
t of
+      libXcursor (from meta-oe)
+
 -  QEMU / ``runqemu`` enhancements:
=20
    -  QEMU has been upgraded to version 8.1
@@ -118,13 +172,35 @@ New Features / Enhancements in 4.3
=20
 -  wic Image Creator enhancements:
=20
+   -  ``bootimg-efi``: if ``fixed-size`` is set then use that for mkdosf=
s
+
+   -  ``bootimg-efi``: stop hardcoding VMA offsets, as required by syste=
md-boot v254
+      (and dracut/ukify)
+
+   -  ``bootimg-pcbios``: use kernel name from :term:`KERNEL_IMAGETYPE` =
instead of
+      hardcoding ``vmlinuz``
+
+   -  Added new ``gpt-hybrid`` option to ``ptable_format`` (formatting a=
 disk with a hybrid
+      MBR and GPT partition scheme)
+
+   -  Use ``part_name`` in default imager when defined
+
+   -  Added ``--hidden`` argument to default imager to avoid MS Windows =
prompting to
+      format partition after flashing to a USB stick/SD card
+
 -  FIT image related improvements:
=20
    -  New :term:`FIT_ADDRESS_CELLS` and :term:`UBOOT_FIT_ADDRESS_CELLS` =
variables allowing
       to specify 64 bit addresses, typically for loading U-Boot.
=20
+   -  Added ``compatible`` line to config section (with value from dtb) =
to allow bootloaders
+      to select the best matching configuration.
+
+
 -  SDK-related improvements:
=20
+   -  Extended the following recipes to ``nativesdk``: ``libwebp``, ``py=
thon3-ply``
+
 -  Testing:
=20
    -  The :ref:`ref-classes-insane` class now adds an :ref:`unimplemente=
d-ptest
@@ -184,7 +260,9 @@ New Features / Enhancements in 4.3
=20
    -  Recipes that fetch specific revisions no longer need to explicitly=
 add
       :term:`SRCPV` to :term:`PV` as BitBake will now automatically add =
the
-      revision information to :term:`PKGV` if needed.
+      revision information to :term:`PKGV` if needed (as long as "+" is =
still
+      present in the :term:`PKGV` value, which is set from :term:`PV` by
+      default).
=20
    -  The default :term:`PR` values in many recipes have been removed.
=20
@@ -212,6 +290,10 @@ New Features / Enhancements in 4.3
=20
 -  Miscellaneous changes:
=20
+   -  Selecting systemd via :term:`INIT_MANAGER` now adds ``usrmerge`` t=
o
+      :term:`DISTRO_FEATURES` as current versions of systemd now require
+      merged ``/usr``.
+
    -  Generation of :term:`SPDX` manifests is now enabled by default.
=20
    -  Git based recipes in OE-Core which used the ``git``  protocol have=
 been
@@ -225,6 +307,18 @@ New Features / Enhancements in 4.3
       :term:`SPLASH_IMAGES`, instead of a harder to generate and modify
       ``.h`` file.
=20
+   -  The ; character is no longer needed to separate functions specifie=
d in
+      :term:`IMAGE_POSTPROCESS_COMMAND`, :term:`IMAGE_POSTPROCESS_COMMAN=
D`,
+      :term:`POPULATE_SDK_POST_HOST_COMMAND`, :term:`ROOTFS_POSTINSTALL_=
COMMAND`
+      etc. (If any are present they will be replaced with spaces, so exi=
sting
+      metadata does not yet need to be changed.)
+
+   -  In the ``Upstream-Status`` field in a patch header, "Accepted" is =
no longer
+      a valid value since it is logically the same as "Backport". Change=
 any
+      values you have (particularly in patches applied through bbappends=
 for core
+      recipes, since they will be validated as indicated above).
+
+
 Known Issues in 4.3
 ~~~~~~~~~~~~~~~~~~~
=20
--=20
2.34.1


