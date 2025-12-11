Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6CAD41C0B
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 09:06:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5427.1765443984758295487
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 01:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yVKmtooE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06F7C4E41B79
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D30EC6068C
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CF18103C8D53;
	Thu, 11 Dec 2025 10:06:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765443982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/XXhgfMdf9AUqWtBK4xRnZ3CpJrpWVy4G2vMMkilvFk=;
	b=yVKmtooETHeHvuxHtO7a6yOSYL0PzUOH7vAjbFEmL39i7FPTz7jZ6fgxS5Zvy/tYXt2FTW
	Qgu1qeOTA5oTbmxoXY0kSYtvIEEEblNjzYNUXUuQ7wZUKbvaBXh9r9a30XxEudzAB5yQHm
	rLnBZxPElGf1JJNtu+fICziEErpQ4AkIbG/DA+mLxpTtCd5IzUrX3ZOEl5bSB24gJRF39q
	wgbWKeL4rgGuDJCtf9Sog57Foah6tcaMU1f0BchSlck1S4+R9PzW+R1iKaNK0XAKrFqIS0
	YEVN+qKzIKk6fRVyjIiWJuoxdE+GQrzBHEEbWTAyRHypiIZN5s4A9AUk2b/8IQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 11 Dec 2025 10:06:15 +0100
Subject: [PATCH v2 2/5] Makefile: fix rsvg-convert --format capitalization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-build-docs-container-tlmgr-v2-2-58719c103a50@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=d55uiSyS1TQ3i6uhiJla/F4j6h9L9rcgAYwW9aK5wcg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpOomLNY1umsXpbPJ6+AblfhbF+Lqp7bZCy774g
 /kqTIzlP2SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTqJiwAKCRDRgEFAKaOo
 NsP9D/0a1zxpdXUSmquW0KyaVn9W+su1F8nMia/OnLLmGZ8VYZgvBDqi1bsR68Dlmd1wuJNkPPs
 i2paxndXiLKeqQJtaArqPxyux3C5Uux7llh7X7znvZSFwO7fO3BI0O/JbFcwW3KguHx1gulq0lg
 CBS/w0GPMxpHBqKAt0mcxcqYYHt5YoL0sYhUmVFZLsvgTyosRE4QNDvGyV+JRe2T6TRxLnKzvFv
 nyz5JT19a1fLabBA25Rj61KQrymrHKHlQzvmSgBDrccWMXiSeoPcLr3SEhtgcR7eyO8zHz2vAVy
 ZeRzRO6w7o8huaFj28C4nSZQiq8N4+nbWIVMJuOz36C+zyqFnuzfcWCBf12yemTDyDvyVNgrQWY
 9AppQqYxQSrZVCLKkFB/ElcLoff2TAjfOn/N6H2B9ZRXoB3GtyUcPcJ4P81cWdSIH+lDC7CTMQV
 KaneZ/YaZVtZf3xaB/agUkJCNcPRchdzNC+rzZ0XC3doWnVRXGMO7I3ApzuT0ktdJzK6d8u/zex
 Y2dgmBSha1mcym6Kf4lqS1DcsvlbYlDEWbcsZtaGs6LkIMpUJTUkMptVHNGytrzgeZripdPrIIb
 Ca6/TvXktKHXCXjDz0/zgbUjDn37JKgw3XjBRmE3qnCYVbHyZZiEsX5V65POBAoNlNNTZSx+e/h
 Pi17Va8fCfMGQYQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8242

On some versions of rsvg-convert, capitalized formats are unknown.

For example on CentOS Stream 9:

  $ rsvg-convert --format=Png --output=ref-manual/svg/releases.png ref-manual/svg/releases.svg
  Unknown output format.

While the same command with "png" runs fine.

On Ubuntu 22.04, both are accepted.

Switch to the un-capitalized options, compatible with all versions.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index bade78fe8..e144a50b4 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -43,11 +43,11 @@ PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCED
 
 # Pattern rule for converting SVG to PDF
 %.pdf : %.svg
-	$(SVG2PDF) --format=Pdf --output=$@ $<
+	$(SVG2PDF) --format=pdf --output=$@ $<
 
 # Pattern rule for converting SVG to PNG
 %.png : %.svg
-	$(SVG2PNG) --format=Png --output=$@ $<
+	$(SVG2PNG) --format=png --output=$@ $<
 
 clean:
 	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst

-- 
2.51.0


