Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB59D6B084
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17217.1769700279185777431
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jEG6RRhC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A86F51A2B09
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77727606FD;
	Thu, 29 Jan 2026 15:24:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F899119A885E;
	Thu, 29 Jan 2026 16:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700276; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vXg/YNLP+LfPpBXis64lD1mq8jE7D6DzEyqc3na0N78=;
	b=jEG6RRhCBdrqwkLtHikqo//t6DL8fPSKRIXTUD3ltpqjcwM0q+73Q3k9AaV5Y/+8VEk3ng
	y+FrLqYPMpOcvl4TGekZ6G8a1RFqa221nt+N4pzyvIFMBU7cwgkTo7zHhixarb3oU7tE2w
	sBAopRFKTwhLsDd3Sulxvmh4KhpImakM3DertDzeLLhLCJJJ2LoEUHdrFXBNIazaFU4tAU
	eIfRYewLNyqVC3VdB2402un86dVPCQOYI75+7dQC6fZnJ5QEQUydF1KAc91wWDV13jx6eJ
	hDDOLLiPtXBgRdOSBKroq+2ZqMYZOm27uSKZD4cxFXiYHvAgt0qhgkx63fZMEA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:40 +0100
Subject: [PATCH v3 49/57] ref-manual/features.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-49-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=822;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=quxuJjtWCjod5/wBUuxChFeGb5cBaQ/2ABBmIzb9dp4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uQV3GOfHUkQaB/9nk5/SYHdW4Q6un3Dc8Mp
 8/VGHu4N8KJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kAAKCRDRgEFAKaOo
 Nla0D/0RbL71/BAvjyI48tFPs3erIaOKCKOZ1AhhGfHmFXDMpSBBwbs/JE7d9LyHkEMcWFI1iAQ
 b3P3gwr5K8PK/EvvSy3MRTSCUX95HhP+Dj1FKhiiyQKgsT4HW01vWjxxxb9IP970R+JZDRXJ/OR
 Mh8x0k2kXddQTdwg1cNXU+xevZ4dr20+xiiPEZTSGyo8kMovoFgcaqmrag7+rpm/L0xz0nNqZ8j
 qoxU+yPVRwc2nvhCDiohxgVdYhw8UULpkEHSpfJmieKz1v8QthI68XehhPFlVcLzUXSkRxyzndC
 WhjdkBOB6Yh4W2tPOKZBK910eb/KXMXa+K0lZdzUmTciCjSUzWP4R/eCQ51vKJGsk2LorvfWW6Q
 6zVmv5t/YOMqCZh22YDhTOHqmvTtvGWX7qYXFXetKcSUB5fhMni4TfJbHcqyhrUnCK5lvrSv9uK
 ZPfrwFLrRA1PTpWLMrJ8laNVuYb0RqFJ6oWNoxyA9WLzVJZoq8f1BpafojVA4nT9FWoxJblRh3Z
 suCg5ny6VYEd/M44ZABqkXAvOc/p7sFdiT+WAX7Hc8IactLoZtm2SDILQOUUItMdvII5iVfmkwE
 eduy0eJe8yFWZqB9RGbtcvCG5vqPsj59wNKenbRwtkFwuA2lq+nS0PR1wovZxfZJFHRnMnM5gjo
 Y5qGF6g153/Z0Bw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8835

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index df3783089..be67bc0ea 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -28,7 +28,7 @@ a particular feature is contained or not is to ``grep`` through the
 discovers the recipes whose build is potentially changed based on a
 given feature::
 
-   $ cd poky
+   $ cd openembedded-core
    $ git grep 'contains.*MACHINE_FEATURES.*feature'
 
 .. _ref-features-machine:

-- 
2.52.0


