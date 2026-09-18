Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7A4C982E1
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11767.1789739656268808709
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XGF6ekNm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9CAB41A0993
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7293860649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9DD110329022;
	Fri, 18 Sep 2026 15:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZBl8nKAOEXG0z6Ut06BhvewaEx9ONkiaS+hFEaM69Bo=;
	b=XGF6ekNm4oTHshtSj9Ng6IVLv4L1omgbRhJGnR+Ino8nHmSdaWEEYa59h2DTLTRMm4KGK9
	yr66zwwtYaGfxxhEPTOWE/s5DCFs8kdtK8omRfuvWUkRXq3KMC5baX2cKbIOvHzEQlccok
	/8xfKYhwG7Y8qASZm+1/MVz+h410xIfMgmH59W6g4gIC2S+ZBTCee2c4l5uHei2lqHW6Ev
	7yJAEtN0p48NMF3V/CHDQKxdbZU3UUzW214ZsEuJ4ERX/6TKqjfgWIW08CpiUDXFlZ6kja
	KcYY+EWHip90ncTpTLT5pTv0EhpfJ9+YUa8swBievSg4dsoFbMIqOXl/pVvf0Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:39 +0200
Subject: [PATCH 09/20] ref-manual/variables.rst: document the CARGO_PROFILE
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-9-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nTsLMpst8t0PCFFK6TqqiMZeVjmsyx+ZhZWraQ1jqAI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJkMnRqODWTUb1Wp+1a87ADqpt84UYQeJzkc
 cyfM/c+nPaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZAAKCRDRgEFAKaOo
 NhEED/wL5DkHxBQtGSKHmKO/qeURcX3GSllJNV5XjRwbLcJaI0V4YznT+cf6hqfbPR6P9FipKMU
 lpGaSc01w3Bzve/VIx88s5uoXZTgBu4q8pJ8kjTf6jDwxbjq44/XPlJjsUkbSrGYmFZK+E8Ysqo
 naDDePZzoyrDKBSB0LBhpYjdBAr+DFv2UBiJMn/sZHXLxTh9nYhHg3Q9S5w1pTz0l155SzMb2vV
 ts9HlXoMKw+4wazTwfKxK2XAGM76BNogQc6khFegATp2PufVh9fQwYhf8lfY2YjmR6pyGylPZ2t
 Ks3zClXos5cVz2x5XJAR1Sr5Uuo9IxQpnq479ZiLzXOZTbBNf3zrLMrizwRIl9vOXd7F9LVGmLh
 /cbMdJj0T2h8bXZG6nedfmhoog0GFHaGhYwHXCZuBOsBUAB7ZHVrp9HYlQst72zUBMlcYQFdevw
 qwa5QUv6Gzog3NYmeckr9vOmGNMr1+8VwOWJGvu1lsH7zwwPloZB2FgfEWb292r51EDTckgZCYc
 p0bWye3U6QR85MVu06vk093E1Zn+eHXsqj8JZkAaNw2FWcrj4spakDStYo9LrXtePI+JOa91Gem
 rdQSgB6pgaS7ZtFth1jZS2aevVPVgBsL/YxDiA8SOwoNvPZxBCwxLVjIIk/XCD6DhV35nubsTlf
 aYZxtlj/awyP3kw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10541

Added by commit d4de7d0256ac ("classes/cargo: remove BUILD_MODE, replace
with CARGO_PROFILE") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5f94a0505..2b2aa4df8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1520,6 +1520,12 @@ system and gives an overview of their function and contents.
       libraries are not installed, to replicate the behavior of the ``cargo
       install`` command.
 
+   :term:`CARGO_PROFILE`
+      When inheriting the :ref:`ref-classes-cargo` class, the
+      :term:`CARGO_PROFILE` variable allows selecting the profile to use when
+      building (``--profile`` option). By default this variable is automatically
+      set based on the value of :term:`DEBUG_BUILD`.
+
    :term:`CC`
       The minimal command and arguments used to run the C compiler.
 

-- 
2.55.0


