Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B936DCD1282
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:29:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.52015.1711373373143191233
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=en3Gteeb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A16F81C0007;
	Mon, 25 Mar 2024 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GdwECjLeo/q1dok6Uv0WOU0SmU6SnU+2dT5h6TO0jVU=;
	b=en3GteebWvqVIJ2nlX6y6gC7HJX19HJDdhIBY9nNZJFAGgcAZjOwwJfEAErEgYaVPaBN+W
	7lfR+AtDlu99wBNRE+BxhPzxGK5OADPTGlPCwGkGtEFG72sEWyGqYIX7uMlMc/IoFOLZb5
	O72oRPB5wZUWb873KznqowBQGDeDMB/yPz33LibCI4VlQIRerngcFNBq6crZeWSTp5wSNm
	ZOyQa5TRJmIRNARM18YucKUyjNlN/3s/wCmVT26GP5+p8KLTyYCRttxZEPcm7jjRlTnU8y
	BvFkJz2Z6xwRK6lk3QhgvKxssQM9X+FpZEr7YMZ9HCt26c1jXhccu4KZj0tzIg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [nanbield][PATCH 07/11] contributor-guide: be more specific about meta-* trees
Date: Mon, 25 Mar 2024 14:29:22 +0100
Message-Id: <20240325132926.3018186-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
References: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:29:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5015

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Martin Jansa <martin.jansa@gmail.com>

* this is often confused to apply for e.g. meta-oe as well
  where it doesn't apply as meta-oe has own ML mentioned
  in README.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 59f3c1e406..dfeb0305c3 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -432,7 +432,7 @@ varies by component:
    :oe_lists:`bitbake-devel </g/bitbake-devel>`
    mailing list.
 
--  *"meta-\*" trees:* These trees contain Metadata. Use the
+-  *meta-poky* and *meta-yocto-bsp* trees: These trees contain Metadata. Use the
    :yocto_lists:`poky </g/poky>` mailing list.
 
 -  *Documentation*: For changes to the Yocto Project documentation, use the
-- 
2.34.1


