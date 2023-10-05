Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDB1E9371B
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:05:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.25927.1696536307167703925
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HRUti+gM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FA38240002;
	Thu,  5 Oct 2023 20:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/pF+3FbmgRAhHX5/6ZglyOj6qnU3kX5YLilRmR9a5c=;
	b=HRUti+gMUQBiDtTUCGobKNyn/64LAoC9zzb2q1L0Kz5puyJfMXk0lw+L53O5/WHECi7o2R
	BAU3XqQsZuGSJsBRFploYG3kL4qXEbZrf2fY3Q8KKDxkBgeYx9BmLUivJST0DD1JwaCx/4
	8y01bBEZWjtCMx+PPYLf8f5Tu86OLFs9HXLhJNCG5amB0YlYB+0eUJVZIQzBUitYMrnLIL
	JagoKZLNkS8ZHo7JyPtSkM9q91seltkamEe1sYVOqvYj+xPrW0E4hFrWumL4XLLlWc+FZH
	cA9/jYue9ArUspsWqbAosD8UiZFUXePTKIdLezLuG/F9OOx0zFM/b4Zsfynh6g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [mickledore][PATCH 8/9] contributor-guide: deprecate "Accepted" patch status
Date: Thu,  5 Oct 2023 22:04:52 +0200
Message-Id: <20231005200453.2873299-8-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4326

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


