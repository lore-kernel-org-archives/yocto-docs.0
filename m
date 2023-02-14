Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73AAC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:59:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.7497.1676383155916491983
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 05:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lnBx5Y+J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E7B261BF208;
	Tue, 14 Feb 2023 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676383154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VRKDEwP282SSh4UfwmzYGxp2snzx61PvA4yFyqXKEB8=;
	b=lnBx5Y+JSRftDe2ahaFM25eNF01gWAmD295EjzbsMKkMQUuZl6zb+niH+SwM6N5x9bAswG
	d4lijAFpTKKnbByLwoknayPolPRAMok8mVfIfONYHZDoWUuaG7EIIk2HOPeGMnKdOAptEk
	0qBWRICh86riyuLsloy/EUlNznLalNpv7OKU/ot0I5QxHIFJchxZUPJMTiKwSpuxLify87
	g7IyJN2wEmh0WxmZhyM3prpC/aMk46d4DXTzg/u7dWTSBicwvT284gFEE7HCcDLgl3RtK5
	hFUylWvxSUVp+MfyKiOaQA7J+33roafvu+SSFn074h0hF+HwJGKcmDRjATgoDw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [dunfell] overview-manual: update patchwork instance URL
Date: Tue, 14 Feb 2023 14:59:11 +0100
Message-Id: <20230214135911.45914-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Feb 2023 13:59:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3682

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Better to mention https://patchwork.yoctoproject.org/
than the patchwork home page.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/overview-manual-yp-intro.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index 6dd10f2187..2675074f14 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -377,7 +377,7 @@ activities using the Yocto Project:
    Index <http://layers.openembedded.org/layerindex/layers/>`__, which
    is a website that indexes OpenEmbedded-Core layers.
 
--  *Patchwork:* `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`__
+-  *Patchwork:* `Patchwork <https://patchwork.yoctoproject.org/>`__
    is a fork of a project originally started by
    `OzLabs <http://ozlabs.org/>`__. The project is a web-based tracking
    system designed to streamline the process of bringing contributions
-- 
2.37.2


