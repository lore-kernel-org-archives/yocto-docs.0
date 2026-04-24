Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D65FB44D9
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:29:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16373.1777019350759222401
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wS3ES4dU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B2064E42AE6
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 02557604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0ACD10720746;
	Fri, 24 Apr 2026 10:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z8e/uSBhY47keZiLZ9ALsP0zffIgLN5UAUpT5z5d0kY=;
	b=wS3ES4dU5DYxzzUCSf/DdYhq7bxmIEwVUodsUL2KJf0nwqjJK8MCaDDpPEY1LD4XGqbGPg
	ARyA3/79DSTccCxQW37HpSIR3HSAz+PGCCO7XgfOHUzo0x7Kqwk51Zlhi007alkzvO8T05
	QJQPnCdQZseJ7yHfpOc7bfSpbHcavuFqQRVjTsIq8GbiGrixnbWB9peL0OxGrRjrQTu7rE
	WmjGiXq2MNqEa+vVr85tB5pEKrtZzyhdEV9AwviwxVjCZDCC5TGo79n51FveeUETzgXbsT
	1mkhmqRsHbKbFXJeXEmSDsHuANK78fhugMcjbMXZvNfkaIvue3te5dM9LiBpgQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:46 +0200
Subject: [PATCH v2 18/18] ref-manual/variables: IMAGE_TYPES: add new wicenv
 type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-18-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=778;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=u906dhXtcatO4ckxDik/0UMLjBvlTKmtaL85xi9b6LI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ynAP4OQQX5HWkjagyLcUjPlQQrCZBMCIcAIZ
 M771bPQdfKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespwAAKCRDRgEFAKaOo
 Nu0kD/0cEDjeltxSrcV80OzwRIloZwBJiQnflHQygZaU0HY0maKoKOoid28DqVQBOoJed9DgL7X
 pVbUDP1WLhB5jN+1dl7WCylThtlIA6DbPo+/E9V8dASyxZMnm13oJlGv/LoTjK3O7OMVYYgX5Q+
 vIHOMcEi1v9d3WV66C9c2AtZzgnTVJyYsz7UDBYxh1anoCjaYXw4QqzKpau8G7W8g9xWIRadzAD
 lVBmub+fYQqP/jmZUHfkwxdwb/pxOeTv4tHVM17MLicMIRLhaMb16Yyx1XNL1L0wmy6H9QqolkQ
 hijsuU+qF/JxKtnQlPxasgduc9uxuvOwY0St9ZltfiirP5SS0wPHvBFFbB+obog6WxAhN3mrg/2
 xEN8WD/iCTRLtxC4YxHYDmGvt8LZYozOirA++dZX9Fw5Qi81pYwSxhON2MMUb2Ha/zZukGp+5tT
 Bcvr6Q6Qo+u+s2x/tCfsDfv0ktM/Klkhos6qnxnL+ZRY4VvtmTmZ9EwkEEQt2tZTryRqjcbDEaL
 W50SYvYVFAj8XRiXs8fvSCP5UtpmLI440TTsxwzFoiOGbCUKEoCrQE1A5ysPMhSn4zzE7efW48R
 4vmuXxu1zVgSYSz7bZABs7BxyAhjU7KzGUWUEJJTCgEcMLlpWAXfaNZXsBkA5UpWfSpaAkzQ/GX
 R5XZhuppItx0yfQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9356

Added by commit e4d49702f21f ("image_types_wic: Introduce wicenv
image type") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4341e27fc..a8cbb87cf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4680,6 +4680,7 @@ system and gives an overview of their function and contents.
       - wic.gz
       - wic.lzma
       - wic.zst
+      - wicenv
 
       For more information about these types of images, see
       ``meta/classes-recipe/image_types*.bbclass`` in :term:`OpenEmbedded-Core

-- 
2.53.0


