Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE13C25B48
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.147619.1698153818760727697
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FIOIescY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28E14FF819;
	Tue, 24 Oct 2023 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/FtGm9TQrRnQAloMk2H0NQKH+7rNpIIT6wznyvc618=;
	b=FIOIescYZAr863zGvpCe1o3cVrBnX43ehGN5A7y2tr8WogOjX/TPLyj10xrvyR4YQU3PsI
	fL8gfZXxz3UdtbWp296lbpPU7EbHih+OcgudNN328wy/xRIq88GR8LW7dgXq/DGbryzgVc
	X9gZ1in71dJzXQEhqf7MrjOOJPL9xUXwVy5yM0olLy17UdG1APAhkXWcsvuovmDHBGpgkI
	sJV9D7JnIEKWwBKhFTC7wXnFlcFImpBi2f5IWX5tu7BYCxCDAcsQaoMXcZ3s3Myr64qetN
	yUSgI1HykPT+Y6ITVSZDIazQiC/ywoaAkmpY/tRwrdEHJ5z1vYHKS+Mb0D4l+w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [mickledore][PATCH 02/13] bsp-guide: bsp: skip Intel machines no longer supported in Poky
Date: Tue, 24 Oct 2023 15:23:07 +0200
Message-Id: <20231024132318.90209-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
References: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4463

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 documentation/bsp-guide/bsp.rst | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index c78fbeb68f..a32555b110 100644
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


