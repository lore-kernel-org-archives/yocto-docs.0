Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1037BFB44D9
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:29:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16700.1777019348266762947
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k+pkICnr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AAE0D4E42AE6
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81372604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92E181072073F;
	Fri, 24 Apr 2026 10:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YKSMI2asJtvvC7t4xDWFe3x8s1nMrZfhdXk2BHHPZlE=;
	b=k+pkICnrjErNtdX9RIc2w4l8I7zuRHkX3kEEQ/+WLXup8JK6/XY7dUerwLLwS3E9kvKf7W
	cbvaO+TUrJcOZZHHy82yEfVOGc+HxSp2FIse5hrNK0ECYo8bqQNO9W6JNbIKMnIjGvE8qd
	S+6e90Y7ZEI8ZPH+i9ZY/RgQjKSrmKkOvZDCwJL+qLAEw4FyWl9LYx9DW9/Ny3XpTjvb9i
	bpOksHcVw+ffNG6gA3jKBz8medYx5WofDibEQPYyftV0HL3XojGrdjm8OrzOeeLnzzi3ts
	JkKSID2JOjJZiiP6H7w1vl8//K81JfN1BwAQJ1I56A22EuuMlJp5fuWWZ+rDCg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:44 +0200
Subject: [PATCH v2 16/18] migration-guides/migration-6.0.rst: mention
 python3-roman-numerals-py rename
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-16-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=969;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=erZjh4M0WyWUZqhUXROcLPvXmXLaozyQ45grFg6BM4s=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym/mjIiPLRiWlxRRg97TfebPS3FQoEPptuUu
 PdBt4qa5I+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvwAKCRDRgEFAKaOo
 Nqm6D/9LYa2W9EVG9ALUNMXpfhUF1Ju1NdjBUVXaVr4iRZZJ6IkATAZpv5pQLV+Sm2ckpsDPmXG
 dwOTswjLuN3AUQAsDhCzdUORTt+71pFGJQFcCQetEIsigfj8UYQ/nJl8H8jYLscqzyT1ZKxuqCC
 mb1kIE3ogwiI+k4jx+h5g5+MSKSMyQC07qVjtE/2pP5ItmzAEAfwfiRUB3H92BFNI9zFELYL4jM
 2VR5hjEuA7RMuQ7vZ66HppBpeQk5oZvN1N0uX5Jlb4gxgkjF+yQEb7bKucJ3V7b+NepodcL4rsy
 JVO5UyKX84ffZapSVqKdtWo7BwwI3xA2Fot/6+ov+9zUCUadWWNbfHWJDp0RCB76KnofA06g+v9
 ewLDX7B5ay5lTDNPa6Dj1jWWlm1QamAp77kyB5dlsyP0jd4GsK/MXqlXeiHrGiwL3RekhRVrxNY
 ePRWZlQR+1eNZBWDntTmxmLQZh7avbT+M14eNhLHQ8MamzS3UWxfdu/UcmLSfVWcsvW+VXwqtZ8
 N+b+v57cbmNsjfOYuNvfYIOE6cAekRPAsoBm8UpwenLeJ4pVT67nYdW/LYmBhS2Aeyz/TqM2Kwz
 IJ7vR7nckJyaa+y6oyldVZ3DQhVOQWC+v0jp/6ethhAi2jCxcfEN2x3SH9N9Rd+ck+mVVIlyabp
 gCffvP/InKm5XJg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9354

Following faff756e829b ("python3-roman-numerals-py: upgrade 3.1.0 ->
4.1.0") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index ecb124a93..905d52fae 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -489,6 +489,9 @@ The following recipes have been removed in this release:
    ``cve-check`` class removal as it was the only user of these recipes.
    (:oecore_rev:`00de455f8d3aeca880129d23e8cfb7e246404699`)
 
+-  ``python3-roman-numerals-py``: renamed to ``python3-roman-numerals``
+   (:oecore_rev:`faff756e829b852724ad706051d6a771071440cb`)
+
 Removed :term:`PACKAGECONFIG` options
 -------------------------------------
 

-- 
2.53.0


