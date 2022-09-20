Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C990C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 07:46:16 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.9212.1663659956883535909
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 00:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oaXx3-000ypZ-Mt; Tue, 20 Sep 2022 10:45:54 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oaXx3-0004oH-Kh; Tue, 20 Sep 2022 10:45:53 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [doc][PATCH v3 1/2] common-tasks.rst: remove SRC_URI:append from
 examples
Date: Tue, 20 Sep 2022 10:45:47 +0300
Message-Id: <20220920074548.17466-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
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
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20220920074548.17466-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 07:46:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3180

Using SRC_URI:append without recipe, machine or architecture specific
limitations makes the :append'ed text more difficult to override than if
the "+=" operator was used. This makes it hard for example to override
SRC_URI completely in a bbappend to update the full recipe to a newer
version. Thus common, reusable layers which users are meant to re-use
and customize should not use SRC_URI:append but SRC_URI += instead.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/dev-manual/common-tasks.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index bdc528b723..17d1433150 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2577,7 +2577,7 @@ chapter of the BitBake User Manual.
 
       S = "${WORKDIR}/postfix-${PV}"
       CFLAGS += "-DNO_ASM"
-      SRC_URI:append = " file://fixup.patch"
+      CFLAGS:append = " --enable-important-feature"
 
 -  *Functions:* Functions provide a series of actions to be performed.
    You usually use functions to override the default implementation of a
@@ -2708,19 +2708,21 @@ in the BitBake User Manual.
    to existing variables. This operator does not add any additional
    space. Also, the operator is applied after all the ``+=``, and ``=+``
    operators have been applied and after all ``=`` assignments have
-   occurred.
+   occurred. This means that if ``:append`` is used in a recipe, it can
+   only be overridden by another layer using the  special ``:remove``
+   operator, which in turn will prevent further layers from adding it back.
 
    The following example shows the space being explicitly added to the
    start to ensure the appended value is not merged with the existing
    value::
 
-      SRC_URI:append = " file://fix-makefile.patch"
+      CFLAGS:append = " --enable-important-feature"
 
    You can also use
    the ``:append`` operator with overrides, which results in the actions
    only being performed for the specified target or machine::
 
-      SRC_URI:append:sh4 = " file://fix-makefile.patch"
+      CFLAGS:append:sh4 = " --enable-important-sh4-specific-feature"
 
 -  *Prepending (:prepend):* Use the ``:prepend`` operator to prepend
    values to existing variables. This operator does not add any
-- 
2.17.1


