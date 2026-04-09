Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1D2E98FDC
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:40:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128478.1775727651107198604
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 02:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=oAAUQRTs;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0635A4E429A1
	for <docs@lists.yoctoproject.org>; Thu,  9 Apr 2026 09:40:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D18C85FDEB
	for <docs@lists.yoctoproject.org>; Thu,  9 Apr 2026 09:40:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A6F4104500DC;
	Thu,  9 Apr 2026 11:40:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775727648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Hm9cBbKxKyeb7kXCvWIOpR9UtYdk4aKmgXMqWr+Ors8=;
	b=oAAUQRTsqv2GPSOIrmOAMe/Br5kQfEXNQxCq2sjOokwlBsUDVLPkkpppz0o5Kc8LCT6cVt
	NT9TC236NNuXbstzmyx4aMeH/rjjsWLCUjbUXvlG2lBKKw2t8N0wv3DkiY7XgXzsebP/x3
	wjKWoKQv2WwZA/48FdZetzzpmcyszSjZ25kptSow0cJf50XJBCvRFcUuXrhZlZQZlJQt14
	k4aqUJgU+enIy2o+681fdj9o35Z/hvRyExTFHrh9cD7K7DhKsYqsyvOG8Q++SInB8BLKZv
	SRJnL6uPjrP2imleZzDtuT0B1nh1Fv/3etH/moZ6q8r3Vr6962cKSvEqIcJtmA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] ref-manual/variables.rst: fix wording in COMPATIBLE_MACHINE note
Date: Thu,  9 Apr 2026 11:40:35 +0200
Message-ID: <20260409094035.346379-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Apr 2026 09:40:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9206

Add missing "that" between "recipe" and "inherits".

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 60e608c0c..8466124e0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1679,7 +1679,7 @@ system and gives an overview of their function and =
contents.
=20
       .. note::
=20
-         When :term:`COMPATIBLE_MACHINE` is set in a recipe inherits fro=
m
+         When :term:`COMPATIBLE_MACHINE` is set in a recipe that inherit=
s from
          native, the recipe is always skipped. All native recipes must b=
e
          entirely target independent and should not rely on :term:`MACHI=
NE`.
=20
--=20
2.47.0


