Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7A2EB64DD
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:26:50 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.15577.1686828404506155828
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 04:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q9l7g-001kwk-3Q; Thu, 15 Jun 2023 14:26:40 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q9l7f-00FXBY-RO; Thu, 15 Jun 2023 14:26:39 +0300
From: mikko.rapeli@linaro.org
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] variables.rst: document OEQA_REPRODUCIBLE_TEST_TARGET and OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS
Date: Thu, 15 Jun 2023 14:26:32 +0300
Message-Id: <20230615112633.3702207-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230615112633.3702207-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jun 2023 11:26:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3997

From: Mikko Rapeli <mikko.rapeli@linaro.org>

They control which build targets to use when testing build
reproducibility and which build targets can reuse sstate
cache during the test.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6a7888ab47..bb9d4cc66a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5541,6 +5541,15 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_TARGET`
+      Set build target for build reproducibility testing. By default
+      all available recipes are compile with "bitbake world", see also ``EXCLUDE_FROM_WORLD``
+      and :doc:`/test-manual/reproducible-builds`.
+
+   :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`
+      Set build targets which can be rebuild using :ref:`shared state <overview-manual/concepts:shared state cache>`
+      when running build reproducibility test. See :doc:`/test-manual/reproducible-builds`.
+
    :term:`OLDEST_KERNEL`
       Declares the oldest version of the Linux kernel that the produced
       binaries must support. This variable is passed into the build of the
-- 
2.34.1


