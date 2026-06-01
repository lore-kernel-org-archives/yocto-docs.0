Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EF2CD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 06:57:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22688.1780297047588099063
 for <docs@lists.yoctoproject.org>;
 Sun, 31 May 2026 23:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q3oCiUkM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 75A02C6247C
	for <docs@lists.yoctoproject.org>; Mon,  1 Jun 2026 06:57:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95487602AB
	for <docs@lists.yoctoproject.org>; Mon,  1 Jun 2026 06:57:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08D5A10888CDA;
	Mon,  1 Jun 2026 08:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780297045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bH1GYG4/hZ43tmymcS/U/pb3oryPt3LX+T0kivg6ozY=;
	b=Q3oCiUkMxU2qogEIc9JYXRc8ihXr/LiSo+McmIDEgO01L6pJ76HO+NfeSip9bdHldnwNU+
	/4QH3eevjjlFBK8QQEAJHlEHVLg9P7SwNAhaQQaazRNQEOJesNiOvu+Vtp/oyzR5e8MLeC
	HBI2qkNgdSt/iz2Y3GlJNrdBkeOp9nlHFtV3UDh0+kLCJS15TxLyZ3xrTwpviDFQeV9fDt
	Yy0a33hU2Pl4olLtIOAo+5VNdAAqU+Xo4mZQT0xZqz7P1l7zA/9rvxpOhdvCuCp50oktXO
	hhsXeeUNRPYliKBdIibFVj8pj3QNY/Mm/T9OBFxneQ0j7NA1m9D6GAnnmApbZQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 01 Jun 2026 08:57:01 +0200
Subject: [PATCH] migration-guides: add Blacksail release note templates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-release-notes-6-1-templates-v1-1-e586526dd576@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTuQDJiFVxEX0/irkZqWTBSh9
 O5N6/Jt3kKGkmB06RYq+CZLU27wp47iU/MDnO7NJE6CC85zwQg1cJ4qjAN7rnjPo+7qA4agKvE
 sQm2YC4b0O/br7W/79C/Eupe0rht5LONkfwAAAA==
X-Change-ID: 20260601-release-notes-6-1-templates-b6ef6aa2c522
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6298;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=o/sSNct+ggcnvHY4tgKoIsZy2HJedCJ2K99rFJaSGLA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqHS1TtAZj5A2hluh1lpGQgHJbD8lxKsWh1KIUV
 coLOvISuRGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCah0tUwAKCRDRgEFAKaOo
 NsP9D/9Zbt4jWMZITdAUUL76twATYgasn176J88uZKXFqt8QW1q7Oz/UxJ33XtuVRhI2Qz5OCz5
 gGZYgHOYtFNMn4nMUGb7YGBPqW2bigWEbocdJ8YuFWUIVTlsTxW+HDPRtGuWjkP0zHsR3vzVjCB
 4OyfUen/v87ImQ62oXXCueXejfNUVDR5VCuHEBOKv/nGSInm7SHm9SXFfLS4WiqA4ZgFt9GLKc3
 UPY4siQlYbeMKcdKDSximpAqPv76InTwgyXaQ+5TJBUZTDgeYkAv7lLb8xxw2ENLgbMR0KqTUli
 r2F48NZGQU4UPcgKwJ+KZHxm/c+1uacyXzpwW50PeLgVEp9H7hnTLHymlANjmmQXaEpOd99sOUO
 iIJIYjx9muy9OjskdOcgyBmNGMEqQIfL28ktrSEox6c+2w/g0cHQHxOmI6XlpdMs8xNcuDcv0Ff
 yC1PG78T2dCs+6gGBpZCdrlx8ECt6gl1tl3UI1DN/y6yRwtVfjPd1rrFcPIGVMygDa5YB3GTPhK
 wsJPXyrfrHPQL/OqMlLa4LZgE90tJLc7UTzmZAIWUoKjppte6K8MPSly4scir2CVE9cmxMv89Ns
 2kpaM7QCDKNF3HdCbmN7ANuW2pzPbfvgaH/jLLDPD0wcRqtPUBoa21kIy6VJRZ+5ywSXsno1zQK
 AKQOHdfZUpHftag==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 06:57:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9546

Based on the 6.0 documents.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/index.rst           |   1 +
 documentation/migration-guides/migration-6.1.rst   |  47 +++++++++
 documentation/migration-guides/release-6.1.rst     |  10 ++
 .../migration-guides/release-notes-6.1.rst         | 113 +++++++++++++++++++++
 4 files changed, 171 insertions(+)

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index f71144dd3..e53215c73 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   release-6.1
    release-6.0
    release-5.3
    release-5.2
diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
new file mode 100644
index 000000000..2e103f0b7
--- /dev/null
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -0,0 +1,47 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: blacksail
+.. |yocto-ver| replace:: 6.1
+.. Note: anchors id below cannot contain substitutions so replace them with the
+   value of |yocto-ver| above.
+
+Migration notes for |yocto-ver| (|yocto-codename|)
+**************************************************
+
+This section provides migration information for moving to the Yocto
+Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
+For a list of new features and enhancements, see the
+:doc:`/migration-guides/release-notes-6.1` section.
+
+Supported kernel versions
+-------------------------
+
+The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
+out the box, older kernels are not supported. See :ref:`4.3 migration notes
+<migration-4.3-supported-kernel-versions>` for details.
+
+Supported distributions
+-----------------------
+
+Compared to the previous releases, running BitBake is supported on new
+GNU/Linux distributions:
+
+-  XXX
+
+On the other hand, some earlier distributions are no longer supported:
+
+-  XXX
+
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
+
+Removed recipes
+---------------
+
+Removed :term:`PACKAGECONFIG` options
+-------------------------------------
+
+Removed classes
+---------------
+
+Miscellaneous changes
+---------------------
diff --git a/documentation/migration-guides/release-6.1.rst b/documentation/migration-guides/release-6.1.rst
new file mode 100644
index 000000000..f238a26d4
--- /dev/null
+++ b/documentation/migration-guides/release-6.1.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+***********************
+Release 6.1 (blacksail)
+***********************
+
+.. toctree::
+
+   release-notes-6.1
+   migration-6.1
diff --git a/documentation/migration-guides/release-notes-6.1.rst b/documentation/migration-guides/release-notes-6.1.rst
new file mode 100644
index 000000000..c101ddcfa
--- /dev/null
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -0,0 +1,113 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: blacksail
+.. |yocto-ver| replace:: 6.1
+.. Note: anchors id below cannot contain substitutions so replace them with the
+   value of |yocto-ver| above.
+
+Release notes for |yocto-ver| (|yocto-codename|)
+================================================
+
+This document lists new features and enhancements for the Yocto Project
+|yocto-ver| Release (codename "|yocto-codename|"). For a list of breaking
+changes and migration guides, see the :doc:`/migration-guides/migration-6.1`
+section.
+
+New Features / Enhancements in |yocto-ver|
+------------------------------------------
+
+-  Linux kernel XXX, gcc XXX, glibc XXX, LLVM XXX, and over XXX other
+   recipe upgrades
+
+..
+   Found in meta/classes-global/sanity.bbclass:check_sanity_everybuild
+
+-  Minimum Python version required on the host: XXX.
+
+-  Kernel-related changes:
+
+-  New core recipes:
+
+-  New core classes:
+
+-  New variables:
+
+-  Global configuration changes:
+
+-  BitBake changes:
+
+-  QEMU / ``runqemu`` changes:
+
+-  Documentation changes:
+
+-  Go changes:
+
+-  Rust changes:
+
+-  Wic Image Creator changes:
+
+-  Testing-related changes:
+
+-  Utility script changes:classes
+
+-  Clang/LLVM related changes:
+
+-  SPDX-related changes:
+
+-  Patchtest-related changes:
+
+-  :ref:`ref-classes-insane` / :ref:`ref-classes-sanity` classes related changes:
+
+-  Security changes:
+
+-  :ref:`ref-classes-sbom-cve-check`-related changes:
+
+-  New :term:`PACKAGECONFIG` options for individual recipes:
+
+-  systemd related changes:
+
+-  U-Boot related changes:
+
+-  Miscellaneous changes:
+
+Known Issues in |yocto-ver|
+---------------------------
+
+Recipe License changes in |yocto-ver|
+-------------------------------------
+
+..
+   Going through commits on OE-Core filtered by License-Update:
+   git log -U0 --patch --grep "License-Update:" yocto-6.0..origin/master
+
+Security Fixes in |yocto-ver|
+-----------------------------
+
+..
+   Generated with documentation/tools/gen-cve-release-notes
+
+Recipe Upgrades in |yocto-ver|
+------------------------------
+
+..
+   Generated with https://layers.openembedded.org/layerindex/branch_comparison
+   With "rST" output selected
+
+Contributors to |yocto-ver|
+---------------------------
+
+..
+   List obtained with the following shell snippet:
+
+      authors=""
+      for repo in openembedded-core yocto-docs bitbake meta-yocto; do
+         authors="${authors}\n$(git --no-pager -C $repo log --format="-  %an" yocto-6.0..origin/master)"
+      done
+      echo $authors | sort | uniq
+
+   Email addresses and duplicates removed.
+
+Thanks to the following people who contributed to this release:
+
+Repositories / Downloads for Yocto-|yocto-ver|
+----------------------------------------------

---
base-commit: d7376cca64a0784e59d4fd60b9baefb4da2ce289
change-id: 20260601-release-notes-6-1-templates-b6ef6aa2c522


