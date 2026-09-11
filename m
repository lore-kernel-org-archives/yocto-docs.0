Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D51C88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:11:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41855.1789139501376046329
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xR5o4JWc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B12A21A01EF
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87104601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E997611C7AFBA;
	Fri, 11 Sep 2026 17:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2HZqUgnIZnSUhCpT4blXX91qHtM0mO+O1vXLCeclhD0=;
	b=xR5o4JWc1TlRcbjDR9zZ0BgBdtgrDiE+ofjl6Wehs9qU4U0COWHbz4HP/rkj22dQEtlW2/
	OPrykozDHFUf/rZpfzvnlk7ARtaOVdJNsPwMhPq8LwrYITWm4mx2tcYIzbHLFWazEPDgys
	Kfhsa2TNPKsxSHhYLL86286bLem+rBRAU9dbD5w7hRyw4YUxwjVR/fJAbjkahsTIDvq598
	AqIIGtgKMS+vOVy38K5RV5Xv/jx+1yhLpT3XwePgHTm8nclitxy7b5HWtG1v53thzIOwQe
	FSGnIETP3RPIc6/ujioGzp+XGngmo0qLfom9/m1/+L4hcE09IsGNANMxnB6KLA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 17:11:09 +0200
Subject: [PATCH 3/8] ref-manual/terms.rst: Configuration File: use a link
 to local.conf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-remove-local-conf-refs-v1-3-322e1e9a232d@bootlin.com>
References: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
In-Reply-To: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=heuNLsku99EyCCYchrYkQstc7jvKb2TTTr0yO0SuMf8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBoWvoURtkySSoeKtTfvyGhbh1nHTvNCyb0/1
 vP8P9903Y6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQaFgAKCRDRgEFAKaOo
 NgyZD/0emd9zT26N5PdffSCDQ5EsNIlZOpBZxdgMnCxNGd7nViqW9O7a3zMSyNHzKdxhkB/Bc84
 d+0g8cUC6/OBhrg7Rq987SjfT/ICSNJNTRu7CBx+zP74KufdhxhUi80+GFe+C5c8WS2Ardl2R2c
 HD3LqZsNffmjxUzHRXyJykAhV2p/EaJpdPJwys8/dt6MH3dI5Wz4j+czvH9ihZI1SQWJrarKRLx
 lmyHcvmhUJoOwgYQsSn+5XWvNnibe9/nvgKVD1pSG2r6/JERZXwOO7C6NLXs5RrA6Dx0EP9Fw9y
 JL98mPCThK3tE7tVphLdUklKLjv7LcJ8i69bz8pOQdPkHcoQlWmibw9PTVv7gL18KdAxX3vK6Lo
 IYsqzTFV7CjRJTgC5C85Nu/l28R2mBlbfWgoik5Fisqjv6kyQ3oZGNgIDqTjc6WszYSuKQF9Epx
 DZNs+EYh5gP/ZshA6q0bPN7ZLeaRA9lcFuq+dH8ggeeOvP2uIfCW4o9TIyXr1CQe8kNJGB0LLV2
 hGSQiy44LcDD/L8oypX2L0d6Q8a9OfxahNrrZtIluIIqqgo38pDx+DvAVIldRmut96/AE1JQYgN
 mUNVHno+3YEYVaNESGcpv43xMUr76BT2+TS51vsGgrucxBHYJX7TzjxjfRiqA/wX2v47EU2PHRg
 8dgDBnS6hZaz4GQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10472

Reference our structure document when referencing this file, so that the
reader can get further information on it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index c210da4cb..7c2ae896f 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -198,8 +198,9 @@ universal, the list includes them just in case:
       Configuration files end with a ``.conf`` filename extension. There are
       multiple types of configuration files, such as:
 
-      -  The :file:`conf/local.conf` configuration file in the :term:`Build
-         Directory` contains user-defined variables that affect every build.
+      -  The :ref:`structure-build-conf-local.conf` configuration file in the
+         :term:`Build Directory` contains user-defined variables that affect
+         every build.
 
       -  The :file:`meta-poky/conf/distro/poky.conf` configuration file defines
          Yocto "distro" configuration variables used only when building with

-- 
2.55.0


