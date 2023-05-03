Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B7AC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 04:07:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.11271.1683086824156357009
 for <docs@lists.yoctoproject.org>;
 Tue, 02 May 2023 21:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ydp4Ceeu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F38E8FF802;
	Wed,  3 May 2023 04:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683086822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BmkXPG8qnGXxxOxbLS3dmucDm3LZNGzUfpN8kyP2lA8=;
	b=Ydp4Ceeuw0cxWUZSmjjE6MNig0Rfpv4ZF/hFfD0YCyeATzA4P2K1lOWCr3oINn2dRZj22N
	/ZhGOaLq5XWqgo2GTqYucUqEM9EIv4AI7qbTd3Vu1BfF0kXOkw13qgzuaH/JDeMYXIiAzL
	ksDk0GA+6el+2j5whjFISiQUMaHkqSjlTaYAWOmXFgsnTAHjWjXBTwzH2P315ZkMhaBCa4
	hcU/ez2lqB+GTf/Ly98CVZKXhrtUpNPH03lH+k+tAMuaoLyo5fG0x1ts21BMTFn0S3QwpO
	hKgM6mGaGJ+1rtAcm0+E5q+qS4moZrgraCKym/kVzhH/hJ2/qUKkjy1W4YZJ/g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: system-requirements.rst: fix AlmaLinux variable name
Date: Wed,  3 May 2023 06:06:43 +0200
Message-Id: <20230503040643.2466344-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 04:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3893

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index fd4a8afb5d..91ed6d8d6d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -182,7 +182,7 @@ AlmaLinux Packages
 Here are the packages needed to build an image on a headless system
 with a supported AlmaLinux distribution::
 
-   $ sudo dnf install &ALMALINUX8_HOST_PACKAGES_ESSENTIAL;
+   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
 
 .. note::
 
-- 
2.34.1


