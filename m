Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1221BE92738
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:03:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.25884.1696536215837408024
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OVYpj+nV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 535BC240005;
	Thu,  5 Oct 2023 20:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0bzY39eZ8E+rBpv4dnGyOKRu649hGL3lTBISEi6fOA=;
	b=OVYpj+nVMUVtFBX2ZhVsmD8sUJq+47LfpPWICXRhzMNr68EOWaqHmkgGCNRhzp0SAUmFZF
	EST4QzP0nfzJW027N93gEvXBLYLtM3F7BJluaRVO+DhErRpiXVeBsIF0KaL3MYFCv67tHj
	LMXX6g4Q1c9s3goNQpuGVGXzf07Lb3rViGjs0p95NpRlflBwnYWhrCysED9mG7D3g6YY7Y
	EXvCV73026S8S8exUFn6lUwwihdMzOvzVRBrJ+9MkSvy11M8dhokkscjHXDZfpjZ8MtudO
	7T6dHcaBQ36AwT8IW8uawXEDpTnSj1itS52eeuWLH3h8j0KPKZU6Mj/P7n+U9A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirstone][PATCH 3/9] bsp-guide: bsp.rst: replace reference to wiki
Date: Thu,  5 Oct 2023 22:03:12 +0200
Message-Id: <20231005200318.2873125-3-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4312

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 109811a0c4..8b29290b59 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -893,8 +893,8 @@ Yocto Project:
    ``recipes-*`` subdirectories specific to the recipe's function, or
    within a subdirectory containing a set of closely-related recipes.
    The recipes themselves should follow the general guidelines for
-   recipes used in the Yocto Project found in the ":oe_wiki:`OpenEmbedded
-   Style Guide </Styleguide>`".
+   recipes found in the ":doc:`../contributor-guide/recipe-style-guide`"
+   in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  *License File:* You must include a license file in the
    ``meta-bsp_root_name`` directory. This license covers the BSP
-- 
2.34.1


