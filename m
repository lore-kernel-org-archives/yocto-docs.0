Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D74E92739
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:03:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.25968.1696536225202291353
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Pr7gh5Gr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 634862000B;
	Thu,  5 Oct 2023 20:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/pF+3FbmgRAhHX5/6ZglyOj6qnU3kX5YLilRmR9a5c=;
	b=Pr7gh5GrwVhmc/X5trVoda1aEpjR4I8GLqsIPeslo4iFzjHOBkeI5Lld35Y4uPs1UwEbyx
	Ph/8snQW28072PegI7aKyj9y1LvCNdSUtN3gv145UNXTz+OY9wyBRTLbOB2BarEVg8Fv1A
	KUwEc6ePBkcpB4pwEnSujWIg08xFaooH2kiSyhs9gO/dikOJZOwrx9AM5e+Bjlzv5NOxgi
	gkoV5ve2Ew54KuvWWIYmhnpe9dMTRLsrqGN76p0wlRo9Xd6Uu9YScuM2y5JSxrGwLR2PT5
	njtZxZ34ZXNx5Xw8qUXfE6ogP7rfja1TXgNN7082ZRSLs43eWe1Rkg2sIBo9yQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [kirstone][PATCH 8/9] contributor-guide: deprecate "Accepted" patch status
Date: Thu,  5 Oct 2023 22:03:17 +0200
Message-Id: <20231005200318.2873125-8-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4317

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Roland Hieber <rhi@pengutronix.de>

This is in accordance with the gatesgarth Release Notes:

  > In the ``Upstream-Status`` header convention for patches,
  > ``Accepted`` has | been replaced with ``Backport`` as these almost
  > always mean the same thing i.e. the patch is already upstream and
  > may need to be removed in a future recipe upgrade. If you are adding
  > these headers to your own patches then use Backport to indicate that
  > the patch has been sent upstream.

  <https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes>

Suggested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/recipe-style-guide.rst        | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 7e336a0424..e03b8ff2ba 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -292,13 +292,10 @@ following status strings:
    Submitted to upstream, waiting for approval. Optionally include where
    it was submitted, such as the author, mailing list, etc.
 
-``Accepted``
-   Accepted in upstream, expect it to be removed at next update, include
-   expected version info.
-
-``Backport``
-   Backported from new upstream version, because we are at a fixed version,
-   include upstream version info.
+``Backport [version]``
+   Accepted upstream and included in the next release, or backported from newer
+   upstream version, because we are at a fixed version.
+   Include upstream version info (e.g. commit ID or next expected version).
 
 ``Denied``
    Not accepted by upstream, include reason in patch.
@@ -350,7 +347,7 @@ Here's an example of a patch that has been submitted upstream::
 
    Signed-off-by: Joe Developer <joe.developer@example.com>
 
-A future update can change the value to ``Accepted`` or ``Denied`` as
+A future update can change the value to ``Backport`` or ``Denied`` as
 appropriate.
 
 Another example of a patch that is specific to OpenEmbedded::
-- 
2.34.1


