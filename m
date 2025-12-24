Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF30FE776E0
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123732.1766593930245111663
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U3ckdI0t;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BFB391A23E4
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 968316073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3AF410AB1383;
	Wed, 24 Dec 2025 17:32:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=np3G/2jWr/x9RyTvolpNyi73VF2cRebSkTbQum2fA8Q=;
	b=U3ckdI0tBzjuDpTldVLKfJclzDQpyn8ZgQIF4nNlaFTPYHuQ57u0la5omm69Cu9MXxDf/P
	WT+3hSq3R6Tk5pmkhoCqNru4ew7YbMMldaDdQYlrMOlf+eAVIhll26FNaaSxm7b/wXtIOm
	K4TGtJKv2lFXEfl228X+32CKLUxnOASwFSu27jvqC6CsZGDaCuLbV25yrNAOhoeXF+J7+4
	fjINWntxUvaAacGlttCmY9DbpAOcrEjXPcHsdkVDusR2VR82vywtgAS1CSanbViICB8esu
	2cIm/GRJ/awMcErcMIKolaqjM35vhpZaWZNWJUaLtrpe7P+67Z9QMOIw+f4cJg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:57 +0100
Subject: [PATCH 31/53] test-manual/runtime-testing.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-31-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=jSCfL8jZhg+TJ+NO8yVMAlClRtA0a5PryuNSGR3rq/s=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVs9X274+aazACeiMahkmpIGfr0uBOyVQI3z
 99DwQRKKG2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbAAKCRDRgEFAKaOo
 NtAKD/90JmISyDLrpotPUEQOoUEKlfIQpWB7yI88bOClsIrJxHE3WfcOC3etUSZkK0Ok50uZcFn
 Utf5jXFXreir+KW/0wD5zKlOUWKQIoP+wijggpJVuKTvF8eXYXTjxIBUCUJMSTbaW8ZopP+WGhK
 TEOK3HdMk15ghiztbkfV1hPhQjeklryo3Z7+HqtOgXrutebQ6ItwaCuvSEbK0waDpEZXK5wKc50
 g6/2BAyNLjchX9KWCCOzEdEFAVnWbslM0SLiWusuTsV2vzaYysHwjE/cuTYZ3iTRCbln+C68HwW
 R3O36LCnSavIROqMiwkK2FClAr1GYBSdhIzb4yPbF9bXAWu0mUlEp3PIs7/EgaHA+ubCge+dbKs
 hIcfRtpLn9AP74Aw65FI8BSpwztZeiEVbzzFLhiSYxqHK2a9YFJXgJqHvccy37g/qad1UY8BxqV
 4TfyA25BSkJeks1gH98sAWFE98OC2XqMhSGQVOj2KnIeSLM83XBlwoJ+Mz8CZHL9JnRNfx1XG0n
 yUbtybPQjZAdV7ZI1N58daPkSXJqLxmvqPKpIZGm+rTVAWp1hCIHxXV4T6MMtXufLU7tUqW+k2W
 wu8f5385Qk5VdO4fO4oIR4m7guIE6ibpl8zayO5jmZWA7eZYxO/eH6mCACZB0mgfldrjdWxrJqQ
 qLT1aBVnFPWIUDg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8360

Remove reference to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/runtime-testing.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/test-manual/runtime-testing.rst b/documentation/test-manual/runtime-testing.rst
index 909448ab2..a64a97c80 100644
--- a/documentation/test-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -338,8 +338,8 @@ You can start the tests automatically or manually:
 
       bitbake -c testimage image
 
-All test files reside in ``meta/lib/oeqa/runtime/cases`` in the
-:term:`Source Directory`. A test name maps
+All test files reside in ``meta/lib/oeqa/runtime/cases`` in
+:term:`OpenEmbedded-Core (OE-Core)`. A test name maps
 directly to a Python module. Each test module may contain a number of
 individual tests. Tests are usually grouped together by the area tested
 (e.g tests for systemd reside in ``meta/lib/oeqa/runtime/cases/systemd.py``).

-- 
2.51.0


