Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FB4D68B30
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 15:02:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.38807.1731596545671028540
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 07:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jNT0fs5L;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85BD240007;
	Thu, 14 Nov 2024 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731596543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a0BY1Kl6MgOz0ToLVi2LAskcNlwJlljHlrIj6KvTGfw=;
	b=jNT0fs5LhY1MXjkKDBDYdluCL3Tc8deTxXNOKZVuw72DtzrcFP3LdZO0E5B3WzyzeevpS5
	gdp8x34JINIkCpD/TvEEryGbFIU3b0yuXuMSSwqlEcpp7DxhF1JuZGpuwduvkjd14+bksY
	lC/jzv1O8XVExQn1J1cgMH/ctqOoIN+jZMhcvnCux/l7J2iW88wUFD8CVj0RtRKwaoWx97
	D0h0bkm0KyZNFB7jGG9Pq1k8jFOCx1Ct4F1SCJZ+R5RoU2Lzmd8Tp8w/2tt0j9VXwDtFBJ
	kNL4uHeD+8TL9g0A2fpj6lqScz6+hmcUt79ac2C9UeK5oRAvhjLZlORN5xcEXw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 14 Nov 2024 16:02:09 +0100
Subject: [yocto-docs PATCH] dev-manual: bblock: use warning block instead
 of attention
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-remove-attention-set-warning-v1-1-8d620e7aee40@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPAQNmcC/x3MQQqDQAxG4atI1g00Wpi2V5EuRvuPzaJRMoMK4
 t07dPnB4x2U4YpMz+Ygx6pZZ6uQS0PjJ9oE1nc1tdf2JiIdO77zCo6lwEqNOaPwFt3UJg4pDOH
 RjekugepicSTd//v+dZ4/hBdS5m4AAAA=
X-Change-ID: 20241113-remove-attention-set-warning-7f7b793cf817
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QCADvc+qXsU4vt6m1QCZ3YJ6U7ACjXeFEB+1zeUZHss=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnNhD/Dvh1Byg+lwZrkvydVxcVaPNbJ+m/ERYK7
 Si9g/BsXUSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzYQ/wAKCRDRgEFAKaOo
 NslMEACQ+rf3NKKOY0Q/4rXFERwD2PnWPLFBT2kVTbG40ZJNgmLxd4GpHByDkj6jJa9HZANR0Hg
 tcQd4SF1N8SRil5EcFpDkFbLZAlt8wEmYenz1RId1yt1RIF0m35ADqIX+8kIdW6lrIiZwjy4Sj3
 02PzY14qpFOPiiFEjLPMU6T4dTQxPaeu433vXsDR6mwH9tAg++pmgna8BPIOzA7NJlmRDt4usaX
 rSttGva7cS/U8YKOG1eSAAgT6CIV1oYLG7SbgarzuCc4XOnq8mNSyN11b0G273KuO6Kk4JRcVUg
 oMf+djwEccx/w3kEgIA9l9Y9Qqh3GCelIqqFim/9xInFSoY0wWbzwx5gg/AkaiNcjLRKqjZI3uC
 1hdmywzwF6EU7NSG9Jv0dOL4zreGrwXm74AL1eAu9X2MUYZMKzTOrze7KVMJTZ7YhI0HRn8fu/F
 qrmEZgW/jtcxgec5SW2hq6u/jRIcs4H9GGrS99v5uTNNPXFUDHfCAQPewELn/tjRQRrzCQkWrPe
 HAHhsR+cC+RxVCvXG4YW/V0k4dW6r4vBdQ+6bJBTRreyUOhvQ6hGGIiVSl9r9htwdtLRNc7u7gy
 gChTHZFoyL613cJaNFcaE5m35VVtntCIuo/3GmsNKfCVMiyUPiYYEJJfwBKQlptAbOi53F5+q33
 2ZRFnq9DFetIRfg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Nov 2024 15:02:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5743

Sphinx recommends using warning and note here:
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#directives

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/bblock.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-manual/bblock.rst
index 68292903bab039ad66936a5061887a0ed569dfb4..605bb75655242a1c9ec6dc0f5a1d5d472c4a7270 100644
--- a/documentation/dev-manual/bblock.rst
+++ b/documentation/dev-manual/bblock.rst
@@ -19,7 +19,7 @@ recipes that depend on it.
 To prevent this, use ``bblock`` to lock specific tasks or recipes to
 specific signatures, forcing BitBake to use the sstate cache for them.
 
-.. attention::
+.. warning::
 
    Use ``bblock`` only during the development phase.
 

---
base-commit: 2bfd49176ff71350054417dc6a9a284466876069
change-id: 20241113-remove-attention-set-warning-7f7b793cf817

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


