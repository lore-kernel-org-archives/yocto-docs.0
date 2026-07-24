Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386D3C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19192.1784899511575079928
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0KN+Y+Lx;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5242C1A11E5
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FEF660395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F141811C103CD;
	Fri, 24 Jul 2026 15:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899508; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=X9OxpdPgwM5EeyN6nqs97L15SKTtDz31Q1W70NqByEE=;
	b=0KN+Y+Lx/ToDKmNqgpWVkJRlTDzgFtEYssIjmhqXqHJssToMocRGZOltS6byaMhntGVlX4
	tqdU4aha5BkJnExsWN2HE67Y8Dhi5ONY/u+syS6v2rySQtkiSxbUpplCyU3NrtMlq7EGJr
	IuNnUCgHrDac3RSPeU7AyhCoDYD+KAKOuv6mOPwLfEUFUx1+hJz9OvXijcajv/yI/vUjPU
	JHRqdGkBRIclVUJXXdJtOAzwlttoltbf1t6H1sIv9q2ikMmfrZmAxfjZlGHLTOVlIZiyJy
	FuN1yhcZHostu/czTzgm2Emb5xWMHBsDZUy71NJL6qhOSKgNyMiG1gLFAkK24Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/9] Rework the docs.yoctoproject.org welcome page
Date: Fri, 24 Jul 2026 15:24:57 +0200
Message-Id: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM2w6CMBCE4Vche02Tsp4SXoVwUdpRV5GSLYgJ4
 d2tePklM/9KCSpIVBcrKd6SJA4ZVVmQv7vhBiMhm9jy2V6YjWKJ+jQLeh9fMKPLE8cH24WKA44
 nys9RcZXPXm3av9PcPeCnX4q27QtRXr4qdwAAAA==
X-Change-ID: 20260722-rework-welcome-page-a230bd12de45
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3089;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5yHge8WK8Bs48TnMr3aRJkcqmP8rPzi5hTQQCI7rG2c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2ew5+K1c7L5V2S/3f3Z5SZQjJbmKbvLMGEiJ
 1Do7UAsKumJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnsAAKCRDRgEFAKaOo
 NpAXEADE2awT9HMDyL7djgX9VTV9Lema+1xbsI9DZG3M2FP3l9ir5qwe9s++0vho0Y3ca8mCU1K
 qsZ5WNfhfr9XRlIbuY8PUBk8uGaXYUOH1rIGz3WPVA0BvPKTIx0VdG7AkCZOuxW4q1S8zxBzRHr
 jrS1wwxvlGfh2OXKqFfMMLmLo2DpGK2tR/yHXKdvhaLn9QCzvH7XbAMi0Hl/05ejIZ2h3oOUBbo
 hSTvXM38VdMZEy74why26nZj2zP55bwDKVna2L2e/GQx255g4qcPSWWemn9osGdBNsqQZgav2TS
 O5jAebWyqMKjeI7YzOxFt9BmjwA9kdPNYRH4tcTCvDPw43JWm0ukn+jExawqASH99bsPfrTsf7w
 OjDm/fkdnFA2bLrYtO3OeB2faNyr2kTId7UltMOF4pfq17bIcTKxlQ+cNNAFmTDuYyGtxs89jq9
 85dd2qeF4ZqKU3Y1HUGaBwQZR222T4cBFB2hu1eIJ86MUuwOGCGWGuhtxR0IEKs1w1Fyb1mUz+U
 hNyFkf5ZFe1pOYmd46o5oIMjrGfjONgLxUhT8y5jiwi/4hZIPubDTMeqefbF+JlWwxJAIpx1rV0
 u0EKJP0LV3PBhtd+OEpzWrnF+LCPJMUDbTmXATlXz0sbNCCwk1mg/UDB9nxynTVNCKYH5cjnyyq
 Yq+7sfQHuaVSaQg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10128

The current Yocto Project documentation welcome page only contains a
table of contents which is not very approachable. This series aims at
making it a more helpful welcome page, but also goes further down the
documents to organize them in a more coherent way.

This does not break existing links apart from the bsp-guide which was
renamed to bsp-manual.

You can preview the changes here: https://docs.yoctoproject.org/next/

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (9):
      index.rst: add introduction paragraphs
      index.rst: move the contributor guide out of the Manuals section
      index.rst: move the "Overview and Concepts" manual in the "Introduction and Overview" section
      index.rst: move external links to the bottom of the intro section
      overview-manual: move the intro content in the index
      bsp-guide: rename to bsp-manual
      contributor-guide/identify-component.rst: use the same tense as other section
      bitbake.rst: rename section to "BitBake User Manual"
      index.rst: move release notes in their own section

 documentation/README                               |   8 +--
 documentation/bitbake.rst                          |   6 +-
 documentation/bsp-guide/index.rst                  |  15 -----
 documentation/{bsp-guide => bsp-manual}/bsp.rst    |  34 +++++-----
 .../figures/bsp-dev-flow.png                       | Bin
 documentation/bsp-manual/index.rst                 |  15 +++++
 .../contributor-guide/identify-component.rst       |   4 +-
 documentation/dev-manual/layers.rst                |   4 +-
 documentation/dev-manual/new-machine.rst           |   2 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/dev-manual/upgrading-recipes.rst     |   2 +-
 documentation/index.rst                            |  68 +++++++++++++++++---
 documentation/kernel-dev/advanced.rst              |   2 +-
 documentation/kernel-dev/common.rst                |   6 +-
 documentation/migration-guides/migration-2.5.rst   |   2 +-
 documentation/overview-manual/concepts.rst         |   2 +-
 .../overview-manual/development-environment.rst    |   4 +-
 documentation/overview-manual/index.rst            |  59 +++++++++++++++++-
 documentation/overview-manual/intro.rst            |  69 ---------------------
 documentation/overview-manual/yp-intro.rst         |   4 +-
 documentation/ref-manual/faq.rst                   |   6 +-
 documentation/ref-manual/resources.rst             |   2 +-
 documentation/ref-manual/structure.rst             |   2 +-
 documentation/ref-manual/terms.rst                 |   4 +-
 documentation/sphinx-static/theme_overrides.css    |   4 ++
 documentation/standards.md                         |   6 +-
 .../transitioning-to-a-custom-environment.rst      |   2 +-
 documentation/what-i-wish-id-known.rst             |   6 +-
 28 files changed, 190 insertions(+), 150 deletions(-)
---
base-commit: 358519ca6406a89fee42c45dcaf63a37a374f33c
change-id: 20260722-rework-welcome-page-a230bd12de45


