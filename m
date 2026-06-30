Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF51C44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:13:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16459.1782807203748717457
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 01:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AxCS+XfZ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 171534E40BA4
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1B8860233
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D4D9106F1CCC;
	Tue, 30 Jun 2026 10:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hTC/O8kQFh6cxP3qyjpBN0NLXZHreijptAS3MNdgiyM=;
	b=AxCS+XfZW4nfLn6TLsL28Old+UpvzguRe0hOT8wVHQOFKHan+ckt351K76rUyAgmrk3ckM
	cvfSggajiB0yQRlqPSet/pyAA6/OdO0fZpSzTzrpErH7vSrChFfW2rsNAncsi9kJJ1Sz0g
	yaKyoHPjVGPRq99fHABNZuZROj+EwbmWhUlnfBr0u9Xi0TZ/XMvkW6JqMugJgsmMHzwZnr
	kCoccC6c0HlplpfVzh5jHI1rt6FQ2w1JnoywrJCtZ8pgzYjtMM7e16KJz2hfhfRRyCo6f9
	b5VXciTKsYi1JO3CfG1PCpYJBnEXPMMesDnZMcOP/YAH0hoaNI0wiJTIxVGPpA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 30 Jun 2026 10:13:14 +0200
Subject: [PATCH 4/7] ref-manual/variables.rst: document the
 TEST_SERIALCONTROL_CONNECT_TIMEOUT variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-sync-documentation-conf-v1-4-da14b40cb515@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
In-Reply-To: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5EjJHqI0sFfOgrKinL6b7YseUslTVJUX+czf65Si62Q=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQ3qc7Ce8QHazRoWHPAq23H4RsrxYPahpPhYid
 Rk7zQ7O7ImJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakN6nAAKCRDRgEFAKaOo
 NotfEACRcAg021B2djeX5hr+RAXluBrBJJi1qQkLMKLOfD6S/tMGfuYA+eMHzSX38VeSaot2BJe
 GR52vPzZfx4VSqNEEHufxrfJWszogaJzgspxONAIXC+NNFNCZ+QZA7OqDTfcdXo3WjouTE6Ze8A
 rCm8Gk8QcpMfVOqPUDUlc6ERQl5uq0sqZZkf19rBokrvcwUlGMesMtxcI5GOEgo8tvsecoDC9a3
 0MBMn/J+llOZ1zWvkoA0cocB9cYOnkSpPRGrwKasXJEOayT+jfm/CbHK4fbuLpyjfIUNJYM7LRV
 DEdD/tc/udg8b274Avit14un+VjzKEZbCwv1TObEOgq3DLI3wh3j2li3valVuMya2toSkcGZf/u
 8/GAM8yc4zpVIN+dDd+H0bysMwzcyXG4mUqbxP5S7xU1IZWlSUSIbu23Ur32VvYneyyRPzhz6Hf
 GtXRzoF0Hc5W3UhCZXCdAymD+vZd6AQuM/ORvEYvgyx/b4o52eqLTSD4EELZGXB0B5JyiMiHyvY
 7FdCK75HlL9p0ChbbjyU2EZwZePZ3J0eOfBptMGgIk2AbCzWw12UxoRBHiF/NKZOclOTIpl+Ax7
 AKS1QDYvPL6D3IEcWFGBnVaDcqHcqZL8ueSjACSpxeBvNee1HPIU7xriWIDKIbWaFNWLpM1Rowb
 hKEq7/Bh82nGk+g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9987

Added by commit d817b27d73d2 ("testexport: support for executing
tests over serial") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 64e329c07..231f61d37 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10978,6 +10978,11 @@ system and gives an overview of their function and contents.
 
          TEST_SERIALCONTROL_CMD = "picocom /dev/ttyUSB0 -b 115200"
 
+   :term:`TEST_SERIALCONTROL_CONNECT_TIMEOUT`
+      For automated hardware testing with the :ref:`ref-classes-testexport`
+      class, the :term:`TEST_SERIALCONTROL_CONNECT_TIMEOUT` variable specifies
+      the timeout in seconds for the initial connection to the target.
+
    :term:`TEST_SERIALCONTROL_EXTRA_ARGS`
       For automated hardware testing, specifies additional arguments to
       pass through to the command specified in

-- 
2.54.0


