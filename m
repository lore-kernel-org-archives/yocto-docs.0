Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9ACC43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:31:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37597.1782739900278658424
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 06:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Wd0P/KZV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 94F484E40B6A
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 13:31:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AC845FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 13:31:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA35D106F179E;
	Mon, 29 Jun 2026 15:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782739898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p4zPP/Z6A/gwshKM78jD3Vqm1w/jv34+7BfFp5k4w9w=;
	b=Wd0P/KZVO6LcJuvVTlpYc7/+jtZxUOdwKhC6CgTGIUGJa90xAwRF6R9Gx++KPjYlZ8Fn4S
	vciEhfakZ+fiKN8Ex5shGjHQ1q62vkMIo3jaFIm4AYm2SVhS2m1Vc6dmTBNF/6ych/RKPx
	/aGuvHF6H/bEtcCDFSb4SgMbWRGncTyFoV+RF9BB7GF1RdGvoFGA7hDeaYIfT5T+enq5J7
	tkwmoYb5aKainqYKEIYVmm57+LKno76S78T4HtF3R3nXOCkJQoeSZu55mdWrxeBYQ8oBrB
	plNPOOXZqzyEZFS2D5Q9n3j2if/8zjLAviozNtr7ke7duTvvc7B+sCfaJmODJg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Jun 2026 15:31:32 +0200
Subject: [PATCH 1/2] ref-manual/system-requirements.rst: drop Fedora 42
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-remove-fedora-42-v1-1-b55005c6e434@bootlin.com>
References: <20260629-remove-fedora-42-v1-0-b55005c6e434@bootlin.com>
In-Reply-To: <20260629-remove-fedora-42-v1-0-b55005c6e434@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=708;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WoG0wtLSj5wZYVIHGV2PM/YYWZhh1x/HEsZHWKhw5pk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQnO3+aCTdka9goHzXwG5YES/zmq9+nnLTLb5W
 o8aFLN2cZyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakJztwAKCRDRgEFAKaOo
 NvpZD/4icHDUI8sJuqX5iMUbKs19SGPEmdOIarVojVNLe711zqrZx65Hj2V+zLdY/YfHIFawhlx
 Ih61p96xveVjDWN9bP8jvBoTJ+zysiQa+LK8gDjVLFfGrruSiLQD0SPKHgornBHfEIsVkDobVRI
 2vtj1gD/v+tHTzQ0YIndLlmX4X3rNRXI8OsawMtqMaH7XbGHymTlarV0CM1+pvXFSlXWekl0poI
 l82Jm3DvPGJab1tHC3jUjBS/liDrE1PR44LKdTfLAkjaQCn2gjr14qrfZml9LRrG3fgSPRxOHaM
 hL5h2oQCy7cLztCaumJahaIk8NBi56yNWrd+fDpM7emNUTJP7RGwzVZsEueOgCjNXEcEjXVHrb/
 2SAHOJyMVPOZYljExwh4UWFr952inbp1qb8TLS+gHcI0/oXQ/Umgt2lipaw0hSOueFAWN1Pvg0O
 UG05gjd430tLEkSgZuhp0xKklwkJvVcITjge7wJE5tASFdMTrdzoAwneIxnUs41iZ38vJXsGcl7
 cpXsSM5oRdNO0LccZa0LN5h2C/zeO5y/v4brn4zO/leVmqlz83oLX4dbMZaNF75j8nQeRJBX7w4
 mDissQLlr8TIt1QUJgpLmOJhPiElamzx4QfHb61kO5xsIxBL45GZX3idHE/OEvCV+4OeUvpqyPv
 Y+Do8lfKe3kYwXg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 13:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9971

After 366fa2f21bfb ("poky: Remove fedora-42 from
SANITY_TESTED_DISTROS") in meta-yocto.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 5171ca6ba..63291cae3 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -69,7 +69,6 @@ supported on the following distributions:
 -  Debian 11
 -  Debian 12
 -  Debian 13
--  Fedora 42
 -  Fedora 43
 -  OpenSUSE Leap 15.6
 -  OpenSUSE Leap 16.0

-- 
2.54.0


