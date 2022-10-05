Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247C8C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 09:30:24 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.21669.1664962216803728544
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 02:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1og0jE-00DaIZ-J4; Wed, 05 Oct 2022 12:30:12 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1og0jE-001NM7-4g; Wed, 05 Oct 2022 12:30:12 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 2/5] classes.rst: document openssl-native.bbclass
Date: Wed,  5 Oct 2022 12:30:07 +0300
Message-Id: <20221005093007.326744-1-mikko.rapeli@linaro.org>
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
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221005093007.326744-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Oct 2022 09:30:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3284

It sets various environment variables correctly for openssl-native.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/classes.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

v4: updated to :ref: syntax and simplified text

v3: no changes

v2: moved doc changes to separate patch

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 11e0d472e8..8a10e51eb7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1672,6 +1672,16 @@ one such example. However, being aware of this class can reduce the
 proliferation of different versions of similar classes across multiple
 layers.
 
+.. _ref-classes-openssl-native:
+
+``openssl-native.bbclass``
+==================
+
+The :ref:`openssl-native <ref-classes-openssl-native>` class supports using
+the native version of ``openssl`` built by the Yocto Project instead of the
+one provided by the build host distribution. For full certificate checking
+users should also add ``ca-certificates-native`` to :term:`DEPENDS`.
+
 .. _ref-classes-overlayfs:
 
 ``overlayfs.bbclass``
-- 
2.17.1


