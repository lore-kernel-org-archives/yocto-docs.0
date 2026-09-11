Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC828C88E60
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41432.1789138593366542233
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=P5elHbM3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C7B6C653FF
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDDFB601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A6F011C7AFBA;
	Fri, 11 Sep 2026 16:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KesM0/ZlIwFMCanhXMzNd/fMPcmJpr/a+XvH82+Izqg=;
	b=P5elHbM3BkWJDawk5enNvX1nij/6ixsyds4wHpCx1ETKbhdVaWfyq/8/kPh2J6LuFIlYZL
	9xYSQPganw/el10EGT5a3kMVNqMNZnF/4TJjMitefaslpjwtV8GR4Q5PlD5KOjybVWwgCt
	dcNWfpEWpfssP46nAgzPYUX16lNDmJtgDEa7ZTAg0CZCchqd6/JunfdZNnNBCEx5KtgZew
	/UmBtBPvE5x67/DazZFcOsEWNGhg2urUm/N6F5TZa32Bt8UwgVR8d2+WTN6sO/GcgFAs+T
	TBNj94/j4OPQdIzDaQOdSrDm8GHMtCBLq8aDT5ByQRMWpdHx2dAoaZMDQxyWrw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:09 +0200
Subject: [PATCH 09/10] ref-manual/variables.rst: fix local.conf.extended
 obsolete path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-9-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xGtErV45bACMMVgl87VQqBf/W5auPyD5kPpAgUDVYnc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaWucp8UjAKoji+tfUGNN1m3EFyZZTyv9WPh
 cScsR8pbEuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlgAKCRDRgEFAKaOo
 Np70D/9ejY2nNBU5pR1wbG72HikWWRtu6XMKGd7aFtiR/5NG9/eVgskOLe4kX16byKsYz2Uxs2b
 FnQVWXEjanrPd3hwDpuf0K/qw7UK6q3n09J8AlCS5TiWpLSXYP5TS0DAjvsT644qtS/ym92hfYW
 +hm84TxcL1VOUr4AfSPtNsK7wHgknsjz7dYkkE2Vu97hk3NjrWU1JsNNPa3/kfA0GGk8nRwiFZp
 N1Qvl+Knbjgj1CGMOpp7d3dAxAvRBMejB0H1OLkbIZp2amS7rMss9Vm5v9JRbKOy9qo5XHpgLqo
 Y1PkCyd0UVyXYH7bMLzHCjnV8wxJ+JdB+P6+xNRVVKK+cYjmglLK13oK9hPNK8m7gQe61aXrH/G
 8wzFbYe9rkxjB4kebGQj4HFDPxX3ueT1ujtHHnh7DwMhT8RIoXb6Rn6ptrBBfpJOcgsw7y506qw
 MKZCzYq9gafB5A8N3OLG6bcOGYd0pQjmp2YHwmC32fJDQUztF7c13+bpXgOLvc+NHD8lx8L1cyy
 jjRHJet/XMJ8pCZHoHc5rCNe9NsfgZ3eu/+xhrPq0UC+uJhFDy1X6f4Z671bLiydNnJI5Xrsbas
 ejcRmKaRvODActyRKMP+qYicERbxauT5bLfdwz2Dt+Ia3aJEzOXHPpfFuwOQgHzJNwLyyflb83n
 Pq0aRx61d8pN0lA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10463

The file is now in OE-Core, not meta-yocto anymore.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 972349497..4a41e3501 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5022,8 +5022,8 @@ system and gives an overview of their function and contents.
          to "core-image-minimal-initramfs".
 
       You can also find more information by referencing the
-      ``conf/templates/default/local.conf.sample.extended``
-      configuration file in :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`, the :ref:`ref-classes-image`
+      :oecore_path:`meta/conf/templates/default/local.conf.sample.extended`
+      configuration file in :term:`OpenEmbedded-Core (OE-Core)`, the :ref:`ref-classes-image`
       class, and the :ref:`ref-classes-kernel` class to see how to use the
       :term:`INITRAMFS_IMAGE` variable.
 

-- 
2.55.0


