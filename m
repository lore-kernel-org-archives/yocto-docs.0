Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF566C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 17:17:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.29795.1654881426685602554
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 10:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B2rfEpv1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 57A291BF204;
	Fri, 10 Jun 2022 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654881424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UUh+jfHUcnJ7BLwszym+n0vuLnh5pUjhWKMh+Q7HRks=;
	b=B2rfEpv1GfNFV6Uw8ZCuBKmT+f6dtvOu8TjvXv6nDoWfXeySoOvvSDeZYLbDOrmRR/vkCx
	3w4w1KIgCIMZJGkOT9WUTXr6Zng22+a37/+dNmxHcouq2PFZZz8GJ9YtUcmfF4vrwVXfgV
	Y+2rYLwfnXF80D1glhBhyKiLGtpUXXDj05HVNlxlQlsFXPGJm9GG9FoQhtGxINzTp1p/ky
	Lefs5RYErkfWMUbVHkMTeC2rOTd+qIo5FRcmREmgv4YQ1q4WKQO/jEvbkAZ1/nOibywYm3
	wsIWBMtUvtkpjp2pUNzitriOErgMZC6/nRMqdvo7aTn2XMdlysFDaMYkjC0Feg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: fix references to BitBake user manual
Date: Fri, 10 Jun 2022 19:17:01 +0200
Message-Id: <20220610171701.7654-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jun 2022 17:17:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2981

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fix a wrong reference
Add missing double quotes in a reference to a chapter title

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index ca6d594386..7b9fdac10c 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2563,7 +2563,7 @@ Recipe Syntax
 Understanding recipe file syntax is important for writing recipes. The
 following list overviews the basic items that make up a BitBake recipe
 file. For more complete BitBake syntax descriptions, see the
-":doc:`bitbake-user-manual/bitbake-user-manual-metadata`"
+":doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata`"
 chapter of the BitBake User Manual.
 
 -  *Variable Assignments and Manipulations:* Variable assignments allow
@@ -2621,7 +2621,7 @@ chapter of the BitBake User Manual.
 This next list summarizes the most important and most commonly used
 parts of the recipe syntax. For more information on these parts of the
 syntax, you can reference the
-:doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata` chapter
+":doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata`" chapter
 in the BitBake User Manual.
 
 -  *Line Continuation (\\):* Use the backward slash (``\``) character to
-- 
2.34.1


