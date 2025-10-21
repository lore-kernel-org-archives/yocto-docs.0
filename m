Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF41CCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 15:19:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.14772.1761059982203912693
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Oct 2025 08:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=2rX1CuDU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9341C4E4124B
	for <docs@lists.yoctoproject.org>; Tue, 21 Oct 2025 15:19:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6416D60680
	for <docs@lists.yoctoproject.org>; Tue, 21 Oct 2025 15:19:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A356D102F23D3;
	Tue, 21 Oct 2025 17:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761059980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yTzZkauJfeDmi6rvqrXtRLQjJNYRP2W8ogMSY8q53qM=;
	b=2rX1CuDUlPbsF9MGmIreJ+SJC/+eHgjJa8KRuXCWoWw7ZMegIiUeTdiv0xF5ILcz6XOEOu
	wnlkPaeMIQvkK9AnpoG667M/aybXamOHfa4uJxgGVQh84R/gk1w0/EXkZDjOmMZWm/WYXP
	sbYR2fyS8Vc1YONQpVweAqkZJm1cos+Bku1JRZTXj2cvhoGQ0bZNFAtA0EOX0STsmp/UTb
	nJlAbQCvDu7G9iTo7nTLKt7d2v/7PTx3BaO9/R1LcDOTSed0R8S0yTrp3ln920VzW2002u
	9hI8NtrCPV8Wi/OD9pWEwEYs4WoDP6l5Qj5VOS+WtV2kZ7xanzM/ASvQRbZ21Q==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 0/1] variables.rst: fix LAYERDEPENDS description
Date: Tue, 21 Oct 2025 17:19:17 +0200
Message-ID: <20251021151918.2922354-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Oct 2025 15:19:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7765

Hello,

I didn't find any references of this variable inside any recipe (oe-core,
meta-openembedded/*), but I didn't look too deep in bitbake's source code=
, so I
might not be 100% correct about this.

Here's the patch, just in case.

Jo=C3=A3o Marcos Costa (1):
  variables.rst: fix LAYERDEPENDS description

 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.47.0


