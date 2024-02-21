Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDEBC54788
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 21:37:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.631.1708551422714070930
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 13:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ljKamYDj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B97161C0003;
	Wed, 21 Feb 2024 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708551420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ecOQqp2bosQ9XMkzcwhffTKtIcD+D4CrLNmN2gdYyHo=;
	b=ljKamYDjbj1+GlGdIGlOL2oFFMbp9rP4hc18qjX8gUklFE4Jy01hnwi9U9BOrvDdsc9vDH
	8UR2ohpuguegZuxk6fssAW3jjxSiglFJSHUyPGfG0zWtAlmssk7L4SYZLkM9RD3hq2UIML
	AQ2hnz6+VNmQM/uHKa3BP66EyIpZ75B2tE4FG9NSlO1JwJIsVV6dvdRKjk1EvSB02rU0WG
	QADp5t0hHJxQdPrBat5De7JYVkJ2NpisiAHNAi0i6+o55vMxSLWH7uKfMKfPnNQUaBg5Kc
	y6oKvgQ+QYqKWPiXByKI7X3xDo0jgYSSja3sNUWyI1r2rFXlQ6xKg/XcB7vNzQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: packages: need enough free space
Date: Wed, 21 Feb 2024 22:36:55 +0100
Message-Id: <20240221213655.106996-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Feb 2024 21:37:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4856

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Enough free storage space is needed to apply package upgrades.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/packages.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 0e991e409a..6c208555e0 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -607,6 +607,13 @@ subsequent sections are necessary to configure the target. You should
 set these variables before building the image in order to produce a
 correctly configured image.
 
+.. note::
+
+   Your image will need enough free storage space to run package upgrades,
+   especially if many of them need to be downloaded at the same time.
+   You should make sure images are created with enough free space
+   by setting the :term:`IMAGE_ROOTFS_EXTRA_SPACE` variable.
+
 When your build is complete, your packages reside in the
 ``${TMPDIR}/deploy/packageformat`` directory. For example, if
 ``${``\ :term:`TMPDIR`\ ``}`` is
-- 
2.34.1


