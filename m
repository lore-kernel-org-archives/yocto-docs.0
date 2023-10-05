Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD91E92734
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:03:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.25883.1696536214129140577
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EwbNacSA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF7ED240004;
	Thu,  5 Oct 2023 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fF1gg/GHRmXQh0W4kMMQtQO9oaY5mGZRPenMq3z1vVo=;
	b=EwbNacSAtnSqJ2GNlCig5UMbX+J+6Mi7Z0soFSAn9KKdDhByZKsLrPQfkOYnjsfudgIpAm
	nmXjqxSEx+CY7YSmgj5ZAi2GG611hh9Zy47tqOZw2kpv12k+/vEwcWmafdpJKi5bbmCQeJ
	lXLf8IJM7s5DC1gDbH+xMgwe9x8G+zz5gbwoMLHiBl1349yMoc1lJf3jNP4T4a0rsDLyvY
	ns1AdRaFdgVnMGZ+toxDrTdnzOj+r21fKbNWE+40J+TNcrsHo5D+AuT8q6TM36nZkcTyAE
	eur/knFUrRSLCyJXJbvvky4rK3yJkMwHfkb6Y+CAibUxC8FoIxU+h10llP4cHA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [kirstone][PATCH 2/9] contributor-guide/style-guide: Add a note about task idempotence
Date: Thu,  5 Oct 2023 22:03:11 +0200
Message-Id: <20231005200318.2873125-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005200318.2873125-1-michael.opdenacker@bootlin.com>
References: <20231005200318.2873125-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:03:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4311

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Yoann Congal <yoann.congal@smile.fr>

---
Changes in V2:
- Use a bulleted list to clarify the order of steps
  (Suggested by Yoann Congal)
- Recall that we are talking about idempotence in tasks.
  Useful for people overlooking the previous paragraph.
---
 .../contributor-guide/recipe-style-guide.rst       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 1a1c1c6ee2..b63172bd77 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -257,6 +257,20 @@ Tips and Guidelines for Writing Recipes
    and ``-nativesdk`` ones, whenever possible. This avoids having to maintain multiple
    recipe files at the same time.
 
+-  Recipes should have tasks which are idempotent, i.e. that executing a given task
+   multiple times shouldn't change the end result. The build environment is built upon
+   this assumption and breaking it can cause obscure build failures.
+
+-  For idempotence when modifying files in tasks, it is usually best to:
+
+   - copy a file ``X`` to ``X.orig`` (only if it doesn't exist already)
+   - then, copy ``X.orig`` back to ``X``,
+   - and, finally, modify ``X``.
+
+   This ensures if rerun the task always has the same end result and the
+   original file can be preserved to reuse. It also guards against an
+   interrupted build corrupting the file.
+
 Patch Upstream Status
 =====================
 
-- 
2.34.1


