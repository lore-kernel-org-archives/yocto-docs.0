Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C73EE93712
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:05:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.25925.1696536304608016480
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=StYu8cZy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0621240004;
	Thu,  5 Oct 2023 20:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwnLQXy4n6leHDqLTxYqwCAuzBnpA6IrsuBDh2cP3xU=;
	b=StYu8cZyPZlPGtVLY1U/4H5tWVFNwFhSI/PeHzD1Cb0PoAqc/Ar91teF7wbQklGHdKVTeT
	oOncv7cj5nEfRXVHlpy6k5ffOPGya1hX6qR+POowOtvnDl5PYCb897pI0N6+PvLQtLY4IF
	3EsGx+//jtzJTUH2Jc3cSNSe8lXhmzLuScmbMh5HSyxthx9aU3acZfUNVSdK9x1ks1AAMy
	o7e+C3DMiHx5RlHPgaU9BbCUv+GvAu+4bhoc7Je5gkLZuEiPpYMHUYU8pylURBGDqzX1dJ
	qsVTuNlabFjXVzDb4dLFBBWbmL39zwts3el8IPNJlVy9OvBIC8m6Utnz6vnl9A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 4/9] dev-manual: new-recipe.rst: replace reference to wiki
Date: Thu,  5 Oct 2023 22:04:48 +0200
Message-Id: <20231005200453.2873299-4-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4322

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 39ee9683b0..a330a8f8c6 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1442,9 +1442,9 @@ doing the following:
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


