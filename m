Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313CCC54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 11:19:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.37593.1700565572551837824
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 03:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WqLtDCBB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CAC01BF205;
	Tue, 21 Nov 2023 11:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700565570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vDig4f6+1NMrBiUWGDuqz+6oIufhT4Ps/0xinIKzP2c=;
	b=WqLtDCBB/EM81rKNRhYNxoiOhBj7jlaBQXM9z0aVsH8RzGe8HIu0lp9OvwZXO8snMlo/oQ
	DmS7eolUTfv7rmsk4q18ofVAal6THjVtjCOZiqCD8D7RpQxBKITQ6cuSyjXOtVLQ1MwSf7
	G07ifCk2wIATpDkDZnizjVRFPpW5ChHjLhCJAAkeKK5QVOrvdECmhX8DlM8FMnv0mWMITC
	DA8xEH63EZffC29uVg3dcK/zzlMRlTwLRBnrYQPklfN54IrlxmqyqNZ+/DXtBLtrPUyjEO
	yebtGUvwuEGAbJBE7aXazU0FL6UBICQgcLoghtNarnY4iX8r5bT+MkK3/T9+GA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Megan Knight <megankn@amazon.com>
Subject: [PATCH] dev-manual: layers: update link to YP Compatible form
Date: Tue, 21 Nov 2023 12:19:27 +0100
Message-Id: <20231121111927.164290-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Nov 2023 11:19:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4638

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Megan Knight <megankn@amazon.com>
---
 documentation/dev-manual/layers.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index c65a94b4fa..b3ccf633df 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -313,7 +313,7 @@ Logo for your layer and application. The process consists of two parts:
    successful compatibility registration.
 
 #. Completion of an application acceptance form, which you can find at
-   :yocto_home:`/webform/yocto-project-compatible-registration`.
+   :yocto_home:`/compatible-registration/`.
 
 To be granted permission to use the logo, you need to satisfy the
 following:
@@ -337,7 +337,7 @@ application, you can use the Yocto Project Compatibility Logo with your
 layer and the application that uses your layer.
 
 To access the form, use this link:
-:yocto_home:`/webform/yocto-project-compatible-registration`.
+:yocto_home:`/compatible-registration`.
 Follow the instructions on the form to complete your application.
 
 The application consists of the following sections:
-- 
2.34.1


