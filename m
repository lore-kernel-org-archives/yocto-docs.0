Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E862C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 18:49:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.1454.1645555772320570796
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 10:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MNpeakXD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D3FD41C0006;
	Tue, 22 Feb 2022 18:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645555770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o76yxAJJXIUmBTRNmsahfVatDR81cAGEuHg7GAZf7v4=;
	b=MNpeakXD78DEAKD+N5Le5kLR5GxRFEGNegjy4EpElpgbz22S4kzFck25d479njeXP38Iem
	AXeA8IgU5p5wMHC3LzsFVh5exaPwc3aY9b2HxGVouRMcTQPG9oh/6ZBofMka9tz9/LnAAT
	i7nT1AJ6U5JqfzAiL6RldZqO76vTU+rafs5bPh2QMyaz7TQM4bSShdr0TdnaiosCH2YKdV
	3It033ig+m6qN2E1imrE0WWjHEWxxZYMyjD1hKj+xAxCJuiyqDroQQ6pgrG6UHrrDVX8C8
	8av/al3tFiLHT3DWAMh/dkHydR8fYfMEi1NrPDEf+0s/Bsg50KVYp/WEEqVezw==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] documentation: release notes for 3.4.2
Date: Tue, 22 Feb 2022 19:49:18 +0100
Message-Id: <20220222184918.102478-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222184918.102478-1-michael.opdenacker@bootlin.com>
References: <20220222184918.102478-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Feb 2022 18:49:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2488

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-3.4.rst        |   1 +
 .../migration-guides/release-notes-3.4.2.rst  | 240 ++++++++++++++++++
 2 files changed, 241 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-3.4.2.rst

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 1e71ecd0ff..80d7a5ef0f 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -266,4 +266,5 @@ Miscellaneous
 
 .. include:: release-notes-3.4.rst
 .. include:: release-notes-3.4.1.rst
+.. include:: release-notes-3.4.2.rst
 
diff --git a/documentation/migration-guides/release-notes-3.4.2.rst b/documentation/migration-guides/release-notes-3.4.2.rst
new file mode 100644
index 0000000000..ecb7b12d0a
--- /dev/null
+++ b/documentation/migration-guides/release-notes-3.4.2.rst
@@ -0,0 +1,240 @@
+Release notes for 3.4.2 (honister)
+----------------------------------
+
+Security Fixes in 3.4.2
+~~~~~~~~~~~~~~~~~~~~~~~
+
+-  tiff: backport fix for :cve:`2022-22844`
+-  glibc : Fix :cve:`2021-3999`
+-  glibc : Fix :cve:`2021-3998`
+-  glibc : Fix :cve:`2022-23219`
+-  glibc : Fix :cve:`2022-23218`
+-  lighttpd: backport a fix for :cve:`2022-22707`
+-  speex: fix :cve:`2020-23903`
+-  linux-yocto/5.10: amdgpu: updates for :cve:`2021-42327`
+-  libsndfile1: fix :cve:`2021-4156`
+-  xserver-xorg: whitelist two CVEs
+-  grub2: fix :cve:`2021-3981`
+-  xserver-xorg: update CVE_PRODUCT
+-  binutils: :cve:`2021-42574`
+-  gcc: Fix :cve:`2021-42574`
+-  gcc: Fix :cve:`2021-35465`
+-  cve-extra-exclusions: add db CVEs to exclusion list
+-  gcc: Add :cve:`2021-37322` to the list of CVEs to ignore
+-  bind: fix :cve:`2021-25219`
+-  openssh: fix :cve:`2021-41617`
+-  ncurses: fix :cve:`2021-39537`
+-  vim: fix :cve:`2021-3968` and :cve:`2021-3973`
+-  vim: fix :cve:`2021-3927` and :cve:`2021-3928`
+-  gmp: fix :cve:`2021-43618`
+
+Fixes in 3.4.2
+~~~~~~~~~~~~~~
+
+-  build-appliance-image: Update to honister head revision
+-  poky.conf: bump version for 3.4.2 release
+-  libxml2: Backport python3-lxml workaround patch
+-  core-image-sato-sdk: allocate more memory when in qemu
+-  vim: upgrade to patch 4269
+-  vim: update to include latest CVE fixes
+-  expat: upgrade to 2.4.4
+-  libusb1: correct SRC_URI
+-  yocto-check-layer: add debug output for the layers that were found
+-  linux-firmware: Add CLM blob to linux-firmware-bcm4373 package
+-  linux-yocto/5.10: update to v5.10.93
+-  icu: fix make_icudata dependencies
+-  sstate: Improve failure to obtain archive message/handling
+-  insane.bbclass: Correct package_qa_check_empty_dirs()
+-  sstate: A third fix for for touching files inside pseudo
+-  kernel: introduce python3-dtschema-wrapper
+-  vim: upgrade to 8.2 patch 3752
+-  bootchart2: Add missing python3-math dependency
+-  socat: update SRC_URI
+-  pigz: fix one failure of command "unpigz -l"
+-  linux-yocto/5.14: update genericx86* machines to v5.14.21
+-  linux-yocto/5.10: update genericx86* machines to v5.10.87
+-  go: upgrade 1.16.10 -> 1.16.13
+-  linux-yocto/5.10/cfg: add kcov feature fragment
+-  linux-yocto/5.14: fix arm 32bit -rt warnings
+-  oeqa/sstate: Fix allarch samesigs test
+-  rootfs-postcommands.bbclass: Make two comments use the new variable syntax
+-  cve-check: add lockfile to task
+-  lib/oe/reproducible: correctly set .git location when recursively looking for git repos
+-  epiphany: Update 40.3 -> 40.6
+-  scripts/buildhistory-diff: drop use of distutils
+-  scripts: Update to use exec_module() instead of load_module()
+-  vulkan-loader: inherit pkgconfig
+-  webkitgtk: Add reproducibility fix
+-  openssl: Add reproducibility fix
+-  rpm: remove tmp folder created during install
+-  package_manager: ipk: Fix host manifest generation
+-  bitbake: utils: Update to use exec_module() instead of load_module()
+-  linux-yocto: add libmpc-native to DEPENDS
+-  ref-manual: fix patch documentation
+-  bitbake: tests/fetch: Drop gnu urls from wget connectivity test
+-  bitbake: fetch: npm: Use temporary file for empty user config
+-  bitbake: fetch: npm: Quote destdir in run chmod command
+-  bitbake: process: Do not mix stderr with stdout
+-  xserver-xorg: upgrade 1.20.13 -> 1.20.14
+-  python3-pyelftools: Depend on debugger, pprint
+-  linux-firmware: upgrade 20211027 -> 20211216
+-  oeqa/selftest/bbtests: Use YP sources mirror instead of GNU
+-  systemd: Fix systemd-journal-gateway user/groups
+-  license.bbclass: implement ast.NodeVisitor.visit_Constant
+-  oe/license: implement ast.NodeVisitor.visit_Constant
+-  packagedata.py: silence a DeprecationWarning
+-  uboot-sign: fix the concatenation when multiple U-BOOT configurations are specified
+-  runqemu: check the qemu PID has been set before kill()ing it
+-  selftest/devtool: Check branch in git fetch
+-  recipetool: Set master branch only as fallback
+-  kern-tools: bug fixes and kgit-gconfig
+-  linux-yocto-rt/5.10: update to -rt56
+-  linux-yocto/5.14: update to v5.14.21
+-  python3: upgrade 3.9.7 -> 3.9.9
+-  bitbake: lib/pyinotify.py: Remove deprecated module asyncore
+-  updates for recent releases
+-  libdrm: upgrade 2.4.108 -> 2.4.109
+-  patch.py: Initialize git repo before patching
+-  boost: Fix build on arches with no atomics
+-  boost: allow searching for python310
+-  recipetool: extend curl detection when creating recipes
+-  recipetool: handle GitLab URLs like we do GitHub
+-  README.OE-Core.md: update URLs
+-  libtool: change the default AR_FLAGS from "cru" to "cr"
+-  libtool: Update patchset to match those submitted upstream
+-  scripts/checklayer/common.py: Fixed a minor grammatical error
+-  oeqa/parselogs: Fix quoting
+-  oeqa/utils/dump: Fix typo
+-  systemd: update 249.6 -> 249.7
+-  glibc: Fix i586/c3 support
+-  wic: support rootdev identified by partition label
+-  buildhistory: Fix srcrevs output
+-  classes/crate-fetch: Ensure crate fetcher is available
+-  rootfs-postcommands: update systemd_create_users
+-  classes/meson: Add optional rust definitions
+-  rust-cross: Replace TARGET_ARCH with TUNE_PKGARCH
+-  maintainers.inc: fix up rust-cross entry
+-  rust-cross: Fix directory not deleted for race glibc vs. musl
+-  wic: use shutil.which
+-  bitbake: data_smart.py: Skip old override syntax checking for anonymous functions
+-  documentation: conf.py: fix version of bitbake objects.inv
+-  updates for release 3.3.4
+
+Contributors to 3.4.2
+~~~~~~~~~~~~~~~~~~~~~
+
+-  Alexander Kanavin
+-  Alexandre Belloni
+-  Anton Mikanovich
+-  Anuj Mittal
+-  Bruce Ashfield
+-  Carlos Rafael Giani
+-  Chaitanya Vadrevu
+-  Changqing Li
+-  Dhruva Gole
+-  Florian Amstutz
+-  Joshua Watt
+-  Kai Kang
+-  Khairul Rohaizzat Jamaluddin
+-  Khem Raj
+-  Konrad Weihmann
+-  Kory Maincent
+-  Li Wang
+-  Marek Vasut
+-  Markus Volk
+-  Martin Jansa
+-  Max Krummenacher
+-  Michael Opdenacker
+-  Mingli Yu
+-  Oleksiy Obitotskyy
+-  Pavel Zhukov
+-  Peter Kjellerstedt
+-  Pgowda
+-  Quentin Schulz
+-  Richard Purdie
+-  Robert Yang
+-  Ross Burton
+-  Rudolf J Streif
+-  Sakib Sajal
+-  Samuli Piippo
+-  Schmidt, Adriaan
+-  Stefan Herbrechtsmeier
+-  Steve Sakoman
+-  Sundeep KOKKONDA
+-  Teoh Jay Shen
+-  Thomas Perrot
+-  Tim Orling
+-  Vyacheslav Yurkov
+-  Yongxin Liu
+-  pgowda
+-  wangmy
+
+Repositories / Downloads for 3.4.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: https://git.yoctoproject.org/poky/
+-  Branch: `honister <https://git.yoctoproject.org/poky/log/?h=honister>`__
+-  Tag: `yocto-3.4.2 <https://git.yoctoproject.org/poky/tag/?h=yocto-3.4.2>`__
+-  Git Revision: `e0ab08bb6a32916b457d221021e7f402ffa36b1a <https://git.yoctoproject.org/poky/commit/?id=e0ab08bb6a32916b457d221021e7f402ffa36b1a>`__
+-  Release Artefact: poky-e0ab08bb6a32916b457d221021e7f402ffa36b1a
+-  sha: 8580dc5067ee426fe347a0d0f7a74c29ba539120bbe8438332339a9c8bce00fd
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-3.4.2/poky-e0ab08bb6a32916b457d221021e7f402ffa36b1a.tar.bz2,
+   http://mirrors.kernel.org/yocto/yocto/yocto-3.4.2/poky-e0ab08bb6a32916b457d221021e7f402ffa36b1a.tar.bz2
+
+openembedded-core
+
+-  Repository Location: https://git.openembedded.org/openembedded-core
+-  Branch: `honister <https://git.openembedded.org/openembedded-core/log/?h=honister>`__
+-  Tag: `yocto-3.4.2 <https://git.openembedded.org/openembedded-core/tag/?h=yocto-3.4.2>`__
+-  Git Revision: `418a9c4c31615a9e3e011fc2b21fb7154bc6c93a <https://git.openembedded.org/openembedded-core/commit/?id=418a9c4c31615a9e3e011fc2b21fb7154bc6c93a>`__
+-  Release Artefact: oecore-418a9c4c31615a9e3e011fc2b21fb7154bc6c93a
+-  sha: f2ca94a5a7ec669d4c208d1729930dfc1b917846dbb2393d01d6d5856fcbc6de
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-3.4.2/oecore-418a9c4c31615a9e3e011fc2b21fb7154bc6c93a.tar.bz2,
+   http://mirrors.kernel.org/yocto/yocto/yocto-3.4.2/oecore-418a9c4c31615a9e3e011fc2b21fb7154bc6c93a.tar.bz2
+
+meta-mingw
+
+-  Repository Location: https://git.yoctoproject.org/meta-mingw
+-  Branch: `honister <https://git.yoctoproject.org/meta-mingw/log/?h=honister>`__
+-  Tag: `yocto-3.4.2 <https://git.yoctoproject.org/meta-mingw/tag/?h=yocto-3.4.2>`__
+-  Git Revision: `f5d761cbd5c957e4405c5d40b0c236d263c916a8 <https://git.yoctoproject.org/meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`__
+-  Release Artefact: meta-mingw-f5d761cbd5c957e4405c5d40b0c236d263c916a8
+-  sha: d4305d638ef80948584526c8ca386a8cf77933dffb8a3b8da98d26a5c40fcc11
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-3.4.2/meta-mingw-f5d761cbd5c957e4405c5d40b0c236d263c916a8.tar.bz2,
+   http://mirrors.kernel.org/yocto/yocto/yocto-3.4.2/meta-mingw-f5d761cbd5c957e4405c5d40b0c236d263c916a8.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: https://git.yoctoproject.org/meta-gplv2
+-  Branch: `honister <https://git.yoctoproject.org/meta-gplv2/log/?h=honister>`__
+-  Tag: `yocto-3.4.2 <https://git.yoctoproject.org/meta-gplv2/tag/?h=yocto-3.4.2>`__
+-  Git Revision: `f04e4369bf9dd3385165281b9fa2ed1043b0e400 <https://git.yoctoproject.org/meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`__
+-  Release Artefact: meta-gplv2-f04e4369bf9dd3385165281b9fa2ed1043b0e400
+-  sha: ef8e2b1ec1fb43dbee4ff6990ac736315c7bc2d8c8e79249e1d337558657d3fe
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-3.4.2/meta-gplv2-f04e4369bf9dd3385165281b9fa2ed1043b0e400.tar.bz2,
+   http://mirrors.kernel.org/yocto/yocto/yocto-3.4.2/meta-gplv2-f04e4369bf9dd3385165281b9fa2ed1043b0e400.tar.bz2
+
+bitbake
+
+-  Repository Location: https://git.openembedded.org/bitbake
+-  Branch: `1.52 <https://git.openembedded.org/bitbake/log/?h=1.52>`__
+-  Tag: `yocto-3.4.2 <https://git.openembedded.org/bitbake/tag/?h=yocto-3.4.2>`__
+-  Git Revision: `c039182c79e2ccc54fff5d7f4f266340014ca6e0 <https://git.openembedded.org/bitbake/commit/?id=c039182c79e2ccc54fff5d7f4f266340014ca6e0>`__
+-  Release Artefact: bitbake-c039182c79e2ccc54fff5d7f4f266340014ca6e0
+-  sha: bd80297f8d8aa40cbcc8a3d4e23a5223454b305350adf34cd29b5fb65c1b4c52
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-3.4.2/bitbake-c039182c79e2ccc54fff5d7f4f266340014ca6e0.tar.bz2,
+   http://mirrors.kernel.org/yocto/yocto/yocto-3.4.2/bitbake-c039182c79e2ccc54fff5d7f4f266340014ca6e0.tar.bz2
+
+yocto-docs
+
+-  Repository Location: https://git.yoctoproject.org/yocto-docs
+-  Branch: `honister <https://git.yoctoproject.org/yocto-docs/log/?h=honister>`__
+-  Tag: `yocto-3.4.2 <https://git.yoctoproject.org/yocto-docs/tag/?h=yocto-3.4.2>`__
+-  Git Revision: `3061d3d62054a5c3b9e16bfce4bcd186fa7a23d2 <https://git.yoctoproject.org/yocto-docs/commit/?3061d3d62054a5c3b9e16bfce4bcd186fa7a23d2>`__
-- 
2.25.1


