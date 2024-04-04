Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DBACD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 16:56:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.43910.1712249807874395940
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 09:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=erB99EHS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DAA840008;
	Thu,  4 Apr 2024 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712249806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI1nmSLAZx/fPzLv3NbKN/SGYRo2IvWLv+m/h56/moM=;
	b=erB99EHShufXCPlFZqKKMhOmGonzHLNz3Zvw9CCRG3lmkLWj9mLdBz3jOBl4AVKzVbsLiU
	KcNrZB7Jy0yf4F+uV0rQwSMmeK/7bBOEzitZgntJLme5VuREgj0WDohO0DI3Glqs0d6uz6
	BUQZ/yj04yub7IZDmQobalMetILAxbD/tuWOffHcjAL/IgT9fQMY9Jq1Rhmuc02uLnrYkV
	odqJ2hcJ7wNtZtSwxYtsADqwPRV/nkHZ/NZzwUMJFOu1loryxaJNm/agn0qL3ycHU4eQLq
	kjbSs2CSHk9bxF1TsY93HOB1gZBxtF1nZ69opA5OfJSDrmKG7ozQZM82bB+rZQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 3/5] release-notes: add Go language upgrade
Date: Thu,  4 Apr 2024 18:56:18 +0200
Message-ID: <20240404165620.2248838-4-joaomarcos.costa@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5060

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

There were multiple bumps between Scarthgap and Nanbield, but overall
the version was upgraded from 1.20.10 (in Nanbield) to 1.22.1 (in Scarthgap).

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index e03f722a2..4ff05d86f 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -85,6 +85,8 @@ Security Fixes in 5.0
 Recipe Upgrades in 5.0
 ~~~~~~~~~~~~~~~~~~~~~~
 
+-  go: update 1.20.10 -> 1.22.1
+
 Contributors to 5.0
 ~~~~~~~~~~~~~~~~~~~
 
-- 
2.43.0


