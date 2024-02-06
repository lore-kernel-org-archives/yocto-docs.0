Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C761C4829B
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:25:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.24137.1707233115519219680
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jrbECO8Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AC0740004;
	Tue,  6 Feb 2024 15:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0IpVXVFoTbfzzqFJJBL1VKBYY8oVaJPil2Qiemqhjhw=;
	b=jrbECO8ZNLCWbcB7aP8NLbpZ+GDYM383q6ubvWO5xYZ+eZqo8H8JCCql/yicE1DYTy2Rk6
	Lubga6AhUFrQEUVnRzu4jFXXMsnphQrAu1J7VFCYyw9fjgaNXpg3gsNcVGTzGhN53DZsip
	9an/iYtkE5Dy7DkPfrDyeCe7xfzGreM1SEtd1XkYYMgA+PsFJtcNjxVWSDA6mH/W2BW6QX
	n2aOmjzOp1784AEO77wZkdBS/qVBydJptY3CUYMzHa9GUp+mhl78A3GbxUYmPLYmRSxY4L
	QNwqw2KobNXixmFB3rx9Z+RjGeeOLaUOk7xRtbkwCdmkwy5YB18AUFgX5qzKbA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Baruch Siach <baruch@tkos.co.il>
Subject: [nanbield][PATCH 2/3] contributor-guide: fix lore URL
Date: Tue,  6 Feb 2024 16:24:50 +0100
Message-Id: <20240206152451.76368-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206152451.76368-1-michael.opdenacker@bootlin.com>
References: <20240206152451.76368-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:25:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4817

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: baruch@tkos.co.il <baruch@tkos.co.il>

Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 95728c25c6..61f3157d60 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -438,7 +438,7 @@ their e-mail clients will default to including your email address in the
 conversation anyway.
 
 Anyway, you'll also be able to access the new messages on mailing list archives,
-either through a web browser, or for the lists archived on https://lore.kernelorg,
+either through a web browser, or for the lists archived on https://lore.kernel.org,
 through an individual newsgroup feed or a git repository.
 
 Sending Patches via Email
-- 
2.34.1


