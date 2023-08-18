Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0433C7EE31
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:29 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.77.1692378621156587588
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FN62TxLW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8BF2240004;
	Fri, 18 Aug 2023 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ndD9zW9JqTqCfk3DCMRe/mpBnoMFSaIp2CgQTVVzm4M=;
	b=FN62TxLW9t8DopTd1yHCnT4jlIAqKxbbdDHII90oP8keV7BMI0JWDiw9rpGTMG4HhkNAT4
	Qfoiqz/EtBlJbgC5ODlpzWn0QIAERC64lzqBOq/VsukgA0V5H/o2vvoK/76/WzexZSeykV
	Yju6FQXG/0Hfb5CzqoSnPHlLsSyB+ZyK3pn6MrlOXrT//VouuGlD4vNalsZvSYPbK0aszk
	ICWfxcJ47AVu48fcx0sqD6cQs2w7IIUi33P9IkLn6uZ8lOGwQMiW9Hmjk3jf+lqvYIvxEm
	fzbNdGPlPqWZwtRSXQBYTAHuUaznmRq1oC6hJfhE4gfhKi2dIAqD2iXoR7qFFw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 01/10] contributor-guide: move to 2nd place in top menu
Date: Fri, 18 Aug 2023 19:09:56 +0200
Message-Id: <20230818171005.92381-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
References: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4166

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To give it more visibility

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index 4d0231503d..3fef1704a4 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -26,6 +26,7 @@ Welcome to the Yocto Project Documentation
    :caption: Manuals
 
    Overview and Concepts Manual <overview-manual/index>
+   Contributor Guide <contributor-guide/index>
    Reference Manual <ref-manual/index>
    Board Support Package (BSP) Developer's guide <bsp-guide/index>
    Development Tasks Manual <dev-manual/index>
@@ -34,7 +35,6 @@ Welcome to the Yocto Project Documentation
    Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
    Toaster Manual <toaster-manual/index>
    Test Environment Manual <test-manual/index>
-   Contributor Guide <contributor-guide/index>
    bitbake
 
 .. toctree::
-- 
2.34.1


