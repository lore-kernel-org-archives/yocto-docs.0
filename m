Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699D5C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:47:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.630.1783694832405439515
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 07:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wox43gGt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BC7321A0F42
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91D8260342
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D670C11BD1743;
	Fri, 10 Jul 2026 16:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783694830; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DLv7g0jMHK7VSWurm4CsbY/wEGe+ZocCDZz9friyQQE=;
	b=wox43gGtZWkB/ptaTbB+9Y7TSGIZu1CgLI7X3HRwV8EZ9I2gxWeA4X8Wud8juRGFrc3TfY
	bjg7TH/8CxCtA7tFpsY23yuR8dSfM2CCK1eUmWZzNgVHmaLBjsgZR+WyvNYklTJNZr4JGz
	VUQDrF2Dkq0oar1JQrAB07nCwCALbhDTv+3Lqu01Isc5XZMBViV7WIazc1p130+YnDXZ3o
	p69rhnK95k5MsvlfT3rbVSFbQkCppRnMSAUuqp3aLEq9PYiMDxteTnKIUTtgPjxT7+qkUl
	FHLUeZeoi8HxTajaAc/O8rlZ6g8oyMX7W6y8rIECMLYupnFzWPy9E94nje4XWg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 16:46:49 +0200
Subject: [PATCH 2/8] conf.py: add extra links known to be broken
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-linkcheck-v1-2-999168371d5e@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
In-Reply-To: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PCk0n2dlEBBAl6g03y+TzY7WSD1GGIQcgPWvUFKJtm0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUQXqJyFEMTVPj6euricVFnm9gJrc7MAH8RZ17
 bYs+s82U4uJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalEF6gAKCRDRgEFAKaOo
 NoPbEACzsAH5/Y9cBnIlHFgPIrOe/baWRGCLmMHDRTpm7dizKlrM/mfUcCJeNsYmGlnF7kXozGn
 4b6sMRUQtLOEk/Hae83YExp/affQexVAaBBN7ly9l0FcuPvmEIQ7v9wPyxQ8PsCaAjg4AI9/xED
 4oQEVhj5hfhAihTUGjaWmNrNkm7K+NFwKPTNE7IwosvrTC+Pa6jHNLGGPZ+OtTeCTYihfMDAVS6
 5huK7uEjzMX1J8s/Vmmb7ORPinWN5+KhJa+/Dr5EYFcHA+4q75dUKXuIXJVqLV3dPfPHRenCgPv
 2pn/lSW5NLY7ir3PsxQYxocXHT5Zv0LKf8CWkHUN28o0/Ww0bYe+OSO2ZsczgA9uwv/iarZiguG
 e0RwUcL+PFUY53gd4H+xH9a0DfEzgMAKLmxy5kKnVnSoDyBWghI0KIX1WL1LeXj6LktM6Xoo49K
 PW+/5F7JzX2Es+UyRcpOwijn9DxC9fn99ETIH/7/8d8IjYI8Kc5EQq0bdqKL4jO2piaRv+bF9T5
 yw92x7X98KTVgiHrpv44vjKWjBLgsnOXLcMYq6Ly6KH4SWXiDkKJsZnHnCY8ADFqCgoT8ea8h2E
 Ke0n94Jfpzo4PLnp1kbJHUKPd+Csvf9I/H8gk7kyEqEgCkdjy5AlExf5pYd4g/GRvQ8q4DowXpZ
 JIzMWLVMsAVaUhw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10057

Those links are broken, yet our documentation still has references to them
we want to keep, namely in release notes. Make the linkcheck ignore them.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index aff01c1ed..a5b0add8f 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -156,6 +156,16 @@ linkcheck_ignore = [
     r'https?://mirrors\.edge\.kernel\.org.*'
 ]
 
+# Those link are known to be dead, yet we want to keep them in our documentation
+# because they still hold value in the context in which they were used (e.g. in
+# release notes).
+linkcheck_ignore += [
+    r'https?://linuxkernelcves\.com.*',
+    r'https?://gpe\.linuxtogo\.org.*',
+    r'https?://jk\.ozlabs\.org/projects/patchwork.*',
+    r'https?://rlbl\.me/prelink.*',
+]
+
 # -- Options for HTML output -------------------------------------------------
 
 # The theme to use for HTML and HTML Help pages.  See the documentation for

-- 
2.54.0


