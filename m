Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985B9EC01AC
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 08:50:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12770.1774255826643495893
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 01:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xI1P/hOu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2914B1A2F8E
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 002545FEF6
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D902103711D0;
	Mon, 23 Mar 2026 09:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774255824; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jz1xTMFM/njhNHtB4IXO81BIVY7182CPpc51NMn3/Is=;
	b=xI1P/hOuSUqEay2aCVZ1ATTcOPXBFqZs22xpwhOePm8JoDGfrl0+Nn+CPGoZM5EEbBae0H
	ZiKM9CRNlCcBADeSwzvGQOPz/eL5J9NFdj39y52foW4Foz4X0c1HoPxijN9Q+UPK0ADzw/
	suBKw1JEnoREQsO8K4/WLAPnhUCNaDj06FnbIZB6+hkpbY2+MT2Loa6hmZoRhPQW20sDUe
	NMx4spRpf6P6gg/522zhpjEeNVGfjWrcr4msEq8rSZ9QTyOoByfhhqvcYI34vhApmMJpZd
	p8SPWIpZEDnjugUD28tP88BlRRF5CfO7fzHf776Y9uHH/+ic7Lc+iOCSsKwtUw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Mar 2026 09:49:56 +0100
Subject: [PATCH v3 5/8] ref-manual/variables.rst: document the
 SPDX_CONCLUDED_LICENSE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-release-notes-6-0-v3-5-844ec702f95b@bootlin.com>
References: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
In-Reply-To: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9flgFEj5tHqyRwWu10D982KLgJJRO4cCrUPqvV9JUHQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpwP7LysBIINU2Oya1a00RtZesV2W3ISfmIVUrl
 wIos0/a0M2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCacD+ywAKCRDRgEFAKaOo
 NtoPD/9tEYVxTGmx63zCw/jZlaOxsnZ7UrI4W6ggtG48rS6EgFju3AEhC79ayg8kxg2Jkn1vO+d
 +8haOOciDufmHt5m4RX1t5C02iOzw9pY9O2VgxilAo9Ch+zQqI1THj9w1daehtWXdQoR77K/GJN
 sEh9sOLVq6m5fTxOhIpxdTVqD7zGt13MWg4/Q/PO6R3uiAdCkQxL/g0MZ0gQs7F+/WHe67xSBwm
 kHuyUnajRrnUf2kXFeaGcUDdxV5IgSXy4/RhynKlbiHCFjqOW9Q2Ap+/dUYWOeTQOugtO6YaG+H
 /XHxifwKsjYyvpbe81yessts0p2Tw74urerSiE5IpepEIP5cbxe+oAEycketeoBc3OWCpBCE4d5
 kMRLQjxuENWTz5kQq1XEGwrP3ADNElfv7aLRC7Q8Wa2nbVmGOy70tqHbFrHIa02Y54RSvcTyteP
 uG9pkx3IoXYFvi02ByO7X6pre+vk4BcLM25edVMtkschWWSzfH+5uOfSK1ocKLX4MnMT5fopybl
 Wd43llVNnESd1fVEua0acF9c4IKYnmL6AA3eoxaWoj9GP5dzAikELGuhgp96bNcPy+ju3O3l3hj
 fJ03ren4F1K2xlCz4WvDb+xkmvRELl4AV4UGQ04IZMP7Xk6YY5gv6YrOT3s0kaFpL/lN6l46m0L
 lOCuRVMSGmB2mnA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9118

Document the SPDX_CONCLUDED_LICENSE variable, added by commit
bb21c6a429a2 ("spdx30_tasks: Add concluded license support with
SPDX_CONCLUDED_LICENSE") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6c779e42d..03154a866 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9191,6 +9191,22 @@ system and gives an overview of their function and contents.
       (+ 0.07\% with the tested image), compared to just enabling
       :term:`SPDX_INCLUDE_SOURCES`.
 
+   :term:`SPDX_CONCLUDED_LICENSE`
+      The :term:`SPDX_CONCLUDED_LICENSE` variable allows overriding the
+      ``hasConcludedLicense`` object to individual SBOM packages. This can be
+      used when the license of a package was determined to be different than the
+      original license string value, after analysis.
+
+      This variable can be set in two ways:
+
+      -  For the entire recipe::
+
+            SPDX_CONCLUDED_LICENSE = "MIT & Apache-2.0"
+
+      -  For an individual package produced by the recipe::
+
+            SPDX_CONCLUDED_LICENSE:${PN} = "MIT & Apache-2.0"
+
    :term:`SPDX_CUSTOM_ANNOTATION_VARS`
       This option allows to associate `SPDX annotations
       <https://spdx.github.io/spdx-spec/v2.3/annotations/>`__ to a recipe,

-- 
2.53.0


