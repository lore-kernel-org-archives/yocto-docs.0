Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7672BCF34B7
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 14:45:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8622.1763563553968260560
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 06:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pKdKk14H;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D899C1118A
	for <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 14:45:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A910B60699
	for <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 14:45:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 000C510371A76
	for <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763563552; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding; bh=NJt21FhUPBh8J/ICm1LfeV43ps+xL8WUPnNESgsGuL0=;
	b=pKdKk14HC0jd7/3pydMhKPGvAcTgnn2qCxrHNXV1dBw48ATNNBdXOBS4lurt9eubNpmw4A
	lWDVZAxUsCIRZNzWWGZil0v8UqjfpV/Yp7yuJd/3dMSz3EsUoVOtINGJPJT9U3stAm9FLp
	ITRJPjFiXhHtkN3vd4TUKI4FliezyaPx/hjzlK8PxchOAh1TJCURxtXjUKRHLp8A/YozyA
	zVWfSAzkZPka2vgZ0Hf7arYCII8pt4HD0MJLcyScFV5Ugsh1G5qljeJCtftH3Z454n3c1i
	lplnybp9VNsZgnoEgux7IwGEe/7TXsoI8Mthhhkl4HS8bzAirDIR5pUn26aBVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 19 Nov 2025 15:45:40 +0100
Subject: [PATCH] brief-yoctoprojectqs/index.rst: fix bitbake-setup settings
 list command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-fix-quick-guide-v1-1-f17eaf2bed83@bootlin.com>
X-B4-Tracking: v=1; b=H4sIABPYHWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0NL3bTMCt3C0szkbN300syUVF1DYxNLs7QkQ8uUREsloK6ColSgErC
 J0bEQfnFpUlZqcgnIGKXaWgDLsalRcwAAAA==
X-Change-ID: 20251119-fix-quick-guide-13496fb19da9
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vXroh9hVpxtJtjp6p/u2ZQr18ijLG0fOKxIB9441Rb0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpHdgfLh64Cdd3AJUhHBK6GhSr/MzUH2Qxmw7Qm
 kzELnC578WJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaR3YHwAKCRDRgEFAKaOo
 NnXwEACurYWMtESfw2IkvE0/rE57ya7X9lbs8VZgMcetinaMo75+fPU8wVO3mbgLhUFXSezXwD+
 H+n4Elv/CT87SShXjcdnuJKHgVQKMBTs+TcJjSXN+eG0zfY9FTR4FeyXFxhhxV7lLNjq35KKEHx
 Y80iE3EFefgRlQgSjQeadTCwPj7CU95pbuedPdk35rnljLxYVqLwH/oCymkMRTsTKkX0p+bYz6u
 4LEH6W9HC09yn/lRkaynhO2ZlWbsY79+dm1qasPIZsHwhd9IJiPtwYy3N0MLVK9AlycwQohQQuu
 o72Z0k5yeDAaAnPuH1S+W2BXHdS7n7KwSVzLHOFofNHQyFmfSVGMBFsnZzGnEqA+RxNBbya2u3T
 bHPatBHKCoKLgtitxPJeEH4rVGzSbhUq1qe8zFyn3xQsj5KTtBrORED+QpSActAkygXX3YYbhZg
 QgmTgOnInIxXhljMHVZGwWltBA52FEuOBFWTZ3LvSPvQjZPOyl0FhkYaRcnj3Oy+ZB/WASW1/uI
 uX7m2oqLTXH3aExQ6YY6YsSLZNBVtjFx2fAOYFkNFc3FTH/THWdU8a2F6FHj4ImeIILv93O4BtM
 FUPq0fyEtN/k7eHMEz5fDDs2beIB92H/YnQ7+OAxadJufry+oOfra1I7cCgmGl3oOUpUKC6gmfw
 SgATY/F2mbP6EUA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 14:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8087

The ref was confused with bitbake-setup list, but here we want to show
bitbake-setup settings list.

Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index c55279dd1..07bb4e1ca 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -116,7 +116,8 @@ If you prefer to setup your builds in a different top directory, for example
 
 .. note::
 
-   Use :ref:`bitbake:ref-bbsetup-command-list` to get an overview of the settings.
+   Use :ref:`bitbake-setup settings list <bitbake:ref-bbsetup-command-settings>`
+   to get an overview of the settings.
 
 :ref:`bitbake:ref-bbsetup-command-init` is an interactive program by default and
 will ask you to make some decisions. Depending on your answers, the output may

---
base-commit: 5c7d56a3cedecfb85407dbc7fb9448a0def75d37
change-id: 20251119-fix-quick-guide-13496fb19da9


