Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211B4E9273B
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:03:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.25886.1696536217582290376
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AQ1j3lkd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A57DBE0003;
	Thu,  5 Oct 2023 20:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAjCSaJanhCagfr1lT9CyVq5q2qw1dheNJOPd/U0Yno=;
	b=AQ1j3lkdRyHQIqj5+7NKuLVaDn7h3ECUcBSt9f00FKnImdgj5NeXUnO5la9MzEUcfxA64P
	Ne7vSsxsPd23zBoo6uuwOBf1agkgQKLBxXC1o8h8mGcOPydVjW/Xp3p9UMJtxglEyig40W
	m6IkXM/aYaEPAGphRR6RX+X9OugnGOj3SphUmvTyfUH3JC0pAouQHsG2cSP4Cb6meiuQEt
	BSn9UKpPkBLt4iOJi+uThFApr1vuEP5d4SnbxDk81Rx2XJDUD7otoFiGyVxXn5Cdph5x6y
	tn4mR4O2UySeZmLau8j57/wCeY9QAoxKjCWrHH/X5I7M4dhASt/9IDLqIRlOVA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirstone][PATCH 4/9] dev-manual: new-recipe.rst: replace reference to wiki
Date: Thu,  5 Oct 2023 22:03:13 +0200
Message-Id: <20231005200318.2873125-4-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4313

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 8c471699a7..855ef8eb06 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1396,9 +1396,9 @@ doing the following:
 Following Recipe Style Guidelines
 =================================
 
-When writing recipes, it is good to conform to existing style
-guidelines. The :oe_wiki:`OpenEmbedded Styleguide </Styleguide>` wiki page
-provides rough guidelines for preferred recipe style.
+When writing recipes, it is good to conform to existing style guidelines.
+See the ":doc:`../contributor-guide/recipe-style-guide`" in the Yocto Project
+and OpenEmbedded Contributor Guide for reference.
 
 It is common for existing recipes to deviate a bit from this style.
 However, aiming for at least a consistent style is a good idea. Some
-- 
2.34.1


