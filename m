Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA7ECD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 09:07:55 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.13223.1712826473877178377
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 02:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NFHsGOCR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 145211BF208;
	Thu, 11 Apr 2024 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712826472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kjidG23b3NkGgrO9aypf8Ln1cvksEM5rOIJlbiT/gmA=;
	b=NFHsGOCRdShxWjRaGGUY312afr+Ir6OwJ34jEfUI6jIcTNw4dBuSc5RUMSAPe5ad/DF1F3
	WdiLL+WVoLcjlsRMuOj/yazgmb7683YIm0WI9EVRiVKOVdPLsPOksoLL5twtIHadhrbwkW
	H23ZOsM0sE1Veep7JYvY+FILvnDpsDFEtt5q6+AJiapp/cNCKq2caGwGavBAXGDF8jZMkd
	BeuXcoZUG34hsq/804PTskhZYvPdJl2IhRIwqFkt1X25OrOEcaeCjgpmoxw5F19HBw7+3u
	FomK19hq1OHlVv8QyMdd5OOAO4cyhSY01TbIl8gq78qiUTqLqhnCtWSjFQ2acw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual/debugging: mention new ``taskexp_ncurses`` option
Date: Thu, 11 Apr 2024 11:07:50 +0200
Message-Id: <20240411090750.3103612-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Apr 2024 09:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5110

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested_by: Reyna, David <david.reyna@windriver.com>
---
 documentation/dev-manual/debugging.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index e20637e1c6..92458a0c37 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -270,13 +270,17 @@ format and can be converted to images (e.g. using the ``dot`` tool from
       displays paths between graph nodes.
 
 You can use a different method to view dependency information by using
-the following command::
+either::
 
    $ bitbake -g -u taskexp recipename
 
-This command
-displays a GUI window from which you can view build-time and runtime
-dependencies for the recipes involved in building recipename.
+or::
+
+   $ bitbake -g -u taskexp_ncurses recipename
+
+The ``-u taskdep`` option GUI window from which you can view build-time and
+runtime dependencies for the recipes involved in building recipename. The
+``-u taskexp_ncurses`` option uses ncurses instead of GTK to render the UI.
 
 Viewing Task Variable Dependencies
 ==================================
-- 
2.34.1


