Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803A6C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 20:43:42 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.6121.1713127420816334867
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 13:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 389EC16CCE;
	Sun, 14 Apr 2024 16:43:40 -0400 (EDT)
Received: from localhost.localdomain (unknown [209.210.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id DAA0916E18;
	Sun, 14 Apr 2024 16:43:39 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 9/9] release-notes: additional features and one known issue for 5.0
Date: Sun, 14 Apr 2024 13:43:18 -0700
Message-Id: <91fad937a3567c0c66d0c28e4ed2fb3227450a5e.1713127068.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713127068.git.bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 20:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5144

Add additional features and tweak some existing entries.

Also add one known issue for gpgme.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 .../migration-guides/release-notes-5.0.rst    | 71 +++++++++++++++++--
 1 file changed, 66 insertions(+), 5 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/docum=
entation/migration-guides/release-notes-5.0.rst
index 21de79a638..121c2afaff 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -23,6 +23,8 @@ New Features / Enhancements in 5.0
    -  :term:`EFI_UKI_PATH`, :term:`EFI_UKI_DIR`: define the location of =
UKI
       image in the EFI System partition.
=20
+   -  :term:`TARGET_DBGSRC_DIR`: specifies the target path to debug sour=
ce files
+
 -  Architecture-specific enhancements:
=20
    -  ``genericarm64``: a new :term:`MACHINE` to represent a 64-bit Gene=
ral Arm
@@ -33,6 +35,8 @@ New Features / Enhancements in 5.0
    -  ``arch-armv9``: remove CRC and SVE tunes, since FEAT_CRC32 is now =
mandatory
       and SVE/SVE2 are enabled by default in GCC's ``-march=3Darmv9-a``.
=20
+   -  ``arm/armv*``: add all of the additional Arm tunes in GCC 13.2.0
+
 -  Kernel-related enhancements:
=20
    -  The default kernel is the current LTS (6.6).
@@ -145,6 +149,10 @@ New Features / Enhancements in 5.0
    -  ``nativesdk``: prevent :term:`MACHINE_FEATURES` and :term:`DISTRO_=
FEATURES`
       from being backfilled.
=20
+   -  Support for ``riscv64`` as an SDK host architecture
+
+   -  Extend recipes to ``nativesdk``: ``acpica``, ``libpcap``, ``python=
3-setuptools-rust``
+
 -  Testing:
=20
    -  Add an optional ``unimplemented-ptest`` QA warning to detect upstr=
eam
@@ -155,15 +163,29 @@ New Features / Enhancements in 5.0
=20
    -  ``oeqa``, ``oe-selftest``: add test cases for Maturin (SDK and run=
time).
=20
--  Utility script changes:
+   -  Enable ptests for ``python3-attrs``, ``python3-pyyaml``, ``xz``
=20
-   -  New ``recipetool/create_go.py`` script added to support Go recipe =
creation
+-  Utility script changes:
=20
    -  ``oe-init-build-env`` can generate a initial configuration (``.vsc=
ode``)
       for VSCode and its "Yocto Project BitBake" extension.
=20
+   -  The ``sstate-cache-management`` script has been rewritten in pytho=
n for better performance and maintainability
+
+   -  ``bitbake-layers``: added an option to update the reference of rep=
ositories in layer setup
+
 -  BitBake improvements:
=20
+   -  New ``inherit_defer`` statement which works as ``inherit`` does, e=
xcept that
+      it is only evaluated at the end of parsing - recommended where a c=
onditional
+      expression is used, e.g.
+
+         inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', '=
python3targetconfig', '', d)}
+
+      This allows conditional expressions to be evaluated 'late' meaning=
 changes
+      to the variable after the line is parsed will take effect - with i=
nherit this
+      is not the case.
+
    -  Add support for :term:`BB_LOADFACTOR_MAX`, so Bitbake can stop run=
ning
       extra tasks if the system load is too high, especially in distribu=
tions
       where ``/proc/pressure`` is disabled.
@@ -185,7 +207,7 @@ New Features / Enhancements in 5.0
    -  ``git-make-shallow`` script: add support for Git's ``safe.bareRepo=
sitory=3Dexplicit``
       configuration setting.
=20
--  Devtool improvements:
+-  devtool improvements:
=20
    -  Introduce a new ``ide-sdk`` plugin to generate a configuration to =
use
       the eSDK through an IDE.
@@ -194,10 +216,35 @@ New Features / Enhancements in 5.0
=20
    -  Add support for Git submodules.
=20
+   -  ide: vscode: make files from recipe sysroots and debug rootfs read=
-only to avoid confusion
+
+   -  modify: add support for multiple sources in :term:`SRC_URI`
+
+   -  Support plugins within plugins
+
+-  recipetool improvements:
+
+   - appendsrcfile(s): added a mode to update the recipe itself
+
+   - appendsrcfile(s): added dry-run mode
+
+   - create: Added handler to create go recipes
+
+   - create: Improved identification of licenses
+
+   - create: Added support for modern Python PEP-517 build systems inclu=
ding hatchling, maturin, mesonpy
+
+   - create: Added pypi support
+
+   - create: Prefix created Python recipes with python3-
+
 -  Packaging changes:
=20
    -  ``package_rpm``: the RPM package compressor's mode can now be over=
riden.
=20
+   -  ipk packaging (using ``opkg``) now uses ``zstd`` compression inste=
ad of
+      ``xz`` for better compression and performance.
+
 -  Security improvements:
=20
    -  Improve incremental CVE database download from NVD. Rejected CVEs =
are
@@ -226,6 +273,11 @@ New Features / Enhancements in 5.0
    -  Systemd's following :term:`PACKAGECONFIG` options were added:
       ``cryptsetup-plugins``, ``no-ntp-fallback``, and ``p11kit``.
=20
+   -  New PACKAGECONFIG options added to ``libarchive``, ``libinput``,
+      ``libunwind``, ``mesa``, ``mesa-gl``, ``openssh``, ``perf``,
+      ``python3-pyyaml``, ``qemu``, ``rpm``, ``shadow``, ``strace``,
+      ``syslinux``, ``systemd``, ``vte``, ``webkitgtk``, ``xserver-xorg`=
`.
+
    -  ``systemd-boot`` can, from now on, be compiled as ``native``, thus
       providing ``ukify`` tool to build UKI images.
=20
@@ -238,12 +290,21 @@ New Features / Enhancements in 5.0
=20
    -  Disable strace support of bluetooth by default.
=20
-   -  ``openssh`` now has a Systemd service: ``sshd.service``.
+   -  ``openssh`` now has a systemd service: ``sshd.service``.
+
+   -  The :ref:`ref-classes-python_mesonpy` class was added (moved in fr=
om meta-python)
+      to support Python package builds using the meson-python PEP-517 bu=
ild backend.
+
+   -  Support for unpacking .7z archives in :term:`SRC_URI` using ``p7zi=
p``
+
+   -  Add minimal vscode configuration to avoid vscode's indexer from ch=
oking on build directories
+
=20
 Known Issues in 5.0
 ~~~~~~~~~~~~~~~~~~~
=20
--  N/A
+-  ``gpgme`` has had Python binding support disabled since upstream does=
 not yet support Python 3.12.
+
=20
 Recipe License changes in 5.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--=20
2.25.1


