Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92C3C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:51:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.12525.1705078300549315424
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OjTbMKoL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33928FF803;
	Fri, 12 Jan 2024 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iqQ2h9anIOZvUAZX/VKs+9vaPGK5eZi/I24oF0xrAYs=;
	b=OjTbMKoLsqf0n4dmmC4MFQn5brzw+Yui2mXDXSzFimHuaQs00Io8+1FUCY+5tiBeWAqemd
	n8HTLYHE0JuAS3nvTTkOYBcpOJVbjeB0xjZKPrCIfZL1/pGTgo62nqiAg2iUv3FtGap0da
	fEHHg7T+67PZJnBQRhVZhutKUZsGLmeeriqwYEmDHVhDxErZJGRxkdy8KhEZyYov1SN1Zg
	mZhLxK22HcQFQLtnpi1S0g9WuGzL3QJDVDtdWa/7ky1AkuwhYLw5na+Az5TMMXyiLrZROk
	qkt8+Si0QgEpVTZPiab7+VTHn7KpbFVOpPRiFkUVwXydXozztn64XzkpQRYJog==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Ilya A . Kriveshko" <iillyyaa@gmail.com>
Subject: [nanbield][PATCH 3/7] dev-manual: update license manifest path
Date: Fri, 12 Jan 2024 17:50:55 +0100
Message-Id: <20240112165059.3553847-4-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4768

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Ilya A. Kriveshko <iillyyaa@gmail.com>

After changes in openembedded-core@1a4ab9f, image licenses moved one
directory down into ${SSTATE_PKGARCH} subdir.

Signed-off-by: Ilya A. Kriveshko <iillyyaa@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/licenses.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 3b9190d47f..57713effa0 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -332,7 +332,7 @@ completeness.
 
    The Yocto Project generates a license manifest during image creation
    that is located in
-   ``${DEPLOY_DIR}/licenses/<image-name>-<machine>.rootfs-<datestamp>/``
+   ``${DEPLOY_DIR}/licenses/${SSTATE_PKGARCH}/<image-name>-<machine>.rootfs-<datestamp>/``
    to assist with any audits.
 
 Providing the Source Code
-- 
2.34.1


