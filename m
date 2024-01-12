Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB1DC47DA6
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:51:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.12350.1705078301264229418
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wn7hauNW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE48240005;
	Fri, 12 Jan 2024 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAbCGoJGD9SNWHnFR5GBGJUXtjahaZI+diDen/xErdE=;
	b=Wn7hauNWQAwTpYMDtuV5g/CyixNTCEYGpXjhgmDnyGcKUfIxdCkg6MyB74knxpkhsu9g4c
	EMEgBELYUFJda20Y8U9vYlE1KKNQQwlRHiseE/h5fDI0uiVlbeyt3+bGauddWx2aj18xWk
	mycyCCZVgR6BQVD9bXzoww31V6X4pATjm2iK3pgT0XazyUPmbL/TlQBCPo3gv57I0En2lz
	PrHzDgK0qBklOaJXe3TB7kicK/NU9MsahZ+xMHQB32C3RognEWi7Gw4tb6nBkPXF/77WXS
	AUst8rFeaseR85qMkM6cL6WUugTlSEebcst62iL5TpD2t1efjPrahGQumhmj7A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Maxin John <maxin.john@gmail.com>
Subject: [nanbield][PATCH 4/7] ref-manual: classes: remove insserv bbclass
Date: Fri, 12 Jan 2024 17:50:56 +0100
Message-Id: <20240112165059.3553847-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112165059.3553847-1-michael.opdenacker@bootlin.com>
References: <20240112165059.3553847-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:51:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4770

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Maxin B. John <maxin.john@gmail.com>

insserv.bbclass was removed from oe-core:

commit e6bb5dbb62257a7de730ea9085dfd89520f3e47d
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sun May 10 12:30:49 2015 +0100

insserv: Remove

Signed-off-by: Maxin John <maxin.john@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a8afe9f2dc..8d8bea4714 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1538,16 +1538,6 @@ Here are the tests you can list with the :term:`WARN_QA` and
    automatically get these versions. Consequently, you should only need
    to explicitly add dependencies to binary driver recipes.
 
-.. _ref-classes-insserv:
-
-``insserv``
-===========
-
-The :ref:`ref-classes-insserv` class uses the ``insserv`` utility to update the order
-of symbolic links in ``/etc/rc?.d/`` within an image based on
-dependencies specified by LSB headers in the ``init.d`` scripts
-themselves.
-
 .. _ref-classes-kernel:
 
 ``kernel``
-- 
2.34.1


