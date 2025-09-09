Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131FDCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 13:30:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.13182.1757424597462966318
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 06:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Vs/5RsFv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 49B8F4E40C12;
	Tue,  9 Sep 2025 13:29:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23C8F60630;
	Tue,  9 Sep 2025 13:29:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F6A6102F26A4;
	Tue,  9 Sep 2025 15:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757424594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=jMmTMT3D2uEqNrc3fGnoNMqMep917ofa3by/S5dlaPA=;
	b=Vs/5RsFv0m06uZ6LziXh+xOw71CgMabn/nlBdX5ax2nHAsuz7FYjjLLBxnYZGg0gtSCtd1
	zfpQJgp6FsCSS9Fzs/KGnYk11hfu1pg8LwwXrg6MdLbLad2EPaxtMgKsOEJ9KwDJaaXPzW
	H6g7qLCSUG9M2kz9GSSDfgOSUZDH4VsFh8onwzMxZik917y/UxHcYuF73W5Co29IPSXyMj
	00WZxiSwdFesiLWTd5euQkcVGNlzeUyMaVLQp1BAAL6yLYcRfbCZTaGRRtkVCwMEyPxgL0
	kWKKdwDsC45ceUEObQNNvb36PeO09WAWyh3SScp5Q2eWCL/xw9qsT7kzVeC+OQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 09 Sep 2025 15:29:41 +0200
Subject: [PATCH] migration-guides/migration-5.3.rst: add note on systemd
 pni-names change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-systemd-pni-names-v1-1-efb2fef7aaf8@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMQrwGgC/yXMQQqDMBBG4avIrB1IgwrxKsVFGn/bKRglo6Ule
 HfTdvkt3sukSAKlvsqU8BKVJRZc6orCw8c7WMZissa2xpmG9aMb5pHXKBz9DGXv0IWm7YwNjkq
 3Jkzy/j2vw9+6354I23dEx3ECMnJWEXUAAAA=
X-Change-ID: 20250904-systemd-pni-names-a9e6c45602c9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Koen Kooi <koen.kooi@oss.qualcomm.com>, Ross Burton <Ross.Burton@arm.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=amJ1MBTXmKL3l3epGBdutX7nO6g+ZK5R52ShAinQEU0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBowCvLDseQreXzWdl0DZpHDirW+vNYBleTNUcNg
 2lgL4S42zGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaMArywAKCRDRgEFAKaOo
 NqJLEACCiT3N+mEm+F1Yo+7jphOLMzNQH0Za0AdEVaveijjLywQajoWn/7JxZ/IKhUN2mLv13qZ
 kBc/lE/MbER8/N/9pYaQ6nfr4h2Ic8G//ds+5u8xuqOu3f1Nf2XJycd8eV0/PG6w8TNaCbolZrh
 +Uz00HPlpcQ7XpQrOts1JxrjTn1pxSzKZ93E96v5nSyRWNgB4wtDFTdb82zauwr1Wd6/sWZEKEh
 4ztvzN7Mu85CzPJx0Rn64aArjMF/qNUdRfpGF+eKeQ5FziEyTl+SH/QH5L+W/XVrgw4/x6TSTgA
 f3VVN8iB5O4ttTttrb2CtNW+se3UWlbrbm25kUl6H8CrYUJEVToTG7LCaiDrQSstB5guUbmv8g1
 nhIcYsSFlCDpxCyEFhXelHlSjJR8PpStLzcZbN2qWjtTQwvACXqwzdjxtTg3WteW8woUDPiE4EF
 iVp7/4P+HHTb93UXbIlUeXogO2tfIkKZXUIy/zz8NPCV1wx40NVZTD86+bUOGZLFr8rnpeYat0G
 ElWuNwofUeH7WERjgSYkBdymISdexpWUMgN/DXtSBXXOEE+IWZmgrVxlNEcyc5KBs+fLD2bhtlF
 10Q/inXX26StMty25vZrCJNNd0BqY1zp60gaxO1p1fJQuVNjDyct/InHikM4xs1tquUeo6oIGEM
 SGKL+uw30+mcR0w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Sep 2025 13:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7490

Add a migration note on the pni-names default policy change after commit
<> in OE-Core.

Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Cc: Ross Burton <Ross.Burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.3.rst | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 2d2f8d91a..8aa7b537f 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -118,6 +118,31 @@ class. Instead, one should create a new recipe to build this FIT image, as
 described in the :ref:`Removed Classes <migration-guides/migration-5.3:Removed
 Classes>` section of the Migration notes for |yocto-ver| (|yocto-codename|).
 
+systemd Predictable Interface Names no longer MAC policy by default
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The :oe_git:`systemd recipe </openembedded-core/tree/meta/recipes-core/systemd>`
+used to forcibly set the MAC policy by default when the ``pni-names``
+:term:`distro feature <DISTRO_FEATURES>` was enabled. See
+https://www.freedesktop.org/software/systemd/man/latest/systemd.link.html#AlternativeNamesPolicy=.
+
+This is no longer the case. Instead, when the ``pni-names`` :term:`distro
+feature <DISTRO_FEATURES>` is enabled, the default policy from systemd is
+selected (from https://github.com/systemd/systemd/blob/main/network/99-default.link).
+
+To set the MAC policy to systemd, add the following to a systemd ``.bbappend``
+file in your custom layer::
+
+   do_install:append() {
+          if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
+                  if ! grep -q '^NamePolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
+                          sed -i '/^NamePolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
+                  fi
+                  if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
+                          sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
+                  fi
+   }
+
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: ee0b46bd074dd34c3d6b401e65d2c519c2c3d47b
change-id: 20250904-systemd-pni-names-a9e6c45602c9

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


