Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF16AEB64DC
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:26:50 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.15576.1686828404500791315
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 04:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q9l7h-001kx7-Jv; Thu, 15 Jun 2023 14:26:41 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q9l7h-00FXCw-BF; Thu, 15 Jun 2023 14:26:41 +0300
From: mikko.rapeli@linaro.org
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] reproducible-builds.rst: document OEQA_REPRODUCIBLE_TEST_TARGET and OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS
Date: Thu, 15 Jun 2023 14:26:33 +0300
Message-Id: <20230615112633.3702207-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230615112633.3702207-1-mikko.rapeli@linaro.org>
References: <20230615112633.3702207-1-mikko.rapeli@linaro.org>
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
 Message-ID: 20230615112633.3702207-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jun 2023 11:26:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3996

From: Mikko Rapeli <mikko.rapeli@linaro.org>

They are used to fine tune build reproducibility test for
different build targets than "bitbake world" and to define
which recipes can be rebuild using sstate cache.

These are useful when ramping up build reproducibility in complex
build configurations where "bitbake world" has too many failures.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/test-manual/reproducible-builds.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 50256fb197..28feb78391 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -103,10 +103,12 @@ run::
    oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
 
 This defaults to including a ``world`` build so, if other layers are added, it would
-also run the tests for recipes in the additional layers. The first build will be
-run using :ref:`Shared State <overview-manual/concepts:Shared State>` if
+also run the tests for recipes in the additional layers. Different build targets
+can be defined using ``OEQA_REPRODUCIBLE_TEST_TARGET`` variable in ``local.conf``.
+The first build will be run using :ref:`Shared State <overview-manual/concepts:Shared State>` if
 available, the second build explicitly disables
-:ref:`Shared State <overview-manual/concepts:Shared State>` and builds on the
+:ref:`Shared State <overview-manual/concepts:Shared State>` except for recipes defined in
+``OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`` variable, and builds on the
 specific host the build is running on. This means we can test reproducibility
 builds between different host distributions over time on the Autobuilder.
 
-- 
2.34.1


