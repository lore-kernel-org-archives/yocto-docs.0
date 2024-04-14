Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2AAC001CC
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:20:41 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3490.1713118831513149484
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ABPdr/jY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 829AD60004;
	Sun, 14 Apr 2024 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713118829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xH6+KH4oxUEqidlsRNl7c09E7OH6frUl7xyuo8HRP6A=;
	b=ABPdr/jYssDUk99SDu8kVLdJkHR7uIbJGffIqdeEdgVto3FIzZndp4ypqFunInKbSSw6pN
	IjOPshs7otmGC2g5kxT9I89bAe6PjRShVqZRPlDE56g7RcY0b7x2sveHWQc/yMdknKTLM5
	hSrYpd4JuhQATdq/rI3ilFI/qtLZ+NvQlbV48pUt3hbyV3XEikQZ8wfpYtEuW4zmBHmknD
	6XoAh64iz4xK/ZaNVjbcihb1U/LR+KGRN+NuoyL0bz7+kzNJyl/OthY8G/GqSBybJKJYoS
	i+LoKBu3+BNLtezH2td2tj58kwmlHb07+N4tV+1Sf10+Mesi6HWEQn1hynWmdQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 7/9] manuals: fix incorrect double backticks
Date: Sun, 14 Apr 2024 20:20:09 +0200
Message-Id: <20240414182011.994356-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
References: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:20:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5132

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As reported by "make sphinx-lint"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 542bd918b9..cffb63e3f9 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1853,7 +1853,7 @@ Practically speaking, that means you need to do the following:
 
 -  Or build a non-SDK image but include the profiling tools
    (edit ``local.conf`` and add ``tools-profile`` to the end of
-   :term:``EXTRA_IMAGE_FEATURES`` variable)::
+   :term:`EXTRA_IMAGE_FEATURES` variable)::
 
       $ bitbake core-image-sato
 
-- 
2.34.1


