Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30B2C04FF0
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 19:13:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.4760.1695237223147529900
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 12:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gX6Eo6QG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAF66C0003;
	Wed, 20 Sep 2023 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695237221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fF1gg/GHRmXQh0W4kMMQtQO9oaY5mGZRPenMq3z1vVo=;
	b=gX6Eo6QG0fcjPQ5XXklS5sWWcNi/TRQdZjrXnXeQ66QnaQ3tMq/3S23SQf/2H9usbfsYyL
	756XvvBwFetOxJuKj9x32gBiQnvJ/+TuOgx9STEdhPy4i/T9hsxmP2nYrSw3PmyL0SxXIf
	TwfRKpvTtyu13mX1QUGBGOSl8l+DxvboE1IKbyMjFdVkFULp7rt5sBxumz0Fy3X9nfCQ4E
	c5Xmwvu+zBqG8zS2jDpT05O+Br0kYGx80Gz40yKmKJzqSO54WfN174+jpU4vL6SBSC/aVg
	jRTRfJrtfOa3waJ6X797FF+iuUPx+M5zA7LV9laDDWTq0P//32bRC50P7gwWzQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2] contributor-guide/style-guide: Add a note about task idempotence
Date: Wed, 20 Sep 2023 21:13:29 +0200
Message-Id: <20230920191329.2504837-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <95b653db-9dd2-7fe9-189c-03d646a57b20@smile.fr>
References: <95b653db-9dd2-7fe9-189c-03d646a57b20@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 19:13:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4278

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


