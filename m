Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1E1D6B071
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17215.1769700276968699879
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=f/A5+uDe;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 683F24E42322
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FA88606FD;
	Thu, 29 Jan 2026 15:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B217119A8856;
	Thu, 29 Jan 2026 16:24:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NbBQDqVcJofKnsIcaVkx8Yq0qiiKoWiu8OXYq2PiHmg=;
	b=f/A5+uDetNIjVXnNmX4NqtFRjHlBJhXq+nom/7C8aiTalxS60rTq+Yjh3VeN2BNGNXH3HE
	UYTyYPejw3y984jp3T3w5es9uaQO6KORg2/d+7GHaS0lpsN2wEfW9IgUXFxx+0KjfYrj4x
	MQhl2YsC5zr6UG90qcMrKkyztwIjiaSxycNIn5E0kqaNWN4ddxA8XsbKBggjnnhfhAjJ40
	2kilhDqaYmgVOLoPjaoGMB2jxiDoXL6zoTsvXunCjnmvKOMIHPdhAqVRPg2n90L21WL0Ro
	cG4QcSrq21iz36PzhKPq+hUa2PLbo7U5rrchnI3Gky7pJrxJei273o8bLKduhA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:37 +0100
Subject: [PATCH v3 46/57] dev-manual/vulnerabilities.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-46-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4535;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qD3kgbCnsEgdJ/A4v81lbnSaHjsMPVtzRdWrSsYOA/I=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uQad+4z2sMt7HjLXguRx3suuRGObsFCgt6a
 o74so4SHB2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kAAKCRDRgEFAKaOo
 NnpqD/9bo+hSBZBPFWZvJVbusx9AZz6GwmKmkA1WWmYffft6y2AUnuhbLQBoNBLmfcWETQlgma4
 l3e9e1bfbdiiBhbOnFyFy6mcylx3DOMAx7nVFzdbOwsccmfExJw31/tRxzkppFA4f7bgBi1v7n9
 B2h9gzTRcD4gGCNZBXhQR3iYjQ73v/prD8jq/Wp21wjBmxARajXAuMTb+xYe7YFKCJ50taT5NcG
 whWDX7nQArVbFpkFujY+PWnCzgZyUkqiyf3yzQVnXl2F567S8cJu68hsLA1YFLaCf6ODJwXN7m9
 PNpi/NK96+07ehWXAotpnEaa2+Hk2sGLfje2XDlwUl22ncMI8WXCGHPvth9ZLml9BmY1prsC0Cr
 FKqxIq/zu+l6k+FRwqVk9sPUArlvzVBESKDPxIyIGrewWLE5QLz6MiFjdQHscWdWv/16JpRMcxv
 YwR/afU/ZVJV9/Xe3eS3e6iBOLuH9sDM8v42lLql2iMkD3SR83Zw6b7tmka5MOZVaqFWEc+QNGW
 KtXkhripuMMOR9Faj8q26pGTu6BsSPc0OJlSaduwJJV44rKmpMBACGN8M3mvLJyofUjYZ/QWecD
 6K2ZumRgAfP0Zg3dpe7SyMWQ6dcT5KymbQNDpLCOsZHa7sJ0NGoGFWmrqDTmk8PzaYx7Higfu+X
 bdnCde+ahLhW0JA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8832

Refresh the document now that the Poky repository is obsolete. Mention
that only vulnerabilities in OpenEmbedded-Core are tracked as that's
where the packages are.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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


