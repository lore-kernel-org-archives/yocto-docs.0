Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303F6F4487B
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157879.1775832229407407361
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FzE59woo;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D57BC5C1A9
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4976A60495
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9A0010450026;
	Fri, 10 Apr 2026 16:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xa/+fELT1Q/dhD+kGEQpXCYW1NEzMO/cJHNUk6LQtaQ=;
	b=FzE59wooDcmF00VsoHKaMlH5d9sLvy56fCDgQlKjAdiSgwhb0RNQ/P/6lnKv4rNQfyVOvR
	a/OpVS8Nc7iGxGCd3t46QRjOXsVjf83044sfLZUTuT24V3XYN3g7XUfhOLxNvtjLRfd+5j
	ny2z+CAgVKYIqfODsW5ub1h5bUzTsLDR4QLRE4BN7lC0qbNupK6KDDkZcctkMBxTWcI03t
	Fa+E5LKDdlr89CKuidKCM1DzzmAolsm2IFbzojqrUzN96C8gBLng+cRRBPxNi7hxwlGzfv
	EohJrprSmA25zAGV5wurWsg5caQFV79Ix0XBuf7grdaX9uVciNntB7bdUTUDAg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:32 +0200
Subject: [PATCH 08/18] ref-manual/variables.rst: document the
 SPDX_PACKAGE_URLS variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-8-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wVGiGIDlWTn35+OEGEGhiU8ImvINWX0dh4WM4KnGVS8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyXM1l/fm+IUOG2Xjircqyst9kN655J/v98Q
 CAyZyA7atiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlwAKCRDRgEFAKaOo
 NgZREAC3NVpC6Dd7f6hgR4yW0njczPZJHwHOQXmkG2IGmglWe+ZhpbBSffHRNUjcMa0j+jdZAMT
 zjU8HYmcYT5RDbD+5FQF7nyxLVNP9DmVQ2Lexhdud/Q5pwR3DdehAxXlzEori4ZDq/hY4TzuNUH
 KUJCyLaPMuqCKdzkUsoAyZD926IKgyrzpYBiRU50m5gKB2ylYfzdQH3UYlPcU+LrKb6+MOfdMHw
 DvkuQj3CYA/S6mhfUAUl+u56w3l+NJdHzLUAmb89kJnYi5k8VVPIIQVVGNKI7JJaC+2KPJryFxU
 n/defA96PpDQzfL53o6/3lDD2TMc8+aZxGGQVwuBSM+ne+kG+7ZdCs8WuNKqL1AYBDu1rp1P5BI
 ERe+KucyBX8bC79v9AKx0cdJQGOnQloCgOUF1R1ptMHFCvm9JKJZ2E/nZOomjEXnkijQEKTkSXC
 6HO2utqwE9TYRdfCAlMmbQmX39Z6f0FjYHwyOKkpQ3+/Q6adFywod3QUZVNen8h1Kg2i73V0AJK
 gLmsvj2xj+IIwvWUH3BF0eolNMXpZ/xJ+lqkb/TMptarbzEctj3DOaKgq2gO8YI/tTsL4vxXd9y
 Xz6YhHhtl9DNZYsY2u+az6IpdaTWDZaNCrEQIU5P+iZua8YXSwKeEae+a7dwLeD3O8FXIUmIqyG
 k4rzK4n4x6Vz4Sw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9237

Added by commit 874b2d301d3c ("spdx: Add yocto PURLs") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index bb39ceaaf..6c3f62d9f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9659,6 +9659,15 @@ system and gives an overview of their function and contents.
       specification) for a software Package. The default value of this variable
       is an empty string.
 
+   :term:`SPDX_PACKAGE_URLS`
+      A space separated list of Package URLs ("PURLs") for the software package.
+      The first item in this list will be listed as the ``packageUrl`` property
+      of the packages, and all PURLs (including the first one) will be listed as
+      external references. The default value is an auto generated ``pkg:yocto``
+      PURL based on the recipe name, version, and layer name. Override this
+      variable to replace the default, otherwise append or prepend to add
+      additional PURLs.
+
    :term:`SPDX_PACKAGE_VERSION`
       This variable controls the package version as seen in the SPDX 3.0 JSON
       output (``software_packageVersion``). The default value for this variable

-- 
2.53.0


