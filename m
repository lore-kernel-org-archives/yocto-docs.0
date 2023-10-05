Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D728E92738
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:03:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.25890.1696536223364973630
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mX8acQw5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 760751BF20C;
	Thu,  5 Oct 2023 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQWkpX1hLHnF39Qu2UJAgqFh5fW2f+4kbXVmBQwVHcM=;
	b=mX8acQw5kFPdxYB5uY8kjRcdBvvRPiCPfBAZt6MdRxv6N34Smfi8Vdw7GLTZI0QlqWZYY0
	YwPzW416aAa3eDPNfYg/MLEzN3KaJWCbJkW+qA1W5fjOAPvwSisp2/htQnRiVqmy6x7r5L
	JoDUL4U0mFZY6+vkgoXH+oVl8VxZOJPIqIdUhogASpIxMt+Ei5y05J+wXy6LeIDE0a0Vn2
	9MWFKRKVkMPATvjaNuPCPLlkU19jpEpy3xYd2h/8RPJelwqeedQO7KKzBnzPTqH9RzDJ7G
	BUfoSptnBJvRs0kJ308TqSSWU7LGQ57ybEpEQQe7WMnhxwlrvgmVWHlSB+HSZw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [kirstone][PATCH 7/9] contributor-guide: discourage marking patches as Inappropriate
Date: Thu,  5 Oct 2023 22:03:16 +0200
Message-Id: <20231005200318.2873125-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005200318.2873125-1-michael.opdenacker@bootlin.com>
References: <20231005200318.2873125-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4316

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Roland Hieber <rhi@pengutronix.de>

It was never really clear what all those reasons really meant, and every
patch submitted upstream liftens the maintenance on the Yocto side.
So remove the current list, and replace it with two reasons in which an
upstream submission likely won't benefit the upstream project.

Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/recipe-style-guide.rst  | 30 +++++++++----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 5cbcb23b3a..7e336a0424 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -314,22 +314,20 @@ following status strings:
 
 ``Inappropriate [reason]``
    The patch is not appropriate for upstream, include a brief reason on the
-   same line enclosed with ``[]``. The reason can be:
-
-   -  ``not author`` (you are not the author and do not intend to upstream this,
-      the source must be listed in the comments)
-   -  ``native``
-   -  ``licensing``
-   -  ``configuration``
-   -  ``enable feature``
-   -  ``disable feature``
-   -  ``bugfix`` (add bug URL here)
-   -  ``embedded specific``
-   -  ``other`` (give details in comments)
-
-The various ``Inappropriate [reason]`` status items are meant to indicate that
-the person responsible for adding this patch to the system does not intend to
-upstream the patch for a specific reason.
+   same line enclosed with ``[]``. In the past, there were several different
+   reasons not to submit patches upstream, but we have to consider that every
+   non-upstreamed patch means a maintainance burden for recipe maintainers.
+   Currently, the only reasons to mark patches as inappropriate for upstream
+   submission are:
+
+   -  ``oe specific``: the issue is specific to how OpenEmbedded performs builds
+      or sets things up at runtime, and can be resolved only with a patch that
+      is not however relevant or appropriate for general upstream submission.
+   -  ``upstream ticket <link>``: the issue is not specific to Open-Embedded
+      and should be fixed upstream, but the patch in its current form is not
+      suitable for merging upstream, and the author lacks sufficient expertise
+      to develop a proper patch. Instead the issue is handled via a bug report
+      (include link).
 
 Of course, if another person later takes care of submitting this patch upstream,
 the status should be changed to ``Submitted [where]``, and an additional
-- 
2.34.1


