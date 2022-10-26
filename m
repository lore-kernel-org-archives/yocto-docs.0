Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F244C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 16:07:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.9413.1666800457086516510
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 09:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EZL6Cm6S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2AE4820010;
	Wed, 26 Oct 2022 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666800455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFCH+Q1BQ7yEGX2yPivET2+lIMCRV4/xEPXPCVIr0qk=;
	b=EZL6Cm6S0z/KtasXpNPc/m2Kla2qkmjlxWK6TP/8I/FgmUlxgM2gDtQLd0CF/dq5sXujy4
	kFH1CoZiAADVzL/sBx85/5HWPSuaTYznKR7ehsZMJL0iY97kgUs6Lku8cxKFRHSHkr/A4M
	G7ybspeKKK/eMPJpDUbgGrXVRltz8PtejVjFJkunsPlP46+bt+N4Pfad2sXXOBEzPl/QSs
	G7hngDMDnr2XDaIIlTB/u3wXKaMIFrMTmPkW9iUP7YBnmgeNxJe+eDUcgAh4rXwzdutwuq
	fyXwSeETlSl/NdlQ75b21H59DvnymwtYfLseyB04hVQhgoZlNLB8CoMgRnnqWA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: rybczynska@gmail.com,
	mikko.rapeli@linaro.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 2/4] ref-manual: classes.rst: improve documentation for cve-check.bbclass
Date: Wed, 26 Oct 2022 18:07:11 +0200
Message-Id: <20221026160713.2068570-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
References: <1721A288D2BAB036.492@lists.yoctoproject.org>
 <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 16:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3418

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Mikko Rapeli <mikko.rapeli@linaro.org>

It is a quite important tool for maintaining yocto based products
so documentation should include the best practices.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 52 ++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 1880e44486..cce0269b9a 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -412,13 +412,61 @@ discussion on these cross-compilation tools.
 =====================
 
 The :ref:`cve-check <ref-classes-cve-check>` class looks for known CVEs (Common Vulnerabilities
-and Exposures) while building an image. This class is meant to be
+and Exposures) while building with BitBake. This class is meant to be
 inherited globally from a configuration file::
 
    INHERIT += "cve-check"
 
+To filter out obsolete CVE database entries which are known not to impact software from Poky and OE-Core,
+add following line to the build configuration file::
+
+   include cve-extra-exclusions.inc
+
 You can also look for vulnerabilities in specific packages by passing
-``-c cve_check`` to BitBake. You will find details in the
+``-c cve_check`` to BitBake.
+
+After building the software with Bitbake, CVE check output reports are available in ``tmp/deploy/cve``
+and image specific summaries in ``tmp/deploy/images/*.cve`` or ``tmp/deploy/images/*.json`` files.
+
+When building, the CVE checker will emit build time warnings for any detected
+issues which are in the state ``Unpatched``, meaning that CVE issue seems to affect the software component
+and version being compiled and no patches to address the issue are applied. Other states
+for detected CVE issues are: ``Patched`` meaning that a patch to address the issue is already
+applied, and ``Ignored`` meaning that the issue can be ignored.
+
+The ``Patched`` state of a CVE issue is detected from patch files with the format
+``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` and using
+CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch file.
+
+If the recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, then the CVE state is reported
+as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
+
+   CVE_CHECK_IGNORE += "CVE-2020-29509 CVE-2020-29511"
+
+If CVE check reports that a recipe contains false positives or false negatives, these may be
+fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUCT` and :term:`CVE_VERSION` variables.
+:term:`CVE_PRODUCT` defaults to the plain recipe name :term:`BPN` which can be adjusted to one or more CVE
+database vendor and product pairs using the syntax::
+
+   CVE_PRODUCT = "flex_project:flex"
+
+where ``flex_project`` is the CVE database vendor name and ``flex`` is the product name. Similarly
+if the default recipe version :term:`PV` does not match the version numbers of the software component
+in upstream releases or the CVE database, then the :term:`CVE_VERSION` variable can be used to set the
+CVE database compatible version number, for example::
+
+   CVE_VERSION = "2.39"
+
+Any bugs or missing or incomplete information in the CVE database entries should be fixed in the CVE database
+via the `NVD feedback form <https://nvd.nist.gov/info/contact-form>`__.
+
+Users should note that security is a process, not a product, and thus also CVE checking, analyzing results,
+patching and updating the software should be done as a regular process. The data and assumptions
+required for CVE checker to reliably detect issues are frequently broken in various ways.
+These can only be detected by reviewing the details of the issues and iterating over the generated reports,
+and following what happens in other Linux distributions and in the greater open source community.
+
+You will find some more details in the
 ":ref:`dev-manual/common-tasks:checking for vulnerabilities`"
 section in the Development Tasks Manual.
 
-- 
2.34.1


