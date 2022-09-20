Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9293CC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 07:46:06 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.9116.1663659957226480570
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
	id 1oaXx4-000yq4-Dd; Tue, 20 Sep 2022 10:45:54 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oaXx4-0004qU-BC; Tue, 20 Sep 2022 10:45:54 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [doc][PATCH v3 2/2] kernel-dev/common.rst: remove SRC_URI:append from
 examples
Date: Tue, 20 Sep 2022 10:45:48 +0300
Message-Id: <20220920074548.17466-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220920074548.17466-1-mikko.rapeli@linaro.org>
References: <20220920074548.17466-1-mikko.rapeli@linaro.org>
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
 Message-ID: 20220920074548.17466-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 07:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3181

It's better to use SRC_URI += to append patches etc. If anything
is added via :append, that can only be removed with :remove which
makes the changes rather permanent compared to light weight +=
amendmends.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/kernel-dev/common.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 16ef6453bd..fb8d7cd029 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -360,9 +360,9 @@ home directory:
 
       FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-      SRC_URI:append = " file://patch-file-one.patch"
-      SRC_URI:append = " file://patch-file-two.patch"
-      SRC_URI:append = " file://patch-file-three.patch"
+      SRC_URI += "file://patch-file-one.patch"
+      SRC_URI += "file://patch-file-two.patch"
+      SRC_URI += "file://patch-file-three.patch"
 
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find patch files. For more
@@ -1002,7 +1002,7 @@ Section.
    contents::
 
       FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-      SRC_URI:append = " file://0001-calibrate.c-Added-some-printk-statements.patch"
+      SRC_URI += "file://0001-calibrate.c-Added-some-printk-statements.patch"
 
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find the patch file.
@@ -1875,7 +1875,7 @@ build.
 2. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
    recipe's :term:`SRC_URI` statement::
 
-      SRC_URI:append = " file://test.scc"
+      SRC_URI += "file://test.scc"
 
    The leading space before the path is important as the path is
    appended to the existing path.
@@ -1884,7 +1884,7 @@ build.
    :term:`KERNEL_FEATURES` statement to specify the feature as a kernel
    feature::
 
-      KERNEL_FEATURES:append = " test.scc"
+      KERNEL_FEATURES += "test.scc"
 
    The OpenEmbedded build
    system processes the kernel feature when it builds the kernel.
-- 
2.17.1


