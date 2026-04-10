Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0127BF459EB
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157873.1775832226505198299
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ahfLQvMv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71EDDC5C1A7
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0ECF660420
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FE4D10450023;
	Fri, 10 Apr 2026 16:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WHC+WG+wWMwSjpgqcOXWe9IJaTsrdj9E0GaYqucKF+8=;
	b=ahfLQvMvk/MrP8w3ueIkt2x3FI0gKhOLv9TvFtTxvXlmxreAlaa5Il4l+LypgdLb47u7ZY
	Z6GpEO9/dsvurpYAhZSLm4WE4M2JU17MKPwml72eOSTNL4rP72/Sc/XZvm9OjsXvgTC92h
	Qb7AhjoZNneSt6iPYxu67LGrTXSs2pl1Fni78WsOzaSQVY95bWjQ1E0UiE7SZacH6nSw4A
	1aFOvgseW/heyKhXX2fuZM7Y3bzJoeLW5aRSFK8PY2OdM4X6mMKWl0yJcCW42wQb0g5S9s
	PyiVBX8917tVy9Tfs+9dFEK2EuvL+PYki9ZHBlwpMZ4JYyY9tQzMuRIyGHpM+w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:26 +0200
Subject: [PATCH 02/18] ref-manual/classes.rst: document the
 kernel-yocto-rust class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-2-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/EsE6BLlC2gQSZjnY+ZVmmyXGrHYp/ob8Sm8lxoqlT8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyWD4WU8ysuyChYMGaNGnlrIexdRD/BkBtss
 qEpBG+csnmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlgAKCRDRgEFAKaOo
 Nj8AD/9z6OulAfLRjmOryGqe/KI59UaUQGrCrmB1pus4lT/dRV4ginYB+xGKgWnWL4+2tM5suZO
 N7ynq6VDqZZMnUlMG4tljIQCEeJUNHJJe+6RaiUBMX7ghRCo7AXIiMG675i3oOSX5RASUgIg0/J
 PzwR9wyx5Fnyfjl8k6KdBdOXbpy+H9hkQznMi6kg6TnDXGa78Dmfn0B4LJ5tB5zhG8gbX2TtCv7
 3EcB/MjM6jDR1yURHFSwEkp6bbDPcmC7O2UrixwZWxh2hr47p/zSPeofckQAa1IhgaT2RiUL7W1
 xXJu/oorvGCUH9EbhEt+40MfOa36Fd4yuacHtg951loLo1KfPufRqsJLw607j/D4nYvvaTIm30V
 YTjOMIJbTjCUKYc3oH7UL7buZbZiQft2uwgqS+uO1vBYTmFQPRQEIqaM7NE/6ow22UimYBh0acS
 HATdc3ENqAeXJNK5Km2WmSqP3EO+TSwc51u9ltaDqISGb9nf8gp3nfw4jzPE3JuBq0TTsS3jSdh
 o4sBMZatXPG+VrmKA4vnRY0IrSPdhPJl5GSmuB7OepIf0VlGj3ZHwIRsyHEf2Zfdp+GiOG8gsu0
 JsdrFiyXUm/kEKDsnUIpCwyH6rHKeXZRT/OjGAG0WXW3+JGdia+wDqDoXc6QRss+li13u1gD8MW
 G2yj1TqoMnr8N7w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9230

Added by commit 6c90097bebef ("kernel-yocto-rust: enable Rust kernel
support via 'make rustavailable'.") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b23c680cb..bc46fc3f4 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1619,6 +1619,15 @@ The :ref:`ref-classes-kernel-uimage` class provides support to pack uImage.
 The :ref:`ref-classes-kernel-yocto` class provides common functionality for building
 from linux-yocto style kernel source repositories.
 
+.. _ref-classes-kernel-yocto-rust:
+
+``kernel-yocto-rust``
+=====================
+
+The :ref:`ref-classes-kernel-yocto-rust` class creates the necessary Rust
+Linux kernel dependencies and ensures that they are available by running ``make
+rustavailable`` from the Linux kernel source tree.
+
 .. _ref-classes-kernelsrc:
 
 ``kernelsrc``

-- 
2.53.0


