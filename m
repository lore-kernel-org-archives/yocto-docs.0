Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A073D206B4
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:18:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.24005.1729088308457316947
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EJSbjOgA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 401024000B;
	Wed, 16 Oct 2024 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729088306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u2eQVjLfzgYNR8wAE7+2mE5b+KFMlVYSOpnPam7UO/4=;
	b=EJSbjOgAIYJ0rxMXdPZI/JqzJvoB0Qxq4qh+3Xl1ZlPZ+g0CXAsXBKVdKAG/IUrLJuxa9h
	x8SzJoCXI4MOoHXn9WJEFVr4h83PkJYD0vQW2oaHgnZn4fShq2m5iyzOXQO85HqkqnZFMW
	A6xZuR36MGPbvMfoPipAAXioLgK3p/Xi9uxICgTFwpXYC0JfG3x3rZiNbvjWtMpkdiN/XE
	y2kOMI2jQGFygl9AG8g3Zh+Vwa96HTWjMiRxOoPjhqmrOQaXUVxZ2PR6XoCAhrDvhunmxG
	pcKza/WYziTXRHlXyUR9VlY+Prmlh8IzVJ/ts8t4fbbDqpNCLPSZCMDwWzLeLQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 16 Oct 2024 16:18:03 +0200
Subject: [PATCH v2] release-notes-5.1: add beaglebone-yocto parselogs test
 oeqa failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-5-1-parselogs-beagle-v2-1-9568ac00907f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIABrLD2cC/4WNQQ7CIBBFr9LMWgzQ2lpX3sN0AWWkkyA00BBNw
 93FXsDle8l/f4eEkTDBrdkhYqZEwVeQpwbmRXmLjExlkFx2goueXZhgq4oJXbCJaVTWIevlqDi
 aoR14B3W6RnzS+8g+psoLpS3Ez/GSxc/+CWZRrTI48lajFld11yFsjvx5Di+YSilfySqmjroAA
 AA=
X-Change-ID: 20241016-5-1-parselogs-beagle-629a0ed73704
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ross Burton <Ross.Burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1zup3Ze5GVh/h0OuymsowLQAlYxbUP4oJH2Ffc/CS/0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnD8sy53bxvmV/TmdQHMD+t2E+uF0HUIjxT+pvh
 lPTQRPXb6eJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZw/LMgAKCRDRgEFAKaOo
 NoZ5D/9LKrmT393IcNjpzHTAsCxt2jgPSqpCh2WvxtGkcnK9TVy8gXnFH5xnUDp7XsNhqs+Mb5Y
 ymz/P00dIyheTBoXl8w0MVbQs64QuNn4L8epy5I2W8x9U7YI0QRDKhVdudE3YDN2Isg84vWchWP
 Zuz7WqP/fJa4cLiWOjFEuoSyyV0fTkDM7UmrMjtaTG0T1PQDblzjudcvjajB9MnPcJJRi4yl2cX
 Iq1QyNdXmd/mLmq753YMxXwTuBMuvH7ZOoiTgk6UvqJ7aWh83+L2CxtDR39dGZfGQFU1PYPrDBR
 qoSxd0xkBXsNNYsWsnf/8U7k0mB/n3bjsv/YzuOHYdw9m61MHJXGcCsf/k2DSL2S21SY3alqo0h
 1Si78wO2aPvRFCiZigc+3aZBvnJCg8Sf9VF7S3GMILD32QmIHRnh5hfJazTBCzSl9GoEgeUNLub
 5zl8Rt+Ld4kUrW/yGVPLmW0zvIq3wiVq9dnrFlgZVJnewROXp4t+QUHOPeVt6/iR0wGvT1nkg5B
 JIetblY+eh4GwnQh3PQnKyE8aKbwMnZFPo2S12DkrH30seyoodg6ouDC8rYQvsvBtnGquJoHIg3
 KYbKEAN2+tBpPHGatQMb/YvxFrwrz2XtagnYiGFOmzeDIIyHwznHlorfJ/v86h45EdFDajXulAy
 GfM2VZgCKKgfbMw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:18:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5519

The beaglebone-yocto currently fails the parselogs runtime test. For
details see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15624

Reported-by: Ross Burton <Ross.Burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Add link to Bugzilla with `:yocto_bugs:`.
- Link to v1: https://lore.kernel.org/r/20241016-5-1-parselogs-beagle-v1-1-ade903beb18a@bootlin.com
---
 documentation/migration-guides/release-notes-5.1.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 0f1cb5312e1a59fdfff2df57e98b6c4a27bd589d..d6e284c1e8fef2c7dada3f15ffe3c0cecf21a981 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -402,6 +402,13 @@ New Features / Enhancements in 5.1
       scripts, fixing some issues seen when :term:`PACKAGECONFIG` would
       conditionally modify it.
 
+Known Issues in 5.1
+~~~~~~~~~~~~~~~~~~~
+
+-  ``oeqa/runtime``: the ``beaglebone-yocto`` target fails the ``parselogs``
+   runtime test due to unexpected kernel error messages in the log (see
+   :yocto_bugs:`bug 15624 </show_bug.cgi?id=15624>` on Bugzilla).
+
 Recipe License changes in 5.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: ac4c4455d40dc0852d95461a3a10d687d2aedd6e
change-id: 20241016-5-1-parselogs-beagle-629a0ed73704

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


