Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DEDCAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:14:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.12990.1758276860089267794
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 03:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ec7SHzco;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C62961A0F0C
	for <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:14:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B793606A8;
	Fri, 19 Sep 2025 10:14:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83E4E102F1C5D;
	Fri, 19 Sep 2025 12:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758276857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eoAIkDWRDJMH1+pH/cy6qUwu2UKxeYAGnqqjspyXPSc=;
	b=ec7SHzcocMP13moMP/Ic7Ze6Fuo3GgPjjAsW5khXLxxSYhgOkGXYGxx7V3BCmW42cIN7AJ
	w5sDbYycQOfKauiPkp7l0fS5X5Q2t++0hwWcumJTnSL4wVbVGXijnI3C5pNpzXNUzex2kX
	nEl0SYrNYatQqjcAi7iv8fzNbOcfzCBy4SkZfMn/C4plTksNsNVHlYyTwjmWZehWExvCT8
	WvfFPyot6PhfBwTjq4bJOJV1i0Yr41s40kiBrXnAou4DSeEfX7Tlnsz5v1iEHd/Q3IbNHz
	/cMmxjkc5N+shaSbD18L32azuyEiuXPPfheQ+AxGC6PqCtbq+47UlrEf+3/yWA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 19 Sep 2025 12:14:03 +0200
Subject: [PATCH 1/2] dev-manual/layers.rst: yocto-check-layer: mention the
 --machines argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-update-compatible-doc-v1-1-f3a343914503@bootlin.com>
References: <20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com>
In-Reply-To: <20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YZVKBRPuHYwU/Bgbe94ddUkNMBiBk0Kh3g9+u28vmKI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBozSz0nrd1js2jE1rxxWC837/UOlLdW1UKZwvCc
 hS5d9CFykGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaM0s9AAKCRDRgEFAKaOo
 Npv4D/9ZLqsHtYUTXY1FevFFSzHobt90LTTDLkCis0TDuWhaebojDV+ECV3u1GAAcRAQwClKZ6J
 uaU+OtDQP2fOYHaPswiK3GbyCjGFQ7gjE/jX0htPPN+OT4Eu3JoZlBMqlMr65v0bAMcP6sUV5cr
 d1037dErpiFZTHYFqQpCjpakz1+EqDFkyZ29GufCcjfJQ7+Q3EL0rvzXXHWjD27AKBEPnwBslYr
 mMY3P/eXhxAKAXusUvP1LSR9TOOLgd7BmrujdQEH2I/v3WHx0IjVWDnKzKDdCucygDFTz08EY4X
 GFazjHnaEbBEm+dOym1Oz7P8ETKMvS9TiKvkqjL87awicqNWBBbnfBqqhiPf0zA0Jr0LlRAvm9U
 x5cAOl693kFzZwZ+YxcWUqs3hJ8Yh/HyO7g2emQ4IK+b3LrmibyYkZuTlUNEU3aF1WpqneDLISS
 QMF/Kr4KaL5+EMPz47P5bVOzwKcKFfGJd24ccca3GeuEO9QDh0RvpyXBovSunV1hl49Wel3zlcL
 ZhOFLJRnEzstbX2gFShIaC2IFouqL6/br0qRKrULnmiwRvuehZn9hxsDdqEBn2sPGdt0WUGSDEp
 nej4+b/uZ9mB9/Wj2IyDTTcPRLCPwxKKWeyqdXCKWMrZJ4TjQEAMjPnYRe351BiMeyV0W1UmuA9
 zH6ttbf1nGJ64WA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:14:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7557

The yocto-check-layer script should be run with the --machines arguments
to test the different machines present in a BSP layer. Mention it in the
documentation.

[YOCTO #15974]

Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index fbf3f1a33..0bcbceb1e 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -376,6 +376,15 @@ directory::
 Be sure to provide the actual directory for your
 layer as part of the command.
 
+For :term:`BSP <Board Support Package (BSP)>` layers, the ``--machines``
+argument should be passed as part of the command::
+
+   $ source oe-init-build-env
+   $ yocto-check-layer your_layer_directory --machines <machine1> <machine2> ...
+
+These machines are the ones present in your BSP layer, in the ``conf/machine/``
+directory.
+
 Entering the command causes the script to determine the type of layer
 and then to execute a set of specific tests against the layer. The
 following list overviews the test:

-- 
2.51.0


