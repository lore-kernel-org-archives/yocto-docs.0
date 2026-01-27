Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899C8CA6CA1
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6053.1769501976767665894
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LXdV99ea;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3F8864E422CA;
	Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 167ED606F5;
	Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5867C119A868C;
	Tue, 27 Jan 2026 09:19:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+2xjNaC9b/ELtYqlQzSPG+Jc5NL5biO7pMHI15uRHP4=;
	b=LXdV99eatVHs+bBqww+FY2r1q60kQj6TWzk5dyKjqNyniaD/JxPlkFJ74FUzph+eguiEwC
	oX87WV84r1CvGYQVS1cpCdyTKsMe5k90Xcv5W+ghkkz414N8v4lhDf6m7axDR370C85S9y
	439hIczGTLQ5McSo/W9bC6joF/RQ939ZPmyvII/ojqm11tr0v4uuFnINiPSclx9E0zO74f
	jutzTfX+sU998Mv7X2cN26y2hYiclAmZWOZfF0I84d7rV8vMccKQ3j0994kFb6PnApKEjQ
	FtK+e1yhqDfDwXoodm7XfxNSX/8CnfHGKxKVGRTfevTrXIxSUmfJmI4kQF6a0Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:15 +0100
Subject: [PATCH v2 20/56] migration-guides/migration-1.4.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-20-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=b8WI5BuZdIqh8ndEv21J3B59uLjRO27TWlFHwLrS+Tw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUBnEJqMjluJuS4ss5TRUEVBifRBVSjk23mC
 x2WGFyxSLaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AQAKCRDRgEFAKaOo
 NmBLD/4yBIqmzCUTAS68gTf/7lGTG3usG+HRtxf70IgGfNureFqQ1x79JRCAfHE9rTa27LrWBLO
 fegdmFqJ3svfRbIjor9hRscO3PKoDKpBQEgIoIbdL43lYgnr5PdLP/b+Mgy5K71RffFbs/yPiUQ
 o4pXapbQEEVGGJdUu+FAagW22myHstr+8e84jZyvn6nlDbm70Ft3Y4IPEtNR8gqi/x+LCgz9opv
 bsAleADIFbcdZL10R4JFiualxO8X9XN8tWV/q7OD+iYn79Q0itV+r6uO7BMTPiylnw6LFNs31Mt
 iN474O2NgSbeemoKKrwisuSlDU8lhdxcR/yuYBi2q3/ydW632qSeF6oBSlx3TX6vyC2bL4SLRkb
 /THridV/RbhwpwQRaHJMjYjZmxWAcWFHMRg9erDX97XTdqwkvaXsPvdfAOX9p2LS0aGsSrcEVoz
 O5y6eJ8VyJCXXdsOtZuFuS59lo7QNelQsyM5V96C6UYvg1yVgvsLiGzmXpKIYEclT1duciFP/eN
 RrJUZihLeGanlOcQjdjriZJ4jFHJuE0+b9Q++Q/1dKmaFzGXKabHL1ps95DVMT498481Vi+4cPM
 Bmqv6tEY4k6JpVQrD/DN8QAjrW1gqv3JFHWKjy8/ZH1riOYVj1z628hAYDIz9sLmcwarBdsbkgv
 ZjOiuFRpYbbqqOQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8681

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-1.4.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-1.4.rst b/documentation/migration-guides/migration-1.4.rst
index 6db2a035b8..5d8d0ffde8 100644
--- a/documentation/migration-guides/migration-1.4.rst
+++ b/documentation/migration-guides/migration-1.4.rst
@@ -82,7 +82,7 @@ Custom Interfaces File (netbase change)
 If you have created your own custom ``etc/network/interfaces`` file by
 creating an append file for the ``netbase`` recipe, you now need to
 create an append file for the ``init-ifupdown`` recipe instead, which
-you can find in the :term:`Source Directory` at
+you can find in :term:`OpenEmbedded-Core (OE-Core)` at
 ``meta/recipes-core/init-ifupdown``. For information on how to use
 append files, see the
 ":ref:`dev-manual/layers:appending other layers metadata with your layer`"

-- 
2.52.0


