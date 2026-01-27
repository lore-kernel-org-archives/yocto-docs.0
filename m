Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48011CA6CB9
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5818.1769501988723403745
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ht6dkPOz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 429DF1A2A69
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13B2C606F5;
	Tue, 27 Jan 2026 08:19:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECCB0119A8684;
	Tue, 27 Jan 2026 09:19:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5lWGedgMp6d5SJVOVQvGB3V6zoCnioUJVv95zER9pBU=;
	b=Ht6dkPOzVG1SJUp9GaYllYSyaC5LJ13crSlBhCaPbf+mBaEpiHAZDa9kuwd/fDpyU5ABBN
	psDnHv+ZAvUmv7AAePZXN5+j/flq2khjyRiM00R1EdtRSQHD+g0xwAgLCItWMAHCB6MtOj
	0rS+61He2RK5TBwFdoCivQt6naEV22eX4lX+tXd1he7+kwNCaptV3Aa/op7lhjlFawaAYP
	tvdHz7sebLsv/K+rKXB8dWzKL5x8N2RkBUKHcR7AjH8A/6wVjFxTJeqwtf+obhctjQX36U
	9iuFW8oDoREZRH+y03igU3XzOO9YiwK0QllRxMhaw/bVjmdJMZuxB/yYTz+V5g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:31 +0100
Subject: [PATCH v2 36/56] dev-manual/custom-distribution.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-36-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=e2biYZgbv6AVXFPbMCV+AeaAWoHiX/b2fQmc1CcthnU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUDYNSVxUdTqE2M0BCaIWjb/+n+jXe77WggV
 rMIWZX+NdaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AwAKCRDRgEFAKaOo
 No1ID/4gspN+WcJZ8TdQgHjoqLLO7hx0gGAziV7OPuR+hILVAlMIPFKK/J+cXVG4cYqJ6MieZkt
 ks2E8FKW5auTs8pImq2b0RxMvYBNT4oizVSvwsp6s4fM+8j1bWdNBIGDKGkecr0XU0Xtgv6FNNG
 KUBjbh2u236tTA42QXTxewYZiQbcbICzqXqljdZeIkal3IlcU6KeXpUuNzzi3lSTs6bM5vWHjce
 BPkrN+ehNv0xuDE3PNFRQbKhU+ZC+SFNhiqfifVUsfMRp+bH17+sUsjKQTylscccYNuq4dv8itu
 YrQPpE0Wr051stP5Mf/P5Oila1FgTayZl1PWie0yNtQWDxhJwyF6sXGzcMozuq7A+3Co7JoCaHD
 JQMkrSOJhC5MYjw6DZi2Zue7SQuo3pD4yNbv/ATmYw2BKvJUT8c9RJXT7ajfKb32FgGE/WRQela
 hCpt5hELfrGHgrM7v5J3ged+d5NMbjQ6N87Q1OCxwwZtcc3Pxd2WFSsypz+XZ9WFkSJTKsJj0Gn
 TXWXXW2UOu/jJ8XzFN1MN/z8NJSAYSdPSmls4IPkYLQqYhbpTfSAWdvTVqbPQ+XW2PT/cJB+4o+
 j+0PYathjdXu0q5tEcnyZkwiASzkdnbOu0XTkCb+WCOqllcjgj5eyZ+2bGlqcG3hJBV9kUOWhZD
 ss3FapyNIyFNj+w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8697

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/custom-distribution.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
index 55854f00e..4dafd2725 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -3,8 +3,10 @@
 Creating Your Own Distribution
 ******************************
 
-When you build an image using the Yocto Project and do not alter any
-distribution :term:`Metadata`, you are using the Poky distribution.
+When you build an image using the Yocto Project and follow the default setup
+showcased in :doc:`/dev-manual/start`, you are using the :term:`Poky` reference
+distribution.
+
 Poky is explicitly a *reference* distribution for testing and
 development purposes. It enables most hardware and software features
 so that they can be tested, but this also means that from a security

-- 
2.52.0


