Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED08CCFA08
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:33:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1844.1762187619514965877
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 08:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZNmbUYvv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 32D851A1861
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0703E60628
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44B0B10B5009C
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 17:33:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187617; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yvxUVyawsOW1OXfpZeYvh/yT9CzyWNGbllf36LJzVP4=;
	b=ZNmbUYvvYU4PxQLEsbUV0zKI5fMFPpiQDT9KlEXze29dibOYeOK4uF3PTgFlian3xRnu5Y
	bDiLudiZcuiMMDhBk/Qu8nrOu0rjaB9OSbhgFmvGXeR+jBDMxbFrH8/SpXkE6/T3i2NdbT
	29S77yJ2MFezXgKvSmY81RFewWJvsCAX56cAZG9MoosapzVomrIeoRfiL7VMR5wysSVvh0
	RL1wlp73aJ8pATsOKojssFzhJlWw/RdtjA88eHfhzv7mzMmBPpN9rEkI3WvZcZDtI0XlfG
	DXV+d1SjjVxRtsbSPk37N8+eFidoyi4bMNlKRIFADv9GWZxxIAsZlUgoibcN6w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 03 Nov 2025 17:33:07 +0100
Subject: [PATCH v2 3/6] brief-yoctoprojectqs: delete unused figures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-bitbake-setup-v2-3-89fbb14cfbbd@bootlin.com>
References: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
In-Reply-To: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=31703;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5vw3MzC9vS2xETi4v98m0uhpBhegzW7UZZavRYScrsk=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGkI2V6hJPsHZkxZz+Kicw+icKPjdLMlukiR4zXTu0hiImFTI
 YkCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJpCNleAAoJENGAQUApo6g2PicQAM3+
 cT0N5DbMMRh5bhAMvpBUbuxAer9AISQq8Ram4F+cNleEXG0XMs2vGAOYoLx09z1eG8epBjbk8NH
 SafSA/D5pHdPViqORcYGvCull6vJGRExEAqgGjalnvP0qcKOUGmLdiG7MlwlolJObTpbGiHVrBc
 1vIdASkmyluKPFdWwDW3qmRBk+0oPhybQLPQHZ689ed5RZ/d0Tt7M+RiUedOXayZ6ikR/ai4jV8
 mFvAjapMUegR2iZfhfOcWqCtjD6PRKqd5vfwXbrUEgeG7BfWtgAsYQOLeqQYOhurg9LHlbJAAee
 w0FdHo4/DvVCrhYS+sVP10XBnkb2TLVkGUQc4F+yFXSIrCjZal+qUXojk4fQiz0IepYnVsTl9HO
 L6GnHHnZ2o1Fc9yAX2gramTfJzZ2nKmjGaaJvoIEDDCDb12lDRfiZhKObRbp1FWSwjide6EqWAh
 gNZpup4wBqfga7CiBGsA+r+6qN98dyKPnvjGGL800TcIBQ2mxuVTmViW06wM+dbOWikHcbrM6GC
 mwHLR2x6HxFC/nF1dYi73gNHeAlclQ8vtzkyEPMQ4MfWhGaEHq45MdpMfz3mVnO7q4Q2u5aDjHA
 defWB6knY5vMDq8Oc348f2vcw/yOAuVKlNogkyh+7p/4FcPi9kzG2z9pHCcL6udVqXQWxt2ONyQ
 hjmsF
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 16:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7978

These images are not used anywhere in the docs. Remove them.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../brief-yoctoprojectqs/figures/bypqs-title.png        | Bin 14312 -> 0 bytes
 .../figures/yocto-project-transp.png                    | Bin 8626 -> 0 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/figures/bypqs-title.png b/documentation/brief-yoctoprojectqs/figures/bypqs-title.png
deleted file mode 100644
index 9e0a5ce52ed7817afdc794bc07c09cea1dca3325..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 14312
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

diff --git a/documentation/brief-yoctoprojectqs/figures/yocto-project-transp.png b/documentation/brief-yoctoprojectqs/figures/yocto-project-transp.png
deleted file mode 100755
index 31d2b147fdb5e23f84d64652faf9528d83be7d8d..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 8626
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


-- 
2.51.0


