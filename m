Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBC1E93714
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:05:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.26001.1696536306944976855
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UsrqSv/W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC45760004;
	Thu,  5 Oct 2023 20:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQWkpX1hLHnF39Qu2UJAgqFh5fW2f+4kbXVmBQwVHcM=;
	b=UsrqSv/WR2d7SP4I5fNoAZF881ji6376XFxhKJ9ic4XKpozwLE38pyzCrd7s6pM6MbwnqD
	Ln0cr3jOkeI14rwZauejIh7n0nQnE9wasCUC9bgpgDsxSGXxBVqluf0cN/Wm7WqzCG3ml+
	7MMkaopu/ovQSixoVJtoM417IC6NkVgipFaXteWNJA2Z8kQn7jHkTqU9K8es+EX9r427Ry
	RwXLHJuumYul9xS7D2bxBD5/zD+uEfSb6uOR5E/iofRodxzXhzhH1R9Yi9+FweACA4Zdj1
	Az25tanFAK/G4/KVTRcOkIgmdbtrqsFigDG+/ee1LMpa9Z3t80DVo2iM4vojqQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [mickledore][PATCH 7/9] contributor-guide: discourage marking patches as Inappropriate
Date: Thu,  5 Oct 2023 22:04:51 +0200
Message-Id: <20231005200453.2873299-7-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4325

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


