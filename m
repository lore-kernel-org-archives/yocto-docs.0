Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F445C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.2928.1702935251342504556
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gcDaK62M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 886E81BF204;
	Mon, 18 Dec 2023 21:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDig4f6+1NMrBiUWGDuqz+6oIufhT4Ps/0xinIKzP2c=;
	b=gcDaK62MRQShMzs2TjK0ahQfop2B3m+6ZfGmF4LRxMzwA9zR/eNEQ4IqMvvq2IRN5OW8qj
	k846XNb1m0TnbRNiH8d7IIO3KkXf0WYQcz/YNCbUvo56Yau/v9QTKYaO4HOVxG77+EaVbM
	IWbPFDXpVMLo8V46GTUSzX0qqC8ueCwxcy/HTv0vCGEes9Px7IRGQytLmBK+tGFbbQWGOj
	FEGTmn1vk6hoQY7RLfqGXrhCUpmV84MXb1Sp3yatT7TLVq9FL0JBT0/e4BA4Yb/hmasXlC
	5jVavzeEcbpH+GGpup735TVEibVCGgEMoQjbczgekC80mx8EVQN4ul+PWuHW6A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Megan Knight <megankn@amazon.com>
Subject: [nanbield][PATCH 04/20] dev-manual: layers: update link to YP Compatible form
Date: Mon, 18 Dec 2023 22:33:18 +0100
Message-Id: <20231218213334.146370-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4690

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


