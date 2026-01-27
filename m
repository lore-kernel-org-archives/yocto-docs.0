Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D78CA6CAA
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5833.1769502001901383893
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TYuKK2RT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 668301A2A6D
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35F54606F5;
	Tue, 27 Jan 2026 08:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFDED119A8691;
	Tue, 27 Jan 2026 09:19:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eYBfodnUQoV6+Z+LZLKCM7b7cl0U9OnMNzUUls6Q9Tc=;
	b=TYuKK2RT0fqqI+RDODvZC84csbXgyYKB4O58duODAxC0SKOrogX45sjQxv7msFdSTBkonC
	FMPe7Ozu5AO+JlWaqXbpM9TVT+n6Nl5w1MZYH0HNB1iywu7g5xYuorHoy1ogk2TzYdOuER
	WxgZmRlpV5b2p7jn/sIhZF5uWyKx1jwK6sS1TgoF47XbiK3dSBXftWb/V1udLEFwg105vJ
	PUk12yDiK+4YDcJ8A37C6z+dJ/5SVFq55CbqmNjZ3JQEoszuGCD6Wv+7aN5df2Anfu7mIE
	THM+OY2O37Ri67CKkSxfZTcfPJ1Tmwr66naOYeEASaFCEPo18jOtNmy2wE1eqA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:49 +0100
Subject: [PATCH v2 54/56] test-manual/reproducible-builds.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-54-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4eYaAuZsWOi1UasIMen+pwV4EPzRxLX9T1yIFt9WQJk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUGX8tFm2rg8CLVYfrBDx7K739BWUWMorvEP
 HAxgI4iVTyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BgAKCRDRgEFAKaOo
 NhZ2EACyE7BAQvHPA8n7vDVej+MfhNk9zDvPl3hxQh0Kn+uO7WwnKND7v2dEWHVhV6/+h4BsIAr
 KnVrRLlBwYLNiUpPm2nYaFpZGkRFt+sllZnBlD2k/tIeLLSa7skYO8N1tIou1JOep2/0VdFT+5U
 thi6WGH2Nnr4xSRkzWW0+UNAwubdmlu4SXIX1OtBrBTS9LyxCgGDBCD8hY9OtGTgALYqVyiBgu/
 HCF6F2o9aKlloIBA/62/t5tM4iZgm5tbMLlluQW/GoGLnKIL7mGrqJN340tRPtBDe+ddRPhjiZt
 fuUdIr8tkkQY+HMwxEwdkRAr0uSlvlB5t9igOEl+u9/9az3TH1wjbHSjmz8uos2xUcB92BOJqpU
 2q5/YrPNnoRhL2Ma98uNAUF/XIUABxzwHSs14dof7mjrgAT+5KNieUtkY1Xkn83MJSrdaqUR6R2
 KWMaA4z4Ojz9T8hMg8kWmFFTzPYmV/pk2AZlW28fDyxYAL0U05ATHBQiFHFRdmY70lvlfmiAoTY
 bQRoN0KNFSo0HH/VRMck9tC+bgt2+CbTFc/GrydyN+XL+jbICtcddFp93uWRpSZPBrl15cHCqkH
 0pnHE4o69e4UKHHBn6u0pWpd7PcV0Z2OiYmb+LUyZExi45YmmTCETUBPdiF8zIjGozG8jY0InqV
 xU2DLAm2UjfVOxQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8715

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/reproducible-builds.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 336bb7f26..84523ff13 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -81,10 +81,10 @@ it always depends upon the paths it is built in.
 
 .. note::
 
-   Only BitBake and :term:`OpenEmbedded-Core (OE-Core)`, which is the ``meta``
-   layer in Poky, guarantee complete reproducibility. The moment you add
-   another layer, this warranty is voided, because of additional configuration
-   files, ``bbappend`` files, overridden classes, etc.
+   Only BitBake and :term:`OpenEmbedded-Core (OE-Core)` guarantee complete
+   reproducibility. The moment you add another layer, this warranty is voided,
+   because of additional configuration files, ``bbappend`` files, overridden
+   classes, etc.
 
 To run our automated selftest, as we use in our CI on the Autobuilder, you can
 run::

-- 
2.52.0


