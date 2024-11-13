Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC641D462A2
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 13:44:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.11618.1731505444866979958
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 05:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BAIyIz3i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB16320012;
	Wed, 13 Nov 2024 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731505443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fivpXaNP49WfhjeKzdi9r2YM5mfksm7p/b5GN3XhbIM=;
	b=BAIyIz3iYWfHyCkz0FD6ixzwysXfgU8mPERCSEj3+VxiZsztWZ3IKMOmT++Ba5jq1bC3NG
	hq2P+MbMN7tAQEiFuqNAzZOW89af1R5hBOduw269ojHD7R+P+oeNQPxQZGFXNt3klp0+j4
	noheN6uDAoUgBXIvLaqX5Yb7u0vVBPLkqwkcTvE/A1ZPyZbivRNbBSd/QExUEg+YE9u2/d
	fpMIB5ghndtSAUHyw9qxhBdl+/UznCNajbZ/9abprmrKModYgch7UdpUskdZpyUSljqb+v
	JQKrWkuTzDm7R8WTxoiO/QB9/EZF6HtEslNRs/c2djP4KMXZbn1iTMKlj1+35Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 13 Nov 2024 14:43:40 +0100
Subject: [yocto-docs PATCH v2] migration-guides: add placeholder files for
 next release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-release-note-5-2-placeholders-v2-1-28964033ad77@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAutNGcC/43NTQrCQAyG4auUrI2Y0B9w5T2ki+mY2sA4KTOlK
 KV3d+wJXD7f4v02yJJUMlyrDZKsmtViAZ8q8JOLT0F9FANfuCYixiRBXBaMtgg2yDgH52Wy8JC
 UkUYevLim7ToPpTEnGfV99O998aR5sfQ57lb6rf+WV0JCR83QtuKk7vg2mC1B49nbC/p937+JF
 ZHhzAAAAA==
X-Change-ID: 20241112-release-note-5-2-placeholders-1f2bcea5677c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6275;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TOHcGcE/+08+mgEkkXu0pGdSiDRkZO+sGh2hgPp6r6Y=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnNK0ixtwIoSBVs90ynY4fHQLSKpLUE/6BHkJ0V
 WaY0gTuh9yJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzStIgAKCRDRgEFAKaOo
 NnbgD/sEDR1R7mxdfUfcrxzBTpTKMd7SxNvHtAoGXW0Bn7J+om6DqEM2eRV9It/OuxyVCUNxlbj
 46XrLZqzm9PnSpwkWfme9+PdmkVWdMFLV/Sls9raeZ0RYktf9gVe4ai02G0HEq543wX6fNFm9Hr
 +6pjZJF0wxaE/FsybGsR8vtJas3wpZQiqc8QT0npGcZh0Z+aIqumRQRhnF4nb9jmWDCwwtpuTuk
 HEz2YyWpMselUanEDBYWtxDdG2Hj1YL8NU3aTBK3O1jTahlGI76XLnXk707huIfkiJT+W+TdpCO
 cl/KZaCgHK9t4299yJ/G/D4+R4PQQovioo6Db+Nu9esrymTqfVQrN+OedWyHXphW/7h/Wmb6wH0
 UgC6RZs4QRQQgj0oLOG2D66Wsr84V28JJgVzn2y0asddd5QpfSH9MS6Pe2HKS43dwqhzv9Orv7P
 GIhEU/JrvvtCMSe6sR+WETz49K7KSwA51FltAaunHJ1yWaHLOXhQNIIP3OMG18wPSMi86gjrl3C
 wvo62ozA4ig2GrfGV+YSTuP8zM1rEg+ON97jkx2s2R/eezeAlkXgWMlBiYiNfw+lv8LMCfIfKjP
 qwhUKmBRBMd8GafoDWX2XzqgSl2GLLjQIdsMCTUMr98FxSGJII3wuWz5LpZp6mkpegB24V8zhAp
 gxRLUUBOeKjyHkg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 13:44:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5726

Placeholder files for release 5.2 (Walnascar): migration guide and
release notes.

Define two substitutions |yocto-ver| and |yocto-codename| to avoid
mistakes in the document. Note that anchors cannot contain these so
add a note on that in a comment.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Add the missing "release-5.2" document in documentation/migration-guides/index.rst.
- Define |yocto-ver| and |yocto-codename| in
  release-note-5.2/migration-5.2 to re-use in the document (expect
  anchors).
- release-note-5.2: replace "over 300" by "over XXX"
- Link to v1: https://lore.kernel.org/r/20241112-release-note-5-2-placeholders-v1-1-a15b66eae472@bootlin.com
---
 documentation/migration-guides/index.rst           |  1 +
 documentation/migration-guides/migration-5.2.rst   | 77 ++++++++++++++++++++++
 documentation/migration-guides/release-5.2.rst     |  9 +++
 .../migration-guides/release-notes-5.2.rst         | 65 ++++++++++++++++++
 4 files changed, 152 insertions(+)

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
index 0000000000000000000000000000000000000000..c186f633d26853d8fdd45529f5f3364b79591df2
--- /dev/null
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -0,0 +1,77 @@
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
+.. _migration-5.2-supported-kernel-versions:
+
+Supported kernel versions
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
+out the box, older kernels are not supported. See :ref:`4.3 migration notes
+<migration-4.3-supported-kernel-versions>` for details.
+
+.. _migration-5.2-supported-distributions:
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
+.. _migration-5.2-go-changes:
+
+Go language changes
+~~~~~~~~~~~~~~~~~~~
+
+.. _migration-5.2-systemd-changes:
+
+systemd changes
+~~~~~~~~~~~~~~~
+
+.. _migration-5.2-recipe-changes:
+
+Recipe changes
+~~~~~~~~~~~~~~
+
+.. _migration-5.2-removed-variables:
+
+Removed variables
+~~~~~~~~~~~~~~~~~
+
+The following variables have been removed:
+
+.. _migration-5.2-removed-recipes:
+
+Removed recipes
+~~~~~~~~~~~~~~~
+
+The following recipes have been removed in this release:
+
+.. _migration-5.2-removed-classes:
+
+Removed classes
+~~~~~~~~~~~~~~~
+
+The following classes have been removed in this release:
+
+.. _migration-5.2-misc-changes:
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


