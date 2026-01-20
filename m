Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63024D2ED1C
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:17:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8797.1768922234974256339
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2AO/812/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4ED4EC214F6
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:16:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DADB606AB
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF2B810B6B52E;
	Tue, 20 Jan 2026 16:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768922233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3QE/1ZlkCyltlXWKHbSl2Y5F9AL+Tca+2gvYyTCfSJE=;
	b=2AO/812/EIOVsktbL1RS1gPNAtWT8d2MdqTHleT40cDjbQBnHzwsmR9ZADiRes9cY18b3N
	uD9hdPUBYHutCYLDX5YWDQcf/V5JCG7/yJCP+ApNV13IUZqmfaBWoAJJyf0291OL3bP44n
	NBcWSTV+TJEZQPD9r/LD4ZhNqBk830U2UuKzHNlUoMSG/cleyEZOFaQ4aHdAt1lK1qStjU
	Lu3jQuhgRiHCgGL9ovN++bN5D/xQRhrnMgiz9iNjPvV/z9BMakn7nE0S7i6zapqv9bFHMR
	Q6wXb/uQKSUQscQf/GMtHUB+A/nZhwTEUVxmigZOi4R1J2ECW9BOolQfU7rOKg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 20 Jan 2026 16:17:04 +0100
Subject: [PATCH v2 5/5] ref-manual/terms.rst: refresh the OpenEmbedded
 build system definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-terms-refresh-v2-5-fa49d15b209f@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
In-Reply-To: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7ZsNxJGyxM2js2Se8/QxmlJ3B5RfmIIAHGPuvM7Ew54=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpb5x1waNfZ6Y2htOde7DG2/g1Y7MJQYntCKPst
 NvRYvXQ9s+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaW+cdQAKCRDRgEFAKaOo
 NpyrD/9+eJCgouzOj94rMgg5XdvDFRZXsSEjIjAzcFpd2S5bCbZGZdQNyrolSTnk+yGWSz8jmH2
 xdHgJquNsw6PgXhY+ZEoj8ewodDGtL0Wkuj/J5ek4L+KW9MK4gZB4DEuM859cs4KYg3p6x5vnOV
 w+FnvEe6dZsXrfo9Z0gibp2/Gp/gQC40KrQOjGonPwfj6yfDMtTSJBj+pjfIvhA5uhdx6gaOAiL
 CsXGWJu5z4+5oNoEyBXXfsHVEnSdSE/YQnohbWs57yxVs9CsWy3imNLXI0qNwVFLRrk3I6il9no
 exQMBB/ZuKEobqu7UbD2QOByJYiva25C6V6oCehDHwr2OvplAwQVmikBi6bGWE/c2B8ZfHFHvuW
 1p+cy8RUMQQLH291zKFfEfzLxEPDo0LZUjaHlrnVHv8CrTcKVubQvJvOA1FVctxPw5po8kzf9vR
 k0NqoKTlRj70wvRumcSpP2YR8iD3wslA25H7uRPvjB4/IYp40TKgEbI4kkUNx/R00SMSU98Azeh
 RvP+RykMvivqy6O0in31X9/4VsbQ6eNbdyO1eGEKmlaOCbB7VlfPp4sxOyHYzs4fZe5ReT7Tzur
 kWsBnX58uCnds4L6/7tb30l5dDoPbebb0vZ/5BUOt57D+RHJ6r4B68Lu6lf05r+a5rl5R/omSdf
 zrYTZnSzVyOcqaQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8598

Remove the mention of Poky containing BitBake, just mention BitBake.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index ab8eb6123..1e8a9d57d 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -401,14 +401,11 @@ universal, the list includes them just in case:
       section for details.
 
    :term:`OpenEmbedded Build System`
-      The build system specific to the Yocto
-      Project. The OpenEmbedded build system is based on another project
-      known as "Poky", which uses :term:`BitBake` as the task
-      executor. Throughout the Yocto Project documentation set, the
-      OpenEmbedded build system is sometimes referred to simply as "the
-      build system". If other build systems, such as a host or target build
-      system are referenced, the documentation clearly states the
-      difference.
+      The build system used by the Yocto Project, using :term:`Bitbake` as the
+      task executor. Throughout the Yocto Project documentation set, the
+      OpenEmbedded build system is sometimes referred to simply as "the build
+      system". If other build systems, such as a host or target build system are
+      referenced, the documentation clearly states the difference.
 
       .. note::
 

-- 
2.52.0


