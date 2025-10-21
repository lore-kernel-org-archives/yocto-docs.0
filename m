Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73708CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 15:19:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.14776.1761059986599146556
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Oct 2025 08:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=BR60+Gdn;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4344F4E4124B
	for <docs@lists.yoctoproject.org>; Tue, 21 Oct 2025 15:19:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 198DE60680
	for <docs@lists.yoctoproject.org>; Tue, 21 Oct 2025 15:19:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2434102F23D3;
	Tue, 21 Oct 2025 17:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761059983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KFNoh+wBL98FkrzgJMzVfuDtO3pVkMyX4nqk04t3RiQ=;
	b=BR60+Gdn9P3HVxFU/x0dasSGkS3R1hLtWJCz3JqW/VETT6jKK01FhadVkpxaWIG7UjYss1
	mUfgVa65J+9WRgwjvxue6n8C+B1+bjNwek01ZJqOkLMJwNk6fhv3y49OFNRkEvfSHKVJPq
	407glO1D8iKfRpTv2S0557yNsf0gw/gpfhSayH5ZUQ7Py+cdTgtJ1CSxmWoQgGjRCKhq0j
	Ok+vMGTgjhA/o7XmTH7ZLKWLW5pVrFmGM1sd8zE7GKcgFRPadM7PHkkf8lk0kdaUdIy5f2
	02KnHD63LWnaWYEI/ZJQRujHpnjih4g0bRtoncsXHSDZBpelhcfKMVrvTEajvQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 1/1] variables.rst: fix LAYERDEPENDS description
Date: Tue, 21 Oct 2025 17:19:18 +0200
Message-ID: <20251021151918.2922354-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251021151918.2922354-1-joaomarcos.costa@bootlin.com>
References: <20251021151918.2922354-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Oct 2025 15:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7766

This variable does not apply to the scope of a single recipe, but rather
to the scope of the entire layer.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 591c03028..3d774cf07 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5454,7 +5454,7 @@ system and gives an overview of their function and =
contents.
       information on how this variable is used.
=20
    :term:`LAYERDEPENDS`
-      Lists the layers, separated by spaces, on which this recipe depend=
s.
+      Lists the layers, separated by spaces, on which this layer depends=
.
       Optionally, you can specify a specific layer version for a depende=
ncy
       by adding it to the end of the layer name. Here is an example::
=20
--=20
2.47.0


