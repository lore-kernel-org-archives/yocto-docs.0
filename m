Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0975ACD5BA0
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 09:04:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19659.1763024646132443153
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 01:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EI+FrBV1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 884EDC0F57A
	for <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 09:03:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4012B6068C
	for <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 09:04:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 373D2102F21A5;
	Thu, 13 Nov 2025 10:04:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763024643; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hvZ7CNnuy3zhci3lheOqLgl8WL0EAPHwz05gYe+wxeM=;
	b=EI+FrBV1sjcsd/GZmIWM9NSUDJ9mWetg+2276BvnaGfK+vfDWYt5ISbfyIf4cmPhWKudio
	g368gNwz10kzOBOVjN/HAlAF6XXVN/ba9sETuQBgb2vmPodc/M+SmPRMZRNAj9G/lsuaJn
	DCrGja1EzqiJQolA64PR2oLOO2NgQZJtI63/odlAZ4qtQLt6LeHkhUooMzlr/LfmaphP7r
	Bkfba/wl3oTJdIneR1mLB2zBgpE07vHARe6MHr9m1pHyBNl+Ql1r/R89rXy830WCh5YiD0
	VINjFEQVx8lSh3fMLQkxREdkKYxLZvEyaEQ7EzqjtTvTYHIIPLGhWCJZwyagOQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Nov 2025 10:03:46 +0100
Subject: [PATCH] ref-manual/system-requirements.rst: add ubuntu 25.10 to
 supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-add-ubuntu-25-10-v1-1-092133ab6d40@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPGeFWkC/yXMQQqDMBBA0avIrDuQSRosXkW60GTU6SJKYkQQ7
 26qy7f4/4DEUThBUx0QeZMkcyigVwVu6sLIKL4YtNKWiAx23mPuc1gzaoukkI3z6mPrwbxrKNk
 SeZD9Xrbfxyn3P3br/wPneQHc/vjGdAAAAA==
X-Change-ID: 20251113-add-ubuntu-25-10-e3cd0857f347
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=CjPx4nNA+2ZeRS5yPyAo5S3trAHcGSL2QGxKEpVW5N8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpFZ8Cf/SSXt+Gab3XMM9K8GRJWqRvgq9MyNEem
 xSzM0xyh/6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaRWfAgAKCRDRgEFAKaOo
 Nt5sD/4rZrmHlGN8f6T3hpH32qDMFJMXj1OH1Idde7ynS1WSrHg/ASsX0Mq1YVzyqUNZGbfnULA
 Z67V1Xhj9iSigxbqiuQp3PeFojo+6Gg0GpO7SUUSCL4qLZiK223EOKkwb2J7jNORUGuUsW0nZ0c
 2x8V+l5d+QYraznq9qKThCgmcNJLGYP+FHu/mtG+4w1JMlc4C/LrJ6zMP1d6qowrBK9xYDMPd3R
 FT8MnJV0IimBaao+DzaZ9nSHNpr23VPzXTKe9RRF12kMD9tj90Y10xJjci97a2PpRBIUQt+trzr
 lAztLVtFGaHoPp7TCK5pq9iovBRGYNTO38Kyrnt0odXCbh8QVY7huUiH85z4cvjA5+5txzfajkG
 W2x6FtJlSwSdyGGO+n+DGGxuawHu/l7x2iUcofdUwL07Kwj+eBfeYrZq7/HA5srQ4Z9Y4ROFTmC
 9tU83D9+7AJr2KbHBKJX95QsjA86UfeP97rjvlU47S0FftrGYcnjTjToIkMKDLM6zCuo+GXpd/1
 yVaqhkooYjzyEmR29a1jfBWTZHi9iJS98zi5yNuXPGR3LgJ//832z+VaSOy0fx2cDEqV04RTznB
 EF23UKAVG7rAbDGSVhqJpUXLRqgSzHkwkTI1LE4dT43Fq/FtLYRa7OROc1TUV/52x4SxSdrxo8z
 Ha3eHaqzbnm3LKg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 09:04:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8028

After it was added to meta-yocto/meta-poky's sanity.conf.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Note: merge when either is merged:
* https://lore.kernel.org/r/20251112224534.3094578-1-richard.purdie@linuxfoundation.org
* https://lore.kernel.org/r/20251111-contrib-mathieu-ubuntu_2510-v1-1-4e50cc96eb00@bootlin.com
---
 documentation/ref-manual/system-requirements.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index fcefd6c7a..0860c7a3f 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -79,6 +79,7 @@ supported on the following distributions:
 -  Ubuntu 22.04 (LTS)
 -  Ubuntu 24.04 (LTS)
 -  Ubuntu 25.04
+-  Ubuntu 25.10
 
 The following distribution versions are still tested, even though the
 organizations publishing them no longer make updates publicly available:

---
base-commit: 1d1c26853724a5e9ba9ccd9dc7dc7524f4051fc7
change-id: 20251113-add-ubuntu-25-10-e3cd0857f347


