Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C41E776F0
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123217.1766593944492081450
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZcxLIews;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EC8AC4E41D91
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C472B6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24DC510AB1387;
	Wed, 24 Dec 2025 17:32:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vbiMfS3FE6ZuPuCWxloWB6JlT+A3/3vvaV8JMxs0Zgk=;
	b=ZcxLIewsK+kzYMd063TpnPOJaEUtT7zwlf/eq8nARIsXIH6PKrSDf28PNH26D2WyHhxc0O
	fvBIb5KDNynG/xNsRo3UjGMNSkInY+qWUUH4177ZnPOIJjNlTigOEQ6yIcyxZPDkgOKXmh
	+NMLe4a1mY1/tDhE96f7QwjeLqEANBgGvfVnerttDDQVH7hlCv+4rvv1/VA0NHF2fsFQpv
	smzyTOFy+UkKPEslRVNRCTvvuLSkBd+ZaYHB9nIUOE+5LK0RXXiJSUXYhw/ShNF7U7+PAH
	sEq3iJ3fd4J0njOGkIWNuted5hHtIiEYiMI1JTmFLs0I3ij9gcs/fwFQybZjyQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:16 +0100
Subject: [PATCH 50/53] ref-manual/yocto-project-supported-features.rst:
 remove obsolete poky repo reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-50-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c3m+eSvsaW1zYuK4Fn5y6kHIhCKarhbH1hWV0Px7Rcg=;
 b=owEBbAKT/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVwvntXFDJv6ax00XUmX2Bs8c0/2tklngsWZ
 Y7Am6dQFh2JAjIEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVcAAKCRDRgEFAKaOo
 NtDvD/dEEpxSG4dYlbISIhvNmcBkdqmF9vjOzC48szWI0bQZN/rJaoAz+T7wc3iAE9LARaRkBdM
 dvT+r3fGqbJnokJJsiXApNCwCDe4vd3avZzMjCcjr0QnBcBNaheBdNc7q3G9iCd6LzYIgTYlwzO
 GRKPa5E++9gMR/p80emHcNq+Xz6Rs6bag35fDyp6MgM7KqQCRkEddvQzfh4WR/VSaOCNz1NsSVO
 boUdt1xg/ziqg4ydhQPqpodeNfh0e3UewhKvcWzEOKkAqt3ydDBlb2fDAKFc/mLVbSpWFNUjNcq
 SVytH3BgqOdnmVYwFOiGGwej08AKFN/EFv3qDivd1A9wIITBrfBLph9Zp44OKy7WkdRWw44aDEA
 /eUylHQGauVgil9DWTL6Ch4cahOIFw8KfWClourMKFvRMO8bRcLeaA8j/0x8ExtcXhSJGm6+WEg
 y9BOb+eqkm1onUFO1+CFUn/RXLm5hLFa0/PztkMnLMQ4OVtem6gBoxc12A9/E4UTf1ThhamW/zU
 2IV3yrcf7hlDWVNPSVRS3smdkmrtDx8Jxwf3oXlBef+bbbkbsUMVvWMpn1G7UbFF1B1d0+ejmy6
 4zOIh4dWYA9fc4YKgt7owsVqRBPLlAKfWSvPYfcrA+Jl9Hy8adc7ScYSI+CnxDfxIEQ3myCdR+Q
 ZgGnAQZ8Kdg4Y
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8379

Poky -> meta-yocto link replacement.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/yocto-project-supported-features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/yocto-project-supported-features.rst b/documentation/ref-manual/yocto-project-supported-features.rst
index eeae6b24a..021fca36b 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -59,7 +59,7 @@ Below is a list of primary tested features, their maintainer(s) and builder(s):
        qemuarm64-ptest,
        qemuarm64-tc,
        qemuarmv5
-   * - :yocto_git:`Beaglebone </poky/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`
+   * - :yocto_git:`Beaglebone </meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`
      - Beaglebone image and SDK build testing
      - Collective effort
      - beaglebone,

-- 
2.51.0


