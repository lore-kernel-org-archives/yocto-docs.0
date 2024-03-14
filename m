Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF15C54E6E
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:15:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8391.1710407719192975698
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LGbvSyKm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B97DF24000E;
	Thu, 14 Mar 2024 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89g5xuVS7heUR9Cq3BV/iDoYGePtfeN5zXumo2vTVvE=;
	b=LGbvSyKmSbmU6M4yRL8cyXaYA3PaajJ5LMoGOqjpsb92THiSf1RwIOaHjFGUw3F/9/QTnI
	M3AtRQsVF/TYr9F0t9oUWLtX74/vg/UMcvS7aPCujaEenZoAK7qtzdJzjvXRGNIJXorLWH
	OclpqfPZZwcITnlqBkTJ67ZddYI4oRSUIt9QC4+QHbPZ83xi2ceTwjXOdTg5CbBN4KNRQ5
	bEEPi19Tuja6I7ohd0zUCDu+NylGwluwFQhX0aO2ks3k1EiIc8wT1VqyNeyUuKLhT+OJHD
	8G0L036GEiftqp2a7lIPSGG6ll9BKXWmkBez6yX7oGqCMas9Iln6b/LwFpqlCg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [nanbield][PATCH 5/7] dev-manual: packages: fix capitalization
Date: Thu, 14 Mar 2024 10:15:06 +0100
Message-Id: <20240314091508.84166-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
References: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4973

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Using "PR service" instead of "PR Service", like in the other
two instances in this document.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/dev-manual/packages.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index a6e6af0de7..e5028fffdc 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -206,7 +206,7 @@ history, see the
    part of the shared state (sstate) packages. If you maintain an sstate
    feed, it's expected that either all your building systems that
    contribute to the sstate feed use a shared PR service, or you do not
-   run a PR Service on any of your building systems.
+   run a PR service on any of your building systems.
 
    That's because if you had multiple machines sharing a PR service but
    not their sstate feed, you could end up with "diverging" hashes for
-- 
2.34.1


