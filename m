Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92FAC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:58:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8663.1783673887048683115
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 01:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=t55DgBLd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CA3AD4E40D41
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 08:58:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9907960341
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 08:58:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F1A611BD0656;
	Fri, 10 Jul 2026 10:58:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783673884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=l1YsF9GEaMqf9XQ04NyiIagwm3gjSzDSvbVDU9YNSCs=;
	b=t55DgBLdFBDkKd4KHEF2USZGGldC4zj/1gcOIZGuf6gWxvAaS+guOLAhurlWa4jnwwWHFr
	LQvBYotPU1Rl2Q83jqsRg1JNumgYX7fzfh1PWal+zrXqEws3wCJB64GwmPzNKaSfM9njR6
	ZgLVWE+BrV+g+2wlaW2RH6bOwYTX4KA4r2U9Ec9ALNyU1Thm+T5X5LfR6x2uKhU2Wa5McT
	mJjZaiOijYcHHicupdNX8/t460xntJ4wuDIQg7dP1UFrF1g4uPlzcYBbSN0qxHM9bX4wfL
	wsMafjPa2D4fO68nNQHxj7hcXbfwYgwYhF7x7uaq39J9NeGl3IVmOburIyyGUg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 10:57:59 +0200
Subject: [PATCH] ref-manual: fix some repeated strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-repeated-strings-v1-1-e170bab49db3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMBAF0augrWPJpiBOroIobPgmm8JBuw5CQ
 twdk5SvmNlJIQylZ7OTYGXlT65wt4bGV8gzDE/V1Nq2s3dnjWBBKJiMFuE8q/GIPvkY0sM5qtk
 iSLz9lv3wt37jG2O5PnQcJ7OUxg50AAAA
X-Change-ID: 20260710-repeated-strings-8eb8f8baf911
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2875;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=8lKiCHq1kUuyVoCK/SjC/9Xnsiaxrr/ur6syrFfIASw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqULQbjC3EVsa36IXwBp/jAagRJOLOLN5m2/nAs
 3eXJKM3XEeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalC0GwAKCRDRgEFAKaOo
 NmvMD/4idVwNCWtObVngF0KdbXUJdyvdyPSVj19rQuQY19haVwJU7y1TzxWTmviANj9+pHcvd0x
 lg81+26GFeLcWZz16Q+lCCY3dBIMdR6vfqu/2sot/dOgCGxB+rEWmKfcKjzSna++mQNC8webVsb
 gOPgT+BOiACYylLtrrWDWr8Od8WpDdqyv5aVu92FbkrthlQQIFbI7hkONGgOnwMof4pZh+VH5WP
 XPkSuyMEOPhIUj28mCxAYpaxC7t9a3Q4PamrpEbSMkSNdZ9coo4IrLKVObjuxD2L99rIfOZA/Nd
 n5ZoZpIBLcc16QmOM9UKGQr8Nc3ncnQKScxEYLergUd1BkxbmN0bS3Zf6PcLsBtPKiRg7OCr4Jz
 utVv2A+5ILiVf5Jsi1kv2B1fl6ab6feqUhhM1zvERvCjknFLyKvZLjOzcYN6GgZxNegn84Cc+Ke
 F/5/2c6i/tHsnkJV+PZo9bH4v3gyF1FsOD4iD09kbpbmW5bUXVSQM9uLn2zWYMHloukecXNrbrc
 DlIusTQS41NUZuWbOosfl4EjAzozQtGt4FhG3fDA7OsmEODpG8ioblZ0K6HxlymWsyQGvqjgF/o
 cZhyAjDD+MdI5elbkkCAI5f/oT1DdmPlRnnLR3CHCy++JLBcCFD1aTPIwLyjCxEOfbUdJ0kNS9R
 nfFRhAnxaSnXSLw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 08:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10054

Grepped with git grep --extended-regexp " ([a-zA-Z]+)\s\1 ".

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst             | 2 +-
 documentation/ref-manual/system-requirements.rst | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f826bbdbc..ae0f771c9 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -560,7 +560,7 @@ as well as in ``tmp/deploy/spdx``.
 
 The exact behaviour of this class, and the amount of output can be controlled
 by the :term:`SPDX_PRETTY`, :term:`SPDX_INCLUDE_SOURCES` and other variables
-starting with with ``SPDX_``.
+starting with ``SPDX_``.
 
 See the description of these variables and the
 ":ref:`dev-manual/sbom:creating a software bill of materials`"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 63291cae3..8317452b2 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -514,7 +514,7 @@ installer and automatically installs the tools for you:
 
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the
-   tools are initialized. The results are working versions versions of
+   tools are initialized. The results are working versions of
    Git, tar, Python and ``chrpath``. And in the case of the
    :term:`buildtools-extended` tarball, additional working versions of tools
    including ``gcc``, ``make`` and the other tools included in
@@ -555,7 +555,7 @@ steps:
 
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the
-   tools are initialized. The results are working versions versions of
+   tools are initialized. The results are working versions of
    Git, tar, Python and ``chrpath``. And in the case of the
    :term:`buildtools-extended` tarball, additional working versions of tools
    including ``gcc``, ``make`` and the other tools included in
@@ -626,7 +626,7 @@ installer:
 
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the
-   tools are initialized. The results are working versions versions of
+   tools are initialized. The results are working versions of
    Git, tar, Python and ``chrpath``. And in the case of the
    :term:`buildtools-extended` tarball, additional working versions of tools
    including ``gcc``, ``make`` and the other tools included in

---
base-commit: 0cd9c643c0185c60eb9aae90fe48c3597b1781d6
change-id: 20260710-repeated-strings-8eb8f8baf911


