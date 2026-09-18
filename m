Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E045C982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:06 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11645.1789739643666654548
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Wzlnx/4Y;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C8A51A091E
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D545160649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3041710328EA3;
	Fri, 18 Sep 2026 15:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D032HOZpj14zrD7BbPn/0Om5i7jwxtKgm94ftR405bo=;
	b=Wzlnx/4YRh/v0iEgUoSQfdIKWJ4tiJER/oBAZ0hAzAlSUSUZoX/nwKxX5xKkwp7xEA234m
	D7SoxPT40eOahFmo69eDQM8T5geM5yh9eCtfLmZI+OTe3dbtK9phEv2GdL1E/tlLv3JtBm
	b3oBHijDDRfAWJbopt6ojripD+dNbK73F/aWP1DRolQDFnESNs2PvMTroIubd3c7QQr/p3
	cdz/YNfAPFPtcD/6sjmql5ScyjYjs/PvQz0uWFBWFfPWTZccXZ/7V42fNaDdxUo/gRoax+
	hyvGjv5qn4IxiQUoOQ26nyf/R3n4yutv7d2SvD7jU7NvnMPmeThB/BvsYZpn7Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:33 +0200
Subject: [PATCH 03/20] migration-guides/release-notes-6.{0,1}.rst: update
 path to check_sanity_everybuild
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-3-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c3NLSVszpAzNQS3z+mNhMjaoZqKTHtoqBxVJF7sqbuA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJjKglMxhYq5/z/EjED/dCCNExZZvY8rqPqq
 41rFVKLVYeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CYwAKCRDRgEFAKaOo
 NiumD/0brXI0yqhegwtgvmFbokGzZmS1q/8OjRmVEZwVVwZfGWkk5EsaEQteePL9IpmTsXNnyun
 htC4flG4ITF8dbGc5sU/OoVYEWXiHOYd8lCqUnidGdlcwVAh3d1sAyMDqhWq7TJhMxY6I82DfIO
 ksb1WsXCkTNGlJ4NbkeSfU9xV6ueFmWyo0f4toWU9DEvrMcclytOJzpHzyQpXkHQgGOZJp83qga
 81uKkJCUJJd/lZbMMPuepr0leMfmrGZedBZiFOPuPe3ONncVAZOMFjToDKsyL4JEwJLO0T7JVkr
 AbA6VXsAy+7BSfR9R34qU2JCp5c9nZo/gS28YM4YA5Co3aSjF3BDucfwp9sejUeefuPNnqCm8wR
 54MclQaWaFv0gcczfnKnHf9RpMic+tJMc034yIbOZtEOzPiQbZJ2ycTZWmwXr9RVCPq9s3OeH9v
 mA6Qvzina/LtRRIGD64aLaTaxqcHYGWCeaSjTFmvn2Kr8T+8Kh06bGn3NapT3ht3fAp3/j0g4Rr
 M/bZ/64Opm5syywHs/+A5Yqytxz/FV0tw4ZnLbTOICdkL6xZbKE5pFrjaKNGoAGMomYq1zO+Zsh
 hwqJKGNqcKdLiGf2Sw+i+Cyae2sUxX6wbUVJdFulwDPaxAY8lxJiMb143xbL7Im4rTSGAf7yOLu
 KWO4NDepxmKkzUw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10535

This path has changed in OE-Core, update it for future readers.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-6.0.rst | 2 +-
 documentation/migration-guides/release-notes-6.1.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 5ae78daf0..dee51bd7d 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -34,7 +34,7 @@ New Features / Enhancements in |yocto-ver|
    recipe upgrades
 
 ..
-   Found in meta/classes-global/sanity.bbclass:check_sanity_everybuild
+   Found in meta/lib/oe/sanity.py:check_sanity_everybuild
 
 -  Minimum Python version required on the host: 3.9.
 
diff --git a/documentation/migration-guides/release-notes-6.1.rst b/documentation/migration-guides/release-notes-6.1.rst
index 37f4ad0aa..49354f638 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -20,7 +20,7 @@ New Features / Enhancements in |yocto-ver|
    recipe upgrades
 
 ..
-   Found in meta/classes-global/sanity.bbclass:check_sanity_everybuild
+   Found in meta/lib/oe/sanity.py:check_sanity_everybuild
 
 -  Minimum Python version required on the host: XXX.
 

-- 
2.55.0


