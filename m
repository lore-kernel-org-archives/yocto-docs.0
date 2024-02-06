Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643CDC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:31:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.24057.1707233496173532744
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=djwVU4a/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3B41C0009;
	Tue,  6 Feb 2024 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvvxCQA1aHY1XykEx+9RM4CNli3kdvNng8jem0hiz30=;
	b=djwVU4a/11N3aW7hhaKBXcptirsNQj4/V4Y8OA8gmFuNKSCZZgo/CR5S9FO9zM6qo1kP0a
	qVVsYlSBUJxyE8rBbD38u9QaA637aR6IPGdPbSR88GTXI7IWdxHNKr2H1uFrp147oTZIL7
	XR2thMPDRcUBUwY+R+1NMO73rVPX8oT5qoLYz8Agx0XpwTEfsC6s58re5c0ZvTZoxre3Uk
	QF6DIThBup9t86Sv2iknMH/NBlieRF+IEX/1SKjS55RhTn0QiQb08K7JEieBmgG54J4HGO
	zJVZuRB4MnAE1YUO5BeCfH4IRhqQNyVlze/7tefcc4GV2cx2Jzt5vBkJ2g7KDQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Baruch Siach <baruch@tkos.co.il>
Subject: [kirkstone][PATCH 2/3] contributor-guide: fix lore URL
Date: Tue,  6 Feb 2024 16:31:10 +0100
Message-Id: <20240206153111.77153-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206153111.77153-1-michael.opdenacker@bootlin.com>
References: <20240206153111.77153-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:31:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4821

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Baruch Siach <baruch@tkos.co.il>

Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 86f73c1dd0..319f41b51f 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -398,7 +398,7 @@ their e-mail clients will default to including your email address in the
 conversation anyway.
 
 Anyway, you'll also be able to access the new messages on mailing list archives,
-either through a web browser, or for the lists archived on https://lore.kernelorg,
+either through a web browser, or for the lists archived on https://lore.kernel.org,
 through an individual newsgroup feed or a git repository.
 
 Sending Patches via Email
-- 
2.34.1


