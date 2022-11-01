Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D58C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 13:33:40 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.6335.1667309617294052177
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 06:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1oprOY-0006Xk-Cq; Tue, 01 Nov 2022 14:33:34 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1oprOY-001gdg-GS; Tue, 01 Nov 2022 14:33:33 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1oprOW-00CPji-Lw; Tue, 01 Nov 2022 14:33:32 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] dev-manual: common-tasks.rst: fix typos
Date: Tue,  1 Nov 2022 14:33:30 +0100
Message-Id: <20221101133330.2958821-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Nov 2022 13:33:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3450

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/dev-manual/common-tasks.rst | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index c747c0deacb8..d99d32793755 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11518,7 +11518,7 @@ applied and that the issue needs to be investigated. ``Ignored`` means that afte
 analysis, it has been deemed to ignore the issue as it for example affects
 the software component on a different operating system platform.
 
-After build with CVE check enabled, reports for each compiled source recipe will be
+After a build with CVE check enabled, reports for each compiled source recipe will be
 found in ``build/tmp/deploy/cve``.
 
 For example the CVE check report for the ``flex-native`` recipe looks like::
@@ -11567,36 +11567,36 @@ product name when querying the CVE database. If this mapping contains false posi
 some reported CVEs are not for the software component in question, or false negatives like
 some CVEs are not found to impact the recipe when they should, then the problems can be
 in the recipe name to CVE product mapping. These mapping issues can be fixed by setting
-the :term:`CVE_PRODUCT` variable inside the recipe. This defines the name of software component in the
+the :term:`CVE_PRODUCT` variable inside the recipe. This defines the name of the software component in the
 upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
 The variable supports using vendor and product names like this::
 
    CVE_PRODUCT = "flex_project:flex"
 
-In this example from the vendor name used in CVE database is ``flex_project`` and
+In this example the vendor name used in the CVE database is ``flex_project`` and the
 product is ``flex``. With this setting the ``flex`` recipe only maps to this specific
 product and not products from other vendors with same name ``flex``.
 
-Similary, when the recipe version :term:`PV` is not compatible with software versions used by
+Similarly, when the recipe version :term:`PV` is not compatible with software versions used by
 the upstream software component releases and the CVE database, these can be fixed using
-:term:`CVE_VERSION` variable.
+the :term:`CVE_VERSION` variable.
 
-Note that if the CVE entries in NVD databse contain bugs or have missing or incomplete
+Note that if the CVE entries in the NVD database contain bugs or have missing or incomplete
 information, it is recommended to fix the information there directly instead of working
-around the issues for a possibly long time in Poky and OE-Core side recipes. Feedback to
-NVD about CVEs entries can be provided through the `NVD contact form <https://nvd.nist.gov/info/contact-form>`__.
+around the issues possibly for a long time in Poky and OE-Core side recipes. Feedback to
+NVD about CVE entries can be provided through the `NVD contact form <https://nvd.nist.gov/info/contact-form>`__.
 
 Fixing vulnerabilities in recipes
 ---------------------------------
 
 If a CVE security issue impacts a software component, it can be fixed by updating to a newer
 version of the software component or by applying a patch. For Poky and OE-Core master branches, updating
-to newer software component release with fixes is the best option, but patches can be applied
+to a newer software component release with fixes is the best option, but patches can be applied
 if releases are not yet available.
 
 For stable branches, it is preferred to apply patches for the issues. For some software
-components minor version updates can also applied if they are backwards compatible.
+components minor version updates can also be applied if they are backwards compatible.
 
 Here is an example of fixing CVE security issues with patch files,
 an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
@@ -11610,8 +11610,8 @@ an example from the :oe_layerindex:`ffmpeg recipe</layerindex/recipe/47350>`::
               file://fix-CVE-2020-22033-CVE-2020-22019.patch \
               file://fix-CVE-2021-33815.patch \
 
-A good practice is to include the CVE identifier in both patch file name
-and inside the patch file commit message use the format::
+A good practice is to include the CVE identifier in both the patch file name
+and inside the patch file commit message using the format::
 
    CVE: CVE-2020-22033
 
@@ -11619,7 +11619,7 @@ CVE checker will then capture this information and change the CVE status to ``Pa
 in the generated reports.
 
 If analysis shows that the CVE issue does not impact the recipe due to configuration, platform,
-version or other reasons, the CVE can be marked as ``Ignored`` using :term:`CVE_CHECK_IGNORE` variable.
+version or other reasons, the CVE can be marked as ``Ignored`` using the :term:`CVE_CHECK_IGNORE` variable.
 As mentioned previously, if data in the CVE database is wrong, it is recommend to fix those
 issues in the CVE database directly.
 
-- 
2.30.2


