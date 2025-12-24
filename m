Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0D4E776E0
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123743.1766593943296070182
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qoGTLb81;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C52754E41D8F
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 968E46073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD55410AB137A;
	Wed, 24 Dec 2025 17:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593941; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SUfp+NmCxe7v5jgZfmb0TgQgksv/FMEq4y4YvwoIsYg=;
	b=qoGTLb81KxblE3hm+iDDCRKGBiyMBrkTVMGajv7EMJOActnI3S7fcqkqbBjftbyPGwynas
	nFtSLz8Ikfna9FuY83mr4H4qluC3PmJDRrkUM3rXVLvzCUfbStobqzIbhFItLqZdYFMGce
	EnKxFr1at0yYpE1Ad4kq/qsegULV7aEof/ux4izWtT3b/Z9EnNAHv62Sq+MqlKvKwVXNP7
	mTGqcfKymt7Jgu3DaYQi7uiT7vfNv/6p+GNKokLv1zanXrtRunIrYrqt+Lgr8afON9Cbao
	zr1DYWm7GYHf+qp5n+m2KkTTRoROmionp8akDpjnZ/y63UBGS3dANRgjCvt4/A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:14 +0100
Subject: [PATCH 48/53] ref-manual/release-process.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-48-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=H+Ntvzf3Vi7OfOF5h8PanRpQYwdzRLL6iQDwArbbJEs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVv/071CofPHa7YTvUkz/n7+nMspA8TyVrsi
 dL3N3/imoSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbwAKCRDRgEFAKaOo
 NlmED/90GdCbfGFk8jwk1Nr82QI2LBO44mn54anQrg7tZKJ5ggubbt0txp3pZg4Xo+j/215y8Qb
 jV1dN+rk0tyMH//aBSpjNDLnwmlXyk6Czbq18JYEuMp5VzRkOJOZrkKwtYRspEMm/M3pQ13uCfO
 XZeBqugAjInnTXDDINTfobINKl4goOHuUAVAIq2anew2seV0XMngu9LReVaqG/oQHiWYA5GHwSq
 G0HsyjJkPvYE7SJtIJd/kTkvpEFCxw06rF9bvKX0+L9LequJYvisE8x7hA8HbOYkKr4vDmPh2TU
 Qt0hfnKFca3/l9cRSpxcZydoTtMXvHzoteCVTiAcpowm6v6efZ4LtmhQq/NHQKU3WTKUG3YL17/
 GnqnnsX1F2zXDICskyIThAN3PmlcZfIRifcWUnsz10Yd0pfRpd6armyLg/kZZ8eau5Mhl86AQ0I
 TlOYd2HNqIJckfzbujt6leZgFiWdo5u8SG0mk+W7RwUVis6yxTKSa+r6TzlEohoGE6W+AfjhoDQ
 +8fQHfTDeL8jblazdJtocJesr32H4ACZG+Reqm4oyCK0A+/hDKskH5bnctETaL0vP3/HW0+0JZM
 aMPDUnhjcrvfi+UyAEtBuq/r6CUNIAo/sNSxfAPZfLJ5BXl4LmvT8NKCmxePthW/E5KsubHFlw/
 t+TQNaamB/7F5fw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8377

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 826354844..7b428efad 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -193,10 +193,12 @@ efficiently.
 
 The Yocto Project's main :yocto_ab:`Autobuilder <>` publicly tests each Yocto
 Project release's code in the :oe_git:`openembedded-core </openembedded-core>`,
-:yocto_git:`poky </poky>` and :oe_git:`bitbake </bitbake>` repositories. The
+:yocto_git:`meta-yocto </meta-yocto>` and :oe_git:`bitbake </bitbake>` repositories. The
 testing occurs for both the current state of the "master" branch and also for
 submitted patches. Testing for submitted patches usually occurs in the
-in the "master-next" branch in the :yocto_git:`poky </poky>` repository.
+in the "master-next" branch in the :oe_git:`openembedded-core
+</openembedded-core>`, :yocto_git:`meta-yocto </meta-yocto>` and
+:oe_git:`bitbake </bitbake>` repository.
 
 .. note::
 

-- 
2.51.0


