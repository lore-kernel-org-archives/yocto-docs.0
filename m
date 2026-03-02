Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7290AFEE4CE
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:38:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157027.1772444284212918375
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FF70puOA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA1724E424DD
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 785F25FF29
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91BFB10369536;
	Mon,  2 Mar 2026 10:38:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772444281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tTjoLefNFNOIzJz7fy4eM8sOVMPs6AflOlUFE2YZKOs=;
	b=FF70puOA64RKzdP4syoqo0Rf5bRqhfqyiDEjnDYc4sc6L3w0HEbUpYU+djIszvvbjRSSt1
	UQvyEaMAufz6/7pM0X321uXtYqzGKvCY9UbyX7fY9GYHM2u2s2IS4lHCouipjGu/fvm3aT
	ef9ip6XrVSeZnWzQ2rVEDjk+3LRBEaEM4+EVLZEJig8f0s7m4vAlsoEurrLCr0esSThWbf
	jsgJA2cJsGPu/pSQIESBsVSFuee3qnOPWe5kTpwP91TNs0wc3rBlnPHQQ6pQakUAbEI4q6
	arCpwF56E0B8g2F3iu4E9GCFIKq1z7lnuqBKPeEMrVGdylwk6HYQI6+1LMpqgA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Mar 2026 10:37:51 +0100
Subject: [PATCH 4/8] ref-manual/variables.rst: document the LTO variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-release-notes-6-0-v1-4-9662dee58591@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
In-Reply-To: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=pCii4XcYJyLdt1MfMRmkYWzDYOINklW5Kc0I469qjwQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBppVp1L3M65smoY8dwSLUbV/IjQn2N20W0pPPDq
 sJ6NgvFJ4+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaVadQAKCRDRgEFAKaOo
 NhtyEADDmS6/mz7AbQHcULLuzUF8aXSg0c5ANFTSjGIO/4i3MlxpX1bgOwa6Z3ZWIYKDoq6TBYz
 ULc3wmEInM11RQz271WsQ4WOps0sacWcdzpTzQEMtZL5jtgJJl4Etli1HskVhzISFqxlXxI38d5
 HRkV0VR/QmPPh0Dur8Gf0Ubn4G3OjBpD0IERn8jvKNkmdBVKniak//kaScDDZh2NGlNksI8rUKM
 /VqMdKuAhwTFNuWvdezxT8KqTSnsoL/cmfxb4ZeJaxTIxsE6Vv7WUJ0Qrl0VY/tluK8nm5H2xI0
 JgbQZq5JgvuPJLYyqbQkoy+oIvjY89KeF551GHNDnIyV5MZCbsN4OHlZqlYo/bx1StdSNHGue3I
 z25gBluHc8JwvXKLvE8GQLwUtXXeZd4xNo6VvEDtv04JKlHmC0FFbKXDYZ0KiM6Wc8HJBs9b+gZ
 tg70oTSg9L7ZdWigMaiVgRX+YPFLE+cEANwIFdVXADCR0t6g0VGT5FEVqiJH2nX0WMkEQAhlPeK
 eTMoNTTd4Z8WVkhEPCbA7R3OhjTcgBatbo8CaCqdvKDSIbRrtGhpvzqCykz/sRiQF6nbucHAwb0
 zJkfXkLNNbuBGIzgqCcGp2/IcyeS/VeuyDSGSam0NrZwFcwEmX4Ty7Z4E8sUnyBQppV1MgS/NBX
 5wt5U+DVG9kOw9A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9020

Added by 228b5a91516c ("lto: Add global LTO distro policy file") in
OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1fedb98d2..579faf7be 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5893,6 +5893,13 @@ system and gives an overview of their function and contents.
       For the directory containing logs specific to each task, see the
       :term:`T` variable.
 
+   :term:`LTO`
+      The :term:`LTO` variable define the flags specific to the ``lto``
+      :term:`distro feature <DISTRO_FEATURES>`. The value of this variable is
+      appended to the :term:`TARGET_LDFLAGS` variable, adding `Link-Time
+      Optimisation <https://gcc.gnu.org/wiki/LinkTimeOptimization>`__ flags to
+      the linker in-use.
+
    :term:`MACHINE`
       Specifies the target device for which the image is built. You define
       :term:`MACHINE` in the ``local.conf`` file found in the

-- 
2.52.0


