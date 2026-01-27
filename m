Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D2FCA6C92
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6072.1769502002870920830
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dUYzw0Id;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 64D671A2A6B
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CD31606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88439119A8692;
	Tue, 27 Jan 2026 09:20:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769502000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RZvA3PoQFjDryrOstIxfnm+KlmNzfk3C2wq1m8aqkQM=;
	b=dUYzw0IdNEgFYGEm2SKM8LJ5g/8fuAg7Ab3B+HdfDjsJEEs28sPMsarTtERYd0tE+MDbUq
	23bcuFcw7bo9+NPIj+eHpQVw3jRo3ngKpyVWkjZH2P7hRVCG/aEoQbCUsPiKjfD//W5UZ6
	203VVC4rfe281S3pZxHAP9J7yCgkk50VRFqpEaemQEXL3DscjyR9lQ9YLx/pb2rP5n5Rxu
	bEj0q6sXp60VdCFm90GLOE+KgHM4ucU/DyBlU7LGF03WaH/tSjx/UeC+aLl4KwJNPhU3Bk
	zRT7Gf2i6ORky0fL082hpw+J2LQDNZyZcaXGBGvK770s6081MnZq5/KCrhhd6Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:51 +0100
Subject: [PATCH v2 56/56] what-i-wish-id-known.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-56-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=s3WvyhDX8KtW3uxtea2+VTPZ2vfcQBfe33v2pAD43a4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUGSq1BHMrvi6VYvwj3CCZEldZaRZ5fye2Yp
 TG0gKgPo7KJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BgAKCRDRgEFAKaOo
 NmEFD/kB6wBvLdCNprg45aLxM2aiz6Kihbg8Kd69prq5HSg+yNleZEMtYczznt7e9VRJfoEf1Xi
 6WZi8mY7MAfxSQv+1ZtxitwTEMmOIyyltC2hBMkGgwNavEx2IYqumqSnE6NIzNzHaTAlcd2ESk3
 WY+NeE+QnBuGfNWYm4EC4LGFdvg233o19br/x43ST0hKRYNzl+/ummpehTgZiXsHAkZXQ0o8PQL
 did6+Ct6Yifkgi7nfVw2fI8M9hXX2Qks5xwC2c5EVGgxwx5z30nv1bRDu/VqoAC0rADfcFFyCu2
 8wlwyvaDZjJwrlkypXVsC5v7QTvP9v49vB02qwn+BE+3QJD1jc2N4NK+DztRcdZAywk68h393Yd
 n4PqokHUHHg0QyEDXSvXO/KN8WaLBIBLlzUuJkJ2Wf8TfFT3DohW/XnIXEnYmZVmVUnIV6EvuqR
 9bikWO0FLzf/SJ8Zaiaz1AlgD0o/VOWdgOeKS3wFnB6ffJEg4Lv3wYbTIQ8xez2/VYgBRVvdEAM
 Q1FNq5Lzz2IVogbdhuY8svM9i1DUdIGBV7cOm55C6iwWN8Xdem9riq9Bx7bOvJ9GRrPC6bUGWP4
 OC4i4UUxgY20+qZUmQY7PFSo3jCCqFPsI5dw6k22NvdnnyK++M5YMs2bVcf2vuS1pQgW8VMOF7y
 o+9pcn+BX78GkIg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8717

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/what-i-wish-id-known.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index ddee6ad74..36cf715fa 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -60,8 +60,9 @@ contact us with other suggestions.
    layers, on the other hand, helps keep simplify future customizations and
    reuse.
 
-#. **Never modify the POKY layer. Never. Ever. When you update to the next
-   release, you'll lose all of your work. ALL OF IT.**
+#. **Never modify the core layers** (:term:`BitBake`, :term:`OpenEmbedded-Core
+   (OE-Core)` and possibly :yocto_git:`meta-yocto </meta-yocto>`). Never. Ever.
+   When you update to the next release, you'll lose all of your work. ALL OF IT.**
 
 #. **Don't be fooled by documentation searching results:**
    Yocto Project documentation is always being updated. Unfortunately, when you

-- 
2.52.0


