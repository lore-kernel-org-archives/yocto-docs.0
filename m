Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55B5C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:46:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93803.1782744384938407452
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KLIs10S7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4CFE11A0D1F
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 238B65FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72E60106F18A8;
	Mon, 29 Jun 2026 16:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mBvHFwMXEin940D3OPNuUJFGvtDzOkQlCMqUKxs8T/0=;
	b=KLIs10S7tfrqYJuyfHpo4QVrac7fMQrBEH0M1b9A9i/LQQedEXavPs8oW1QJhHRWw10cbA
	om8dtRsNr/xIVeBu3V+dmt2uEZGCnDXrqEZvkypMNO9PxyRGQikMBPvskgJeepr/Io46VL
	96pl28XnxZy84+GXDXqeReFn/MhkwEKfUX+niCdpe51qrPXN/lJ1/Vwo5kIPIuzQ/9KPDi
	elcT+QDv4ALaAqJL+bn8s8O3o1AAV4a7EC7WMTAy8spI9EhPJ74C+cjbvJNrdi7lplwkk7
	PRDYhgFy//ukUVeMqxNOPg+ggwZPfjWQ1HdMPjgFgE8PkpQKmHNPhjl6eb+p5g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Jun 2026 16:46:15 +0200
Subject: [PATCH 6/7] ref-manual/variables.rst: document the
 UBOOT_FIT_CONF_DESC variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-master-updates-1-v1-6-ad9b047f9ff0@bootlin.com>
References: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
In-Reply-To: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tUhY4mFTm92TTolN93S13XRqOzDuZ4g+i08wd3GJr10=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQoU4xjASIti4OAsaMxLhLwAYXRURW2dSgWKA4
 Zlzdb70mBOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakKFOAAKCRDRgEFAKaOo
 NlnRD/0SGUqBh8wuyyU66W+3H9gqPKnA/oLkeNi/NZ1KsZIznEEaMStyWnSdf9LqsAk5HABhW+h
 Aqdcs5QiO0l0Bm4C/Nsc4nXBt006iMDfFyeLih32FPhR+7S8KhYThP1zbH5Q7K8S7gIBSYkMVWO
 Tw9fbVElkn7/XH9tJ+cy0KQInwGvdZxplz+k/fdMv3OHLTynI3pWpyIXgDHMrOweaEoPm6a0t2k
 SCxdbwwwNssmca1/r4N7Ba9+xsFf8b5k/yktiWl73WqN3Gr8QMeHQE9VtFn96xA5AInzQqYWvzs
 xeA240Pgh4tSVp15Iz5562VrPU8Ep22/BoAqZzBe+oXAvm6qyxhI5oNrdh9KuxTREQ2EHJZp3jL
 hcoLLjlszbdm6FisDRwx+GmRwl1rk5eYyZwyssBgSvqMrPU0KrTc/MxGI/CIDhaqLCQrenXkdZQ
 X6JNiIuiyTA3fKAESb2S1P4VyiBa+CCBVz9mCbsTWE96fVjXd17yQOKr7o8DW/vYxEEJxl9ov7E
 CBknjR2+fPj83ockNQ/UuJ3Cj7j9sHJ9pqywLECFdJZlKTLbvzhnrT45YKX+ZBqK/FB+sC8G7tp
 TFdRCzGnQErAjYLSQEwgVR+geW1pea13ltR3rcTNgGQdYRmYgnvikpkcsKZ7eX5ZEG3JHesufPZ
 ewcRYQuzwouaffQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9979

Added by commit df16e4a3900f ("uboot-sign: allow customizing the FIT
configuration description") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6044283c4..c2327247f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11563,6 +11563,10 @@ system and gives an overview of their function and contents.
 
          do_compile[depends] += "trusted-firmware-a:do_deploy"
 
+   :term:`UBOOT_FIT_CONF_DESC`
+      The :term:`UBOOT_FIT_CONF_DESC` can be set to override the description
+      property of the configuration node of a U-Boot FIT image.
+
    :term:`UBOOT_FIT_CONF_FIRMWARE`
       Adds one image to the ``firmware`` property of the configuration node of
       the U-Boot Image Tree Source (ITS). Sets the ``firmware`` property to

-- 
2.54.0


