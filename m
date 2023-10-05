Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4BFE9370C
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:05:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.25998.1696536303046754628
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PtJhW82n;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D8FBFF809;
	Thu,  5 Oct 2023 20:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fF1gg/GHRmXQh0W4kMMQtQO9oaY5mGZRPenMq3z1vVo=;
	b=PtJhW82ndxfPjYqUlqWyXIbcJ6IXHD+9PsUO7cc8prhsT6MZD3eyBkbWVuc9YNAR2nWccA
	Go8faT4Ai/nDV/4GmTOnbkPbiRzu2w1QcgfJhRHkC+Dq1OaYOlHY/k9a2rmLNOCnC1jVZB
	+Q+r9GCgoeMUgauL2MwgTsYJ+F2ZcCD1gKa4RpXUU0G7uuZ+95FzltJ8LGpuaGoLWIL44U
	2TvRYqhHxXuiOy0gHZ1bQmV1jqXvBwWXwv4fkq9Gvsocr/FSZxbekE2T7MqjRM6F+3x7x3
	clteWViXYamLVKcJncKSd+GGNm/94PjM+U2QiRjDUPSkCM/iqaMXgsnibcp/Bw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [mickledore][PATCH 2/9] contributor-guide/style-guide: Add a note about task idempotence
Date: Thu,  5 Oct 2023 22:04:46 +0200
Message-Id: <20231005200453.2873299-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005200453.2873299-1-michael.opdenacker@bootlin.com>
References: <20231005200453.2873299-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4320

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


