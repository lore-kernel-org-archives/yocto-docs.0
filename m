Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E0ACD1292
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 14:38:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12732.1712155097324330273
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 07:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lF1MwFuq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2B8E1C0003;
	Wed,  3 Apr 2024 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712155096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E666IHGgvpY6rnMkxdDtcVmfeZzMtysumSGP8YRNzDU=;
	b=lF1MwFuq68P9Hv1nYwtjAg0lSE51HPkBvp9Yka2lTsXSEsCj4ONWEbiBT1Sij2blodl1uC
	yvzEnMpbtb4BLOlwbHh7r5e1POPRD4yIOkS1DIT2bdrWx0Z0U8CHUT2wNemYlXSdhtlBk2
	hdl8xAhz3fSoRUGpipe+q+NB0bAueM4msAo0Fg7jHAuhqhWPu5crh5YtsLbSZkadiD8gxx
	hyCSqAgLiuuhGY8R5mVPF35iaxIkplh+3v5+zTj7uAT5kVZ1+3G1ymtqJMI3qzWTbvjzmN
	EhXfOFWKgd8LI2S4/QE/3Icci1KtEh0iT5Ah5wfRKG4rWUgWVCGiHAMZowDRrg==
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 2/5] migration-guides: leave Removed classes empty
Date: Wed,  3 Apr 2024 16:37:21 +0200
Message-ID: <20240403143724.1956838-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
References: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Apr 2024 14:38:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5052

Only mention in 'Removed recipes' section that no classes were removed in the
upcoming release 5.0

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index f7d817176..2c106ee13 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -104,7 +104,7 @@ The following recipes have been removed in this release:
 Removed classes
 ~~~~~~~~~~~~~~~
 
-The following classes have been removed in this release:
+No classes have been removed in this release.
 
 .. _migration-5.0-qemu-changes:
 
-- 
2.43.0


