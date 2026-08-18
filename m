Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A30C5DF70
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 09:20:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4926.1787044837449411132
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 02:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=spFZlZbP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BEF691A16FE
	for <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 09:20:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94AAA60355
	for <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 09:20:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F28A711C74AB4;
	Tue, 18 Aug 2026 11:20:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787044835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oNTUEyxpFp37pByIN2IAZ5N+WgS8KrVZfFF0pvbT3QI=;
	b=spFZlZbPTAsKkgWTSsnCRBd48SqoRmYJNvEb7u3dbrfalR4xLF5SPVy364CBmx4J2wcGs9
	yKr+ctsiGaFR0nxMaL8128bMPE5fzSURw8Pc6ub+oyTlqrmE90qlGgDiZhjdE2ohSqVkzW
	2Ug23WYC5qw0Z9lNhwrLIUCH7CTzTrPDLw3JtkmYHVYS2D9qKhKQzMr8s+mylSubLiKGTB
	FpbO1+9yhHdEIyZhuHrouHbv3Wqz5BQ8vdZiNfBiHoPEp0yPXiqjBT3VxxSHpmZ4sLnpXk
	kpT2KxdaaPb4aeEN5lk1PpHTJZnjrqeErRf1WIbivAyPId2f0kSTwerzN+xfAg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Aug 2026 11:20:28 +0200
Subject: [PATCH 1/2] ref-manual/variables.rst: document the
 PACKAGE_NO_LOCALE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-packagefuncs-v1-1-1f26764cbdd3@bootlin.com>
References: <20260818-packagefuncs-v1-0-1f26764cbdd3@bootlin.com>
In-Reply-To: <20260818-packagefuncs-v1-0-1f26764cbdd3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=okzmNtDNj+8RB7VmDDcZ2FBcTbJtO/EBZqoR58lwxJ0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqhCPhQHmUDx378O/bAatULtN7XAgIw7ORLJxew
 ug/Y5z3y4mJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaoQj4QAKCRDRgEFAKaOo
 NgmxEACb6WrDs1bOtaTWFiAP90aa6OZ+uVf9lqUUjg70v3x3pU4+aqsXC8/HFypouSrz2YlTknC
 6vYg4hNphKDd3NqTEII0lzxeI7094inh0+udweg2qs1a1gMWcG3+Lb7QiB0PWSk0R+jj37T11gb
 1sFPPqB8cCenDYZHFeiau/ArfwfAbQI4Ar5bWdDYvHKPEbwn2XG4V8Azj+nu3mvEM1JqoCnsoLe
 0FU87M4oPkqHqG0w8veOO9TQpWMuTcMxWm0z513Y0K0vPFezJdQRlmCdnTvrhPSgnELgA13BVDf
 sZyTzn5HF+YUOjq/qd0182Vsrc+Fgpyf13bMelJJkuPLPAc0HWJkcTGmVysQ42Xh3fqLs0C971r
 7Wiqv/CwEAXF6HxlAmacBRmsLdJN4rCZg6IXAAOpL2atFMftlNy2g7W3pghHqePVVgiIT7wFAdz
 0xRAAX8dqfLHOKu6D5QIok7+/7CCEtR8/RzH9WTCeI+OK47torXD+RwB3Zb1uuV2MSSf6OsIfZ8
 CsF0tDEaPUOvf2Q0miLuPUsX54AwZWwBlkYy7lp3pw96jRAxoN7L2AvMUiOnIcFKj2SUYZLGPjw
 27IxSrsdtAglAMVenvIueHR9INqk0Udd67X06s+Lu4h0zSHSJxonPeQm5D0xe8yEG/EYJNKvtRh
 f0QO+Sqe3K7RT4w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 09:20:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10297

Added by commit 4b46c1f6e891 ("Initial population") in OE-Core (2005!).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fa0dfdfb8..09136803c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7166,6 +7166,53 @@ system and gives an overview of their function and contents.
       install, the build system does not generate an error. This variable
       is generally not user-defined.
 
+   :term:`PACKAGE_NO_LOCALE`
+      The :term:`PACKAGE_NO_LOCALE` variable can be set to "1" to prevent the
+      :term:`OpenEmbedded Build System` from splitting the locales found in the
+      :term:`PKGD` directory into split packages.
+
+      For example, the ``quilt`` recipe automatically produces split packages
+      after the :ref:`ref-tasks-package` task is run. Taking a look inside the
+      :term:`WORKDIR` directory of ``quilt``:
+
+      .. code-block:: console
+
+         $ ls -1 packages-split/
+         guards
+         guards-doc
+         quilt
+         quilt-dbg
+         quilt-dev
+         quilt-doc
+         quilt-locale-de
+         quilt-locale-fr
+         quilt-locale-ja
+         quilt-locale-ru
+         quilt-ptest
+         quilt-src
+         quilt-staticdev
+
+      We can see the ``quilt-locale-*`` packages were automatically generated.
+      Setting :term:`PACKAGE_NO_LOCALE` to "1" would produce the following
+      packages:
+
+      .. code-block:: console
+
+         $ ls -1 packages-split/
+         guards
+         guards-doc
+         quilt
+         quilt-dbg
+         quilt-dev
+         quilt-doc
+         quilt-locale
+         quilt-ptest
+         quilt-src
+         quilt-staticdev
+
+      The ``quilt-locale`` package contains the merged content of the previous
+      ``quilt-locale-*`` packages.
+
    :term:`PACKAGE_PREPROCESS_FUNCS`
       Specifies a list of functions run to pre-process the
       :term:`PKGD` directory prior to splitting the files out

-- 
2.55.0


