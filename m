Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA770CA6C9C
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5824.1769501994894816478
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=o/2hYE/b;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 605DD4E422CB
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37D83606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 669B3119A868B;
	Tue, 27 Jan 2026 09:19:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yrWtpzn9Ia2OPJ3220Me+tg+TuaHUV4PTp7MV85eTK8=;
	b=o/2hYE/bvrVfrQabFKC319osKrlD/F+e6YMT4CHBhsVh8riGjS2ZKrqvq1Ws2ly6evxLro
	KpHPTJ8JLrwycySqpOLSPrSj43WB+58SGkNNX8eNLZ6rA52/xWdFiufdnEU4ariSndN8eQ
	0zChlbrYpMUVK4uPhvbes6WGfBa5/mlFeoOptmaQcIhjmgFjIsvdHiNtuhfnZ4/baraJJV
	UGeBgPOUpG/hk6Cc5uyoQvWItuFpfBOQzwZhwU1CSYKHfnKyOTSp9OUjduRKdUbOlMu0/y
	QGgg9i8nvzI1epbTn4tXwKN3gY01zPCa/TLezO3fMfB8iu9C0k7uLFTNj4FEig==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:40 +0100
Subject: [PATCH v2 45/56] dev-manual/vulnerabilities.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-45-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4479;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=eCamXmssxLrkvpPYS2dB06tvfV17l0tCoj83O2f1LG8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUF9/nOpu/nxupwiCZQIe3XKqki36dJU7S8Z
 ZNHp5xJ+nCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BQAKCRDRgEFAKaOo
 NvK4D/9SX2SiZhyApYIx1DUlvx/0qLRt5Bh2/ATEs5OBcE4AznjzxhY86qAPgHB6cgvSmHwMhZx
 AtADJEwg9qetlNgtD/bChH5Dp7gafrai9fxbxrZVQK4QYgnq5IzV6A2pdEGDf4iT1dQk53iPpQs
 XOVL1lMQqNbCag3tGARGk/L+e5My/ngDIgNuP8+tNqVMAKK1X4865CvuEB+IFg73E5hbmHkvsXa
 Qvp+9QetmICnCuvz4YLs+OAAmkoTxhYCII4kE0EggG2AEldc1QKQC1JZ9lXACkbGIhD/MZJs1Bf
 4Wsd97Htro1IZrXaWkIqKbJYIcDy0duO5KeVfGxzG/f0U7O6bkJiKAq9MqLm7XmCEuS78fFR2Ef
 Z/GafmmkHa67bgQ3ZZAHaFKci4e6t6TUc7V4517Dk7ayNgaS8t+WNFmsS9bj7JJ7UtcDYlokLxi
 fBHR3H0PUxkGgactej+3pAeRvl7Q9NnHUUJcTE8HFR6mzUwHYen7Ch8gm3z5TTXZoW/n8zSuCUP
 qIKBS2zrc8GlsAvqrAdiS9hBYYAcLsS1w23IgKBs4vcRvq3y1i51GyL3c4Mop3qq/UhSmkYt7Qw
 RLZ8p3oWYtwQCJ8d3o/liniZbvTM4wfVHqiCQvOo0sJAWlWxcoNSvin8jgz6z0JV1y1bqca9U9r
 qsYHW5GLRAjypWA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8706

Refresh the document now that the Poky repository is obsolete. Mention
that only vulnerabilities in OpenEmbedded-Core are tracked as that's
where the packages are.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/security-manual/vulnerabilities.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/security-manual/vulnerabilities.rst b/documentation/security-manual/vulnerabilities.rst
index 6eaf75758..e6135a525 100644
--- a/documentation/security-manual/vulnerabilities.rst
+++ b/documentation/security-manual/vulnerabilities.rst
@@ -3,8 +3,8 @@
 Checking for Vulnerabilities
 ****************************
 
-Vulnerabilities in Poky and OE-Core
-===================================
+Vulnerabilities in OpenEmbedded-Core (OE-Core)
+==============================================
 
 The Yocto Project has an infrastructure to track and address unfixed
 known security vulnerabilities, as tracked by the public
@@ -13,15 +13,15 @@ database.
 
 The Yocto Project maintains a `list of known vulnerabilities
 <https://valkyrie.yocto.io/pub/non-release/patchmetrics/>`__
-for packages in Poky and OE-Core, tracking the evolution of the number of
+for packages in :term:`OpenEmbedded-Core (OE-Core)`, tracking the evolution of the number of
 unpatched CVEs and the status of patches. Such information is available for
 the current development version and for each supported release.
 
 Security is a process, not a product, and thus at any time, a number of security
-issues may be impacting Poky and OE-Core. It is up to the maintainers, users,
+issues may be impacting :term:`OpenEmbedded-Core (OE-Core)`. It is up to the maintainers, users,
 contributors and anyone interested in the issues to investigate and possibly fix them by
 updating software components to newer versions or by applying patches to address them.
-It is recommended to work with Poky and OE-Core upstream maintainers and submit
+It is recommended to work with :term:`OpenEmbedded-Core (OE-Core)` upstream maintainers and submit
 patches to fix them, see ":doc:`/contributor-guide/submit-changes`" for details.
 
 Vulnerability check at build time
@@ -34,7 +34,7 @@ add the following setting to your configuration::
    INHERIT += "cve-check"
 
 The CVE database contains some old incomplete entries which have been
-deemed not to impact Poky or OE-Core. These CVE entries can be excluded from the
+deemed not to impact :term:`OpenEmbedded-Core (OE-Core)`. These CVE entries can be excluded from the
 check using build configuration::
 
    include conf/distro/include/cve-extra-exclusions.inc
@@ -167,7 +167,7 @@ the :term:`CVE_VERSION` variable.
 
 Note that if the CVE entries in the NVD database contain bugs or have missing or incomplete
 information, it is recommended to fix the information there directly instead of working
-around the issues possibly for a long time in Poky and OE-Core side recipes. Feedback to
+around the issues possibly for a long time in :term:`OpenEmbedded-Core (OE-Core)` side recipes. Feedback to
 NVD about CVE entries can be provided through the `NVD contact form <https://nvd.nist.gov/info/contact-form>`__.
 
 Fixing vulnerabilities in recipes
@@ -175,7 +175,7 @@ Fixing vulnerabilities in recipes
 
 Suppose a CVE security issue impacts a software component. In that case, it can
 be fixed by updating to a newer version, by applying a patch, or by marking it
-as patched via :term:`CVE_STATUS` variable flag. For Poky and OE-Core master
+as patched via :term:`CVE_STATUS` variable flag. For OE-Core master
 branches, updating to a more recent software component release with fixes is
 the best option, but patches can be applied if releases are not yet available.
 
@@ -276,8 +276,8 @@ The entry should have the format like::
    CVE_STATUS[CVE-2016-10642] = "cpe-incorrect: This is specific to the npm package that installs cmake, so isn't relevant to OpenEmbedded"
 
 As mentioned previously, if data in the CVE database is wrong, it is recommended
-to fix those issues in the CVE database (NVD in the case of OE-core and Poky)
-directly.
+to fix those issues in the CVE database (NVD in the case of
+:term:`OpenEmbedded-Core (OE-Core)`) directly.
 
 Note that if there are many CVEs with the same status and reason, those can be
 shared by using the :term:`CVE_STATUS_GROUPS` variable.

-- 
2.52.0


