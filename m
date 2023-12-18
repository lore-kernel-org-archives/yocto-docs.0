Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B84C46CD4
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:13 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.3218.1702935907623961522
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kOIiLczr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2933840003;
	Mon, 18 Dec 2023 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zMcNYFpPs37N/KhsGu+gUlaPVMI5UmcnxIeM9FYqypM=;
	b=kOIiLczr4Zms/Sz7cY3nVdd1GTs/NHVV9KA5odiBn2GtA+BgVa0BOU9Y+iwt0/c5VPqAyg
	4BGw4aIJ49I0GOjzjp8oO2wFaQ6czziTnb80WVpUpBVTTbCbsJQeZ91UMK4jesRODRlICv
	xknwH5ztflo9XJb0EDLp750JCqMHrVRqxU+l2cZdv1TrQjnfXcTgDEiqO97Jum6vpTdL2r
	5k205md2c7sLrAW7ofMFnHmtYYJq7oyChGtkrio5Hpmx3p6L+rUAkg4selb0e3c7ROufyc
	hqLrAdc7vvk9T35Nyi8QZuWX/5/WecM2WmN/U/RXejmgWzagS9XzkP0R+xsaFA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 06/18] contributor-guide: fix command option
Date: Mon, 18 Dec 2023 22:44:30 +0100
Message-Id: <20231218214442.147385-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4713

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

"--subject-prefix" applies to "git format-patch", not "git send-email"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index cda2d12d25..289ec1383c 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -420,7 +420,7 @@ or any layer other than :oe_git:`openembedded-core </openembedded-core/>`,
 please add the appropriate prefix so that it is clear which layer the patch is intended
 to be applied to::
 
-   git send-email --subject-prefix="meta-oe][PATCH" ...
+   git format-patch --subject-prefix="meta-oe][PATCH" ...
 
 .. note::
 
-- 
2.34.1


