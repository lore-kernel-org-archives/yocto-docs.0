Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB78E9273B
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:04:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.25970.1696536234905218625
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DH5G6YVo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C08E2FF806;
	Thu,  5 Oct 2023 20:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLmesjVkNE0LwzvSiL9Xt5Jfae9mIWCRGPj45cQTtug=;
	b=DH5G6YVoQOPBzCUdgan9zaA87T5NEqKLrNjlZA0C9tmI4+Hw64/wxNsX4aLJdq2Jxu/p5+
	miO9FJfNn3AND370F2IBtEVUYbpv8VHT1kqvxVHKMKZisj7M7BQBasuFWlNyhwCGm3csix
	6jODotNqK+F457+rW6sNlvsv92L2NSNvzuN+nFSPCxMs5FOW8/Fx3xovUeVoUAPpzdSiJO
	X1nEJ3mhz8MtUPF4818hVFl0+ZE6/q5oz6qZdThoeypk2LjqnFwlHw8FVkCS7q3ZmrvpX1
	Q4zckA82UIOWszVZIK+eJP3/LSNBQCPiwIDMJ2roaCVUy17VjZgAqfFPagcehw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [kirstone][PATCH 9/9] contributor-guide: style-guide: discourage using Pending patch status
Date: Thu,  5 Oct 2023 22:03:18 +0200
Message-Id: <20231005200318.2873125-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005200318.2873125-1-michael.opdenacker@bootlin.com>
References: <20231005200318.2873125-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:04:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4318

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


