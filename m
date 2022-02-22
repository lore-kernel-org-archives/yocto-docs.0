Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C181C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 09:13:46 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.10680.1645521224993919239
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 01:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=a/j6C/qa;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F08A920000E;
	Tue, 22 Feb 2022 09:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645521223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Srmc3DzWuBvLbkYEQlNRgBeE/wK+PXa1ply3ECNXl6Q=;
	b=a/j6C/qaZqbBxPDDNrUDfdPihEAj+juJbcaBRqCu8nXVzvP7eP5m1qEasjZhXbBCgJyYBr
	zathd/yMSi/PLAmhjI67CnEn1uErCQex4w8PXaT3TIG/8HgyJNPp868VE1BtMVDC/KGzv3
	eGjaXjthWb27kC7oFhOIP/2JGIlylsjgZxO3DeTbjjFs9VzcsWS5yFDMOkmigtbpUyNNlQ
	U1trAMD3Xz3348xMzuITj0TDcn1ao9mH/4i273skwBYBfwYrZdqDBHwggrTaFYpDQ/roie
	snrUV/RFlw3x72jSqOyV/VZryLANa4Pa0rzv6TCy3vXO9BkBYFvkN2ZFuI4lgw==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [honister] documentation: conf.py: update for 3.4.2
Date: Tue, 22 Feb 2022 10:13:41 +0100
Message-Id: <20220222091341.86311-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Feb 2022 09:13:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2485

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index ef369b7f18..213912f377 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.4.1"
+current_version = "3.4.2"
 bitbake_version = "1.52"
 
 # String used in sidebar
-- 
2.25.1


