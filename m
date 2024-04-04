Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C283CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 16:56:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.43818.1712249806464241983
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 09:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aep4ROTA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFB4F40005;
	Thu,  4 Apr 2024 16:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712249805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GD0EPkceqqyqVrCbl1XfiTa61MoU9nEzgKaYeMU7RR0=;
	b=aep4ROTAE2KL8Xn5luuaDwKYU7d35gQfMGWUqPWB5yvampjcPBSP8RXsgsFfLIVpRW9MTB
	DkNjXGNrQyfWcgeVAhT//uUWoWVeWjaIneAd7LBWCmBs9vl1Z7LkFhsQl/vu3rR8Xs9VSd
	MGBdkMf2FBSdrUxbkJARP7hSaA0AolLFGg5t5nzcg9wUDv+vtvRe/q0r5TrPbiIENyd/I6
	Zw4/yN0zNOYrYVUB2/WqpazOHyltlahDWNhvW/Z3y0Gu8R5kx75B/00kGwBdcjCL26RvJY
	uOr1kPzCLiv3lDLaYQfcbTnJysnVmv3TmHwuTGD7PnMOfYvnLwkZAqprJLrdtA==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 2/5] release-notes: add changes to Go language
Date: Thu,  4 Apr 2024 18:56:17 +0200
Message-ID: <20240404165620.2248838-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
References: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Apr 2024 16:56:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5059

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Mention the new class 'go-vendor' in 'Miscellaneous changes'.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index a56995cc9..e03f722a2 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -62,6 +62,10 @@ New Features / Enhancements in 5.0
    -  ``systemd-boot`` can, from now on, be compiled as ``native``, thus
       providing ``ukify`` tool to build UKI images.
 
+   -  The ``go-vendor`` class was added to support offline builds (i.e.,
+      vendoring). It can also handle modules from the same repository, taking
+      into account their versions.
+
 Known Issues in 5.0
 ~~~~~~~~~~~~~~~~~~~
 
-- 
2.43.0


