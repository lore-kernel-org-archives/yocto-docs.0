Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B0EE776C9
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:24:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123070.1766593484926011857
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RU2UYowb;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6FF311A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 478FE6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4C3E10AB1359;
	Wed, 24 Dec 2025 17:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593482; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bnBr8cqLEtWYHwaz0/sAObM/c9I1Lo7xPcTs3C0Thfk=;
	b=RU2UYowbCYvn/5E84V7Lo9va6kQm9CW7tMvMtCOxO0/kHxKWVCwRgWQSaNAd4SIJUsj1tm
	93f+EmYVKFcAvs8FyEUY9pTCKlBSxss6fXo3caSe1KztuHDZsgXQWDOUx/GAYBdN1+up2K
	9ajJo3oJ7tW1nVrIsehPaetVJCriZSZ2oHKXyOwOZWq5SPyPzMcArOc1gdlU1O9+3ythOb
	M6+aGTEttM2kBZFi63Hx2GqFg3gsMyi7RKZTG3qWDjVNbrYuEhu0oMVQ3AB9BUTjbSJce4
	Cn+qRBvCzKHbPqzF4vgaxCDQDRYUsvvgHdgTf7zCZzOkaMy/63TgnFq83Yml+g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:24:17 +0100
Subject: [PATCH 2/5] ref-manual/terms.rst: refresh the OpenEmbedded-Core
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-terms-refresh-v1-2-691329fd038f@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
In-Reply-To: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Mnx2v71iRlXjY29ZI2Y38rMM2M/0gPBopopm431VBvs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBPHcDG496DRHEsrN2LxwxReQW6PuXAbaZSh/
 EUDWObg4AuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwTxwAKCRDRgEFAKaOo
 Nq13EADDjIckeCkenmyTcMV2ciXDr2v8Gwv1LndffVCbebyrnmG5INqkZkXLSn8YsohFJTIFnUz
 KqY3j0+n6Wb0fhkZtqYNk69KcAeIkp/NgxBNxSo+/oShitQ8Blmc4n7J84S+WEXUvTB5zx0P7pG
 9hFCqGn9PiEDTBbXvOrS0xNdrTOn47ZViI0FCIzwS8tKVwqJGkVW9wMwCS4Qj59A5mNbXQACWtC
 00i3Ppex2SHESKfiv5i3+6aTPoWPvoU1EkC0R05hXl6fkPF1lLwLyO/dFwx15Y/kN/YWGE4NIRB
 hpQqm6SA5US7rdCS/e4lpozF+NUvOtJ++lQPzpXNdAlUokfDxFjQhoCrsPqhMY9C5sWHPx2J6YF
 QmqjJ8ERvhAK3Pcn3CuLWBm0w0ersPzd/bhxsGL1JBUj5L7D21SUv71KGwDv3Ct1QLdIs7WUdeK
 Y6Uz+uUL7X5+K6b/6btr2Lxwl/eClxNe/9nRvLEF0B4ZWNY63W0Cdn/Vw6Bdqe/PHVJU+3Yj+a9
 tLxUtx41rsoSk5yi0K8A8ZFBKm/xPKQqqI3XaWM9qCJZbe+JSXudvTb5rRHk16auqh8uY+YG8w7
 ts9OqqYXzDQh/S2kjE1PDv7RqJlaWoci+nj7YW3A10FE01qT4aJPJmghYS/4BccRzhb2XHaOpmH
 muwhLjpxZxdkDjA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8325

After the Poky repository obsolescence, refresh the OpenEmbedded-Core
definition.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 4b9b6ed88..b7a7679ae 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -424,8 +424,8 @@ universal, the list includes them just in case:
       recipes. The result is a tightly controlled and an quality-assured
       core set of recipes.
 
-      You can see the Metadata in the ``meta`` directory of the Yocto
-      Project :yocto_git:`Source Repositories </poky>`.
+      You can browse the source of :term:`OpenEmbedded-Core (OE-Core)` at
+      :oe_git:`openembedded-core </openembedded-core>`.
 
    :term:`Package`
       In the context of the Yocto Project, this term refers to a

-- 
2.51.0


