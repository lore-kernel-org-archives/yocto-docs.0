Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3809C46CCD
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.2902.1702935249563953574
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eCQ9T1n7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABD40FF803;
	Mon, 18 Dec 2023 21:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TYtHuA7hFVto5FI+q90NtUCjls0b6aSZnr7M+FZknz8=;
	b=eCQ9T1n75Ga4a01tIjTXRRCQ/VVIxZAOn7eMG64ATNGfDUfYogfuLK740Qlx+vRbEL+zfX
	iaR0pgHxO4qA62aSuEYBhV6d62DLIxq6fNckl0p0/S/KJKslm96GPUoUrvFk4xl4KWdKM9
	/U/ZewCTzx0+qGSkIX95H8X5tDhhByzyHS3EboJkcLfVg10NiQGWBWsvDiUP+p1ei4miJq
	f7QiODq+peYbDgKtYhILUDCq+9WolHWVDwMvOHB6Q6xNepKpn6OqH8K3ktEPxty6mPHQ05
	1ZK0FiX0ayAoXKqcaN63zBPHG2wnHdtWGhVoCIyiEvabpQmbN9ZmiaYl7jKswQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 02/20] contributor-guide: fix command option
Date: Mon, 18 Dec 2023 22:33:16 +0100
Message-Id: <20231218213334.146370-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4688

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

"--subject-prefix" applies to "git format-patch", not "git send-email"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 53daaf901a..5a6136c8c8 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -460,7 +460,7 @@ or any layer other than :oe_git:`openembedded-core </openembedded-core/>`,
 please add the appropriate prefix so that it is clear which layer the patch is intended
 to be applied to::
 
-   git send-email --subject-prefix="meta-oe][PATCH" ...
+   git format-patch --subject-prefix="meta-oe][PATCH" ...
 
 .. note::
 
-- 
2.34.1


