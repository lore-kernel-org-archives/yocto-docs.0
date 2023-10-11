Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B501CD6E6E
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 13:36:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.16672.1697031386972343214
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 06:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lUyW7qFt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E361AE0009;
	Wed, 11 Oct 2023 13:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697031385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUlAKi/QMdSrVmfubikKs0rETJtF1EC5Flgp54uCJQY=;
	b=lUyW7qFtBQKQx4WhyriEN44OH2H2VJMbDuBvwlEsINfOFe82NjTLBKMAGOWdX/WxKxlJaW
	pR/PdxmSSvHzbiYGqaPaq+h5h/TyFq4TngOmHzAy0y2n3EstO9eH3n9NgDZxtXZsCIbxF9
	aYyjjB7KgWekUV+FPfpwkpPvuxIZXCO9pvyZHOIXU3cLzu5MZcCMPpj53JPyCJ5KBFEWFG
	Gbyl1Yjp29MLJ7kwsHOgN5I0y+oHcAlGg7Vx4udO5Pfj1M01G+imW5Yrlvg+r8j/PW7Axm
	pFwoIUgO9+y39446JQd2zvUqy2e6Vy6p9EZ9Doc6y2RR5VzzizUx0sqFwzVWGw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [kirkstone][PATCH 2/4] dev-manual: fix testimage usage instructions
Date: Wed, 11 Oct 2023 15:36:08 +0200
Message-Id: <20231011133610.78119-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011133610.78119-1-michael.opdenacker@bootlin.com>
References: <20231011133610.78119-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 13:36:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4343

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Trevor Gamblin <tgamblin@baylibre.com>

The proper way to inherit the testimage class is now

IMAGE_CLASSES += "testimage"

so change lines with 'INHERIT += "testimage"' to match. This makes the
dev-manual consistent with the migration guide, which already specifies
that the old way causes an error.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/runtime-testing.rst   | 4 ++--
 documentation/dev-manual/upgrading-recipes.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index a5d8502fbb..177f781b62 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -229,7 +229,7 @@ The final thing you need to do when setting :term:`TEST_TARGET` to
    statements in your ``local.conf`` file::
 
       IMAGE_FSTYPES += "tar.gz"
-      INHERIT += "testimage"
+      IMAGE_CLASSES += "testimage"
       TEST_TARGET = "SystemdbootTarget"
       TEST_TARGET_IP = "192.168.2.3"
 
@@ -335,7 +335,7 @@ You can start the tests automatically or manually:
    inherit the :ref:`ref-classes-testimage*` class by editing your
    ``local.conf`` file::
 
-      INHERIT += "testimage"
+      IMAGE_CLASSES += "testimage"
 
    Next, use BitBake to run the tests::
 
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index abcf7ca9fe..dc8e3c6f52 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -117,7 +117,7 @@ The following steps describe how to set up the AUH utility:
       class, which is optional, you need to have the following set in
       your ``conf/local.conf`` file::
 
-         INHERIT += "testimage"
+         IMAGE_CLASSES += "testimage"
 
       .. note::
 
-- 
2.34.1


