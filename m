Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B30D13C1B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5806.1769501974596301727
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Eg1B2oxm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 225A11A2A69
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA84A606F5;
	Tue, 27 Jan 2026 08:19:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 287D6119A868D;
	Tue, 27 Jan 2026 09:19:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kP+D3YJ8WN+qLf/jP0L/uWEt9anDHVMCac7gvyUU8C8=;
	b=Eg1B2oxmTIQYo1XKtECIPFlWWYVUsZDDJJQWraDaFjnje7c+81kMhftWxfOn5Gv4Mhx4+g
	mYJGiX2DmKEnYl3KsMrIqyPezp1GOpe02bd+TDMx1IYdG3GxSmNXPrIWqYJetnMUK1G7f8
	aupTL29ghXqmpxOAM2BQEmvRbjo50DJGideW4f2rLe1h/QJMz3+mlGujHC4FFJ63HbW/Ac
	YcjJXL6tVrHjZIWlVKIPQJ5eB6ru7v1hpRSwDVF0UEsUnspZbAmaZ8+dthaYkXh1GECk/s
	+oTC7qHAisRUSL+25BDM++Yz+MRKv118zNRH79ObWyAum5kFQ/zzB4cHpwU+Rw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:12 +0100
Subject: [PATCH v2 17/56] dev-manual/wayland.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-17-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ArZdQ9IJBWORZ7l/hoZaNdZttPXDgevMN8FGCm7e6Lc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUB5HtZQW+mKY1fp271lBzGOWe1r8YhgBdNd
 0lnspAYTBmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AQAKCRDRgEFAKaOo
 NhI4EACaoKC+aj/7PIfLissVUzzxjBSEyoZsT1C95Kn2zgHISa53h/ggghJVlF42t6s9q8rND6Y
 VNkZSYXa6fjM+uXJf2LtXLAavB23+17sBAA9pZOuXgD4Uh8ZnlA0Byi+ovCYrhUnnwgMl32rQ4N
 Rk+eYWBa7M5ugDW3oBZY9fDLJEaUqHsUberA4un0dXSg3c7etE1H/4mw3OiLrkdfC8Aola2lqVT
 FG8aRimgaLyBaG60XjHdu/UlWkHk8g2wbFjeZvTw7WUQ2icJfMEvsFBOc+F+8emBohFDfZIh9gh
 Yz7+vS08oscmTMCSAbu/ysNu/cG38p/Fu2FIOy/cG7DgQZy1ImF8M/14CdeYUU57ylvRTlOwIq2
 p6GGy4G4DxvKdrAinfC60UzoOEbC+3b+babeShp+y3inRPzo3HM4iKvdXuyCBP4LKiKBS0zQp0Y
 jxDfZUaqIpsp9JSihE2x/xBKlQaUI/v4dJFtC4ffYw8e1c7aKzn+YphrfJWf13lqD7+e5BvTE08
 P8r9icVkclsDNCY+KXzSHwe/JCjGlxKuunzKkNJmA+OeDQjcHFs77Md7DAd+0uTw8ljrHWP5IR7
 gTwb1S9nlns6+Hgu3IlFw6qb/7Z4eGNpI1FZmwBVHU8uByhwh5EDxDaBHCmCA8YOQmJi+bz5JVw
 A67J7MG0AMN78KA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8678

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wayland.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
index 097be9cbde..18d1bfb0a6 100644
--- a/documentation/dev-manual/wayland.rst
+++ b/documentation/dev-manual/wayland.rst
@@ -14,7 +14,7 @@ might otherwise achieve.
 The Yocto Project provides the Wayland protocol libraries and the
 reference :wikipedia:`Weston <Wayland_(display_server_protocol)#Weston>`
 compositor as part of its release. You can find the integrated packages
-in the ``meta`` layer of the :term:`Source Directory`.
+in the ``meta`` layer of :term:`OpenEmbedded-Core (OE-Core)`.
 Specifically, you
 can find the recipes that build both Wayland and Weston at
 ``meta/recipes-graphics/wayland``.

-- 
2.52.0


