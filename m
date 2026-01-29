Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390A0D6B07E
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17222.1769700285572298310
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AtJQxSXT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EE3B2C22F4B;
	Thu, 29 Jan 2026 15:24:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6C16606FD;
	Thu, 29 Jan 2026 15:24:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 243C8119A8857;
	Thu, 29 Jan 2026 16:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zQs7y59B5I0wfvd4GOUBP23ijDMnvK40AbMc0hJXbnU=;
	b=AtJQxSXTTLzWGIQSM3TM5upBbheM+8VGMePRpSbIi+RlyRXpyhQ5sUwrgDdRFjrPbkhCxz
	73QiLFXoGU5SqodJ5Vt+43WTcuYwckA+6oah9KcleXBTinYJy9226vm2HSkCkBbkdyoYwS
	ITBQOx7GS/i2KUERc38wzNFw/YCYnxIDxjLC3YB9r71kHxG97c/ztahDt74L2VDYIERDGS
	9B8AFkBIagrlzn1/G8KqU6lsvTVZGVjDr+1cpZ+gULn/EvueHmNI3OkUoEjEco8l4jKh05
	JPlYEjq+dmN6/tPH6DQurmQHPi9abiOwPG5sGgWp8K1ZuBR1LLOcSVOENKYmhg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:47 +0100
Subject: [PATCH v3 56/57] test-manual/understand-autobuilder.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-56-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=r/yn+8vjaVjyWxh/o7W0fea8QW3G4j5jczXwF6Y4wIo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uRFrwG+D2Eh1JmTSnF/aa/3+8unl5ZSchoc
 pN35XUxNX6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kQAKCRDRgEFAKaOo
 NgC9EACKEkA7RAYV3wlbq6zZf3I/k0JzszMGwYJDxOruIm2MfvwiLGhBPVaZGgS/9nasHqRFIFr
 CZ73x4+MfpmxPQnUxvQfYLQnU34M/O0xSXKfKNxZztJvvYQ0sKHclyTQxKzT477lnMp/q+fEm2E
 bO3JiOzfyaVexNBf+fW76SIvr4qkwiqk1MWdtAAiS0zHVpxG9+ONrocLGmsZX8MjQhFv2v37vcg
 Ert5f7R4mUZ9X51IgGBWVajSPlNJNuAtF+ShAYkITrCz1yPk5QbY32cAxshNEjtao0WawUmI9qm
 Y0HepxYbBiOQLrRcEV7dnYdj65IourHO+e6yN/kPNUUTNny7FOGeCkQR3QgfsKGrvE+f4gTu0t1
 D0YIx8DtNlFO+sV+hvVuYBfrkBAg6eyqhgpU/wvYYGND3l3zoSeMSDg9l7l4zFubEiQJ2KgfYyK
 pyTmz6xPxFRjA/xaArgXe7Myn9oLAjlro1BkA1HWGpV6J01JqACrHP2WFgZB362UmSC6GxaZx7Z
 gkw9A2e1T6HpDQw4kKVwuGfCBnuTh7vySqCt7CUoCY+z7BUtGy+LG4A67WHJnyVJg4/hM2MFTfU
 FK91h5vgOuuNZZRKsRQ1+gW+Tby6Lpr8iImef8iJSN2jY2CTrI3HbDCJ5H7mSfwa8Nf7NQDGfLA
 rgoOdmAO6mfhAuw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8842

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/understand-autobuilder.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 23b3ef7d7..0015c2e57 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -102,9 +102,9 @@ roughly consist of:
 #. *Call scripts/shared-repo-unpack*
 
    This is a call into the Helper scripts to set up a checkout of all
-   the pieces this build might need. It might clone the BitBake
-   repository and the OpenEmbedded-Core repository. It may clone the
-   Poky repository, as well as additional layers. It will use the data
+   the pieces this build might need. It might clone the :term:`BitBake`
+   repository, the :term:`OpenEmbedded-Core (OE-Core)` repository as well as
+   additional layers. It will use the data
    from the ``layerinfo.json`` file to help understand the
    configuration. It will also use a local cache of repositories to
    speed up the clone checkouts. For additional information, see

-- 
2.52.0


