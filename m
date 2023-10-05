Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD08E9371A
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:05:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.25929.1696536310125948407
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n4zcSSxv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C441C000A;
	Thu,  5 Oct 2023 20:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLmesjVkNE0LwzvSiL9Xt5Jfae9mIWCRGPj45cQTtug=;
	b=n4zcSSxvI4VqY1ktirokNlT84ZP7aVjmE6IKJmUjDEs/Xn02DEn0D+83vJHn3LvFVBL+fv
	nbBgUj/vJzkn+RZ0PVqehWUw/Zp3mBsDQFiWH9WZlvLV+kVnwpgl+fsXeKuxbBeq49vVUF
	cSYvV7K1auGP67tTS+r7EG80FJxHquWoqNRok7j0gGAIJmBs+0MEZ5eHe160oB5Flgou+j
	aFcSQSsdpNd8qNZKLV1cY6nCyH6mHqXAjK9MM/aUuV2BI9QyPY+ZYmF3bjnDMJ6RG2NRQW
	rPIluIpRFPJmLaIwebkDRNAtGkQODqKwFffQwtfe9/29/w7O22EM9xNm75gDjQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [mickledore][PATCH 9/9] contributor-guide: style-guide: discourage using Pending patch status
Date: Thu,  5 Oct 2023 22:04:53 +0200
Message-Id: <20231005200453.2873299-9-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4327

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Roland Hieber <rhi@pengutronix.de>

Suggested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/recipe-style-guide.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index e03b8ff2ba..a005aa3247 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -286,7 +286,14 @@ Then, you should also add an ``Upstream-Status:`` tag containing one of the
 following status strings:
 
 ``Pending``
-   No determination has been made yet or not yet submitted to upstream.
+   No determination has been made yet, or patch has not yet been submitted to
+   upstream.
+
+   Keep in mind that every patch submitted upstream reduces the maintainance
+   burden in OpenEmbedded and Yocto Project in the long run, so this patch
+   status should only be used in exceptional cases if there are genuine
+   obstacles to submitting a patch upstream; the reason for that should be
+   included in the patch.
 
 ``Submitted [where]``
    Submitted to upstream, waiting for approval. Optionally include where
-- 
2.34.1


