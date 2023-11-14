Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A5CC072A2
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 16:50:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.17593.1699980598378811537
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 08:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j/58xECr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B91841C000E;
	Tue, 14 Nov 2023 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699980596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Din6eWmbYPTqu13BaenMYZ4qbWHhN5pRPmoX1mf3Fv0=;
	b=j/58xECrA/VUsy0BMnWZR2ckmaEUop1/kdc67cnM4QwRzR8IdUs8gm7867qz1EwC0XOcGg
	QNt3WSLUnafhONHqSC5jCdhqfvAdg31pC3rUYRju3Bs5/nz1lvK7OupQ0YA+vKJd7dchPf
	AIju1Oijpu57aCd7KLrZs0oip69bv0MHXb/EI1i6guC7e6yLF17s1ivN6TqkYfdDXJjjzg
	D28JrU9oXEGYZFOWtP0grQQQ7KZKdorl13x3dJ/amIP7rRDPcBow/7tumWZ29S6yT+aQVK
	xBjV4Sx234tfIQKKXc2BjlerlLlm37OlnYoDJlNr0b0eQZ8p3HE7gA5/fXcgcQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH 6/7] ref-manual: classes: explain cml1 class name
Date: Tue, 14 Nov 2023 17:49:41 +0100
Message-Id: <20231114164942.133472-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
References: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 16:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4626

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Martin Jansa <martin.jansa@gmail.com>
---
 documentation/ref-manual/classes.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 139f854172..53e47ab5a7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -299,7 +299,9 @@ Modules during
 ================
 
 The ``cml1`` class provides basic support for the Linux kernel style
-build configuration system.
+build configuration system. "cml" stands for "Configuration Menu Language", which
+originates from the Linux kernel but is also used in other projects such as U-Boot
+and BusyBox. It could have been called "kconfig" too.
 
 .. _ref-classes-compress_doc:
 
-- 
2.34.1


