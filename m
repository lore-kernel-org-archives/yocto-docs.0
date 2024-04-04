Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D91ACD1297
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 16:56:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.43906.1712249805273775161
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 09:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dWhjm16v;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6C044000A;
	Thu,  4 Apr 2024 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712249804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3B2g3PcfqRh17zTh4JFSXRcbjmfavsdl5RvZMOOxwo=;
	b=dWhjm16vyNYK9Fmg0KtNrTIIOOZsFgIdQpe8/vlmTsO6zll2ux40e1x5v2/IOsmaSLc3oa
	AZIUmMVvLrb5rGbQhJtkxtpamBlHSNCOCfNWPh5J6X/PQaghb+/yuevCKIpolWudJ9fHhO
	pGIfkLbumMQ16nR59QIditJM3EL2u5vK7WUmY7kCfQ4P1hRQeJR8k+9BX512VqCTOVqsEb
	VL2c0TFWJahKr1eWgnQnxfFpVPRDR+TdHgBk1UCPMNXw9ogTHr7aVZFkwna1avpA7kEmk8
	gd6vVUgtc4m/caKHLb6HO2tzRPNfUNIEqmC20cyWqQoLRpz50RmH3vMOva5QxA==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 1/5] release-notes: add changes to wic
Date: Thu,  4 Apr 2024 18:56:16 +0200
Message-ID: <20240404165620.2248838-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
References: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Apr 2024 16:56:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5058

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Summarize changes in 'wic Image Creator enhancements' item.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 .../migration-guides/release-notes-5.0.rst         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index adc1597bb..a56995cc9 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -26,6 +26,20 @@ New Features / Enhancements in 5.0
 
 -  wic Image Creator enhancements:
 
+   -  Allow the imager's output file extension to match the imager's name,
+      instead of hardcoding it to 'direct' (i.e., the default imager)
+
+   -  For GPT-based disks, add reproducible Disk GUID generation
+
+   -  Allow generating reproducible ext4 images
+
+   -  Add feature to fill a specific range of a partition with zeros
+
+   -  ``bootimg-efi``: add ``install-kernel-into-boot-dir`` parameter to
+      configure kernel installation point(s) (i.e., rootfs and/or boot partition)
+
+   -  ``rawcopy``: add support for zstd decompression
+
 -  SDK-related improvements:
 
 -  Testing:
-- 
2.43.0


