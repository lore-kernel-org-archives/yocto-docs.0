Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F41CD129A
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 16:56:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.43912.1712249810284609589
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 09:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ARD2HucS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C440040006;
	Thu,  4 Apr 2024 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712249808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rv1BwTyQ7VKnIZbJSEeEesHF46DBctQnh/92CNxIsIc=;
	b=ARD2HucSlEKf1PSJ8E2h6lIrKmkLm/VFitAGYibJvVdm9mospriaIqo6NEsf7KIXOszIlP
	hP79e3n52qMs5D+X2k4XSYLaBur+qHLV8IPw1OEVHM4HZDnDEwmENUuJy6DEuzyeIF0yQS
	odvBJxLrH5N+/c37puE2TRxkxqoUDKW4JPXY9qwlFWbAKbchuM7z9f5cJqEr+Gs7MFFSMM
	oYnufqfIAgTZrminMP29vz0XidYpA52KUlgcMcXeuv2VEFmsnPI4S0Tp27b+Xwph+epvR1
	nXJLvkcZNyOxYbdGIQS5ttw0Pi+nvLuIRLTWSBVa9UEiLMD8PsRLd5U5PvWsIQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 5/5] release-notes: add create_go.py to script changes
Date: Thu,  4 Apr 2024 18:56:20 +0200
Message-ID: <20240404165620.2248838-6-joaomarcos.costa@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5062

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Mention this new script, at recipetool, in 'Utiliy script changes'.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 4ff05d86f..1c8538986 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -46,6 +46,8 @@ New Features / Enhancements in 5.0
 
 -  Utility script changes:
 
+   -  New ``recipetool/create_go.py`` script added to support Go recipe creation
+
 -  BitBake improvements:
 
 -  Packaging changes:
-- 
2.43.0


