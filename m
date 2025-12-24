Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738D7E776EA
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123218.1766593945020027269
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rPrzqu12;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7EEBF4E41D8E
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 561926073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B66F110AB137E;
	Wed, 24 Dec 2025 17:32:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FRXNeRWlYwN2ksrdbh1KKkHuPRSR2Xxvdp+XgL/ldCI=;
	b=rPrzqu12E0MlEFtbESnZXW0kL+qyKpffNH/mpNhvqcZsqDk45/AhOkt0bIL80BtKhIIzLN
	BfLuJWMKCUPR5pwAqooRMX8zLd4oI4Q5J08KO6lEU21BTY7aHFfHGwv8/9Of57XdKnKWnj
	1PcEWC3M6wAVDTb2ZNejHRH1MFgJze4QlqZjOkpfmT18WKWtYWgRRu+RPshT8CbK0JHRGS
	VtI9BR7A5tAMT6W/KtDWuSsFkRi1jjg11apoAML1Anoy6uiPU+YAhIweJuZAMbhe+/+jy9
	BxOMh87qoVkYEYowJmMGFNBe+jKLScSv9W7nVIRrEgLYjjMCTRx+mvAGGalqkQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:17 +0100
Subject: [PATCH 51/53] test-manual/reproducible-builds.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-51-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=J3Xq7d4zAbBU2bkFct2yLGi6gzaj7pGQudWugM9p9vM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVwvPYwMTs4e0UEf0yrtnOEKgsoRZ3tffUak
 1Jmx5erGDSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVcAAKCRDRgEFAKaOo
 NjeLEACN4kWUuhS+E8ijgl60v4v65zugfXvC/aZJbWg0q7uUIDX79/tYofjz3N+Xzet6k0PhXtE
 Zrt59atV7kg9XhRfayWBNx7ZuIpA4kQdf10/t5akVp7AOMeaDk0Rt2dXgMSgfQhdQ1dnhySI0aP
 jiBYFkj5k2vefoSblPYz16B0lj2jR4QdYe0ngDcJ+aL+9/BMmxRa2o+OepradYcy2wIT7B2CbLS
 J4YRXgL32RAMzGj0XC9iU7wxJy9eipJnmTlMLy1vCkCaVOVpRvzOWWrmQdV+nXdAiP888dl77KL
 HlHtr6+fFucd4emDiLV7cYUMuqugmSYhqtdM9bubWldEyp+Pc6w6W4E+VEmwXj7nHhDKW7tyZof
 xYTb9Ljuhq5PUo0gy1Stzn6RQYKAGzw1mqYlmi4DTU1siVl6PTjwXloboAOLh8T14joTf8cPxoy
 FsKgUijCxmxV7Uiporde1Fkf0ZrZ0Sf2Dzc/UJUr8ZPaJnSXOJD+BWLwRGrgn+GZecu2QSUGciM
 lweJ+Vjw3xh1xlyJ3ZpccLUjcFYUXl/lAjiFcaM+fRrjS2K9cG+oNPPWFoiVyOCYrU+YmjsBzXi
 5kZRinDqVuqhEVTaZZhDx1O51AJp6iFESrt+BTjGkmK9KBAwOzPCwkMJvEEJjNkIMiBGG1bKbaO
 yFIWxQdmC+S/vhg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8380

Refresh the document now that the Poky repository is obsolete.

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
2.51.0


