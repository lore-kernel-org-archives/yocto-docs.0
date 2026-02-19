Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA96BE9A04C
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 13:02:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13212.1771506167075561581
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 05:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ecxuIncm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 230091A072B
	for <docs@lists.yoctoproject.org>; Thu, 19 Feb 2026 13:02:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EED395FB45
	for <docs@lists.yoctoproject.org>; Thu, 19 Feb 2026 13:02:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BAE4102F18FC;
	Thu, 19 Feb 2026 14:02:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771506163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=FF4kQpNNtCjgZzFv6bcMLvfTaFKmN28ndCxAeXyJX6U=;
	b=ecxuIncmvDUcRWmpGnQwy9nTZkk3uMe/V3PKfcQqEFmHSsJIeRRCsik+on2f1Pisw0tIGq
	YcUxWsE55sGF9ddWThVK6bMk+0lwSK3G/7TnB8eTMEF3+OM6OYWptTGyGGt26TgL6OQAJa
	Ysz7W8h4ji4Ub2nqKOdRqWsNb6eqA7MZ7MlJXJl6DFwL+5ifdo7WSBu1JzKxZpALoDZ6Cv
	3ZBLL7xDw6OywBPvM5UehZVZBvc442EvC52p+uu1zebW9BwGg258cVxLzJ7y4MmmAgzgQw
	EvK5GZEdrXA3Df6dEAhhLfh7YT6p8h8WeI05SHflUu3L8kEA/pv0FGtOQu7fkw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 19 Feb 2026 14:02:33 +0100
Subject: [PATCH] Makefile: pass -silent to latexmk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-latexmk-quiet-v1-1-acc137bc88b9@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NL3ZzEktSK3GzdwtLM1BJdc+PE1DRLS7OkNDNzJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAJyCO7dxAAAA
X-Change-ID: 20260219-latexmk-quiet-73aef996bf67
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZyYbHbV1fJkxN1ELC6RUJuf1/xpFjDHV1wM7kzxVRUo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBplwny416MWuMTcNNRq8waR/Ho4YjgkQia5AbuQ
 ezDE6WK/YyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZcJ8gAKCRDRgEFAKaOo
 NoZ+D/4vfiHWbMFq2Yf1dFcQi4jNk9+hw5+H42zaXOtfQaEgIu8eI+MwrIGaUMwy7WaW330cst0
 qlxREYiRZPwwcu2iwu9mC92S1b5AKHYA5wMQ+dmk5Fz5H2werZsaftPgzbExBiPuXgIkyPk8Fhg
 v8Jutx15yG7u1dvIfMp6AjuyDT8qWO3ml/pOOPuzewlZC+waFEwIEIB9kXmO5uobjk3fpL8iz3u
 +5/lseNiztBR6oz9jdsaGtnEw4k3dXYzfnPTKSaxZF6RexGMuCPbvxD6jGVtQq6EFQDgfDocJ98
 kywYe9ixvQDOhAUKs1yDTEbvuKm88XZ+oS/DZ0o7PrdyalWwHblCXkvKnanP46Lzna4mZRT90Vw
 HWPIPz7WMSIaaGjlIZWupeB2mEIMTf4hPA761GcV29B5aLgSakjEqiTJ8mfimLwyeOVMXf/mPcp
 TRZFH5j1nu0QuOnBQ02wqEyVpuv7nMattAySfkMmmu3DPbOCpL0/9CgBK2K/KYJ/h1XMf32yEa3
 iGXMdwg7Ari+ZQw5apLZj7QzFrwVInJKSovtc/hcecesBgww7+yItMeQX954rgagpZZrrBiWUTR
 onWsHYtyDqVzAnNNv5hASH4Fjl2W1EdiyojTSdkxItoEnRmEg/0FwJPIOViKTMMn5tB1VYY0xnA
 dq3bFynPMYcHX9A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Feb 2026 13:02:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8948

This should drastically decrease the number of lines in the
docs build logs, which currently can go up to 1700000 lines on the
Autobuilder[1].

[1]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/34/builds/400/steps/6/logs/stdio

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index e144a50b4..3910c41e6 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -71,7 +71,7 @@ epub: $(PNGs)
 #   Unable to read an entire line---bufsize=200000. Please increase buf_size in texmf.cnf.
 latexpdf: $(PDFs)
 	$(SOURCEDIR)/set_versions.py
-	buf_size=10000000 $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+	buf_size=10000000 LATEXMKOPTS="-silent" $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
 all: html epub latexpdf
 

---
base-commit: 599e73c6d925562b7c4fea0429ba0281d14ad4d0
change-id: 20260219-latexmk-quiet-73aef996bf67


