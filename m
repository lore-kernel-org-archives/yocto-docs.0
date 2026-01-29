Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A9FD6B07A
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17127.1769700284938098337
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XzrrrvBh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4C6E9C22F48
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 484626075A;
	Thu, 29 Jan 2026 15:24:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BC6A119A8877;
	Thu, 29 Jan 2026 16:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eYBfodnUQoV6+Z+LZLKCM7b7cl0U9OnMNzUUls6Q9Tc=;
	b=XzrrrvBhdrdxogbrSxxwjV3KjhXD/ZgJ2fJzWE4Q1k/Ubjpnvt4eu0ZisN+Bv5Akha+a13
	0tMytqGRkMfvsFXWIJtVk4lLiLKTU/x0dZcBaXFY2Xs2rlPC2Lww3kHdv2/I8pIZSzWHLy
	qiqbZNAnlunva2GGviu4LVeWaGX5Do5KVKZvIqOvkt0Y+SiInsQU//LPEpidx4NUFoz74b
	8bP/Whoq6FttczYF+mQx1lWnURINTxk+PnDoZfGSJY+VPyaUo4xJuvntNKn8MhI586gerT
	jpj2AXdxu/fHpf3ABTVVyccW5Tqc1C/FVnjNJ7GI8Z8WZZQpSk8bf3ZgOb2s3Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:46 +0100
Subject: [PATCH v3 55/57] test-manual/reproducible-builds.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-55-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4eYaAuZsWOi1UasIMen+pwV4EPzRxLX9T1yIFt9WQJk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uRdrQFSSAhbYwmadHjfo8h3oixTcQpiVOUr
 jNCmtnbdI2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kQAKCRDRgEFAKaOo
 NsZGEACYPgi9smbNTRDniPttVwA/MktlPKgbLYAi61VLr1XiUT6DSfqjYHdvDoJnAnymzau21+f
 qn3x+KnS+mJ2kzPoVnkbzDRc6yaQSoUaKeOYOA5KpauQH8ei1fhDnPNLDTy9/7kTXjGuTRR1Xvj
 6XJSnvI25ZYjn8gFEzASYIUI77eTMzURPRGtfKA53DlFX/sgiDdIo7/1jn+RBco/GYwQaIPp34m
 IDB4E7+7znkmuYWBSXLBoywc366pNgXk2PNlWtiHlGTt7bs+cMje+VALPfcW/1GbllSB1SM7HhX
 TgXUHtBX8lN+i85DoV7wg7BR15ziP8/v/mjEN21nbKolxAbPI6Qh9wrX65tO+BpLZzavPDazdhl
 Gh6wFy27UACxm8MsukMYj/jtpsobieWjQzVuiWhldRP1AsKYt6NZkCf9Km2oPwtA93Yksoe7Uxl
 QvWLe+9T5LovHssh1latEc0N8X1ESl31Gok0j50SPNAf6IENPvDrC05uJSFWRaUpNb1yD/oekxq
 Yf/QmbxEiTQgS5mvX0JrydhBg9jAW0iFDPaGurvvIkxJXp1mGLqmXf7QonuNjdsVaHP/DnRYTdt
 cy5YBS/pN1eZeztuwJmguykhKZsdj3QqGP2tAXUJ6movkM93fol7gGREFfGMHlP4WYl8NuDwTFf
 NxaGMfmp69rJpbQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8841

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


