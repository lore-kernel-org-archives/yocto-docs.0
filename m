Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C3FCDE00D
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7575.1782380027589549436
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IaTUwhxj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E3E054E408D8
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9E585FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED7FA106F07AB;
	Thu, 25 Jun 2026 11:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5OELTGJcSp+17kFys1Uh98c9yvB0O0T1y2lySgHj3NA=;
	b=IaTUwhxjtffDYo5mCZYbcrkkIsvgKxBBNVImGo6VC2R9C42V8lMuczGCceWqCjzDQ08Fat
	0qjphwBviDdJJXDkt1swipi1fHYuTbMuySL8++JnHBNR2XVb0eYh2EzqVQn3/1RRIgLz7O
	TQtnDp6VeqxsH7vMRykqFHKtG1qDblX1HeK57plSK1d48WG7B/kevMWs+BceNpGUADH7KG
	Z+15lP4EssbIv7Ca4EfuqJo+VC7r/35K8GcDFMQZOlEJ9WVLcDNIRv498V7Zl2EZJs5qsM
	RjsVbVHSw90DsvPwrSuiKrxJvgBQA1Vrm2gxlp6bCfUC6eHZBPKGoVoA7d9scg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 25 Jun 2026 11:33:30 +0200
Subject: [PATCH 03/11] ref-manual/kickstart.rst: replace deprecated wks
 directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-wic-migration-v1-3-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wizrrXOCugufjWLYBklNlPPAXyxNW9Uo7Zzt9tuDOKI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPX0Xw+OwTZZpG6jWN5qv2h+zOBjH5yjejd5N
 I8Y4I38cHiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz19AAKCRDRgEFAKaOo
 NlK6D/9AMNesOuQZzeLHdsjSrt5lMeUzyylzXbRZd90fnrMXibcKufFNv8gNu0tj7D3zJgKmFvs
 CEkAYAbkwegmeciKhQaa4sVIK/ktTDkRjEndv0aVAEDyl1O02BLLnaRlyg554bWYNXFDYLS6dWG
 BAl0mOSFUDCwS8mCnEjxd3kYpOVLXhlYJWBmL+IoDBNFSsA7VN/sr8bgaw0Mo7KyEqmmZ6AjX/v
 cfWeX1fTvmuEbHka4WVST8dGj2Hm8/tcWh5ZPcir3QZPkk1Tkv42a8JUpeFpUwM/A+o9zQFO8DE
 a4QXJwLANkpNt8Y0h7Ty9GxcMDhF2CCgHhX5F9yloFgRFf9BtVJT+DX19sEwG2luVvdgwgaY/11
 0q5J+ASSdnXM5/7UQpe4ZjXBWaIGCk72gxImXtSnPsALKgxhuoW6Pw29kDC1bCEmEb8s2dyn/n5
 lyTQ3BiLnz0BEjFRVVhotrYWvbmKVr0r87/K61RMJylcDrdSd62m75dYDM6GR2p0f6xsJPtcuBB
 KXfjhuX6nus6Tn6BTKk4H4x5Vx7t+5lu54YtVQ7r/fYugL/aofgwGe0wNtZQw0hzu4V1Hrk8qj8
 4WUlI+WXFk/eiNjPSKcKWe31+U/vWtKY6+zKDCouu5iUA2Y6pRiPhID0sL58X8BLIXgHPzl0BEo
 OvdBt5kvKCrmJzg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9885

Since Yocto 6.0, wks and wks.in files must be placed under files/wic/
inside a layer. Replace the "canned-wks" mention.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/kickstart.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 80e2f9d84..9ab806899 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -230,7 +230,7 @@ supports the following options:
 
 -  ``--configfile``: Specifies a user-defined configuration file for
    the bootloader. You can provide a full pathname for the file or a
-   file located in the ``canned-wks`` folder. This option overrides
+   file located in the ``files/wic`` folder. This option overrides
    all other bootloader options.
 
 -  ``--ptable``: Specifies the partition table format. Valid values are:

-- 
2.54.0


