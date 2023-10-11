Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941EFCD6E70
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 13:37:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.16699.1697031449152910292
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 06:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Bxzvl84C;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 886E51C0002;
	Wed, 11 Oct 2023 13:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697031446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OChJKFy8chG2VlRLwQOhLSlqiwgLU5zMtLat+vZIcAA=;
	b=Bxzvl84CahNkR2hzV2umaQEL8TSp8oGZPTe61sPbcDUTXn1qqniKQMHHsWu1CAThk9KMKd
	e4OJE55+AU02wGw0mLHEN/yu2fE96yGLSS2vVBJU/z8114MZDa8BZv72eEN0YQsUTQrDNA
	kszKguj3k2ZLHlMQ67f01sLM8f2r1s8Vm5lu+jvVfIlrQ1o2wGwHLSGDtIu2SiBbmSSWBx
	KAyu2/88wN+Cjy/XbYhwbIio4xxP8DLFED14upNUDfEOxzcxby9Mz0dK8/EEa7F/4lFob2
	AsEOKnGlLGKiz1Ie1P4ee5UpfehWbmD3XzsXJD10EAw7VMT9cYVhbg12jnGiSQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 1/4] ref-manual: releases.svg: Scarthgap is now version 5.0
Date: Wed, 11 Oct 2023 15:37:17 +0200
Message-Id: <20231011133720.78265-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 13:37:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4346

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


