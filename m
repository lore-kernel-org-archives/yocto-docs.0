Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF8CD6B07C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17113.1769700271282561806
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rcV1s897;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B886E4E42322;
	Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EE02606FD;
	Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7D9A119A8879;
	Thu, 29 Jan 2026 16:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/y1DwQWWC+bG3sAfBh0BmLJxIsOeierLVS+gu8nlvzk=;
	b=rcV1s897h+oT/+0ZtMblrFNuTlWZuSIXfYmx4EhSzco/2GBaiVOYyJRIx3NBKhsRqXvgXr
	vS/GcPfkllMGlZ2/bGDsNfFwp0dDWOJ9g4s34BJoukQoTDsW8j+NfRAB5Cf9pAYttCsMb+
	x3obEN04a04j6QhasJbyt+JHHSsISvV5XvfVKSDlu+3vZNrHSep44/5ooti69zqpUb0NIV
	jt4tZ4S+qRFyiWvAUFpLo8GsGqg8BvxcI5BgHGNupHUJNagx/LGuqeEWyeaypwqtV31Qt/
	8jZ1+/6yfhAhks2IGQIuR+k1wUrCGs0dxXwjOo7hP/a4mm74Clj5A6dmZ1zslg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:29 +0100
Subject: [PATCH v3 38/57] dev-manual/init-manager.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-38-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c6AoTqHAhHK8Oj5u1F4Y5nmJSHQIBaYhOphObOes/Ik=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGl7e4+ha1rbe+E9+bGbCtNKJnA9egqMQeUSumE778+WivRYh
 4kCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJpe3uPAAoJENGAQUApo6g2rfsP/332
 nFdVMrxShSZLQZxSGXNBF3KiS1kXKTw/2oxhOd+wgyJZ91gP88AegnQs/2lazsgU3xxxzu8821V
 6tVpIPkqHPvKi3hg1U71JGC7Eur/KquS+SPu0cHW8Cm+Rjv81nS0/Et0+kvXwDdV9JHz5AopYau
 sg2PbYQexyh7iJz8Adt+9V6ZWZU9ukP1otm8BPaOGxyR6YBcapfEeHno7ynHmdY9jokGN5rAs9Q
 88f93ynp37t91CqjKtAww+zbEsU9v64xMfg2cuQP6OyxQ+HtLzfgNbARrWKWggPg2+3Jw++vlb9
 5FR0uZYyDhynQLu8CAiemKIRGeq2CF/Tx1Yf6aZRgimJaQE5AuUhAXzKqPlAwXabXXpVRAWbWEu
 5McDrHURuIl3wO/0PNH7B9874JDiVlG6Dfbg2upBLypbHHTamcjk2wNLoHETbVG4OK+tYgBO3xP
 BHnpUq2aOIQNjAP2/tyuM7tBik06PXWUz2FPH78LlbocEe8rP/80pbF+ac8Q6kYLr9qheqWS4m7
 BTVEa7vUVKVnXMONVYmTZa0m3DV6NW++AXd0EAqLxEeyMhB8PCjczLx3R57Uxp8jWe6sJr9MTEH
 LgbIj8IT0MmQenfLMjl5VWuZE9EgZLz2S1hsVcL9UJz8UF0i8K5juI4wElbLdI3+R6PhbUAdKEA
 RaNGD
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8824

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/init-manager.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index d0fdfdf77..670810310 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -54,7 +54,7 @@ Using SysVinit with udev
 =========================
 
 SysVinit with the udev device manager corresponds to the
-default setting in Poky. This corresponds to setting::
+default setting in :term:`Poky`. This corresponds to setting::
 
    INIT_MANAGER = "sysvinit"
 
@@ -77,8 +77,8 @@ for more complex systems::
    INIT_MANAGER = "systemd"
 
 This will enable systemd and remove sysvinit components from the image.
-See :yocto_git:`meta/conf/distro/include/init-manager-systemd.inc
-</poky/tree/meta/conf/distro/include/init-manager-systemd.inc>` for exact
+See :oe_git:`meta/conf/distro/include/init-manager-systemd.inc
+</openembedded-core/tree/meta/conf/distro/include/init-manager-systemd.inc>` for exact
 details on what this does.
 
 Controling systemd from the target command line

-- 
2.52.0


