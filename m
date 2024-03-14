Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BE3C54E6A
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:14:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.8363.1710407653361748395
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MAgfWV5R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8448D1BF20A;
	Thu, 14 Mar 2024 09:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89g5xuVS7heUR9Cq3BV/iDoYGePtfeN5zXumo2vTVvE=;
	b=MAgfWV5Ra9cSLXstYCObKbV4/s7jdYpomQ6+H9Al5jJSIvxgzS+5+/DKgfy5EWS6PD9pZ9
	gVW93c75YgyoEFGCmt5iaMfcsrHMHHLZFcso+UZXacIvkcmqgwHBUC1EhUHib4m6Oc5lbI
	LbuQiNkHMQKovEJNc48TTZt/QsaS5k4ljtYvq0HNkumCIoAOJbULjF7zBUkmN5x3iZzx6h
	YNXbkdpwbt4Qgas2MBNu/ImXQGl8hTjaDHPV2LjSl8Nigz+VJCesQ5WGKlmps2z30GQ7El
	/U3j9s0wKwz0NbxfTUzXu+dU5bOtA6/4nw6KjDlGv59pV+5qQOEUiAtzO8sEDg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [kirkstone][PATCH 5/8] dev-manual: packages: fix capitalization
Date: Thu, 14 Mar 2024 10:13:55 +0100
Message-Id: <20240314091358.84025-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
References: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4964

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


