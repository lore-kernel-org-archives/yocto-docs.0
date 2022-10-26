Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB939C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 13:12:23 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.7412.1666789937228980589
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 06:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ongCc-00CFsW-9P; Wed, 26 Oct 2022 16:12:15 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ongCc-00FLf0-04; Wed, 26 Oct 2022 16:12:14 +0300
From: mikko.rapeli@linaro.org
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/4] classes.rst: improve documentation for cve-check.bbclass
Date: Wed, 26 Oct 2022 16:12:05 +0300
Message-Id: <20221026131207.3655961-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20221026131207.3655961-1-mikko.rapeli@linaro.org>
References: <20221026131207.3655961-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221026131207.3655961-3-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 13:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3409

From: Mikko Rapeli <mikko.rapeli@linaro.org>

It is a quite important tools for maintaining yocto based products
so documentation should include the best practices.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/classes.rst | 52 ++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 1880e44486..cee4fcf555 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -412,13 +412,61 @@ discussion on these cross-compilation tools.
 =====================
 
 The :ref:`cve-check <ref-classes-cve-check>` class looks for known CVEs (Common Vulnerabilities
-and Exposures) while building an image. This class is meant to be
+and Exposures) while building with BitBake. This class is meant to be
 inherited globally from a configuration file::
 
    INHERIT += "cve-check"
 
+To filter out obsolete CVE database entries which are known not to impact SW from Poky and OE-Core,
+add following line to the build configuration file::
+
+   include cve-extra-exclusions.inc
+
 You can also look for vulnerabilities in specific packages by passing
-``-c cve_check`` to BitBake. You will find details in the
+``-c cve_check`` to BitBake.
+
+After buildin the SW with Bitbake, CVE check output reports are available in ``tmp/deploy/cve``
+and image specific summaries in ``tmp/deploy/images/*.cve`` or ``tmp/deploy/images/*.json`` files.
+
+When building, the CVE checker will emit build time warnings for any detected
+issues which are in the state ``Unpatched``, meaning that CVE issue seems to affect the SW component
+and version being compiled and no patches to address the issue are applied. Other states
+for detected CVE issues are: ``Patched`` meaning that a patch to address the issue is already
+applied, and ``Ignored`` meaning that the issue can be ignored.
+
+The ``Patched`` state of a CVE issue is detected from patch files with the format
+``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` and using
+CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch file.
+
+If recipe lists the ``CVE-ID`` in :term:`CVE_CHECK_IGNORE` variable, then the CVE state is reported
+as ``Ignored``. Multiple CVEs can be listed separated by spaces. Example::
+
+   CVE_CHECK_IGNORE += "CVE-2020-29509 CVE-2020-29511"
+
+If CVE check report for a recipe contains false positives or false negatives, these may be
+fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUCT` and :term:`CVE_VERSION` variables.
+:term:`CVE_PRODUCT` defaults to the plain recipe name :term:`BPN` which can be adjusted to one or more CVE
+database vendor and product pairs using syntax::
+
+   CVE_PRODUCT = "flex_project:flex"
+
+where ``flex_project`` is the CVE database vendor name and ``flex`` is the product name. Similarly
+if the default recipe version :term:`PV` does not match the version numbers of the SW component
+in upstream releases or the CVE database, then the :term:`CVE_VERSION` variable can be used to set the
+CVE database compatible version number, for example::
+
+   CVE_VERSION = "2.39"
+
+Any bugs or missing or incomplete information in the CVE database entries should be fixed in the CVE database
+via `NVD feedback form <https://nvd.nist.gov/info/contact-form>`__.
+
+Users should note that security is a process, not a product, and thus also CVE checking, analyzing results,
+patching and updating the SW should be done as a regular process. The data and assumptions
+required for CVE checker to reliably detect issues are frequently broken in various ways.
+These can only be detected by reviewing the details of the issues and iterating over the generated reports,
+and following what happens in other Linux distributions and the greater open source community.
+
+You will find some more details in the
 ":ref:`dev-manual/common-tasks:checking for vulnerabilities`"
 section in the Development Tasks Manual.
 
-- 
2.35.1


