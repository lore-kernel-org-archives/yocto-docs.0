Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4DFC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 11:49:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5959.1790250535030414886
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 04:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HN5gxS9H;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7EE5FC211EC
	for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 11:49:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1ABF760341
	for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 11:48:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C08710328615;
	Thu, 24 Sep 2026 13:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790250532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p3o85O6/sP18ShKrxz1gEbWb9n8UtVgne4EQ3JePBoI=;
	b=HN5gxS9H4re+Cqa/r/H7Sqo67ALIRbbbEKAD6DfH6fC6FcDiwOhW4eCDR22E+VEnYpdg47
	xT1GeMrANEsQzaTane59ydXOjZVWtXx6jF2QcBOM8GgXlX19U/ZtYtzfv4PaHv9hNeqqKC
	y4WmjGIHhszyhHSKEV67C/pPeHAyz0iEHc1ejyulTzBS0sHQlKvmYiOIwAplDW4MGwJ05f
	eT1G8hooG3J2apO0dU8obOAQBU+dntq1t4zt7u+3m1+AiSWAjgtnrl8ysQ1qJ+347ZL1Aj
	aaOD4DlcnlmnnA0JyHGUoC5igNk2o6TJNBWsF7NsgFIdh2iOUS2GrXFXnV0/rA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 24 Sep 2026 13:48:40 +0200
Subject: [PATCH 1/2] dev-manual: update recommendations for build system
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-min-cpu-requirements-v1-1-003fc136e9c4@bootlin.com>
References: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
In-Reply-To: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=NJ1tDx7D83NfDxyLMRkt1tJs4kLcpkiFyfM25tutZBY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqtQ4d8YEjDtND8Oo008zBBTmKW8Hsb2iHnnyAL
 1gSTW2rqZqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCarUOHQAKCRDRgEFAKaOo
 NqukD/4gzbM+qplTQ+Z/9n5xq8comXmttQGy2o70dgD7BTI1Shbl4GU20eUSpVysel1v3q1TAcQ
 w9gvsBFARXpLqwHyFi3r+qxLZNXZpa/lpPadFKi/fCL/Zacjq2RKPWfuCRXCacHAUFY05K8kFWm
 o11bdUtHs85lL3iHUNcv2DHQ+HJ+klZrNd5yvtGNZfy9/91lru885LvkVhu7BZzEWaxfGuRKtWW
 9Owj2zQEtfs8JYFPcUPewWw/MRRFqHgz0elQeW5qHhDdE6SC0QtRloO8Fa+8Dx3Y7Ua1tMDDkzL
 IoGjuMmmGs3b08rC+m2rH5m2ygIeaqt+ifeLfHluDPG8fzPN2ZXenmrc+NdlHv9hy5g1f6/Z+qy
 61CfWF5nNX+wQLGGgbFoPoz80+GCUmFRLjwV8FVu1G3ysp+incBJblKM4oO5/wAFlBBs3PZvhIQ
 aJQz9cOSRwbCB2DJVgjzCbqAFVLAsBUQAp6Y9+4XA5ckKu3alzeG6pSFoRbSvGgFMj+6hfQEFeE
 Rcrme0M1itMJ40Bz1Di/20dc3FcwNuWOhe4Ge+UlX2NHBOoz5staOYtkyYjJ3lHRROCUk4DP8Mo
 3FyvLl+JpHy1ZtIMYMbwgKHTJJ/k8TnVVD0SQeF6T/fi9fyMUFPWUSpnF/Qi12EAA7wZk0E2hha
 RGjV3Bj5FXfwVSw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 11:49:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10613

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Drop the reference to "Xeon" and hard-coded RAM and disk space
recommendations and get those values from poky.yaml.in.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
[ag: move period out of parenthesis]
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/start.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index c7d0fe3da..5f0bb37b7 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -55,9 +55,9 @@ particular working environment and set of practices.
 #.  *Gather the Hardware:* Based on the size and make-up of the team,
     get the hardware together. Ideally, any development, build, or test
     engineer uses a system that runs a supported Linux distribution.
-    These systems, in general, should be high performance (e.g. dual,
-    six-core Xeons with 24 Gbytes of RAM and plenty of disk space). You
-    can help ensure efficiency by having any machines used for testing
+    These systems, in general, should be high performance (e.g. a minimum
+    of &MIN_RAM; Gbytes of RAM and at least &MIN_DISK_SPACE; Gbytes of disk space).
+    You can help ensure efficiency by having any machines used for testing
     or that run Autobuilders be as high performance as possible.
 
     .. note::

-- 
2.55.0


