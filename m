Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B4AC71159
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.76.1692378623871394470
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WExjjy8P;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B81C660002;
	Fri, 18 Aug 2023 17:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NC8Son5TEUXilC/ZzNxwNgYzT6Q18DYvAhdeNq1fYJg=;
	b=WExjjy8PNKUvIOryRhdYMUMWKk8w/xT7UKsdhE2lWz09kqrv0lgBkT0nwOpWo1p9twwEVI
	maweTYAkoAmdlj40Zom0RjCdXA+XIz0r0EK+A1h3P3yJodkWIPnmXOpkkelAxe0UkJTqLJ
	UXlFwDnhPKrglHHurAbJWfsQ/8LRKLS1JA17xCtNHXAUMtcIydmDP5eq9Zkk6vlv7GGo2B
	8nuW43g9oix3qgOyWc0ZUHviGdb/iKZqAnUS5DGE/d7gOLWgaSgZ/exv2LE3rY+bmzyPGn
	FlGZOCsWYlYuUIVu5ildNiCmMVxZv6uGmHM+UQwCUEv2sU5bWjcvH4dthZzqlA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 02/10] contributor-guide: submit-changes: simplify note
Date: Fri, 18 Aug 2023 19:09:57 +0200
Message-Id: <20230818171005.92381-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
References: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4167

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 3f6d2db96c..533aab5b83 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -226,9 +226,8 @@ So, for each identified change:
 
       .. note::
 
-         You do not need to provide a more detailed explanation of a
-         change if the change is minor to the point of the single line
-         summary providing all the information.
+         If the single line summary is enough to describe a simple
+         change, the body of the commit message can be left empty.
 
    -  If the change addresses a specific bug or issue that is associated
       with a bug-tracking ID, include a reference to that ID in your
-- 
2.34.1


