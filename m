Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92A3C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 13:12:23 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.7304.1666789936545073230
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 06:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ongCb-00CFsR-Os; Wed, 26 Oct 2022 16:12:14 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ongCb-00FLcG-EW; Wed, 26 Oct 2022 16:12:13 +0300
From: mikko.rapeli@linaro.org
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/4] ref-manual/variables.rst: add documentation for CVE_VERSION
Date: Wed, 26 Oct 2022 16:12:04 +0300
Message-Id: <20221026131207.3655961-2-mikko.rapeli@linaro.org>
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
 Message-ID: 20221026131207.3655961-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 13:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3406

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Related to cve-check.bbclass.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71e8c272a7..467b9678f1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1508,6 +1508,18 @@ system and gives an overview of their function and contents.
 
          CVE_PRODUCT = "vendor:package"
 
+   :term:`CVE_VERSION`
+      In a recipe, defines the version used to match the recipe version
+      against the version in the `NIST CVE database <https://nvd.nist.gov/>`__
+      when usign :ref:`cve-check <ref-classes-cve-check>`.
+
+      The default is ${:term:`PV`} but if recipes use custom version numbers
+      which do not map to upstream SW component release versions and the versions
+      used in the CVE database, then this variable can be used to set the
+      version number for :ref:`cve-check <ref-classes-cve-check>`. Example::
+
+          CVE_VERSION = "2.39"
+
    :term:`CVSDIR`
       The directory in which files checked out under the CVS system are
       stored.
-- 
2.35.1


