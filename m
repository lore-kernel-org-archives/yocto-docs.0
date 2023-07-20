Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056C2EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 12:47:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12020.1689857268044801384
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 05:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=diiyYiXY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 623E1FF803;
	Thu, 20 Jul 2023 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689857265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=31HMIH7GBw2F/QXoOUFegz9hGmt3PGrNxILliyUQbdM=;
	b=diiyYiXYVxNtcA0grQ8+qs4iXOvgSjjSFVvO74ZPig9HtDjGgtGio4n9rPMmDcjMGALXI1
	WqX3iIUgjjFjON8HnLZUwxuYDAYvyTC+F1hakQRg74MifnfRaD8AkwSXVgMnXENptMjcHt
	leoFs5jUTlp03LBgVFrcuh8/JqN/l1duQPmvDF3yDqpANzgWrOImDnXbGHMbX32qHHKivI
	XPECD3yfhL8uKvniaz0uPPP2Nv+TnMraKoOWHhr6XYvCjgeQcFZp0ib1nxCDspMyPDX863
	gc1T9EZe01V4BcPOz0dF8080711adtWlnT8G7juwZ3kvM3ujqDnsXUChS8bnJw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Lee Chee Yang <chee.yang.lee@intel.com>
Subject: [PATCH 3/3] [mickledore] migration-guides: add release notes for 4.0.11
Date: Thu, 20 Jul 2023 14:47:24 +0200
Message-Id: <20230720124724.333252-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720124724.333252-1-michael.opdenacker@bootlin.com>
References: <20230720124724.333252-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Jul 2023 12:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4071

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.11.rst | 214 ++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.11.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index 05c2705e8e..1f08c8844a 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -17,3 +17,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.8
    release-notes-4.0.9
    release-notes-4.0.10
+   release-notes-4.0.11
diff --git a/documentation/migration-guides/release-notes-4.0.11.rst b/documentation/migration-guides/release-notes-4.0.11.rst
new file mode 100644
index 0000000000..8a15884908
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.11.rst
@@ -0,0 +1,214 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.11 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.11
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  cups: Fix :cve:`2023-32324`
+-  curl: Fix :cve:`2023-28319`, :cve:`2023-28320`, :cve:`2023-28321` and :cve:`2023-28322`
+-  git: Ignore :cve:`2023-25815`
+-  go: Fix :cve:`2023-24539` and :cve:`2023-24540`
+-  nasm: Fix :cve:`2022-46457`
+-  openssh: Fix :cve:`2023-28531`
+-  openssl: Fix :cve:`2023-1255` and :cve:`2023-2650`
+-  perl: Fix :cve:`2023-31484`
+-  python3-requests: Fix for :cve:`2023-32681`
+-  sysstat: Fix :cve:`2023-33204`
+-  vim: Fix :cve:`2023-2426`
+-  webkitgtk: fix :cve:`2022-42867`, :cve:`2022-46691`, :cve:`2022-46699` and :cve:`2022-46700`
+
+
+Fixes in Yocto-4.0.11
+~~~~~~~~~~~~~~~~~~~~~
+
+-  Revert "docs: conf.py: fix cve extlinks caption for sphinx <4.0"
+-  Revert "ipk: Decode byte data to string in manifest handling"
+-  avahi: fix D-Bus introspection
+-  build-appliance-image: Update to kirkstone head revision
+-  conf.py: add macro for Mitre CVE links
+-  conf: add nice level to the hash config ignred variables
+-  cpio: Fix wrong CRC with ASCII CRC for large files
+-  cve-update-nvd2-native: added the missing http import
+-  cve-update-nvd2-native: new CVE database fetcher
+-  dhcpcd: use git instead of tarballs
+-  e2fsprogs: fix ptest bug for second running
+-  gcc-runtime: Use static dummy libstdc++
+-  glibc: stable 2.35 branch updates (cbceb903c4d7)
+-  go.bbclass: don't use test to check output from ls
+-  gstreamer1.0: Upgrade to 1.20.6
+-  iso-codes: Upgrade to 4.15.0
+-  kernel-devicetree: allow specification of dtb directory
+-  kernel-devicetree: make shell scripts posix compliant
+-  kernel-devicetree: recursively search for dtbs
+-  kernel: don't force PAHOLE=false
+-  kmscube: Correct :term:`DEPENDS` to avoid overwrite
+-  lib/terminal.py: Add urxvt terminal
+-  license.bbclass: Include :term:`LICENSE` in the output when it fails to parse
+-  linux-yocto/5.10: Upgrade to v5.10.180
+-  linux-yocto/5.15: Upgrade to v5.15.113
+-  llvm: backport a fix for build with gcc-13
+-  maintainers.inc: Fix email address typo
+-  maintainers.inc: Move repo to unassigned
+-  migration-guides: add release notes for 4.0.10
+-  migration-guides: use new cve_mitre macro
+-  nghttp2: Deleted the entries for -client and -server, and removed a dependency on them from the main package.
+-  oeqa/selftest/cases/devtool.py: skip all tests require folder a git repo
+-  openssh: Remove BSD-4-clause contents completely from codebase
+-  openssl: Upgrade to 3.0.9
+-  overview-manual: concepts.rst: Fix a typo
+-  p11-kit: add native to :term:`BBCLASSEXTEND`
+-  package: enable recursion on file globs
+-  package_manager/ipk: fix config path generation in _create_custom_config()
+-  piglit: Add :term:`PACKAGECONFIG` for glx and opencl
+-  piglit: Add missing glslang dependencies
+-  piglit: Fix build time dependency
+-  poky.conf: bump version for 4.0.11
+-  profile-manual: fix blktrace remote usage instructions
+-  quilt: Fix merge.test race condition
+-  ref-manual: add clarification for :term:`SRCREV`
+-  selftest/reproducible: Allow native/cross reuse in test
+-  staging.bbclass: do not add extend_recipe_sysroot to prefuncs of prepare_recipe_sysroot
+-  systemd-networkd: backport fix for rm unmanaged wifi
+-  systemd-systemctl: fix instance template WantedBy symlink construction
+-  systemd-systemctl: support instance expansion in WantedBy
+-  uninative: Upgrade to 3.10 to support gcc 13
+-  uninative: Upgrade to 4.0 to include latest gcc 13.1.1
+-  vim: Upgrade to 9.0.1527
+-  waffle: Upgrade to 1.7.2
+-  weston: add xwayland to :term:`DEPENDS` for :term:`PACKAGECONFIG` xwayland
+
+
+Known Issues in Yocto-4.0.11
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.11
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alexander Kanavin
+-  Andrew Jeffery
+-  Archana Polampalli
+-  Bhabu Bindu
+-  Bruce Ashfield
+-  C. Andy Martin
+-  Chen Qi
+-  Daniel Ammann
+-  Deepthi Hemraj
+-  Ed Beroset
+-  Eero Aaltonen
+-  Enrico Jörns
+-  Hannu Lounento
+-  Hitendra Prajapati
+-  Ian Ray
+-  Jan Luebbe
+-  Jan Vermaete
+-  Khem Raj
+-  Lee Chee Yang
+-  Lei Maohui
+-  Lorenzo Arena
+-  Marek Vasut
+-  Marta Rybczynska
+-  Martin Jansa
+-  Martin Siegumfeldt
+-  Michael Halstead
+-  Michael Opdenacker
+-  Ming Liu
+-  Narpat Mali
+-  Omkar Patil
+-  Pablo Saavedra
+-  Pavel Zhukov
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Qiu Tingting
+-  Quentin Schulz
+-  Randolph Sapp
+-  Randy MacLeod
+-  Ranjitsinh Rathod
+-  Richard Purdie
+-  Riyaz Khan
+-  Sakib Sajal
+-  Sanjay Chitroda
+-  Soumya Sambu
+-  Steve Sakoman
+-  Thomas Roos
+-  Tom Hochstein
+-  Vivek Kumbhar
+-  Wang Mingyu
+-  Yogita Urade
+-  Zoltan Boszormenyi
+
+
+Repositories / Downloads for Yocto-4.0.11
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.11 </poky/log/?h=yocto-4.0.11>`
+-  Git Revision: :yocto_git:`fc697fe87412b9b179ae3a68d266ace85bb1fcc6 </poky/commit/?id=fc697fe87412b9b179ae3a68d266ace85bb1fcc6>`
+-  Release Artefact: poky-fc697fe87412b9b179ae3a68d266ace85bb1fcc6
+-  sha: d42ab1b76b9d8ab164d86dc0882c908658f6b5be0742b13a71531068f6a5ee98
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.11/poky-fc697fe87412b9b179ae3a68d266ace85bb1fcc6.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.11/poky-fc697fe87412b9b179ae3a68d266ace85bb1fcc6.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.11 </openembedded-core/log/?h=yocto-4.0.11>`
+-  Git Revision: :oe_git:`7949e786cf8e50f716ff1f1c4797136637205e0c </openembedded-core/commit/?id=7949e786cf8e50f716ff1f1c4797136637205e0c>`
+-  Release Artefact: oecore-7949e786cf8e50f716ff1f1c4797136637205e0c
+-  sha: 3bda3f7d15961bad5490faf3194709528591a97564b5eae3da7345b63be20334
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.11/oecore-7949e786cf8e50f716ff1f1c4797136637205e0c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.11/oecore-7949e786cf8e50f716ff1f1c4797136637205e0c.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.11 </meta-mingw/log/?h=yocto-4.0.11>`
+-  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
+-  Release Artefact: meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1
+-  sha: 49f9900bfbbc1c68136f8115b314e95d0b7f6be75edf36a75d9bcd1cca7c6302
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.11/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.11/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.11 </meta-gplv2/log/?h=yocto-4.0.11>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.11/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.11/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.11 </bitbake/log/?h=yocto-4.0.11>`
+-  Git Revision: :oe_git:`0c6f86b60cfba67c20733516957c0a654eb2b44c </bitbake/commit/?id=0c6f86b60cfba67c20733516957c0a654eb2b44c>`
+-  Release Artefact: bitbake-0c6f86b60cfba67c20733516957c0a654eb2b44c
+-  sha: 4caa94ee4d644017b0cc51b702e330191677f7d179018cbcec8b1793949ebc74
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.11/bitbake-0c6f86b60cfba67c20733516957c0a654eb2b44c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.11/bitbake-0c6f86b60cfba67c20733516957c0a654eb2b44c.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.11 </yocto-docs/log/?h=yocto-4.0.11>`
+-  Git Revision: :yocto_git:`6d16d2bde0aa32276a035ee49703e6eea7c7b29a </yocto-docs/commit/?id=6d16d2bde0aa32276a035ee49703e6eea7c7b29a>`
+
-- 
2.34.1


