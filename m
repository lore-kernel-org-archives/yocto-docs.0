Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E43D6B086
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17218.1769700279502703035
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wt7Bw/7z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 034C81A2B0C
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE5D2606FD;
	Thu, 29 Jan 2026 15:24:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F72F119A8860;
	Thu, 29 Jan 2026 16:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3kq3+hxUz9p3CM01s0RFmZ26oyNeHO2PGj/RGKNndIM=;
	b=wt7Bw/7zbCEYLjRB7CawDQwlzhpEu/YZNL5b9x4zR3YmlJVT6pDDM3XkRQQnMhQjhvTsOD
	dm++E1ZxexFNRlnN9tjI+o88NkBt8qCY9RAg5uVTD39k/IhyQy3+hhR1lr7mow7mWENw4d
	4sL/c99AdlwESR3pNsOsKJVhQsQqOITTcZDY7urC8jtsd1tAfRxvvKN9Yzi9mvXD7H1ijH
	FeS3hxJPjjQ8okeG2AbO4wT1EBozAm1nX8JvYo10MboTZ53joZGpNVXzyhjKiW0fDHCLts
	+vQxwOmfPcaMG1CLFU99GXC/TpGguR062ZVIIvjsz1sp1z81UHUiUNVGinvOwQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:41 +0100
Subject: [PATCH v3 50/57] ref-manual/release-process.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-50-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Wkw2SsfG2gNRHNKJEpXPri1B77tA5W47J/yvdfZmNc4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uQem7vaAbcZ57Eu28kwaJbqJBrR6nRlzzcg
 TlT9h4oGZGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kAAKCRDRgEFAKaOo
 Nr++D/wOL8cDnLDOmq18DEdaLb65QjnfDETBkhXmC8ZoMa6O2jQOcTL9gr8MoVPhq5xb7h+4NR2
 dSXV0j8gnMi8M7v8AKgOP1fUyu/5vOxrSpzJuPPHcRosL3RZy+Re8i15468M2AETGLPugnWqYab
 JUltOzzdPD+dVo/k78j2oGrqSCAx9LO4TYICZ1C14mGlpl10Nc5UHclChfHILwK16EAX0VpcYwF
 ue7sH2IsZsGFWxyOZWcgLdWAGM9WwLMbVD9gGFf8vkwPY8iozqeolAh6u7yUiCeDK7ZYHX4HUYS
 Hj/JBTNmliC3wkmn38vW3oaReohJAt1AKMV/Zl1WvRuRAEu1cEGPfXu7ICHQBTt//DeZOnVIxBP
 mPtZnM35Sn/9HZa7cGmZ8QzR+r1fa3Cbw1Z1AHZ6eX5/XyrgpgN43Uud3mrmpQMgb9/Jv0Pmltc
 5SYFr5iQz9mdNHajgFN142MWFHvR9/P8kR/udtpdIrEdZn/LEtZFXv7IwBlFi814q28cVi3mxA4
 sMryDZuxvu83CFkI6+YXvCYg2Fb/K9Nu08Aoehpe/bGEhLUu2aNyrECkO74D5x10GDiPxoZQnXw
 PNeI3ML24gqOeVB/42Sh1sMpFhHWZ6KaIUYTCSDFnGWKf+7wSkiLUbk9m06yCSsUQMmfH4ODq09
 fx+Uu3VUaAMjeVA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8836

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 165dfb86d..a75ca52cc 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -232,10 +232,12 @@ efficiently.
 
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
2.52.0


