Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A977E776FC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123211.1766593938578705639
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HIJI/ceo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E119A4E41D8F
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7C9A6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F185310AB1374;
	Wed, 24 Dec 2025 17:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kWIHDATJke9Nt1ELfsGrqORG16eOhr3tBHpWXY9OQOs=;
	b=HIJI/ceoahNmjQdAFO4KKF60acjetDHnNDklzNf6tizCO3e+GMsTyDq6IltQ3I6JwdSyrr
	kfoo617wDcq9te6TmRGdeUEeaMyqWSqZ8qwO64hRgwmmSqiwdytwHmkGrGgzxdk8r/zQ3B
	k/Yt/uZ2xGrxxm7JEeWt+R1ByN+N2qfQ8Z5W2zZO2PYJE8Jik042ve5WQ9NYEr60COI2tx
	eFy3N5MSDy/OPLoYn+ugV3sTYuI3Q+Z6uzzGiBicxn/wsUrfqQaBwGBn3V4Nyhm9QRpcpk
	f2UZDUxkhYiQfmg9UyGnxNmWLrn285TsrqjaKcK6co/H+u+gMtaNAwUgPlj+lQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:07 +0100
Subject: [PATCH 41/53] dev-manual/python-development-shell.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-41-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1Hnz67XNcNyBn9pT8rZfqmSl6GHmXl5U7hQa97OuKyg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVuHR3do6ZHFngt7FUs8K7ClFYnsUnd01cbn
 fxNwqkDnseJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbgAKCRDRgEFAKaOo
 Nr8HEADJV9KnvFp52bFJBpHZlehVCBcnOZ092BlJOekOeimR41U6Zb3v6w4ddKr08GrQBV/UVGy
 W3AAl+nISKPg3teR0NLtSz/vZx2AvQpC7F+Rc2YeH5sFN5/3QrN4Y8czRSRmFDxsqizpIQA6gJK
 PXKsf+0y9Xiw0oVFtkA2Mule0WqjjzipNkI0F+gweMLy+0q9dboiuODij6Lg6OzP2weGjzHwO4Z
 GkE46UqI/zOWDthnMsg4xU3JjdqgPP6tda8z7j2KOdpCxviqd2Hr3ZF0nBnMy4Ievavgjalm/KJ
 2iceJl87ZtNj8Y23BAK6l2WBVK2QAhZP6Uq7dLrgGRQy8gYUXVufxUo5ZldEYdW8zdKFfYn65/w
 uPIIAIOlIaSXxbrSGD+DJUtm+A3/J0qO4KVnxY9l8XNJu9k910ZGFW+jY6pwWOrYXodmJFFTuFR
 z3E8ZelseQn31OJEdka64NW0oiRhgqdROMxdsRQOdGWEi3Pp6Q9pVAstEgxZjkGNefMka5Y2cAA
 N/vVkv/eMM9LE1ePy7OjcyYYI/GNE29Tq1JwvK6GfWo81OQa0pefFGG1tyrJy74mD0FfEbmda4c
 HK1Phb7lSrXQLxAt5khm20v1KhBi/JNmcIsGgMFaoLA2Q2e8gGaweOnPK/rnYTl4S01QnzwpclV
 sLGc/OlUzmfbAKw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8370

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/python-development-shell.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/python-development-shell.rst b/documentation/dev-manual/python-development-shell.rst
index 81a5c43472..e03d2a6032 100644
--- a/documentation/dev-manual/python-development-shell.rst
+++ b/documentation/dev-manual/python-development-shell.rst
@@ -16,7 +16,7 @@ the following are useful when exploring the data store and running
 functions::
 
    pydevshell> d.getVar("STAGING_DIR")
-   '/media/build1/poky/build/tmp/sysroots'
+   '/media/build1/project/build/tmp/sysroots'
    pydevshell> d.getVar("STAGING_DIR", False)
    '${TMPDIR}/sysroots'
    pydevshell> d.setVar("FOO", "bar")

-- 
2.51.0


