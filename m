Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEFFD42BB0
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 16:52:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.91767.1731430349586700450
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 08:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UbU3L5VA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F35840006;
	Tue, 12 Nov 2024 16:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731430347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9BD6GRZQKcW+U2ZHnBwC6gQjf1D3WRROq0pm+rTpqgE=;
	b=UbU3L5VAqvXIL6RhBPZy/cIIWZX+vepMZe7WoFx3grcFH32wV6Vb1BYaRsXc91zEaMwyrh
	IBs5VMVddj7PJ3p79/+SX3cYubdSW6iE9vVzof16X/7Fr1DI4Etvz6fpGOOnoDZ9e7Ex0I
	3vs8s0He+LYURUtiXEOll63aZjApr+UYbid6tNvU0xiz0go5D71WOIWvwQip2k1OhuFGHz
	C740HUNEF8fHw7MoBGjgAJuRq8m+cqFTJfV6wcvwG05/eGot0/4+IcpfkA8xnN59cFatnO
	+2DkWqBuQprf3r06oLQPeKYnY2krwaWTEgHcQdjQVmnEnSNHi2vP6BmhZZtZ2Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 12 Nov 2024 17:52:19 +0100
Subject: [yocto-docs PATCH] migration-guides: add placeholder files next
 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-release-note-5-2-placeholders-v1-1-a15b66eae472@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMKHM2cC/x3MQQrCQAwF0KuUrA2YYC14FXExTn9tYJgpiYhQe
 ncHl2/zdgq4Ieg27OT4WFirHXIaKK+pvsA2d5Oe9SIiyo6CFODa3uCRlbeSMtZWZniwLPrMSON
 1mjL1Y3Ms9v3/98dx/AAoDhnRbwAAAA==
X-Change-ID: 20241112-release-note-5-2-placeholders-1f2bcea5677c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4674;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KUPoZ62VyHWVvvzfGzvmDaXtMITohDooo9sdGvnw2PI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnM4fKhimUpepKiullg6Cjv4uInQ1+L5j88lU4Y
 +Cg6P9FwwGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzOHygAKCRDRgEFAKaOo
 Ng7aD/9wf0/hekuIzEomS1WBUK2JLsbM9vaV4ddTFJnrp7PvhpQ3hZcTwsYOuMj9e32+5gfOmKs
 sRK0SS2hXLvc0u0wfl8QiYtxs+czNqrOeV5H1J+uv0XBj2grIiYI95+epmhFS74FcDD3lXtaYmH
 zaiXFgHlXoWSUfZ9llE/GvqAsTKroruBWnCP37PP/2i2w/MJRQFP8jHDUCH0VbWCyFz81TkF7e+
 pwadf5RUEwh01v2cfoFpy5MtBFidsfMyXMOELhpxsoobU5Y+tjKhSPnUwzZOQhn4/byh1OtOUSi
 BXGejEbxKRPq2s8BOfNT1r1lCBJImBpekyK8+VmU+LWoBuqoMSPr9CQVk7vGF86/jf9SVEb0xgq
 ekI6LYvGUw6sQ5ZDUgKx8428Tnvpi5bznlDDgaPLLNDaCktelqChD7URrpWdmdShhO+ZKELemvH
 4BHPiKrz9hLGOjDp++6o5nZGDUJ7X1K6Nth8mGu9t4is/UD1EruvOWnO4FsHlPmHIfGSw2Tp+8J
 Qzkp7DOSyRPPofpt7w/xamoUoKfF98/Lq9nyUrFVXjuO66Tl1fT2EAk8BHA/rRgpF9IPZ/9g4+M
 18A1wfUJEvX10iXr6MnTjhMmCuBEqspDAk7okr8CKizhJRyg8Xa5aaoRAe8qtl0SNNfx/hOm/Xg
 zmyQBpS9jMxw28g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Nov 2024 16:52:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5718

Placeholder files for release 5.2 (Walnascar): migration guide and
release notes.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst   | 72 ++++++++++++++++++++++
 documentation/migration-guides/release-5.2.rst     |  9 +++
 .../migration-guides/release-notes-5.2.rst         | 62 +++++++++++++++++++
 3 files changed, 143 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
new file mode 100644
index 0000000000000000000000000000000000000000..8a077b31f87582e0bcff7ca6fbf6f300c0274e6f
--- /dev/null
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 5.2 (walnascar)
+=======================
+
+Migration notes for 5.2 (walnascar)
+-----------------------------------
+
+This section provides migration information for moving to the Yocto
+Project 5.2 Release (codename "walnascar") from the prior release.
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
index 0000000000000000000000000000000000000000..a6ba1e01a310111cf9483c74718315286b669821
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -0,0 +1,62 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for 5.2 (walnascar)
+---------------------------------
+
+New Features / Enhancements in 5.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Linux kernel 6.XXX, gcc 14.XXX, glibc 2.XXX, LLVM 18.1.XXX, and over 300 other
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
+Known Issues in 5.2
+~~~~~~~~~~~~~~~~~~~
+
+Recipe License changes in 5.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The following corrections have been made to the :term:`LICENSE` values set by recipes:
+
+Security Fixes in 5.2
+~~~~~~~~~~~~~~~~~~~~~
+
+Recipe Upgrades in 5.2
+~~~~~~~~~~~~~~~~~~~~~~
+
+Contributors to 5.2
+~~~~~~~~~~~~~~~~~~~
+
+Repositories / Downloads for Yocto-5.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---
base-commit: 2849690abf94872e259e712128e90413f3b9a2f2
change-id: 20241112-release-note-5-2-placeholders-1f2bcea5677c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


