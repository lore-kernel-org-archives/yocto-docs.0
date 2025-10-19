Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F677CCD195
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 16:47:57 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.102.1760892475218181620
 for <docs@lists.yoctoproject.org>;
 Sun, 19 Oct 2025 09:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=E2lw/Tzn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20251019164752f4aa80961a0002072e-esfidl@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20251019164752f4aa80961a0002072e
        for <docs@lists.yoctoproject.org>;
        Sun, 19 Oct 2025 18:47:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DZYijTP1o6DTEZ4G1qHippHvqLZ/Vmjnnq6AeXiR800=;
 b=E2lw/TznkkCw9X4cB/deirodJANcjK/rEJaCspZbKtv8Cs0xOwASAMgCqH8WQtFCPd3oqa
 FBkaC3wS4sLCOHsmhZXgVH7Q88iimTlviukaanKwV8d42+U84QdtZ85O8D+/16IONiAtZlmT
 lSqaTdZesfnVmjfTmlqdrR7zDlqiN8ukIJI32fV9FPFsAyJPnCYR6CuSQ+OKN2/Ig6T7vTxy
 CQ8w11mk+mFktfmKxnCLM3Rqf1Ky+6C//pmZt/G0mjfEC0oNv7ZyDeMA/lIHHMuozbt/7gEk
 GOKuDeREWP+TvTh5w6M2nLof23uF5IFITO8oxkdnfBGFR+wG1k6j/wHg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: kavinaya@qti.qualcomm.com,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] ref-manual/variables.rst: cover FIT_LINUX_BIN variable
Date: Sun, 19 Oct 2025 18:47:40 +0200
Message-ID: <20251019164740.3795019-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 19 Oct 2025 16:47:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7745

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Document the FIT_LINUX_BIN variable used in the fit-image class to specify
the kernel binary name included in the FIT image.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 591c03028ce..8a10dfc54e6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3430,6 +3430,18 @@ system and gives an overview of their function and contents.
       The default value is set to "x509" by the
       :ref:`ref-classes-kernel-fit-image` class.
 
+   :term:`FIT_LINUX_BIN`
+      This variable is used in the :ref:`ref-classes-kernel-fit-image` class to
+      specify the name of the Linux kernel binary which gets included in the
+      FIT image.
+      The default value is set to "linux.bin".
+
+      If :term:`FIT_LINUX_BIN` is set to an empty string, no kernel binary
+      is included in the FIT image.
+      This might be useful when the FIT image only provides specific components
+      like device trees, while the kernel is delivered as a UKI artifact
+      (see :ref:`ref-classes-uki`).
+
    :term:`FIT_PAD_ALG`
       Specifies the padding algorithm used in creating the FIT Image.
       The default value is set to "pkcs-1.5" by the
-- 
2.51.0


