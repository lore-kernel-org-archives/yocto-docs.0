Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA96CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 13:57:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.17341.1757685457893421651
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 06:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kHq4PpRm;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C488DC8EC56
	for <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 13:57:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5AD660638;
	Fri, 12 Sep 2025 13:57:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74A88102F2942;
	Fri, 12 Sep 2025 15:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757685455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/UKbJpPFD+iCpHQigkbHudFC91xyjlQk2q3jUATpeHw=;
	b=kHq4PpRm1qB2KQx6ijfnrQ4lixb8n+BN1lB0Z31a9D2Q5/EEVdWnBN+a4inT108NLx79m/
	8K30R0TEwDmSoQEuiAhPjixeJeaeuqC/F8a59sQLAM69FHQA2jrSi7redgjus2xvQwO+K5
	mrW6nCW+ozA9hq2s4AZEUhCY0XVCRUmnv2Msy90l1Js+tAhfOwC42m8Dyii9sxRqE5XzEy
	JB21AgZxuCl+mz9+x6EW4c3Ii9uuQi9dGJLF3TDYlH5z5KPwZfVRTguNH/43ckJ5yYDAft
	KsK3mAKmVB3WDAE2GTdIGODufef1EX+VtucOYMuxRQ+IdEdW70P1aEQt9+jGTg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 12 Sep 2025 15:56:59 +0200
Subject: [PATCH v2] migration-guides/migration-5.3.rst: add note on systemd
 pni-names change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-systemd-pni-names-v2-1-2615197df69f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKomxGgC/22NQQ6CMBBFr0K6dkxpAK0r72FYlDKVMdKSTiUSw
 t0FjDuXL3n//VkwRkIWl2wWEUdiCn4FdciE7Yy/I1C7slBSlVLLAnjihH0LgyfwpkcGo7GyRVl
 JZbVYd0NER++9eau/zK/mgTZtoc3oiFOI03465pv36+s//TGHHNA1yqE7GePO1yaE9CR/tKEX9
 bIsHz5W/vjGAAAA
X-Change-ID: 20250904-systemd-pni-names-a9e6c45602c9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=IQ2LagiilxownVkVGjZrhwKUyIh49xmtLNtk6kbGC+I=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoxCbNiII9FIVizHyO9z7OFTt1mHtGx9eC8CGM1
 66iNyNa9VSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaMQmzQAKCRDRgEFAKaOo
 Nt9GD/4rBTUf/KC8XVUNHc4OyOFQgeGrEv3rNmfUYHHWF9vM7CIAHLDX6ok0+C6xyzCF9bN4AUO
 2mCjZozyGEldLRRooYWnV7o6LQZVoc6DhCoBYNa2wpCsAFAvO1vPdYgcf6Tx4LnABu6CyzM1IpN
 beVbeRDmEkaBsbye8MQxemuP3loxxEWrQvMjVfpOF4KmKfZPE2BKgQWNQr4eWkDNWPSy11voqiI
 56tTYvAWEjV3NiDNbGxo57IhhGpBvIQw7g0En/XpGt74TOt/txbUp8AsM/yhj0c7J0ALqLk8lTR
 BEAy9JOP8w+qu893rjpmMTbsdgE0yugFfNOauwYhfs6mDmeX9jyQuvwRGu5ny/w5JBFOcPD7itb
 5qSeo+NBQrYXntTUQWCcoqN+82PkR+N780YGHCrb/6vbpzxYyfw29T/cKlmLvDtfXK7ODuqIAFp
 hUTRyBPdefR4qfruBNTocF2I4HG3w6tP4/nDWe54Fwuk012ASFedzvd0rcbEm2c3P2dC9Dilanv
 3xJ4q2AE8eOW18XpgBG8HFqN0gYbCSZNelWVceMZ5WCOOqYZoshxOS9fEdD+ii13ZvWi7WlyDz8
 bWVkKY0flCdYKlGRFQdMqcvWw6SGZMm2SFTjr3ZqoUHkeyf6A7D/fQ9dAXjzlYJGeKk6xHeiSc6
 WZZgqlllD5VKCCQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 13:57:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7501

Add a migration note on the pni-names default policy change after commit
9b34a810496f ("systemd: stop enabling non-standard "mac" policy when
using the 'pni-names' DISTRO_FEATURE") in OE-Core.

Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Cc: Ross Burton <Ross.Burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Suggested by Quentin Schulz: simplify note on how to revert to the mac
  policy, and mention the systemd version at the time of writing the
  note.
- Link to v1: https://lore.kernel.org/r/20250909-systemd-pni-names-v1-1-efb2fef7aaf8@bootlin.com
---
 documentation/migration-guides/migration-5.3.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 2d2f8d91a..cca93cbb3 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -118,6 +118,22 @@ class. Instead, one should create a new recipe to build this FIT image, as
 described in the :ref:`Removed Classes <migration-guides/migration-5.3:Removed
 Classes>` section of the Migration notes for |yocto-ver| (|yocto-codename|).
 
+systemd Predictable Interface Names no longer MAC policy by default
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The :oe_git:`systemd recipe </openembedded-core/tree/meta/recipes-core/systemd>`
+used to forcibly set the "mac" policy by default when the ``pni-names``
+:term:`distro feature <DISTRO_FEATURES>` is enabled.
+
+This is no longer the case as this was not following upstream changes. Now when
+the ``pni-names`` :term:`distro feature <DISTRO_FEATURES>` is enabled, the
+default policy from systemd is selected (from
+https://github.com/systemd/systemd/blob/v257.8/network/99-default.link).
+
+To set back the "mac" policy in systemd (version 257.8 at the time of writing
+this note), you should set the ``NamePolicy`` and ``AlternativeNamesPolicy`` as
+detailed in :manpage:`systemd.link(5)`.
+
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: ee0b46bd074dd34c3d6b401e65d2c519c2c3d47b
change-id: 20250904-systemd-pni-names-a9e6c45602c9

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


