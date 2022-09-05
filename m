Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658E8ECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 13:59:43 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.25158.1662386382137727761
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Sep 2022 06:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lBfbxoST;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2B58924000E;
	Mon,  5 Sep 2022 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662386380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JAmI+QBeP59zb2U5A8tf0H7CEDTSyPv7z55AdF/G5nU=;
	b=lBfbxoSTI8Ya1UpDr1Y91UK0ymG5/Hp5VnDsNkGU6Nxkyfv4cty/E4bH316lvJGdgEjpZf
	uTHVRox32e9CSiD+WtL9RmA78cKUKUimJqASZHdcssi1a7RIOb8m82axSKnA2G8tbV2Xor
	bI/UvXaWLRiF/bo9wtCU/+HW2MaFCojY2sksg3zi1Ez6JQBvqFUA9yVtM3QutSFoJi0wqu
	QKILqAkP+urpxu8Tuc3ptzRyF5fp3p4mjTEy+aGyEvYSie904rReoYiV3Ce0VPTumr6RP/
	yZicZj/UhIFFyPA6+GnRKQRmpWmfTnG7Nk9Vlm1+EH5kD3/z7WdPP1Z7RpC8rw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: system-requirements: Ubuntu 22.04 now supported
Date: Mon,  5 Sep 2022 15:59:32 +0200
Message-Id: <20220905135932.46843-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Sep 2022 13:59:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3142

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Following its addition to meta-poky/conf/distro/poky.conf
https://git.yoctoproject.org/poky/commit/?id=7786b09212d6ab582db39d0d7d1a4209d36db2ba

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 62da1bfaaa..acc97c9d08 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -41,6 +41,8 @@ distributions:
 
 -  Ubuntu 20.04 (LTS)
 
+-  Ubuntu 22.04 (LTS)
+
 -  Fedora 34
 
 -  Fedora 35
-- 
2.34.1


