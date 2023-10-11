Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8050CD6E70
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 13:36:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.16684.1697031388826011877
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 06:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GF5/gixb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B583260003;
	Wed, 11 Oct 2023 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697031387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TURYknMUGdFkw7id5gRtSzdGwPE84MxOnrWfzhb1MD8=;
	b=GF5/gixbIUWqadEUIkrn2hWQMb44HBIYfIydaOm9MoDFbgZrKYL4bRTbw0umrD5jxeSM76
	b/sT7QtzT7j/UybSFmIr4kdJhkzT4czkqwTTd7/8UtU0OAVK1bDpG4ZwtlZkiS0RNDy01x
	iQrlavCb+iuBG4dqw3rVGHe3emnZ7x4fwAHvLjFqT78pdRwN8f5hHbY/NzOCJfojdYv5Y1
	lO9mkpKkGiagPNEeGwYxbDnLJrC7QjZsGxQQP4PoQ/M0FgdQYVgiPmVMsEuuWmgfI5wYhk
	gsYNhlmkBWktM3rav2ebjuPueYBNS1wO5xEKUq/Qo9NGI7fkq7yLk5683RYv/w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [kirkstone][PATCH 3/4] overview: Add note about non-reproducibility side effects
Date: Wed, 11 Oct 2023 15:36:09 +0200
Message-Id: <20231011133610.78119-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011133610.78119-1-michael.opdenacker@bootlin.com>
References: <20231011133610.78119-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 13:36:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4344

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Adds an additional note about some of the side effects that can occur if
recipes are not reproducible and hash equivalence is enabled.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 7ad21e0d7d..76e02eafff 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2004,6 +2004,15 @@ task output from the Shared State cache.
    the stability of the task's output hash. Therefore, the effectiveness
    of Hash Equivalence strongly depends on it.
 
+   Recipes that are not reproducible may have undesired behavior if hash
+   equivalence is enabled, since the non-reproducible diverging output maybe be
+   remapped to an older sstate object in the cache by the server. If a recipe
+   is non-reproducible in trivial ways, such as different timestamps, this is
+   likely not a problem. However recipes that have more dramatic changes (such
+   as completely different file names) will likely outright fail since the
+   downstream sstate objects are not actually equivalent to what was just
+   built.
+
 This applies to multiple scenarios:
 
 -  A "trivial" change to a recipe that doesn't impact its generated output,
-- 
2.34.1


