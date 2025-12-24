Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6ECE776F8
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123219.1766593945704536540
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n5rFhq5L;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 361414E41D8F
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0DD9A6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F13F10AB1381;
	Wed, 24 Dec 2025 17:32:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BkC+xXKgJW1swyzD+aPrb6evrjLJA1CTvQkYPXGR+Dc=;
	b=n5rFhq5L/+F75januUWacCZKFNtMhDpjxc7UXC0eWGVw+jXjOjUt05Rod6wN0pMfSo1lgB
	zaSLhauRFHt0Uu6PERORa9MEpQ/2VnMnve7F3bnqwuEt1fKJBNRMat9WreY/zXmGzK6FX6
	afHj7jEchX4gj+MN3zYnYugnowQ7iM6lsybjO2IvFc0siJsonol4xup2pLc4U2+uu+Rss1
	b5kPA4ERtfkxBVtdN0sa55YE380kslgAjpHZlyp/xI2Q21TL6wlvxXGxRoc67yJzJzf/o6
	+hzPqXl1VhByTVTEaT1dmbPZ1qDGwG/kAV4QmZuDOd1iY6EdChqf+1l8gvjYyw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:18 +0100
Subject: [PATCH 52/53] test-manual/understand-autobuilder.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-52-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=A+gnKUTYRLxtYe232U7LRDmNgUR5nT0LBOPi0xSkT1Y=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVwg87JAFVVoEpMnfRh0X9A2XHVsHQ+gIU42
 OLiRNXYsoeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVcAAKCRDRgEFAKaOo
 NnJ4D/wO/ps/hF9S2yGlcs0FZebunU5LD8ihSAGGROQuxMS6bShZ+RrxDqFWROy9gJ1x6OFoizo
 ueJgYba9kiH7FaxanZwU0yVoU73MtCYa64sZil6kAsHPVPNSDfxh+GhaUlZSpXe1brYfgOxn7m7
 poEkLiHgD5yX+cawaKKBDjET7Bqn7ipEaBlZN/zUPNFZeds87Y8KAgEBaKEclgqlsRkXwYkti9Y
 pli1L9KKgiyRdqcKPH+1mDVQcSnepKQSoP9yDI2r6lQ9hVHn6lJrkM74isYsvCKc9UfXB0jfcYe
 ENJsS2NjMd3zzGj4eGi6xFdJNHcPhO0U0mccnrLdMCnqzvIKeg5hq15cIShvc5LxoryFmaqbORe
 pxwBTQVkC/vvGaUYJZwNIyst3Yp6ssebzVwPfWhxCN5fmuFUYwHumU4v00X/FIaE5tAEs7p9h5E
 7DofeRW3f7KFunY/sdZrdmc2bI7WN5/UGyNhwFGQVV08gmVwR0RlmDJxHq85rt6MueGpGhwQaxw
 eDFfK1tmINNN4D7g8YecjfDnD6MPi84xgdvQ8PFZBQgHqz0T1PJGy4inFuqjsYcKnPFd2EENOWL
 7b4FdCL+j/UTwnTZw0rFaa1JLKSE/mLCWmAZp4912neMak27aoniUEXUmtG8SXIuI8M4i80OjIW
 vfQlNbeZ4gK7csA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8381

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/understand-autobuilder.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 23b3ef7d7..2b5eb144f 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -104,7 +104,7 @@ roughly consist of:
    This is a call into the Helper scripts to set up a checkout of all
    the pieces this build might need. It might clone the BitBake
    repository and the OpenEmbedded-Core repository. It may clone the
-   Poky repository, as well as additional layers. It will use the data
+   :term:`OpenEmbedded-Core (OE-Core)` repository, as well as additional layers. It will use the data
    from the ``layerinfo.json`` file to help understand the
    configuration. It will also use a local cache of repositories to
    speed up the clone checkouts. For additional information, see

-- 
2.51.0


