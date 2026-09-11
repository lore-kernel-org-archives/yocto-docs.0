Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8E4C88E5B
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41429.1789138587537592858
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Bq1VMWxj;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AF769C63A0D
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE030601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38C4F11C7AFAD;
	Fri, 11 Sep 2026 16:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R/RzW401hgtbM3aQM5y2w0tluUsR8CEZjDJxyOqoGXk=;
	b=Bq1VMWxjvud/1swqw47W0nDGX8T6vuh6yGQlc5TTiZMiKeV/byNiO81lmrgaULJxYqCcNS
	/0hYipADz0sTZGatLCXMbAS//OX22YQGAhKYVGtvHbLRCYDGkPtGSkYSImv977uhEfo8wX
	RpTGJPTkYxvdcxovFLcy5T+287NAw7Ck56T5LoiTiudLXiVY3Ild064gbGgj4TtTZ05lhG
	2gPt/zo+1sDrBM18aRCtvTJG3NarM2nKNQww7Clz1mxyzpbbLNUSMdLEMYzgkYCfAR7jaj
	A7QsQniQAg2fOihUX139TA3NvFIXh0uRu/ppUbuVM7mhRXTn+Mr6J7EI0CKbHg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:02 +0200
Subject: [PATCH 02/10] bsp-manual/bsp.rst: fix a "local.conf" ->
 "layer.conf" typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-2-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=805;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c+LbaCl/N0wlSDjPn7xwhNi9xXyMbg2RPlXIxzIs8vo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaVbfIiX0fzr2M4vhjrBF8c4UGcKXxpqCdU1
 I66GCTUCvGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlQAKCRDRgEFAKaOo
 Ns6OD/45MpGPA6OnrAl7EEyMnaNuuTn4NsoH+Te87FjQtSYyWtWKl7NmOjDJfR0DpVa4he3b83J
 ZV4HoPQaKaANBxi9b0dLVgBUgTcD0Epph7P5h9pVbptOXBbMz+jbE5q/7SzTuEDW3HQ8rdxd3fj
 uarIC3dG1OgX3fhD6esjTwuky80TsceIN54Bx7tG4HPdW+cqT5SzuRUTVlVx/gXz0zvpybMv5q7
 9YqrSFX7SrkIC/HGoj/hyFgAY4U8m65Fgguw/ej7T2wyyFnC22nK0rp/d00l97JGzMmPDr7lvDu
 HbumXwp8CgvgZNYAZRSvJcZ33EsZ1B30YmGFyzkV+mnvhKQkzvciq8Eq/pqGZM2Y1FCrXgcpQ40
 D+JdHaLqGKzHGTGKGn8ZEs/domiuXE0ySAPGYCty4jkhf0G3Nc98dD0FK++Bp/gJNN2+cb9IGuX
 mS9NmltuLtuqXKX4fZ31RXdzRw+913SnOozATIU8p7BjVF7Oomc/9Ze4Cj0T9cikWJhfaxYNyiN
 +84yuxUJ5Ka5YLI3tO/n/OUKVsrbMee1g1LrgULM4oYjzeiUiZM3vAVVnSsnJCwr0x1W1Up6fJ9
 QvQdD3vxtg1XxWVOzck5yqwRqlhP7sKUnVPF/k302nXN/OF2Vwl940VY6ve4c1LLzwmMBWIThyz
 IGVvRSfqLBVY5pQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10457

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/bsp-manual/bsp.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/bsp-manual/bsp.rst b/documentation/bsp-manual/bsp.rst
index b71786e59..8eb4f470b 100644
--- a/documentation/bsp-manual/bsp.rst
+++ b/documentation/bsp-manual/bsp.rst
@@ -1165,7 +1165,7 @@ Use these steps to create a BSP layer:
    :yocto_git:`Source Repositories <>`. To get examples of what you need
    in your configuration file, locate a layer (e.g. "meta-ti") and
    examine the
-   :yocto_git:`local.conf </meta-ti/tree/meta-ti-bsp/conf/layer.conf>`
+   :yocto_git:`layer.conf </meta-ti/tree/meta-ti-bsp/conf/layer.conf>`
    file.
 
 -  *Create a Machine Configuration File:* Create a

-- 
2.55.0


