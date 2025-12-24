Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11524E776EA
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123742.1766593942632902171
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L0bYjBWw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D93C4E41D8E
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E98AA6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6088C10AB1377;
	Wed, 24 Dec 2025 17:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a04Tfue2Xvmq0JNgEzmm1iAsBMgHcNowRjo8vrqjLsQ=;
	b=L0bYjBWwBzU/Xx1IITr5KKwNcRcp2q5/r7QE+RcFoQhhgdTT7xG+kD8rHzTI57kD/7XT1A
	EqXnLD+kTOAjwy8D32/F2beGG+2r9Vi3953Fp8tPPRYCo1B+bpw5N0w5wp+HDaVZidzt0n
	Olh5hEnh53+wd7UksRv2L/kF7odeKel24CHjxKU+w8CFedHfYDrMifc8hnv1QmXLeM8rdJ
	32G3s3/Vkaats7oMoggFjL76lDXXLwgxB0FqSHg5sRke869Dv7G4+mQlTrkDaW1ShHO4BX
	H1F2vkXiI1DsZ1TmGLFfCqi+T4akdLWDF6EF+dnhGP9uorof22pjGtFCRwAThw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:13 +0100
Subject: [PATCH 47/53] ref-manual/features.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-47-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tk69mRejmnYqmjmImzWP9Z8jwxVIEeZZkWqVFiLiveg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVvNmVOGu2hmKFVA/FFnFPmFbm3aaHHND3KJ
 MUpdDHW3DWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbwAKCRDRgEFAKaOo
 NqbQD/4xEmNdTSr+doz3/XVxU6vcLJtQPVzD++spwE8tzb+JQTABBYR8AY3F+IdnZUJNb7lyR+W
 S0ZvkxREd42EpRtxOlzv0NmHgQqR56tYsPoeEXIDSUGbL6VfWobNY8QM4BfBLQY9w8fG4id3kPD
 TMUdzrsjEfm2VRkjD7K2d8Fdve/7jAFcU9ewiEpp5cx+ODqV4lBBz2WrGIxKCeS6xiZTRsJqrmo
 t0L4CN3GRmYDGpCCEzKjL/u4fLZ/igPT73GFbRmEp1FypykKPTjhqnszc/15CtexvqjUKeN9rE0
 U6fRc1hxPTneq7SDjp0CZQINxUkpkh9Hj4MSEIDs0heh1R6PV/H879FqEX+aW0Flm2uBLIV9nDO
 sAgL5Oir1kgPi+ckCamVatkxWYLPKTSqMuJfMN576rvGWHifqM1KgcZK0b/COTLB3LdAvkuHZUY
 YqkKOlMIr/ieMjqgcu29noFtqLai+bWFEvDg8kx0jjeTjbcRTsO2vVBPOZ6W9xyyxJcUCAFI+ZN
 6pQ3xZPCimW07jpujNJTbkPWUVski8P/J0QvBKNdaAc4jPhlCZ+gFvcXvZthsAJSuBep6PXoZT+
 AWvw9zUWXrGhYGvqRkNIAlKOVt83dviWV6SBRWg/h4ZGIiiJLiWFeH6VSCja74qdPUApU8MBj64
 VkQOXy4lBmxVoMw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8376

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 40651a4c9..d59c53b0f 100644
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
2.51.0


