Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F93E776F8
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123214.1766593940626305063
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YGUfw3qt;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D8C84E41D8F
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8A396073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A85110AB137B;
	Wed, 24 Dec 2025 17:32:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593938; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fetN6nSR+EXGCAVpSDdXqx6sakAT6hejOKHguroSrGg=;
	b=YGUfw3qtBcDa9QTMEh/oyrD5fBSQck/P7P93ElcTgwaRQnFPgdczXdMjvFo3EDzi2u8GHg
	wc9Pb4Eu7qC2mRXDCsjt9Nbdx2RG1RvWLc3AsYlkoXM2PEpZN7deWwAzGWh8EIcbj6A0BQ
	j4GhHaLGNiHhAYB6fD4UubLUaPvXMHM96UweArt9ownM6+8ddvCeXunn43WDWhiA6wHzME
	Myvrjwpc/RBYJntLymZuEMA9grm8GaP49vTAEoow3VnGb7Q48tMw54RlFu4psynLibw7vC
	2smu7SSBRBeFjCWwmIEckmtdHyiSzv6PTtYvybEzHpSiso8VvBuMDcAefeYYhg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:10 +0100
Subject: [PATCH 44/53] dev-manual/vulnerabilities.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-44-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4454;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=axMkZ/RIWW00HYRkvttZEweYrQJQJ2YYVciiilSrkgI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVujaR2jxPFhuw9VLEf8euczM17pfonVstly
 o9MlkPWRuiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbgAKCRDRgEFAKaOo
 NnY0D/4+An8qTViC7V7DpFgEKWOwNzrN4O3GOEe/M27HVmou+5M/IpjEX/kKPQbFpRAjnfeJ3DW
 +coRLqc0SA2//fvSBm36p0pJQjxjMrgSgOUvjuT1Jkx2PCYLm9w0SohaiwyZuyVlNOAXjBMEj0K
 Zgi98PyHIXJRSbUNN0SOfPCF7YsM28f9qJ4FRhuOo3BzQ7SxHgHoLyycKTaFat12CWtmnFz8GVG
 v+AxtJFIcldqdIsJszuoHi6/m/zDFheAbnWcNq2eIioxVyCJxMY88lT/72532Kb9GijPkKVzy5a
 MlCsW2Tov1eo7J7q+L6jsmNdc69ef7pFARamfL8lbs1EmMsYApYF34GZ3lHwQ8K2+auN/YyAap/
 hqUnyyvW+7tN1Pbp+nzsanEDax5cW9vKGN/Pk8XS89bPcUGmk4rbl0R1My8NSahMVCNBAhS8McW
 4Ny9BrJmbduiLcksKUYxofO7iLxTc5VBN9wBFFLwPjM+55MmeLap/4SQhxBpN+3Z5xesN4kfTkl
 bmuPDomYATp0EBq3hteIgV84m8rXlJPWOHxglYmZCmd8H/tN5GZ8RoFS+meTG4wOKo0ibmx5gjb
 NtZ98IcJe2grTWqvlEXv/T65FktR/fkv09KO4j+ybocw7SEwNc8rUscWmYf0nt4RV8kp1z6mulS
 W1VRluPsgFTNM4w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8373

Refresh the document now that the Poky repository is obsolete. Mention
that only vulnerabilities in OpenEmbedded-Core are tracked as that's
where the packages are.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/vulnerabilities.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index 6eaf75758..e6135a525 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
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
2.51.0


