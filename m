Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50A6EC01B3
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 08:50:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12666.1774255828030634662
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 01:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0lytcb/K;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8BFE51A2F8B
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62D475FEF6;
	Mon, 23 Mar 2026 08:50:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94B87103713CA;
	Mon, 23 Mar 2026 09:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774255825; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fry0EzbDeQZ6OmmYbzedhuKbgKI6+GPzbR2GThpYbPE=;
	b=0lytcb/K8cA8DQCaYhoLANhhAsvzGf1GDSwSrcOf8q/ZxmHoEtn1BoDTj5fX/x3IsVJArm
	kDlxxg3J3TdTUc8wOvlKASntlSYiYAybMcRkcluLmkXfo/dE0DMLX6sgST9TC7EE+J1Uql
	GSySMPsaiSQf91yjO81gz6h5ZWrXU4D0Hp/V/f+c99hpLWpxqr9AZZ2z4fSpfXuaHb80yh
	USgPjPwtNKsUXA8au0k9DW2BR1X1ij59/9abypyhapYvL9LsZvBjksnO36Kg0pwpSbqQy7
	6WHpRoeOQSvqld/uob+VZkShOtE4z7vEEu4+i6G/GjLwStf59li0t8Ogpbeh2w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Mar 2026 09:49:58 +0100
Subject: [PATCH v3 7/8] docs-wide: add warning on disabled NPM fetcher
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-release-notes-6-0-v3-7-844ec702f95b@bootlin.com>
References: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
In-Reply-To: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3140;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HTHqUCgC3wK3Y8kV3LkRdTw7SHW27wvWAf5lWMXReCg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpwP7LwotZs2fLrnTHkCd+bX1YjZGf0Gr9INelj
 zmkg2kjfTWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCacD+ywAKCRDRgEFAKaOo
 NtvyD/sFT3rDmh/SEz+KWH4fwsH0J6EiiDNQ99qnSWcLqJUPneNIFuHuPN37AWvLcZP1hR9hKpC
 LZ3S6/05QpSF1qzEigSg5aRntUNfmHdH5PtI/ixxlQz4XaF7MKRJi8M0oxBW3Tuz+BRDF6lpBwV
 z+UgPofTzduiflQtTBsYK4DfomtbmW19ggImXGX4suTZXvyZ4zgRJRj09aJSoC2R13y/640AMDu
 /982sqD4MwNlJqdhgX9Ra4lIKDP0Ffid0UJrAXuTqa3e2OqMT4xqDOAoKpuT+dap/Qt1X5ZFGzB
 sSOQ2DHzw92NR9HWkDTEis2u5zVD73OODaz+wMBkADWQ4JYHcK6Sb45JhEWqeT+YMhYAzoMS9+z
 1RDlndpj+p9ZZhj8Kz4/feX9AqmVNuTDjZLsbCM10VG7oT1/si1ZcPSCV26bJuPWoW8vQDF9/73
 wDe477p/pE/+aIhTgcKm0KpL0zbate3cPj/f3sPV+/l/7oZMHpgM776+77x7nypXx+esl6/vwhJ
 1MLbkHFi6zgpsGiFieMCyDU4ePcX1vXrYI5U0UN8bXaBVWZ8XllMfrYd6RsyRa2uOf5RRL7yZQF
 0uCteBfCSnRoqn4ZbleZJfIGb+2mA7EcEVo3pTddxEtads91Tz078MxSXNgDtXqRA3uR4jNwCoh
 8eKyopXw+vzU6aA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9120

The NPM fetcher was disabled with 355cd226e072 ("fetch2/npm/npmsw:
Disable npm and npmsw fetchers due to security concerns") in BitBake.
Add warning notes throughout the documentation to let readers know.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/devtool.rst  |  5 +++++
 documentation/dev-manual/packages.rst | 10 +++++++++-
 documentation/ref-manual/classes.rst  |  5 +++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index c82dc9c33..d67f22277 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -1111,6 +1111,11 @@ the following methods when you run ``devtool add``:
 Adding Node.js Modules
 ----------------------
 
+.. warning::
+
+   The NPM fetcher is currently disabled due to security concerns. See
+   :bitbake_rev:`355cd226e0720a9ed7683bb01c8c0a58eee03664` for more information.
+
 You can use the ``devtool add`` command two different ways to add
 Node.js modules: through ``npm`` or from a repository or local source.
 
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 4c94ffd48..500639565 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -18,7 +18,7 @@ This section describes a few tasks that involve packages:
 -  :ref:`Setting up and running package test
    (ptest) <test-manual/ptest:testing packages with ptest>`
 
--  :ref:`dev-manual/packages:creating node package manager (npm) packages`
+-  (**disabled**) :ref:`dev-manual/packages:creating node package manager (npm) packages`
 
 -  :ref:`dev-manual/packages:adding custom metadata to packages`
 
@@ -914,6 +914,14 @@ Yocto Project Test Environment Manual.
 Creating Node Package Manager (NPM) Packages
 ============================================
 
+.. warning::
+
+   The NPM fetcher is currently disabled due to security concerns. See
+   :bitbake_rev:`355cd226e0720a9ed7683bb01c8c0a58eee03664` for more information.
+
+   This section is left there if it is re-enabled in the future, but is
+   currently obsolete.
+
 :wikipedia:`NPM <Npm_(software)>` is a package manager for the JavaScript
 programming language. The Yocto Project supports the NPM
 :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index dc131be9f..a3a4df1db 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1891,6 +1891,11 @@ generation provided by :ref:`ref-classes-create-spdx`.
 ``npm``
 =======
 
+.. warning::
+
+   The NPM fetcher is currently disabled due to security concerns. See
+   :bitbake_rev:`355cd226e0720a9ed7683bb01c8c0a58eee03664` for more information.
+
 Provides support for building Node.js software fetched using the
 :wikipedia:`node package manager (NPM) <Npm_(software)>`.
 

-- 
2.53.0


