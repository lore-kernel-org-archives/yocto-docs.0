Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AD2D462B9
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:57:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.13330.1731509840300930062
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fVD+n7vq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD8BF20004;
	Wed, 13 Nov 2024 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731509839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6BF+hPn9i6z1ZLKxXYlVVuVt1lTp0Qp89mb+twbtoNM=;
	b=fVD+n7vqPZsvI0ArDejkRV84fSJEyxsDbVwSb1HwkjoBERb744WtKR3vvh+EbNvesQEUUd
	0DcA7jpZnJx7++NrA98QkDGC8fyJLU+lXKi8MntWxS2SVDpXRnbNzEE/Xu3i6iwD3LVYR1
	fwwD6hoImD7s/ofh8CF4K5BOXEDOt89VCRfir455SnJvds/8Vvyys0oaXjUABZiRflhjOV
	tZmFQiqPftRE8t69+LP/OiBtKnCzKPi/UUHgJh0jnIASxMFuub1mP7mHOINhyKEE2ZkNLk
	O1SQRQhBhomikFvrpAo4wz2by8p0wtbZIFrvInKwL1oT15YogVb4Gs1eyX0F4A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 13 Nov 2024 15:57:14 +0100
Subject: [yocto-docs PATCH v3] migration-guides: add placeholder files for
 next release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-release-note-5-2-placeholders-v3-1-8c7df0ddecd3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEm+NGcC/43NsQ7CIBSF4VcxzF5TLi2ok+9hHCi9tSQIDTRE0
 /TdpZ100vE/w3dmlihaSuy8m1mkbJMNvoTY75gZtL8T2K40wwprzjlCJEc6EfgwETSAMDptaAi
 uo5iA99ga0o1UyrBijJF6+9z86630YNMU4mu7y3xd/5UzBw6aN62UpKlWeGlDmJz1BxMebLUzf
 nril4fFw+NJ1pUQulPq21uW5Q1EYIjFHAEAAA==
X-Change-ID: 20241112-release-note-5-2-placeholders-1f2bcea5677c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6233;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=8l/RTd5efgsRoKlxzjMN7TAH0jgWWCI4oJOZOvGiPVw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnNL5Op7aU5Tu328OoGB/391r2x1rOgr49RLK5b
 SeTzp6mEo2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzS+TgAKCRDRgEFAKaOo
 NtZ0EADCozNo8EsekHHj5exL3V23dmlklPik5GRtgP1/ySmZZLLXAmrYj0IkD1n/uu+KrZLbrpG
 8r0/zbbPVUmd+Usf+pqD4NNkiOVHF13LvK/Ur7y5Wbs9FQm1134Z+90NcZlKTny/zvz8KzRa/m4
 mkUpICT0pzbTGn27Q5vLs5EDL/qax4XidogVfwwMJJVJc/i6xq/m6FPMGyxD+UFxuewSVud/PFc
 EzU/7GyHoidljMHQX6ShaV4MSB9UoyOf/BhjID/E1CyKkkWJZ0kQGsidK2eJy5y+WZ4Ww4Hl7Xv
 iLpYL4jMBn5+THVbWid+WCkEbSE2ZwXYZaPpTcu4nAQZdr0OdXh3JqKWva1PqNxqFq4fUjJK0vM
 gcv0RMUbFoEEtuLttDXfMLyOtQlyt9P+Cwy43MZmgdJjCaC97sBtdQ5ueBo/kUaShQpE5+j3SKt
 14B1Eq0BbNXKuRHRCVbUaSLBvalwLCO6goGrYaWE8YF95Li2rPthgkZ/cTeL173mJ85hCIpR9dn
 mMjJ9PzhAvtaCDIx3OzVjU1yDFGbbg30PvQeo/dNTsdOPg/4Pey1xP2qc3taQ4SV2lqLSFUGWvL
 luGBu5tKJuwTSjSm8UtAv8NmVehcZggC08LEV8QtrOuIfPvHl496ce9cCAi0bYyAGWYExQupU2k
 Wie/aruIzLLxdRg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:57:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5736

Placeholder files for release 5.2 (Walnascar): migration guide and
release notes.

Define two substitutions |yocto-ver| and |yocto-codename| to avoid
mistakes in the document. Note that anchors cannot contain these so
add a note on that in a comment.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Remove labels from migration-5.2.rst. We can refer to these with e.g.
  :ref:`migration-guides/migration-X.Y.Z:Supported kernel versions`.
- Link to v2: https://lore.kernel.org/r/20241113-release-note-5-2-placeholders-v2-1-28964033ad77@bootlin.com

Changes in v2:
- Add the missing "release-5.2" document in documentation/migration-guides/index.rst.
- Define |yocto-ver| and |yocto-codename| in
  release-note-5.2/migration-5.2 to re-use in the document (expect
  anchors).
- release-note-5.2: replace "over 300" by "over XXX"
- Link to v1: https://lore.kernel.org/r/20241112-release-note-5-2-placeholders-v1-1-a15b66eae472@bootlin.com
---
 documentation/migration-guides/index.rst           |  1 +
 documentation/migration-guides/migration-5.2.rst   | 59 ++++++++++++++++++++
 documentation/migration-guides/release-5.2.rst     |  9 +++
 .../migration-guides/release-notes-5.2.rst         | 65 ++++++++++++++++++++++
 4 files changed, 134 insertions(+)

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index e9d7f7280931ea6e9b26276ee70a9f9d00004450..14127d56ff397a37e4f36a2e368abcb54eedb8a1 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   release-5.2
    release-5.1
    release-5.0
    release-4.3
diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
new file mode 100644
index 0000000000000000000000000000000000000000..73d52460fdf2980973da1490f66a274cc5b8494d
--- /dev/null
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -0,0 +1,59 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: walnascar
+.. |yocto-ver| replace:: 5.2
+.. Note: anchors id below cannot contain substitutions so replace them with the
+   value of |yocto-ver| above.
+
+Release |yocto-ver| (|yocto-codename|)
+======================================
+
+Migration notes for |yocto-ver| (|yocto-codename|)
+--------------------------------------------------
+
+This section provides migration information for moving to the Yocto
+Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
+
+Supported kernel versions
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
+out the box, older kernels are not supported. See :ref:`4.3 migration notes
+<migration-4.3-supported-kernel-versions>` for details.
+
+Supported distributions
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Compared to the previous releases, running BitBake is supported on new
+GNU/Linux distributions:
+
+On the other hand, some earlier distributions are no longer supported:
+
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
+
+Go language changes
+~~~~~~~~~~~~~~~~~~~
+
+systemd changes
+~~~~~~~~~~~~~~~
+
+Recipe changes
+~~~~~~~~~~~~~~
+
+Removed variables
+~~~~~~~~~~~~~~~~~
+
+The following variables have been removed:
+
+Removed recipes
+~~~~~~~~~~~~~~~
+
+The following recipes have been removed in this release:
+
+Removed classes
+~~~~~~~~~~~~~~~
+
+The following classes have been removed in this release:
+
+Miscellaneous changes
+~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-5.2.rst b/documentation/migration-guides/release-5.2.rst
new file mode 100644
index 0000000000000000000000000000000000000000..5c39b99e037e0a84ad6603d22ec4fb4dc2bf96ea
--- /dev/null
+++ b/documentation/migration-guides/release-5.2.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 5.2 (walnascar)
+=======================
+
+.. toctree::
+
+   migration-5.2
+   release-notes-5.2
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
new file mode 100644
index 0000000000000000000000000000000000000000..d03ed7a3b07936fc3c2d15177f350b5507ecb5d4
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: walnascar
+.. |yocto-ver| replace:: 5.2
+
+Release notes for |yocto-ver| (|yocto-codename|)
+------------------------------------------------
+
+New Features / Enhancements in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Linux kernel 6.XXX, gcc 14.XXX, glibc 2.XXX, LLVM 18.1.XXX, and over XXX other
+   recipe upgrades.
+
+-  New variables:
+
+-  Kernel-related changes:
+
+-  New core recipes:
+
+-  QEMU / ``runqemu`` changes:
+
+-  Go changes:
+
+-  Rust changes:
+
+-  wic Image Creator changes:
+
+-  SDK-related changes:
+
+-  Testing-related changes:
+
+-  Utility script changes:
+
+-  BitBake changes:
+
+-  Packaging changes:
+
+-  Security changes:
+
+-  LLVM related changes:
+
+-  SPDX-related changes:
+
+-  Miscellaneous changes:
+
+Known Issues in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Recipe License changes in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The following corrections have been made to the :term:`LICENSE` values set by recipes:
+
+Security Fixes in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Recipe Upgrades in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Contributors to |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Repositories / Downloads for Yocto-|yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---
base-commit: 2849690abf94872e259e712128e90413f3b9a2f2
change-id: 20241112-release-note-5-2-placeholders-1f2bcea5677c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


