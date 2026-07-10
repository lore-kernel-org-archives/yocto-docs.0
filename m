Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F2BC44508
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:47:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.605.1783694833024941493
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 07:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IXppX9qf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E1D21A0F43
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3406360342
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7604111BD174F;
	Fri, 10 Jul 2026 16:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783694830; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RtJmvYzPG9KkAJ8Q61261qAF2HsLaeIojwyHFPoBbKY=;
	b=IXppX9qfgA94edn7rdMKsxwkcGoACGcrFvHpAHpamH4TYZSzg/C3UcMeFrffZgeGARJnE3
	bt+EL7VKbdQxeqO/i87pIcl5KjxM5LhU6Du46yprrb/gWpitDJD9uuEbXWhvifVljJLLsP
	GICvCcTEMdlXEODbYV5f3LPQEalF0oS9xsM6ibEsKBhBN6uZqN9Kn1BY96skkMQrBOEp3G
	DVxXDtzLUK6jAvAfb8zu/8G16Yo3TYBYdz+IRE2rq7jcCIqkJYHM7aLPJ42cgfgCA8x+a8
	yEukomplryONm5VynXP/s5BoRbzS5GqCRuY6shkLCpgU+Hs27TnfMrrADgU4jQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 16:46:50 +0200
Subject: [PATCH 3/8] migration-guides/release-notes-3.4.2.rst: fix a broken
 link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-linkcheck-v1-3-999168371d5e@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
In-Reply-To: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1Jk8mC7IuIXaQL9lL9M2oIMBNMdzrZFvJSnOG8cfavI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUQXqtZSceuQQmeamnF/Y2i44K+e1bl7RqUepd
 /5UxjoeDbWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalEF6gAKCRDRgEFAKaOo
 No/hEAC/TVVOaMXEagexwDKgnzu9G3T9ZYOrRYJdYLO3OL0tRmB/V7oGUVvG+S0bdn3PENG/k/6
 3xM8CxKGxRZ1GAXO1zd1shM4RTkj1R3BAF9E+Gt5p+GcLWG+rnvI+8jH4XPjrbkMxsbgkP2eTDJ
 drZK0TEUauc8n8jw3zlg11pLR7ZHGwR2XkZsSC3tkqAFpcSrvuSr2P1MbbZEQwhKmizx8tOhQqn
 g7hFP3CfoF6Vm4yKgd1npd25/gDmbAxSH72bgyUUahIFadadclf2eZKRclFPkqNMFh1VGNR7oe1
 AarP5otGNx2cD8En72hlGsVHcDSxz8W0LzijP0GkPSYi13c52AkbWk04LhPiUzGMsB6ujUjPk2z
 K303gybXF7BG+8kyaLZUHPOff6GqGzSQdQYQ+yKh9eovyeOTXBSY3gW11d1gfvws47i9IfxPxtC
 gbvyErbQ1gmsEuVGIiNrewgG793o7rI241PpoDFboyWr6rvGRXgf6/6Noom49YtljkJ5RFv9B7A
 aYHq079EDeZ+Y52dZ5sbxZBK4eJwUvc3+N5/WgbivIYJo2qO0kQp8YNiLIp5xMmd/bbqkPcQA6t
 v4mAvjuNK6wKxMhYvSgFXVy8QfjktfbzhfA45ABhzWdiGvkDgpXNCGtL4Zu+5B5UD2BAUSVZeGW
 XT25fhUEdByPu8Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10059

Remove the extra '`'.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-3.4.2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-3.4.2.rst b/documentation/migration-guides/release-notes-3.4.2.rst
index 51046b6aa..a8e05af24 100644
--- a/documentation/migration-guides/release-notes-3.4.2.rst
+++ b/documentation/migration-guides/release-notes-3.4.2.rst
@@ -239,4 +239,4 @@ yocto-docs
 -  Repository Location: :yocto_git:`/yocto-docs`
 -  Branch: :yocto_git:`honister </yocto-docs/log/?h=honister>`
 -  Tag: :yocto_git:`yocto-3.4.2 </yocto-docs/tag/?h=yocto-3.4.2>`
--  Git Revision: :yocto_git:`3061d3d62054a5c3b9e16bfce4bcd186fa7a23d2` </yocto-docs/commit/?3061d3d62054a5c3b9e16bfce4bcd186fa7a23d2>`
+-  Git Revision: :yocto_git:`3061d3d62054a5c3b9e16bfce4bcd186fa7a23d2 </yocto-docs/commit/?3061d3d62054a5c3b9e16bfce4bcd186fa7a23d2>`

-- 
2.54.0


