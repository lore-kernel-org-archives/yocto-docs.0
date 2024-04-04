Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9CBCD129B
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 16:56:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.43911.1712249809124401845
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 09:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f0n72crt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B22440005;
	Thu,  4 Apr 2024 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712249807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/rXcKIgowhmMMCWQD9kgSU4XFXYve5ywl720xEh/FmM=;
	b=f0n72crteDQ1tkUQTa+7SaML5+1AXxsi/tD4TkwO63hnC1Yp9EWSHUIEXIo1L5/zSU1L8/
	8sSFSs3ZPGp+rHfkLMM6UC4mjacmAhq+D2WcSE5X1gx1U78L5S4StJfvPMC42zqZLCxJLW
	tQ63qUEqpNaGEKfUBN8sU0oY7yfYuZS3AqqWPk0k43QS/ZZA8lKGkeKR91PLDmYFNtpXY0
	OHtazMknGw88ji5uaQ57IoKHhR5EhC1JgsRRMIO9TT1kOVzSpgLAd6pQ0sqwss4Hf0j0T4
	tXUO4QTREJsbuNowVEfvkTWcXBuNB4ndOgM82ypdaZwAjcjF/9c0dBy9bPbpJg==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 4/5] migration: add Go language changes
Date: Thu,  4 Apr 2024 18:56:19 +0200
Message-ID: <20240404165620.2248838-5-joaomarcos.costa@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5061

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index a9075c298..302d7fe5a 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -52,6 +52,10 @@ See :ref:`all supported distributions <system-requirements-supported-distros>`.
 Go language changes
 ~~~~~~~~~~~~~~~~~~~
 
+The ``linkmode`` flag was dropped from ``GO_LDFLAGS`` for
+nativesdk/cross-canadian. Also, dynamic linking was disabled for the whole set
+of (previously) supported architectures in ``goarch`` class.
+
 .. _migration-5.0-systemd-changes:
 
 systemd changes
-- 
2.43.0


