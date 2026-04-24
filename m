Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E425AF589DF
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16687.1777019334189870723
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Qd6I/asU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 918244E42AEF
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69B8D604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3F3B1072073A;
	Fri, 24 Apr 2026 10:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019332; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GrFnkmPiMXKT5Iqq6Sj7WlyM6GjVgub/R3zTTRUR6XY=;
	b=Qd6I/asUhO4cY4OX9ffNbTm2HA22KHzNUGccnNxwv5BNfR3A+D8fLcQcog7zwOLbH15TSO
	LTbal0egDdmLAKmIY2ogv74gqptAJh3CHuHCLxyjBehSjaCBxx8HWL+2kfdypMiNQuCVi7
	hULXmdI/lvMEkPM29M5Ipf1iHkKf7zxo+C6yWSV7G+GCYy1Tjf5a4HpyZYGxStM50HPWMA
	vzkRQRSIWp4hxem+RaNkR/ByrP8gVoUF7LQSfd3EJD4iWXOp8JJQPSCTXsCn8sVgJWwM/D
	0dhynjS3XZHoaFrZujVphIDgDHI+9Pb3XK3sS3jyPHoRACFZYSaV1CILRepEdw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:32 +0200
Subject: [PATCH v2 04/18] tools/build-docs-container: add missing leap 16.0
 in help message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-4-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=683;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kA/9oXiW7LYw5X/o8i6uFStxCPrTuoa2PdGsdRUl/3M=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym9Y18Braqjx1AVgStBXIA46Ol8lq+0xSq/O
 b+RT/0bhmmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvQAKCRDRgEFAKaOo
 Npi9D/9pEyY6AmbNDZggWy11RwuQqPuqP0KZv8blAz/LtulfWx+6mPPgG6kRI6zhDOeSjUjnlF9
 6uVdJghzGGkf/vK7jXDjuRnKgXWukjYAIqJSl98U4WaMppJTmYNd3kGc/GmtuPsEowArUXIlRM/
 olAB7TQ6ncNlw9XxCDDmwK4KnAXfZD1lpVGBzAD7lijf3MdEEqrCZyPakLc2NG7jOOOKWOmZuZC
 /gubB7POH1wlG8pn1YVSEJFFwuF/CEgk0C1iiX/+T9/vUJ7Vj4/579g+5sPisJVjwNMbwgtNzYO
 zPvfCROaqyd/YJLd1Ud5atqXqO4rrWvQIJzgUj8c220j2ORmp2A0aa4a++m79HNJRry78ua+D7d
 2CnZoIlA214VJFw2f0gXtoUGUw+tpN5AWneurKKilUsNkeqL+LsW1+fLxh1AXKiXccrLIARhw4h
 qgYGn1PyIqG+pNs89PTgXN7WdJnickWppMfD9oTRuNiwj5o32xkFQLEtTEXcw+7VPQwVl4+SaiQ
 9RfYLLD9IdhmHyuZuJT7TAVAGmZUe2hUvs+8R9QzRRJGGsf/pDrcPHRwb3GvZahIqVBOYTFSbEQ
 lXzihhZYknTcXvPDt+UM4ea84HuUfdZNiFumBH2MgkWP+hoh6zisO/uTgQPXcZ15+PlkFRTHZt9
 jMWaP+0wxo14t/w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9342

Fixes: e5880b36dfc6 ("ref-manual/system-requirements.rst: add section for openSUSE Leap 16.0")
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index a540e81ec..ab8314901 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -41,6 +41,7 @@ $0 OCI_IMAGE [make arguments...]
      - fedora:42
      - fedora:43
      - leap:15.6
+     - leap:16.0
      - rockylinux:8
      - rockylinux:9
      - ubuntu:22.04

-- 
2.53.0


