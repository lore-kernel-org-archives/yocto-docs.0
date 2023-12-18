Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CA7C47070
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3216.1702935906799924299
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VHXKmEa/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECB7A60003;
	Mon, 18 Dec 2023 21:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hxXiZm/nW9gQ1xhubU7V1+Rl0uJu88zEbrWAIs0CH2M=;
	b=VHXKmEa/jG+ysxwtlF8Bl7sB1edoB228kI/lMSH759dWmTAws1eoYPIfdUgAtSdKO1j8qC
	yUnbAyWs+LdxqRDxkh4uWmrwXXM4vYUUAqUvkG7j+Puuy7Tjv8z4cT/CC941ZMfpS/YtDR
	HysUJIKfPz7ebNwEZY9woZGoseGjwveToJnd69JpBUfF7ojDgu0MAlLOOooYJEisqn6UaI
	1MAcsYizMxYeUlo9JGZaXWy5BKMiLQNcMYDdM8auEVr4EQ52e1S+50J1I7NJythaUJWY10
	IyJV/eSs9ZPWWAbSFyI88GUwgy46qBKC//AJNNOVg8xUa6f3FD1vHXsqOmdGvA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Megan Knight <megankn@amazon.com>
Subject: [kirkstone][PATCH 04/18] dev-manual: layers: update link to YP Compatible form
Date: Mon, 18 Dec 2023 22:44:28 +0100
Message-Id: <20231218214442.147385-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4711

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Megan Knight <megankn@amazon.com>
---
 documentation/dev-manual/layers.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 16f62ee696..2da5d9f93e 100644
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


