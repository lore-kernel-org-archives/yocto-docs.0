Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C569FD1AD2C
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 08:33:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.18578.1729067626209256317
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 01:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BIOtK8pP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 465502000C;
	Wed, 16 Oct 2024 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729067624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xRfC9UnN+6s99UBg6zQHhsZ98IxoCeltNNVqNibtArQ=;
	b=BIOtK8pPzFSVnyrBRKNhxsvdrEZHHo1FJqh+lPaBp71ISGxOALZT4LOfh476CKp+bPHfNi
	n/CJ4v9zSTr666t2DiTVShcd6xuIV1ZK8pV9+jPotQdIPqppvmZyDwitNid3Y4SUEAatgO
	BPyR0x1gWjaiObFppTVah0bU6aINc6xB3IsIe86rGYl9llBTIiHXKFc3bmZkX6LEzyL6hF
	bgpgXbDjRU77BfgX5yU5YIVGpm5X1dv/ltdEXxXXAXgM/E8t1v9f9zzYhbyYfnNZ8EgN7J
	lsNPt988gYKGytt5K0zFNLms+9x4rIQQARpNB8AjeuexdxRUsxWcabNPN3d8/A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 16 Oct 2024 10:33:37 +0200
Subject: [PATCH] release-notes-5.1: add beaglebone-yocto parselogs test
 oeqa failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-5-1-parselogs-beagle-v1-1-ade903beb18a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGB6D2cC/x3MSwqAMAxF0a1Ixgba+kO3Ig6qPmtAVBoQQdy7x
 eEZ3PuQIgqUuuyhiEtUjj3B5hlNq98DWOZkcsaV1tiaK7Z8+qjYjqA8wocNXLvWG8xN0ZiSUnp
 GLHL/23543w/7ZKqKZgAAAA==
X-Change-ID: 20241016-5-1-parselogs-beagle-629a0ed73704
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ross Burton <Ross.Burton@arm.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fuCalAet2D9rGOWBdp02pR61NcYE3hwpC7RGLKPoPDo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnD3poM4f12xO7/JmjKjguCgWsBdrRus/CpTpRn
 +8sUJRmVoiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZw96aAAKCRDRgEFAKaOo
 NmBkD/sHC3ziXxeZTZVsbSAQEqvXmZTOx8vGg8M9p+iN4dqCMPHqPF/IiJuls8vvljsanG+QINQ
 XzMCmNJKrD0rJ/jB05SulW7lEg+eI2Zr2pim1DDICbmavcxVSUBHJtF/rL+0//gGSWkTGfi9EKa
 3QrJ/goDddzzNIo983ZEK5xllUyne/4lT715jPOHouiHQ8RH1GVRBAXp8FGfGlovhIGVMZjqLha
 UJwWnbE+B4KlyFLHcnRXJguJN2kcBd6BnZEAkqs5hotnfA1NOujl1qnfRFsuHotolpdMAfII2X5
 1q/4HFFGcukEHyGA5uAYsJXJ0ppEcY8fofAhkVygJfeixw29RetjTD3AwHLsdls8iIEjQC9Cr5Z
 vQ5ljxV74a9mJnKDtVKHpZaNealDzIXJSwtzKcJrK/f2wwimCRQ168fLO/owxN5aB9X2LQBeob0
 9ZY/luo01h1pcGjaKFnpMcPjXJV4PXMLQ5YPcXj1+MEwxQMYo86+e5utcS8pBweIM1ouWZ1E3wD
 xXSWq7YifZOyVrjwNQT3IrAVpPuhcQ0cgyRKCyopVgtIpI7T3Pm00LDDJw4OsnWhs5mt60EaLr/
 LNWDZdzRVpwwagxTsZMaZrWqsC29438pVZeN+U+3gy6C/gwmqU6uqb+QSzCE8ssxsvEquxi4JAr
 BKZ+cPfCSrbv2fA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 08:33:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5497

The beaglebone-yocto currently fails the parselogs runtime test. For
details see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15624

Reported-by: Ross Burton <Ross.Burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-5.1.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 0f1cb5312e1a59fdfff2df57e98b6c4a27bd589d..7ce1ef2299189f7bdc566a8e549f4dea105626b5 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -402,6 +402,12 @@ New Features / Enhancements in 5.1
       scripts, fixing some issues seen when :term:`PACKAGECONFIG` would
       conditionally modify it.
 
+Known Issues in 5.1
+~~~~~~~~~~~~~~~~~~~
+
+-  ``oeqa/runtime``: the ``beaglebone-yocto`` target fails the ``parselogs``
+   runtime test due to unexpected kernel error messages in the log.
+
 Recipe License changes in 5.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: 3820a7bec0bb23bcd26bd99be2275d6d214a3a04
change-id: 20241016-5-1-parselogs-beagle-629a0ed73704

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


