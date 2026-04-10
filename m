Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDCBF459E4
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157872.1775832226505113157
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iP27hp8G;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6F1CFC5C1A5
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 801E06042F
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC54810450070;
	Fri, 10 Apr 2026 16:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832220; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pDInaUMof/aD8NygGUWWRDGbwzBAfSd4Hq4Yz0KRs2E=;
	b=iP27hp8G5oW3yU3AzpurDFjm5CZPy8klVfROrsPWw2HInHyst2dzx51HA6ylfL9pR3uCh8
	78U0NieNGQ81P83Fzdg+Dl/zOmzzVZ3dtTFV3J7YewjZOBnLUvwYidBXoaBJf072iO6DHu
	udUL26zjrwrT6OkQ4DAkjnJ/bR2WJsrNeKnpKkxNymjozxcX1VOcRNmG89jrPudwxIREvE
	zldw8j3XXMayq4FPcd3TG8quIHgPGeU1micTYfr5H/tiTwmRkPLCC7yezs2+/zuw8S6+2G
	G/VIitusNb+xz4uo03l24Qh6/qRde3kxxhevGXZkiM6GgkD8qoAqrxHaOo5fTg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:27 +0200
Subject: [PATCH 03/18] ref-manual/classes.rst: document the module-rust
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-3-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=J5RMlWO/8OFq7Kj514WW7PL4XKqSfhZgLKriXr/u67k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyXAil+Xh2rBfqYdwfqJAbxgEDrSY0MX24W+
 pNbr8cEySSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlwAKCRDRgEFAKaOo
 NmeUEACeONSK/a+DvF3SwCbi397a1ExouMjX/N7kQNTOwNSsSEAzHpAZefi1qqnirPUUapP/VVs
 6Kp9Z2PI11RmoFM3jto9WT1P0ivwYObDvk6SPD0WpSKB1LbQYT8PlHHq0+eqnaytkedqI34MdDm
 8iRFQofqfOj4ZAhIEdkcvsrviRTkdxTAoXv6aehfv0eQwmnAIvKFBej0/MWT1kMY29sCCTJfp+C
 N1ZlghSglr9AuKQMtuqJnxvPWWXpQmzGUZaJe1Xr3M1Rg1rupa4j1MG+7vNrj73jyClrLytTKY4
 Kp3CVUqmUs0v1RroRVc7A04sk8m9R8SBaF17KjekgdLkzdxDf8ksV2sShF2F4lCrGPdhl9ETYUq
 SVIwuDkjEzZM+3BYXu19tBjh4siA2B+jfPcwiDPJqg11e3A3/jp42YWy20eUQ3YtYzrQWJ/UI+4
 j61omu0EL9Zcwf0vSTc+6+0T5XmP79a0JE0x6w58N2Z2wFOnzz6EGOFBrWkN9D8Rmbhu9HUWYbR
 WbWedm2MayXJJV7gbKQNvSM6Mv5RgUqQsj34ISiBr/HGNQz/pPLPBk2SLdIopS0+2cBZWDa5Jig
 knUPOkO9LFQZBBOKsxGY52tVX6JRV2IFPo9du+IxydCVvkusDUy2xFkBC7aDyf2WLfkrhJWJqsD
 cjv8w3OeskiCS9w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9231

Added by commit 76fd22f09fab ("module-rust.bbclass: Prepare out-of-tree
rust module compilation") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index bc46fc3f4..2fa888e15 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1793,6 +1793,19 @@ includes one or more kernel modules and has its own means of building the module
 inherits this class as opposed to inheriting the :ref:`ref-classes-module`
 class.
 
+.. _ref-classes-module-rust:
+
+``module-rust``
+===============
+
+The :ref:`ref-classes-module-rust` class provides support for building
+out-of-tree Linux kernel modules written in the Rust programming language. The
+class inherits the :ref:`ref-classes-module` class.
+
+For general information on out-of-tree Linux kernel modules, see the
+":ref:`kernel-dev/common:incorporating out-of-tree modules`"
+section in the Yocto Project Linux Kernel Development Manual.
+
 .. _ref-classes-multilib*:
 
 ``multilib*``

-- 
2.53.0


