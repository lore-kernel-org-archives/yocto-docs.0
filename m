Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE49C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:11:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41860.1789139512552826491
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ob4drZn+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0D431A01ED
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A083C601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31D6711C7AFBD;
	Fri, 11 Sep 2026 17:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139505; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fz0z7Xy2gWEQkdTpbQJpzMuScbS8vS6EOT6SWrLLeUA=;
	b=ob4drZn+BnFdbTLEPNoymyhtWyA9E6l/Re410gI2XgT3Y1qA3M+lJFCcV+jivSzC73Ro6p
	nDg+uAxQ0UzyCIrKOm23y67532E1/RJCgrW09zvTE/hzS0mwZgZrdy1TAkNOnp3P0qUPs+
	OSaYVMFEtUfVeIACdfMY5f+2o8gY8cmMyNyALbqhDrWGEIzt/MYDn3KGKyFQ51OtA14D4k
	61N12MhRsuXfZvg/6inZBxvtKsOXUBvY2tdlK00TtT6hKC4rBGniytxSmdJ9xCTkMsMlxF
	Bv+SOKKLLXgFq/8bVbVOnkitwF2fzsPDYeupTC+RYvn1ylYyaJihpLerAMsAKg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 17:11:11 +0200
Subject: [PATCH 5/8] dev-manual/wic.rst: remove local.conf mentions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-remove-local-conf-refs-v1-5-322e1e9a232d@bootlin.com>
References: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
In-Reply-To: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=z6mVX32MGSMlqjdkfGSDm9wSwu2BSyZuq2dWQAbBhco=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBoXIzFuQQ4MI9Niti5C2JeLMnP1dHZJbBzlx
 mDSrjhRLV2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQaFwAKCRDRgEFAKaOo
 NukwEACqkK0Q4uBqrAwmbzcGpXHb7B7zcieu91MjFAc4cZJE2csqe6g470jZqDtrHI4Hh23GNrH
 CA4NP5T6orLXmoKEA50/yhO/S3pCXMaaJYuucjpxUzIRHExNcKcBoIkOlQWTfB7neEcd0JxKZWR
 D/O3cSxCq5crfOGxAzl9FoXk7jKVf8113khs5V5PkPjZnFZejuNgZu+snVeeP9RmZzlMHejigoQ
 tzP4HenBQQ413orV6GS7mgnvUgvPqdByzmqyn2BB+df139pNhsEMa4UzyMfkHEcacMdnLMens3Z
 BAMs0QJILHAxNRmjnGgJbKZUpJSf35TAeJsKWDtU1ciPWJ9qorh3UxF8+HVisSDJ4AcZfKBSk06
 TWEwj8MkBXhPlRGkPmG5M0d3zJHBqwcufyX9uBY3Bt0TD19fcufzOku8qz5U280yET8s4nCNK1O
 0zNh/3wIGtkHEdn0OaPuOfNczqOCwfyye7rBK/tdCx5CTUySYN2K0MNR9ofqQutMq09vMhPBD01
 ez0+yOi44jBq2/tWBVdC02O6+DjbEP3vN2X00gCCqpUnv5hr/tj1UWXca8XUUGBXzDLs2oJYiuF
 9d6N54ISer4BUa0A/gadzo+eD8YNFKcxCnAsXSqscvKd+NMY0PPaM1fk+/R49ES1RccFHT8KOyV
 +NT4TPhNoWzqt9A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10474

These mentions are not needed for the examples, remove them.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wic.rst | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index bd3b5f697..c13655f87 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -530,9 +530,7 @@ file:
 
 The previous example shows the easiest way to create an image by running
 in cooked mode and supplying a kickstart file and the "-e" option to
-point to the existing build artifacts. Your ``local.conf`` file needs to
-have the :term:`MACHINE` variable set
-to the machine you are using, which is "qemux86" in this example.
+point to the existing build artifacts (the "qemux86" machine is used here).
 
 Once the image builds, the output provides image location, artifact use,
 and kickstart file information.
@@ -608,8 +606,7 @@ untouched:
 Once the lines are changed, the
 example generates the ``directdisksdb-gpt`` image. The command points
 the process at the ``core-image-minimal`` artifacts for the Next Unit of
-Computing (nuc) :term:`MACHINE` the
-``local.conf``:
+Computing (nuc) :term:`MACHINE`:
 
 .. code-block:: console
 
@@ -680,7 +677,7 @@ default output directory, which is the current directory:
 
 For this example,
 :term:`MACHINE` did not have to be
-specified in the ``local.conf`` file since the artifact is manually
+specified since the artifact is manually
 specified.
 
 Using Wic to Manipulate an Image

-- 
2.55.0


