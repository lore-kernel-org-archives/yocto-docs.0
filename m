Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA40C44501
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:13:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16078.1782807203108748501
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 01:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yHNLBJ9A;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 712F74E40BA2
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46AF060233
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C206106F1CC9;
	Tue, 30 Jun 2026 10:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807200; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9JuGitwjcyeFTv9wJPQWcl6CIiu9fHJTw/a1iNWftcI=;
	b=yHNLBJ9AIh8caVzrrusYNJIO0g3I9AG2Ur/Gd7IZ8md+RlaeiXCvQ+vpyC27vvsXO0NGNo
	4LGNdYqrbjKv7hnR9ZTU+gyaFEH2QhQlosRDsdvRJgWYVG6raIyY7A2MlMUo1f49lMAn0q
	OLHwz0E/eQ8QdToNz9AKoxJzpfzjAeNPXxlR2N9XfmFLYNLRRcvPe58/XzzAMI57vumrNG
	BLhF7U/WMnJWQH7iLwUk6ClHSHaE3O+gMqqID8wpRQY2HsWiaGOSxTw+mmNNMi0e1uCSLM
	du77dhX5O9zXvZ15jK5xtZRiuqImRAGizG5nZtHpHxChvFMn+x7hhgsvGEjYig==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 30 Jun 2026 10:13:13 +0200
Subject: [PATCH 3/7] ref-manual/variables.rst: document the LOCALE_PATHS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-sync-documentation-conf-v1-3-da14b40cb515@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
In-Reply-To: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9NF3qTHiaw/yf3qIcBH4OjIgV3GgVHPITY1AtbyHwyI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQ3qccBJjHdsQ2An1fkApwCuNY+bYPY7dWGa8y
 XYgS50np1WJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakN6nAAKCRDRgEFAKaOo
 NlxYEACw9d4vDufFmE7dDAry3H9blsN0Sok6U6Y5kQC3XilfPfqS51dXF/BG4qjk5kfubp3WsYp
 xE71LRKvjmlSEiBMDNDHSgzcXXa9zTiX3KXOYKiTN2Pv7Ok4OSqN9QPS3dkuUs9JaQnird0BPQ7
 MP0PJBn7NUQE/4sU4+qhGhAplXnZWZYxCLwyV4EEOHCBPU+jN19Ye13NdSQ25BpYRPFNrxPUqX1
 4PySosZcX8E9exRgCvuMNsJXHfzpy3qMdPB0KveKwNfnKdkLlf/E+xlRTpzLXNJNPQljwvGfund
 pMap20pP1RJmm9th0hKQdQ4vGr8uhYZhgrUV9tewZnQd8nUizppbHos2ZF6sXysX8e9OwlmG4jh
 81gkpvXiOlIWm90Nlr+aJy68BBBFIshy4KOK6ghLfXR099tOsVkKJzU+P7/vpfJ1QqukUDsIU/w
 EfWpFIDr0ezYhPM8e+GNYc0v4QeKdn7K1SmRJNBoHbhOSXedpL+FZJVw+OYIjYbXp4k//Hp2fiR
 BvcHdKy/XwHqEnmw4LC4U5xzqg31F1ymAGCChcfe3Pmuu174t5giHwt7Gexzqs4yYc9OLRjiJNO
 yOhnBw3KNufOfGA7mC98gYbGcMWunEGwOwiDpaAEChqekVXMs6me908OQRXPd+IC2/kAK5kU+Ul
 iaVbDbjzLVDc1rQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9985

Added by commit 0ffc7cf01225 ("lib/oe/package: add LOCALE_PATHS to
add define all locations for locales") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 55c0801bb..64e329c07 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6077,6 +6077,12 @@ system and gives an overview of their function and contents.
          $ uname -r
          3.7.0-rc8-custom
 
+   :term:`LOCALE_PATHS`
+      The :term:`LOCALE_PATHS` variable holds a whitespace separated list of
+      paths that are scanned to construct ``-locale`` packages during
+      :ref:`overview-manual/concepts:Package Splitting`. The list
+      contains ``${datadir}/locale`` by default.
+
    :term:`LOG_DIR`
       Specifies the directory to which the OpenEmbedded build system writes
       overall log files. The default directory is ``${TMPDIR}/log``.

-- 
2.54.0


