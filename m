Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067C1CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.4951.1761294040867293862
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MNqv4GIk;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8078D4E412CC
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5800360703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6A42102F2486;
	Fri, 24 Oct 2025 10:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oQPLtnJaJ6aLjbC5ta4RHfJ4Tnq6akWKjbY7P9TqEh0=;
	b=MNqv4GIk6A8KkY0sD2aXpsYJWj4/Yp84vzIYL+27sxHJ4UmPDCN39/xvv8RhamqvN39NGS
	HvnrhkHQj1GXcSYaypQ5SGCebBdHuZZCcZzfBQn8E4ydhBLO/Iyud90QAMDIB4eVoeYGF4
	R5un7KJ9oNjuQe51GB5w6AK53mrT4WGcbBmB7rrOXt9HD0gO/94ayE3w2gb7XqeJzBBvJY
	q5PWSWpuJxTkKy/j2MZFbAOOlo95jdjcor4AC1/Of0iKSBJOZxTwtXPAjVDXFYQTKGE1rc
	+75JoDowNR/oJusVogqaS5yhMPHYtBv/CutMKFFahhGaTK5JcJQWu5ZrE3BOZA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:20:02 +0200
Subject: [PATCH v2 13/16] ref-manual/features.rst: add entry for the
 coresight machine feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-13-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=OlY2hyufMZyRZOHbwSlrMbkdVVriWO7M2yKehJE5QRg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbKvkdxMojpUrPVJu7T1o+OvsC/h9hhsVPHj
 QRtsoy1BiqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2ygAKCRDRgEFAKaOo
 NpDTEADIgzxv73iWeD7CiVAW4V+/Qf/k2Z0CnqSTLixqicS/hd3WTmxXyuPPp67bywKIp28lz1e
 CMXMKuePba5eimA4sAgiNxul15RPgqUaMr0tx7j/sHDOMqsTWnuKsi4OB3T42drnjAvMP5wYTBr
 RfON6pia+Fa4GFTkiHg9pfEo2Vrvr4p5AwhKSnKmw+mII9dAWRK9UPKiYvR+Cpi8wAMtBlB6LyV
 SnVKYk3c4mRg9u0Byl0yuBVyEyMVK8Qkf+rLK/RWHxIe7T5YN+aOKpnXPcBLJM+Tqz0y+FAzM07
 hgJ5ezYqdBPLUzQdU74lOHhgVDMBz/XOhYy58/p/VD4mVm2o1Fi0pgjeB6Hd4XlknYHSbuRlFKw
 r9bzMwRaleaiQ34ZtziN/rVJkon3uVkx2Ipi0Ety153iMzD9Bf/6LjMv3a9D4bMis+G+dz8Pfko
 7udcUflkj2nXU0y9mYrYoPNIkqfg5SXfdeTyUJwPQZ5W3isIzJ2nt2AmDhDujDGQxmTsP+SQvXp
 u5e7JbM9JGrdK3GjtA1YLPJnMhYDFy2gPgtwxm7Z8WQjv7DSX/yqtx+/EjGyw+EjxPfYbhDOsuY
 ajDtLPfSUQbi2S6IwVnOzdnc1oTmJGSPBjW7wuBLOH7VH9j4mzK1Ax2HnhWk01tykw+ydomwcdh
 BJnLy18cBxFBSRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7802

Added by commit c455bd039104 ("perf: enable coresight if enabled in
MACHINE_FEATURES") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index b295ab44e..6bed23abe 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -54,6 +54,11 @@ Project metadata:
 
 -  *bluetooth:* Hardware has integrated BT
 
+-  *coresight*: Support for the `Coresight
+   <https://docs.kernel.org/trace/coresight/coresight.html>`__ Linux Kernel
+   feature on Arm processors. This feature depends on the ``opencsd`` recipe
+   which is present in the :yocto_git:`meta-arm </meta-arm>` :term:`layer`.
+
 -  *efi:* Support for booting through EFI
 
 -  *ext2:* Hardware HDD or Microdrive

-- 
2.51.0


