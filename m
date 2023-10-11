Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF01CD6E6A
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 13:36:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.16680.1697031382739061394
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 06:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I0yE1Zon;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9AB8FF81C;
	Wed, 11 Oct 2023 13:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697031381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OChJKFy8chG2VlRLwQOhLSlqiwgLU5zMtLat+vZIcAA=;
	b=I0yE1ZonlSaXW5wDkoYEmwi4aZePyHwjIW7qW3itnymH4wt0m2L0EhJfF7HJ/0EaP9vIMp
	yYUgJ53Abw4L/GYJkYxwWPo8xIWTuqKBXNBNsZFd8xCnx5btcbz/lp05r1SjqJGBe9g/B0
	gUbrt3HEd4sC8WauC+JNWscDuijp4jK3+kz1T/Ih/ZoPMkcvnxP6xZPsLD9e8wWKDQ+CPS
	5oopDX5ZtE9NP9FdnUi/7a1kSMISpf8ntLA3L5nWSZSQp7TRAn/2K8cwrB2s2iZ1kKG6wF
	l2kKjvYXCO19XAvKC3C1KNqqbsCNTgVYm+T5mQA5lrjJLIs2zbQ1ns6tzUDIzA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 1/4] ref-manual: releases.svg: Scarthgap is now version 5.0
Date: Wed, 11 Oct 2023 15:36:07 +0200
Message-Id: <20231011133610.78119-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 13:36:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4342

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to https://wiki.yoctoproject.org/wiki/Releases

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index e7d5c6d502..5333498d1f 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -718,7 +718,7 @@
          x="1373.233"
          y="-247.33261"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-1-4-6-5">4.4</tspan></text>
+         id="tspan10317-2-9-1-4-6-5">5.0</tspan></text>
     <rect
        style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-9"
-- 
2.34.1


