Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE16E674A5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:28:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79093.1766406494033247497
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zetQG2Le;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7814B4E41D33
	for <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C5BC606C1;
	Mon, 22 Dec 2025 12:28:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0C1E10AB0263;
	Mon, 22 Dec 2025 13:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766406491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9zYdTyggSWGkZyPe2ud87jrsrl5xT6E6j7x/PA15ppg=;
	b=zetQG2LeePjEDNDHWpg2tX5CQHJlI6vGBdPNXkFaHAE879tpAkQOGbuw/uyf0skKmbFCx1
	AspxvO0BwyWpe4Os1poA2nLx7YkhavXILLuZkBZmwNWPfx2wy4oI5AHF6axS6ZfewWoX70
	IsNNjIjfn/MqCtbPE2G1sHFA7O0DlxJnhpG70mMd2qWwL2EHzwvLuyWIh6snCSbEeVWben
	YH2cllWDjmSsWIay7rFRjm4pDVqPi2zWnJufSxnscS9dihOaQWCFPy14wR8Xed6DHdjTQd
	xo0gQY/WpZSvdoB8GSrZsJXhu2//r/riBuWS+TYK63E7PqxGdo8C9aODKkc7Kg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 22 Dec 2025 13:27:48 +0100
Subject: [PATCH 2/8] Makefile: allow to specify build directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-concurrent-safety-v1-2-e3d86e44cd38@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
In-Reply-To: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=874;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qrXvZHFPd4B6dDJcZ9QM1mrKX9YFsdbTwoASRapGMas=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpSTlR6av9+RQq+x8P+sOeMmuuHRcDBZ94F/9mn
 PIV+5BmW3+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUk5UQAKCRDRgEFAKaOo
 Ns+zEAChdNDU6ybWR1nNGXIwEHvPtdarchbcjt7BPrI6X0HFhj/AdACa96yrX05iedhnliC/hGz
 XjuBD2jGVt7adbsjWOctfXGKJNjz7k2H1PdeUGnoNUA0f7uDxy9rbEnBmMSAJ0ToXZxwMbowNEO
 /uHewFt0COmJ6JQJ/Kq+QPfMYQco2GOpaqGoAswdAf8mOHiNCI0n+rjXUFzOfE1tiLTbVZK1g1X
 RvJfE10PjcwCvkogVKCbYFMTugSEUuv8Gn6/M44s8+U3gvJlGhHpHp1lQ/O5i1hrhYqCb1OD7S8
 SR9ZD8BTr2SNlHV2vSm2KHa9X3TnYZHZOxnnk/fOKSbQop+pjr0uQAbl4NxRsK+8W0Z+Pi+q7CH
 MeSAANbHVMs5y7lEuSKcoyUewNLm0P6TiGW2hOIcJmgN8fWD2WobSHvlPvqqmpaTtHEOgC1IX9z
 EFs3e8dxg+1D/ZnWVXdopjPMeGYhYap6dTxyQP/SXk5H/pC9C2ZGka3IQeq97C99dBjteATaHYZ
 2stwzRgpwnultLA/kWhr2MbD0dFx5XWN24xOLJHU30oWkdHP/yiiXviX93V69VTrmLT73FuCGAY
 JVTYGlw60N5+1EfGRJgnx+sWWtRtl7YnkSWtafg+sHB3dK4NWG6ZIEm+7Y3meNTF+H7YivNu2fc
 U4/w+feSa08dR1A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8311

From: Quentin Schulz <quentin.schulz@cherry.de>

This can be useful to compare the output of two runs or separate the
build directory of 2+ distro builds from tools/build-docs-container.

Note that make clean cannot remove BUILDDIR from previous runs if they
differ as it wouldn't be able to know what it was named in the past.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index e144a50b4..5f84a93e3 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -11,7 +11,7 @@ SOURCEDIR      = .
 VALEDOCS       ?= $(SOURCEDIR)
 SPHINXLINTDOCS ?= $(SOURCEDIR)
 IMAGEDIRS      = */svg
-BUILDDIR       = _build
+BUILDDIR       ?= _build
 DESTDIR        = final
 SVG2PNG        = rsvg-convert
 SVG2PDF        = rsvg-convert

-- 
2.51.0


