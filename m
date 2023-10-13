Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05021C46CA1
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:26:12 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.44801.1697217971527255091
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 10:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VEAmty1J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6E0BE0004;
	Fri, 13 Oct 2023 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697217969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=168lcPScc8ODpLWK2IS9HUtjJJh3+luOtcVr2+DUC80=;
	b=VEAmty1J2xIie8FRDDzXS8Kh60q71e7pjoxQvqkiYudVAzB4vmrRLyN7xPnhQOUKLK6PPi
	i25msSk/F4aAGE55ut3xOqa+EQ8FCHdVeUbZJGAtmkihj9U+NRRbzYFbYkKGJp2L4ov86w
	zTE8WSLOgRcZTyUxJKL27Z/S8wmV9uT7+BXVXkwcBsLa97y0eQqKBni8m0NWLHMCdQYTpC
	uyDHj8GWfNlpkWchjSB2mJbJsBpMREhPAV4Le1M9eiBzjCAr+UPHXR0gpYKb21g07HlBsi
	bdjYWXUdwtq/yB6NLGQjuxhRy4/FxlatFpkmCvFvQCUE64IjJ6DLC0EuKDSGXw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [PATCH 5/5] bsp-guide: bsp: skip Intel machines no longer supported in Poky
Date: Fri, 13 Oct 2023 19:25:47 +0200
Message-Id: <20231013172547.82195-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013172547.82195-1-michael.opdenacker@bootlin.com>
References: <20231013172547.82195-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Oct 2023 17:26:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4370

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 documentation/bsp-guide/bsp.rst | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index f21fc530e4..5d186d9e1a 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -772,20 +772,6 @@ workflow.
 
          -  Two generic IA platforms (``genericx86`` and ``genericx86-64``)
 
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


