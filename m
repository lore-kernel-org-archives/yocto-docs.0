Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC6DC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 14:13:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.99488.1709561588621410603
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 06:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=azdcT06D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEC89240005;
	Mon,  4 Mar 2024 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709561586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p1Yixp/2Cj+rVFZ9ZG0Zg1pyoG2ZwLdQzOLNAUya7Vc=;
	b=azdcT06Dhmo10Rp3MITofM17STAVfxp7eBksCVtJQ9Sj1a+LwHg2+LrAG+rII4XKHn+NXr
	1NAcetoV3gsDXkqVjEQpS4Y6XUWkbNCL0smsc6WdE7JzcXv4eeHbY3ggqSYTLKMG+zMz7b
	8E36uG7QGXkUnwd3JQh1T7d3nwep8/Lq8h9oSUNZ4+Q7IIfi747cxS72j8mHefc1mRyTIL
	gDQqAf9zPmqGTe4dyEhFSCkT7ughYMkbNRI0Ao0S8dEELa3Pn3IqzNZBMWXZ4/MxJWqxfW
	YJoiU4eMGjLeQApRY9O+G2yINzi8VzJ/HEsaHkfZDzvASFoOhwJF1g8BTz6pVg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] dev-manual: packages: fix capitalization
Date: Mon,  4 Mar 2024 15:13:01 +0100
Message-Id: <20240304141301.132063-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Mar 2024 14:13:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4925

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Using "PR service" instead of "PR Service", like in the other
two instances in this document.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
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


