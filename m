Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8382BC44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:35:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91297.1783078513543064635
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=17BUO6/q;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 975DFC49F4C
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:35:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D14A660300
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:35:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 390A7104C95A2;
	Fri,  3 Jul 2026 13:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783078511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eXa1Oe9ILSEXPUFCtsen8mtNmzCJkNXBNcvEKRqw8jA=;
	b=17BUO6/q/vY7H7LrBhZBVpxhRfLZ+c5H/7ujAsQmYDgW3Pm5hTToUS2nvBC3Foh8jmu9SP
	WwUtmnPqZU3IKQSvtQ8GGFaPlioQBN5eiD708CfmU+8JbYVfDdSqrb/jqdOiHlLAaYFY6t
	HZ+FlqqFlb0nLkOcqqdX6WI8HI4UwIhFIoz/l6BH0Gwb8C6YFy2hIa3WbWkon0mhVjlbBe
	6CxiOVZ+piX6J80mEvWJeI7Pi78crUynMMshsurrBkvF/ibyisn+XEWK9C+T13SVGnpiQr
	NQt1tBM1NogQWZCdlPtyuqH4Fap4T9qknKNHTldmhgNZmaIesA6nbZOqe+fSCg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Jul 2026 13:31:25 +0200
Subject: [PATCH v2 2/3] tools/check-glossaries: fix default doc path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-pre-commit-v2-2-a9a391299c28@bootlin.com>
References: <20260703-pre-commit-v2-0-a9a391299c28@bootlin.com>
In-Reply-To: <20260703-pre-commit-v2-0-a9a391299c28@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cLslkTKNLl/k1ulyZbiXM9y4v2rUHWbc7IJc7K3Rluk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqR55tmeUAhNXzPSYowMBg0FMU+5okFSx4ICeQL
 WZBZqIAj2GJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakeebQAKCRDRgEFAKaOo
 NrmJD/4o+Zdsy3/HPvVJDMtovT6SsOtBpR2HSbVw0zYFk6tubaYzjt+AcG3qUKwROQ936mJ9vy5
 OrqBGjVp1HKemkRE2x30Y4M4xlMHBt9qRz+QNiYOIprSc7DPNgE6gOA5K6UcSz0Qz/J3bCoegKt
 4Y5UI9BVWIl2LfcO0yQbiwjqbQ5eIFcUIwYU2pdR731npLjMwE1jf21NFrBPnZKA2czQwq1nvtC
 uztEFVZ6lRxMgpwoa1m+zhPsTaPRlXjBp5UrwdxRe3QaKDbGmnuU90lMNtNI2evJBN3KswGhgOU
 jx5kEnGR20yUphW0BTT7Ajnq0W/6RmTIf+6XkoMZJ+S8Qr4IYdFkpRZYwqEK+L1eo83Qj1pb0F/
 9vpfQsOOLNg7OU/Iei6WfXctu+VnnFIE2DbVoByaw8PLiR3i+XOB1WQHsHKMdQ2aaWsGJpWXQAP
 iK7celrLs6eJzUAptKFL3Exy3gmgsSAwFDvhDS7tbMdXt5kAGSko3kaUbF1eWa9mwl42BHlVtBi
 J7OKa2o2gPvTtaxE46CUNdt/K869n1O/E7MFceqKmCoaldavX+BARGO8HqVRa0GQczTrO8R8ymz
 lZGxZF9Ny4KPVoQ8/gTpAAhkB1I0o0bvGDOQpgOqUDNdaFYKF2io/zspdlumn2GvTZlaSzantXr
 C10a4toV0SXhK8A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10015

This default path pointing to the documentation was wrong, fix it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/check-glossaries | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/tools/check-glossaries b/documentation/tools/check-glossaries
index 9f1a47126..da4987ff3 100755
--- a/documentation/tools/check-glossaries
+++ b/documentation/tools/check-glossaries
@@ -2,7 +2,6 @@
 
 import argparse
 import difflib
-import os
 import re
 import sys
 
@@ -14,7 +13,7 @@ def parse_arguments() -> argparse.Namespace:
 
     parser.add_argument("-d", "--docs-dir",
                         type=Path,
-                        default=Path(os.path.dirname(os.path.realpath(__file__))) / "documentation",
+                        default=Path(__file__).resolve().parent.parent,
                         help="Path to documentation/ directory in yocto-docs")
 
     return parser.parse_args()

-- 
2.54.0


