Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5C0C88E58
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:11:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41824.1789139497091096181
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XmTrTZxd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 385D61A01ED
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0DEFD601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62F0C11C7AFA5;
	Fri, 11 Sep 2026 17:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oWi8zHX3MxDWFBnIdFOvdmug3B6eaSlCwNnvOHJ6wSQ=;
	b=XmTrTZxdhGefFV1OC3cWFLUqFJZNyRL5T5KO5H3HH2spfvbem9TvR8JuRMPK98KMeaFcXC
	NPw5KBfDTICx2zVb0VkVMfnzu1Ivb5LK29azQBGWeMZGglXSeIxl0MaRFjqUtugR9SKp01
	VcrHF2PaMIPgL+gfAg+w0SorwshTpRiuK7L+w+x9BhlDKrEmmM/NFUMK4efUy4TA4fr8oA
	cjpo+7xNpSPMv8SZIMa/h0FG+AkQA0H2m8aO/ttQssta/K64WzN/8e5itREb4ja1zWFr9E
	cIo2UcbMdWJ+TkEfAD6sNdI7SemQWHVqB/U/eXGdFlJ3LUneV9ifoGxVLcoiNA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 17:11:08 +0200
Subject: [PATCH 2/8] ref-manual/terms.rst: Configuration File: split
 paragraph in a list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-remove-local-conf-refs-v1-2-322e1e9a232d@bootlin.com>
References: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
In-Reply-To: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3170;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c2HBW0G6dMNziTcFg2o+SFdub8df3IuB2wXWjH34jD8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBoW/Gpasua0cclwrJFNa59jSp+gfH75dWDmB
 ZJb+55reQ+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQaFgAKCRDRgEFAKaOo
 NlrjD/42M7djxboUXbtiGRpzukx3n6Ri+GnPqyea7ylOB0Qp3CaezRm2b09Vgak1E+PRYYSCoL0
 APl1BvyTYwLI2jWd4g6U95W8J7u9FPi/UHmRuk2UqUvWkMzL9x4mQOIKHmQ+Sr+icaK0x0kZ5//
 6R+OwrySOIhR0/l2AwpTH6JV6ovgRVJIAkhU1BvAY6xgjXer1RFV3APXFrdgQQL4Zt1lKmvxbU1
 GNbAKiBBQX6hzBf6bMKGscWLC96733fUtrElcf0jmpRawVwbQf2CvPQjwEF00OoG77/928UIeQD
 xB2cF2PJdfYjho59E48K3iH9jtmmMpOhneaNOSRvAZzppYikKk0BCjBl0LjiMvgr2FPGiOa6QbO
 JkzY5TzSp7TqrHLbMte/81WEfbprvph2hOuFro0cY7X6LtdU8WXzgFGu9SbtoAb3X+zNJHm4yii
 JJsk6we6x10EGGJ5aWVvFe7c1GxqacLUbUIc3/Skjahqp/wEmc5PVrYUPjHa1FS/CMwp0TXtL5N
 DeHscMEvoiFK5Oo2Dx9xDWZ7k9wKYqPNQTo+hyiRG4/uHM7pEdDBRBJhY39nyn4TCiGzyFmSX5c
 ymhucs7ycCtd++zTJBfNXaX4wcGVce1gsA1XBHzyqg/PUTVV3vM25/fqHIBKRpCIZltJWtQUf/L
 QK4Vxz3fTuM5trA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10471

Use a list to enumerate the different kinds of configuration files there
are, to improve readability.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 22cbc8002..c210da4cb 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -195,19 +195,30 @@ universal, the list includes them just in case:
       build system what to build and what to put into the image to support a
       particular platform.
 
-      Configuration files end with a ``.conf`` filename extension. The
-      :file:`conf/local.conf` configuration file in the :term:`Build Directory`
-      contains user-defined variables that affect every build. The
-      :file:`meta-poky/conf/distro/poky.conf` configuration file defines Yocto
-      "distro" configuration variables used only when building with this
-      policy. Machine configuration files, which are located
-      :ref:`bsp-manual/bsp:BSP Layers>, define variables for specific hardware and are
-      only used when building for that target (e.g. the
-      :file:`machine/beaglebone.conf` configuration file defines variables for
-      the Texas Instruments ARM Cortex-A8 development board).
-      :term:`Configuration Fragments <Configuration Fragment>` such as
-      :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` define snippets of
-      configuration that can be enabled from the command-line.
+      Configuration files end with a ``.conf`` filename extension. There are
+      multiple types of configuration files, such as:
+
+      -  The :file:`conf/local.conf` configuration file in the :term:`Build
+         Directory` contains user-defined variables that affect every build.
+
+      -  The :file:`meta-poky/conf/distro/poky.conf` configuration file defines
+         Yocto "distro" configuration variables used only when building with
+         this policy. See the :ref:`dev-manual/custom-distribution:creating your
+         own distribution` section of the Yocto Project Reference Manual for
+         more information.
+
+      -  Machine configuration files, which are located :ref:`bsp-manual/bsp:BSP
+         Layers`, define variables for specific hardware and are only used when
+         building for that target (e.g. the :file:`machine/beaglebone.conf`
+         configuration file defines variables for the Texas Instruments ARM
+         Cortex-A8 development board).
+
+      -  :term:`Configuration Fragments <Configuration Fragment>` such as
+         :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` define snippets of
+         configuration that can be enabled from the command-line.
+
+      See also the :doc:`/ref-manual/structure` section of the Yocto Project
+      Reference Manual for more example of configuration files.
 
    :term:`Configuration Fragment`
       A :term:`Configuration Fragment` (also called Standard :term:`Configuration

-- 
2.55.0


