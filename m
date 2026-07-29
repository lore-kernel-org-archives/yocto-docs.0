Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2FCC54FD2
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7963.1785319367985236719
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 03:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XVxBbcQY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 523644E40FD9
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 274956039A
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7969211C14BD3;
	Wed, 29 Jul 2026 12:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785319361; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fXNh1uUTBK6c6961EihAjv4fV9QPdsm4X7XIaiateYg=;
	b=XVxBbcQYUGEPelAYNNVwYkaJ6FgLGHhKBEY7xnEg0qjInxdVJK0KP7BF5OwlS21RzBlMKt
	c/VWQ7teylRgBW2du9ChfTKPtK5eLbMy5hUImYbq55ltfHNZo4sxs3G3jTPG4TC5OFklFu
	aS64pX+Wi9h/EGxEBkzgs62q3iI3QjJXx2WI+GPqNBKv6CuTg+i7lnoU5OhSMfqVT4C/HM
	Y39q8hkneYr3p5Oe1LUT1T3Nxwg6IaPfsPZ4podeuK4FJcu37Er84xfTeGSNojeCD+wFUs
	+va6mG3knyaAOy3T9PAt+bff403T3JLW8n2nPgnS9XJDIVuXdHygDT50GcyOmw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 29 Jul 2026 12:02:25 +0200
Subject: [PATCH 2/5] sdk-manual/intro.rst: remove a confusing sentence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sdk-clarifications-v1-2-661e65201bc7@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
In-Reply-To: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XaDpeAdD7L2LQsJD1K9k0FdZK3dLnh2mB4LW5TOaaaw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqac+2cHiOQQGvUV/zdb6Yn5Ef4MXRshDEbGoUU
 Vz1mJQEaHiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamnPtgAKCRDRgEFAKaOo
 Nt5tD/9CF7tamCCKGBa0h1o+04SQbJDBfpMosZ69iwRYqR23NSit/5cwVRIegzvYRV073tPKbuP
 rQeBjyD822imToS4kW6ZZ8sn9fYl2d+fcdhq2mnUDIJ9wDgLcEn3GzETquZdWD2eAbV8gqDznXT
 LhYx4soxL2DQh4WTxTOH+3OFhhgwyE3AnF797k8JnfwoufGTY/bsSvAo9VfTBtSS2iCyQsjXgXW
 RyHHT5CcBASJwP01US8cT1mSFeVOhhLpmgCvxt9+mbDftRv/Rn+742fXc5IMvbZBjBPD7axDdrv
 g1kOo0nlOeYwDBsdVgyw4j57nu7PQIQO9Q0BmizmT8ae2MsxLpIx8uSf+5amJV/D4Z6R7dyCzkb
 /imrB2qN1cvEdX410C1QS8Vf0yaf0ncHbLTs2yzPlTNoyTZyuHeCS5C7JzoywObUXYghJva1Hey
 7PjIofziduMGxAjXDfHh1d2COBHuw+9sCuv006RrFg7sER7V9b6TPjY9k1iaEzR1wpY7zO85qjr
 fk7O2aRX/aSqn4NTfuZW+m1z9qhuNfGmWBs8+fhb63BQ9zplTCEba+6O+SYSoZFB+t2/dOKowL3
 zXxbgF3Q/DHiwmL1gCUPp9rvP3iiZhLpHK7iCwwJMzNZWW9x5b25Ffm9r9Xmgbfpco3E93rbKte
 pW62LxuOK/Ax/1Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:02:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10187

I have a hard time understanding the meaning of this sentence at this
point in the manual. populate_sdk and populate_sdk_ext are best known as
tasks, so the meaning for them as "archives" is unclear.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index dd2902cc4..3e78219fc 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -35,9 +35,7 @@ destined to run on some target machine. SDKs are completely
 self-contained. The binaries are linked against their own copy of
 ``libc``, which results in no dependencies on the target system. To
 achieve this, the pointer to the dynamic loader is configured at install
-time since that path cannot be dynamically altered. This is the reason
-for a wrapper around the ``populate_sdk`` and ``populate_sdk_ext``
-archives.
+time since that path cannot be dynamically altered.
 
 Another feature of the SDKs is that only one set of cross-compiler
 toolchain binaries are produced for any given architecture. This feature

-- 
2.55.0


