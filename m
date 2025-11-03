Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78849CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:33:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1767.1762187621061366878
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 08:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=e2dbMwXG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C01801A185F
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90ACC60628
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 272E110B501AA
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 17:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187619; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VXeEtP7UQv1EkC9OfkxhS3k1XQimZbs8zCQO2qHuXkg=;
	b=e2dbMwXGaOGj5ecJjUR19Tg2ci10mCGrhrFmRh/jZnXJ20eLVccBgNimpd+lu29EAcp0iN
	7gDdC+52QnNMhFDRkAvba3o20A6cUtcG2PBRzwaoc5PkWo/rc2z34pUEI3+z7/8edk95vi
	fhryeRrVGemFJj9N7XcWIqet59XLUA4c0+Moskp7hcwQrOlgsNXvzyS9HlBhH0e3dUjOHz
	OXl3ppYQO42kv2aCZI24KYO/6uhHFG54Vw1UEkjHZRrMnDg7/IruiCXSTHf07UTZ1d7w+G
	w7NNXhcD71X26RfHbieoQx3h8kEy4ZheAOCQ6mpAG56Si7NxtQfPrip5hiqZ/g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 03 Nov 2025 17:33:10 +0100
Subject: [PATCH v2 6/6] ref-manual/terms.rst: update Poky description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-bitbake-setup-v2-6-89fbb14cfbbd@bootlin.com>
References: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
In-Reply-To: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uEHzqAKXqc7JJMqCqzTjRdy94fUsCEFbaZDd6cPSWsI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpCNlfq3CEZrsza8qg2YsQaonspwubUK3ZNqK6p
 /alAq4qykeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQjZXwAKCRDRgEFAKaOo
 NnG4D/92ZVod6vxzFZuS20pmXFhrGCmIx9vouPzoSci2ePAezyji4DWlL18Zg2i87PrcuFlWMaj
 WJIZkvq8J/odSk05kLBs5RhpvDOxd2c6OREM0Ydy8KTJXG0OepOlgi42z+1iU3FnY5Bhaxu4taB
 BbiQFtxk0WxuNgVuesQ4dE0Rv7JNJWsZm7G3VNgzqophGSb1xjzW+8zvhHMvoepUtNoGfC/vy8N
 FydCVT7YFeQuotZtFyGWgNegifEODEZKI6ZaJ+B36KoaTPkft6yXQkc3O3rFCvSIQRpqXLzJN5f
 qRDYKv6fmjQ8RuaTAhGoVXzvTenF8qMoxSZSVEaOVXEsq5pUAHHXosPXQnEa+bO/DEqv1p8IW8C
 KcRvx/Zjdj40CCP+f30RSYZoaPOdgSIwvMHT/E9EqROSMseUaFI6+EF+K/WAUoeaIIFMZf5Cbns
 8Sb8ZbMBetuSr84xGuv7avGGipT0t0I6WusVoXbY60eU0rX4bptLeid4VXCp8K42BBCSY8Y1k9j
 s5l9hQOm2hvbHr4Xvm+21IyE3lbTsDU2SZNpfL8icfSB2Ip3fKDY/UCquxVJmf2axLYgePyFxcK
 7HnMEQhtV/icfWT79YZDswI+Ro5t4TxcjhqLkLr7zpprosWTFPdXH1NVTe0RGXrJ4lpZ7R0plra
 eDR/Bz6iRypJXdg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 16:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7981

Poky as in the repository will no longer be updated. Update the
description of Poky to remove the last bullet point, and add a note to
say that Poky was used before.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index e25c714d9..6a9f88061 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -461,11 +461,26 @@ universal, the list includes them just in case:
       -  A means by which to test the Yocto Project components (i.e. Poky
          is used to validate the Yocto Project).
 
-      -  A vehicle through which you can download the Yocto Project.
-
       Poky is not a product level distro. Rather, it is a good starting
       point for customization.
 
+      .. note::
+
+         Poky also used to be a repository containing the combination of
+         :term:`BitBake`, :term:`OpenEmbedded-Core (OE-Core)`, the
+         :yocto_git:`meta-yocto </meta-yocto>` repository and the Yocto Project
+         documentation -- which were combined with the :yocto_git:`combo-layer
+         </poky-config>` tool.
+
+         This repository is still hosted at :yocto_git:`/poky` and is still
+         updated for maintained releases that are older than Whinlatter (5.3).
+         Newer releases now use ``bitbake-setup`` to clone and setup the initial
+         :term:`OpenEmbedded Build System` environment. For more information on
+         how to use ``bitbake-setup``, see the :doc:`/brief-yoctoprojectqs/index`
+         document. An alternative can be to setup the above repositories
+         manually, by following the :doc:`/dev-manual/poky-manual-setup`
+         section of the Yocto Project Development Tasks Manual.
+
       .. note::
 
          Poky began as an open-source project initially developed by

-- 
2.51.0


