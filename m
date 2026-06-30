Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF36C44506
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:13:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16075.1782807201337999180
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 01:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KWY22H5r;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1097C4E40B9E
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2A8360233
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00942106F1A67;
	Tue, 30 Jun 2026 10:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807198; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4qfviZlZfRjL8FUsc0GMR41SliTDKlPVA7IJntUtxXg=;
	b=KWY22H5ru2nYSiPsRVP3dYK/MlFPuvWmLgL5c1+I9IdbqIHJqDv4QvJDBFHpBf8rhCGhTs
	EwjAvnAIOQzlENS+JOwePTH5xBBHbfUzV5EqooYIAMkpshprRW9MmfQPxRWJspOoiOXRGV
	+/flvJRmOrhlfPbezQuOI2r4cNmQuy73GcbSTfeKC0Xfy51MT2ZI2Q8TOhRFfSRXQU5KkL
	aRcxlq5P9hEC8SDeLxT2+54+qJ659KvpItu/F8PCn3/iK68LbBA2gSbCZvaRcd0w2Em2Wz
	FRuTBHTsWFUdiV6gI5VLelDQYlmAXQMOa1TIQYTLHbWA7KpJ+4Tlq1aWVk1TVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/7] Sync yocto-docs glossary with
 meta/conf/documentation.conf
Date: Tue, 30 Jun 2026 10:13:10 +0200
Message-Id: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUWRtoIgnGq4iLdjLVEZxIJhWl9
 O5NdfnBe/8CSoVJ4dwtUOjNylka7KEDvA9yI8OpGVzvQh9cNPoVNCnj/CSpQ21zg1kmY204xXQ
 co/ce2vtVaOLPr3y5/q3z+CCsew7WdQPqnFWZewAAAA==
X-Change-ID: 20260629-sync-documentation-conf-11689d3b9555
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tlujjezjzIN6jXEfEP2iZ6RkFytjtm14eqj9VaQ358I=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQ3qbglSzvMRZKiolVIIjRNvXTtR8e4seO/hR0
 v7l2kQUcciJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakN6mwAKCRDRgEFAKaOo
 NtqHEACe1x6IY7yyYiTASP172iQvpUUINQxvua92DQwXbqKNwitHgTINpMoY381JJOxZGzmrmWR
 PMw4ZGWVmte3D0oOMZ1OyttxZkIFMx7NgY/JLsz4J/MtUcirxhy/o3w1bB/juBTnRQEfgCL7OV5
 Gpxtsgrt04QoX0uhcOcfJC0p5uttAu95juG11//hQpD+jaaS+AavWNPJ6Il5ttNjP8WslAHdDJC
 UhJIAds527hLRbbfd+kC9cR3VND7/wzULTr34Nlbz1PrQfQ1ouHalZBEVHsDlnhl6i24poOaiOK
 DYKvZlJQ/TGBuHtQO/9/xK8Ciq2JQmeCaXAu6lrE3IsOPVulc9FzocEj0IJ2aOtNiUUCWbqdw/V
 kcIec348gvkGtufPGgP+1WLSOw6vseZP7+acjQ/deWG1S9+BC0QxqHverUJXUmcA0i/46Hisaiu
 kmoVHKYVZlGAPJXOGdTs7yWWlmQek8Xq74gwNdCGlu1stvMnjIfxClWW6Wk/FhRy8QS1ji2jhB+
 PEPuF6H4kpMG3qRkwkpk3xyC098lgZ+8LkwOW44EKzFiH3yGGJWcP1ht9gvY52VH7otXayZfNCd
 v1ciXFWomQbdaJYEvGzZ3tWEXdcaLNJn2pmizpZL6CeQVMDG3BzxTwPiHSI2dREQwfKcymUSQwb
 hd462fEIe4VsMpw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9983

Document variables that are documented in OE-Core's documentation.conf
but not in yocto-docs.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (7):
      ref-manual/variables.rst: document the CCACHE_NATIVE_RECIPES_ALLOWED variable
      ref-manual/variables.rst: document missing CONFLICT_*_FEATURES variables
      ref-manual/variables.rst: document the LOCALE_PATHS variable
      ref-manual/variables.rst: document the TEST_SERIALCONTROL_CONNECT_TIMEOUT variable
      ref-manual/variables.rst: document the LOCALE_UTF8_IS_DEFAULT variable
      ref-manual/variables.rst: document the TEST_SERIALCONTROL_PS1 variable
      ref-manual/variables.rst: document the IMAGE_*_DEBUGFS variables

 documentation/ref-manual/variables.rst | 83 +++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)
---
base-commit: 4562ba19f36e54099bcae82cec8a70deb1c23aa7
change-id: 20260629-sync-documentation-conf-11689d3b9555


