Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77DDC25B6E
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.147724.1698154049139828624
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E7IDIExH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A9571C0008;
	Tue, 24 Oct 2023 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edfsHs2XrR7yWBJwmEgmRQHSBlixPIvSkMwsAZxdhyA=;
	b=E7IDIExHxcwhcM66oPtxod4G6t9/sUsCUymsDnkkAPe22H/R5jXfsys0syqsp5VaQD59K3
	fq4uZIa/MZ4znY232YN/xBu4OTq2O9yb8ZnEYof10USl4+1xL9dPeON6Mw7vdq0k5cHOXk
	k6jMl3jqgLioqUOgndKmMftYY+qnLlPXeT7hvZtSM8WDcLQ/ZtFvSGtWu3JeLYCZRZ1ykE
	+7PLtQHxVhJCyQwmGdOSwlxxf47uNwCcKloA8xd0f1JeqRWzJLoq/SWErldMGTnCSIq1aR
	cFIjRdei0KnBdkro1QrDvzUvdziwZ/T9vD1ucgzW/W7mvtV5hEWMojTGkwUzlQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [kirkstone][PATCH 05/16] bsp-guide: bsp: skip Intel machines no longer supported in Poky
Date: Tue, 24 Oct 2023 15:27:01 +0200
Message-Id: <20231024132712.90600-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4480

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 documentation/bsp-guide/bsp.rst | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index f9e13d145a..94ed1641b5 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -774,20 +774,6 @@ workflow.
 
          -  Two general IA platforms (``genericx86`` and ``genericx86-64``)
 
-      -  There are three core Intel BSPs in the Yocto Project
-         release, in the ``meta-intel`` layer:
-
-         -  ``intel-core2-32``, which is a BSP optimized for the Core2
-            family of CPUs as well as all CPUs prior to the Silvermont
-            core.
-
-         -  ``intel-corei7-64``, which is a BSP optimized for Nehalem
-            and later Core and Xeon CPUs as well as Silvermont and later
-            Atom CPUs, such as the Baytrail SoCs.
-
-         -  ``intel-quark``, which is a BSP optimized for the Intel
-            Galileo gen1 & gen2 development boards.
-
    When you set up a layer for a new BSP, you should follow a standard
    layout. This layout is described in the ":ref:`bsp-guide/bsp:example filesystem layout`"
    section. In the standard layout, notice
-- 
2.34.1


