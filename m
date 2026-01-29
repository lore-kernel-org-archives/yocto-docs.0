Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54032D6B066
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17201.1769700262812687351
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wzTBGtpH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 492DC4E42324;
	Thu, 29 Jan 2026 15:24:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A8F4606FD;
	Thu, 29 Jan 2026 15:24:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EDD7119A8865;
	Thu, 29 Jan 2026 16:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700260; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nwZAw1fI/cU7zhrCsIvB3YieEQIhPoU9tsyVTd7R/Bs=;
	b=wzTBGtpHuHEhb1lt9XjAHIsOd56CUXr63Y4d5Lxajuem8gaTMYRu/yGu0PDuAI8PYCsgKo
	hBHmsaNr7EudK8WTGBOSlQPx3UnE7CP/ptVkJGi7/DWpaqIK7zNMuwC8Nv7S9+mNB3M1f0
	Hol4yB20u9a6JyEuPAiZlV6HsUBhaSWf+KsWjvjRsuuMRaJ9aK7KKRisUrJBI0fcodMczA
	tE0ItRPvq1e/SEySqy30ketpiUfs+awSvLQHZHPVl4MQfk62E8nGZ93Einxnygim+Pp6n/
	rs5efV5I2lizMeS8ti7dlrTXHoc8yoU1qfV5j7HreKvkuR3sXlBwvEZUpbdGVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:16 +0100
Subject: [PATCH v3 25/57] ref-manual/images.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-25-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yhKBxzRJ4I7sjT2yEEavNGBnCJ11sdwGukEhWYN31Xc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uNcIzdP250vMF22Df21VHyvIXAgg7etb49H
 FwRcCPAyVOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jQAKCRDRgEFAKaOo
 Nh2HD/9bfUUWTsy8juv3KoG11BrZVqYJ9/3z0AVhqmvjFmFRA6qo0N64QNnP8KKFJoJgKBjQc5P
 PdX06mUNUFIlcGBWXARlVCGZzMGI14A08DjngFL/AbO2W54PX6Q/e70aGN0T+AqnuJU3jMa0mmN
 PNA0ZvmzZfwolZ5b7LmKtLuXifFKSDsKypaw8yppqNJQoGmE8SSFYCL+pDlEJkfY+JwU/eKCoIo
 y1vcKWb99iW5ciG+hwxPVUKPteDcTzV4XscS3FOzezeXyr1KOW7nHtY2O22YKIJWvhSji0ZxLEr
 W+pdzu7Hvw/8+2HOIW1GzkuGy4JBEutQamBenmquC2NdmhHS9KXNDjXaODk3y+e+e7TKN5GDJJu
 J92dzsk7xtg/TGgoQjqjdOD5+6OrThIW17rva0nAOz0NP0n7P53jeg2AxYWtgu1HkPUUDphxxTn
 NON0fScWJDtSHi0ZpVyf+4P0l2QTRa3TmgUo7SLTSyX6tsDiNdC9dJlUWpTuavaPw13lXZBqbtB
 r+Ad3xYi9n5d+PUYJcOXs3ucjLd5iEI7sIrl0axtwfgUqsXBGksqLlv9bK3Us/wtISEZMJrwLQr
 CrfWes3miZO/aU15dWF0YMG7XRAWsCd5jDRfxu7oUH9TZVbw6xGo/kAHmHrPnInJRcKcVajODJs
 +PhTjn+HacQJrKg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8811

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/images.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index c9d898926..94e412de3 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -26,9 +26,8 @@ image you want.
 
        INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"
 
-From within the ``poky`` Git repository, you can use the following
-command to display the list of directories within the :term:`Source Directory`
-that contain image recipe files::
+From within the :term:`OpenEmbedded-Core (OE-Core)` Git repository, you can use the following
+command to display the list of directories that contain image recipe files::
 
    $ ls meta*/recipes*/images/*.bb
 

-- 
2.52.0


