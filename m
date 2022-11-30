Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99524C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 15:15:24 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.13811.1669821322556634259
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 07:15:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1p0Onv-000vHI-5N; Wed, 30 Nov 2022 17:15:19 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1p0Onu-00BxDn-RX; Wed, 30 Nov 2022 17:15:18 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH][master][langdale][kirkstone] common-tasks.rst: fix oeqa runtime test path
Date: Wed, 30 Nov 2022 17:15:16 +0200
Message-Id: <20221130151516.2845493-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
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
 Message-ID: 20221130151516.2845493-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Nov 2022 15:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3510

It's "runtime/cases" in master and kirkstone.
If layer specific tests are in "runtime" directory,
they will not be found.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/dev-manual/common-tasks.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b9c467526a..9bf2a29b9b 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -8876,21 +8876,21 @@ You can start the tests automatically or manually:
 
       bitbake -c testimage image
 
-All test files reside in ``meta/lib/oeqa/runtime`` in the
+All test files reside in ``meta/lib/oeqa/runtime/cases`` in the
 :term:`Source Directory`. A test name maps
 directly to a Python module. Each test module may contain a number of
 individual tests. Tests are usually grouped together by the area tested
-(e.g tests for systemd reside in ``meta/lib/oeqa/runtime/systemd.py``).
+(e.g tests for systemd reside in ``meta/lib/oeqa/runtime/cases/systemd.py``).
 
 You can add tests to any layer provided you place them in the proper
 area and you extend :term:`BBPATH` in
 the ``local.conf`` file as normal. Be sure that tests reside in
-``layer/lib/oeqa/runtime``.
+``layer/lib/oeqa/runtime/cases``.
 
 .. note::
 
    Be sure that module names do not collide with module names used in
-   the default set of test modules in ``meta/lib/oeqa/runtime``.
+   the default set of test modules in ``meta/lib/oeqa/runtime/cases``.
 
 You can change the set of tests run by appending or overriding
 :term:`TEST_SUITES` variable in
@@ -8982,7 +8982,7 @@ Writing New Tests
 As mentioned previously, all new test files need to be in the proper
 place for the build system to find them. New tests for additional
 functionality outside of the core should be added to the layer that adds
-the functionality, in ``layer/lib/oeqa/runtime`` (as long as
+the functionality, in ``layer/lib/oeqa/runtime/cases`` (as long as
 :term:`BBPATH` is extended in the
 layer's ``layer.conf`` file as normal). Just remember the following:
 
-- 
2.35.1


