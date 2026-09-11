Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B322C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41376.1789138588123997468
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lddo2zGm;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4CC80C63A0E
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D55B601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEC8011C7AFB0;
	Fri, 11 Sep 2026 16:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j/L5S2+jXCdcw5QT4J5KgoUI0nI1raJByI6cLY9gL7I=;
	b=lddo2zGm5Kezbszhxufpma9EX5LWa6knojkfVZdGyOoIbqttmCmgJgJAMCG9ivBpc5DD7a
	4rVjRN4ODyheQRuU1+MgMvKYQifvM3/QN20fhNCxgpndcAfH30JipqOGASDElILA7kUmwm
	AeKo6OWSnBVndOCIuuR/t0XuBpeAHo2OVGDMYDxKwjNdHuz7h9FEDhiKxQXCgDVIHABQhj
	QT4DWeNPKpq5syOKmfo5YgDMjUQ16ixPW2y1BT9xTq81He+xcYBRNk3yo45ca7pQg5yUUv
	4FujbasBJWYo58do1oK//vdg3C8DmtKhhzd1YbMxHSvMpy9DWRUG8c+UnG050Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:03 +0200
Subject: [PATCH 03/10] ref-manual/structure.rst: fix a "local.conf" ->
 "layer.conf" typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-3-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=aBGiGUxP/ovpzfblhRcW0iUHm2J3R91oIgrpX8QAdR4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaVeQSrGBVk0iCsMLOq9x1JiQ3vg3qFdDw1c
 TchndoHZjWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlQAKCRDRgEFAKaOo
 NvmgEACKy3meDKgaX+FqJ6kanSKk54EEfQgtfow3/KzyS2aOihwQf2mT4BpQYilLm/AjwAVfamv
 WFwlxaEPDDF1azNg1qmoe3o1z567TTrjsO/i1bjoXt6WUWHi58w1I2IxAkZgUuYa+0V/4ZjriH6
 rd7Iiz5lcw6Y2BC2u1f7Orml0+32w2Fw7EzyY4nl521nrleF4RGALRZ8Jwn3zuzYSCeM5A4Ic/A
 T+HLG6ig+sFPS+I3hd8IvM/yUIO0jb10dCJ3qk1/AID1OtsidoloeeTg9nMs2HuGXkvsLkMokMg
 s/3/0g8MwoAFMPnpjefYoHUZQRkH9s81v2PIG3ZULHGtFOEIsWKQ/PexztuW9doxL+B9kTU75dn
 hBwsjn1uzicMqSFszuwUmC0AUirxTnOkGQFE0DvLUTjUVq5kFLbNowBzXSXyoKZDQ7hYXLxVeX+
 BJeCToT+z7InXHR8rwpBfxUga2pXKIGJjPEDXg5DM/IThZbq2hBCrhvzC20zc6KOyE//zJ2aINp
 blJKeb3mUr39VMMimJDn814nRkevdizTONsVIk8MPqBYaXuBSBcL7Ef6RqPrkFqApBWy2yLwJ0b
 C8Wu3cnAyM8gFKLYXi0+SqmMAMIKIfMZj6J/ICxniK3C7oOr1+IibvHgDKZA73eJV1lKjSUz4aC
 DrdBsCjpWSA2j4w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10456

The addpylib directive belongs in layer.conf, not local.conf.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/structure.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 2886713d4..ff103a55e 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -891,7 +891,7 @@ and lists of files and directories with known permissions.
 
 This directory contains OpenEmbedded Python library code used during the
 build process. It is enabled via the ``addpylib`` directive in
-``meta/conf/local.conf``. For more information, see
+``meta/conf/layer.conf``. For more information, see
 :ref:`bitbake-user-manual/bitbake-user-manual-metadata:extending python library code`.
 
 .. _structure-meta-recipes-bsp:

-- 
2.55.0


