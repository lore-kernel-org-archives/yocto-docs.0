Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A075E776DC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123734.1766593934030443053
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EVhzWiDh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 711091A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 465CD6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DDA910AB1371;
	Wed, 24 Dec 2025 17:32:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TMMHrMWHOEBL9IN2NSA9WLtFyits+4nHy8QQU37mBQo=;
	b=EVhzWiDhjh9g1ptW/ObS83ed535RWbmmpHwgpjUVOdtye7Ae1mPuQjvp+3dlQ5WXUUnOxP
	4mS8FHTBcdVFv3RcFdJRRnsLdM/Hp3jkGsLKNLHnoBKS9MplB4t99Pk4st/Ol3UW0z/trK
	ycYLpP1yJavumhliDW95MCPWpg/wvo4t2wkzDug6Yv+7l3NqodAhyop9mwnPB1RAjNblda
	7zqHnvayNOYz5niYxHetZ6VZYegzk0rfqCDEBzLWWYZWSJd2kJoYxocxkA9lDwaq3o5Khy
	JvT5byRpjrB4o0V3ZRfv8ZlSTYeU6xjeA3iNlfkl3cht8+a7E7FQwZ1/AJqwGQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:01 +0100
Subject: [PATCH 35/53] dev-manual/build-quality.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-35-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=pNuNmYq5QUQfhZIfre06iuVv8VtubfmfZrdtGW+6P3Q=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVtxoIvUVV5kqsVA3Xw3ksSLCYlyFOntLW2g
 gcUmGT5oh+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbQAKCRDRgEFAKaOo
 Ntb2D/47G5Xz88TB+Lu8Vs2DBfhUaCLX6ZyiTRvljtjrA4/PmL/5p7k0GdiGrnAleU2Oic4ufMn
 VzfqxgIlnqQS7iuCdC7aj53EKxRObF26wZL9Au9xcgLjqfZamgifMtcfEunojRNKyrCue9t1XJt
 GWLkZR/Snba5lU8FwqCNB1X4LWyoSg+CLKTeJgw8NyT9IdMyQV2TVR9sRkw3WcN68mtHIP7D/g2
 SfzHEDk5EJNfo9y7OfMBk81JWh//ykM/UT/ay0ix0tQXW/aKqG8/u7W4Se2Tzq97+HBDkJDkB2s
 w366pb+KO1d8U24SR5X/xCqusPDTvk1hc7CvNpEbjD2EVi8AiSEcx1AY8XnKrEZxEOZVrgjHZuz
 4wzFg5Dan4/3y2Mbu1aoiOAQTES5bWRfj7ZNgZzUVqJpBitrWzWh/qkyIOaOtWoef4cJaxh6Xd9
 MrZN+AmIXaqvJ72OLWIGFd2foCdlixaX7hVEEjNKojINzQYmHCBtLzxV+XVKkZgOuwastKoE3T1
 XAGCrHtdorD/GuGHgO0Y8z798VtkyPjT8UOWM/xD5enEaTvoTOKX1I3l+Z6mRSnbxr6pKPQm8Ar
 TVjh1Ol7vnlCOdy3wWuyGhSDl+lxwqZ5qWanGOZLFjuHt6zEYK5t8lsTAdFU5j/cqLJbDL72UtH
 L/MsR/XVw/X0EmQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8364

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/build-quality.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index fbe5fb6f0..8867f6dcb 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -372,7 +372,7 @@ There is a command-line tool called ``buildhistory-diff``, though,
 that queries the Git repository and prints just the differences that
 might be significant in human-readable form. Here is an example::
 
-   $ poky/poky/scripts/buildhistory-diff . HEAD^
+   $ project/openembedded-core/scripts/buildhistory-diff . HEAD^
    Changes to images/qemux86_64/glibc/core-image-minimal (files-in-image.txt):
       /etc/anotherpkg.conf was added
       /sbin/anotherpkg was added

-- 
2.51.0


