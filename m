Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C31CD37B7
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:45 +0000 (UTC)
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1695.1778259579469375298
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=nJe+rRv2;
 spf=pass (domain: 0leil.net, ip: 45.157.188.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMY61yKzCFQ;
	Fri,  8 May 2026 18:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259577;
	bh=j5MAvmxKVcNt3feNeBSXYxgugvu5hG9rq6ImciT1zK4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nJe+rRv2kek2GJcw2NuTnFVzg0wr1PyRd2+dri3wVeyWkbdaOCi+wBx1o7FA7L29+
	 vNeq8FMeteW/msIxA4SCULO6E5B0JXtX7rmBk/cpiubw5oXe71f/aQfQF4LiXveEjf
	 783tbqZbaPnh5vhbw/u8O56Jt7YdhyXUq+nECqe1Bv10KrEkqVG6bkkWLjETwFafTT
	 lzi+jHxfoQ+Ruh7IcM/NZiW3Iw7BqmZZnDNHZtZfSqpW2v8kZizbe1CC3P7y0/6VoS
	 IERMnVMTMC6Vxv1XpN6jSrd6BwdWkepF0WwvUaa9g2Z8kX2inVGiDsEbWGxRNloW2L
	 edX6xRb2nKj0w==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMY3PBpzlFk;
	Fri,  8 May 2026 18:59:37 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:26 +0200
Subject: [PATCH 02/11] ref-manual: classes: fix https:// prefix missing in
 anonymous reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-2-8fb61b5358cc@cherry.de>
References: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
In-Reply-To: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 16:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9409

From: Quentin Schulz <quentin.schulz@cherry.de>

By failing to prefix the URL with https://, it makes the anonymous
reference a link relative to the "parent link". In other words, it
renders the link as
https://docs.yoctoproject.org/wrynose/ref-manual/github.com/bootlin/sbom-cve-check
instead of https://github.com/bootlin/sbom-cve-check.

Add https:// prefix to the URI so it's properly handled.

Fixes: 51162cd20d7a ("ref-manual: document the sbom-cve-check class, fragment, and variables")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/classes.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2905af5ed..e40032164 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2694,7 +2694,7 @@ usually determines whether to include this class.
 ==================
 
 The :ref:`ref-classes-sbom-cve-check` class uses the `sbom-cve-check
-<github.com/bootlin/sbom-cve-check>`__ command-line tool for post-build CVE
+<https://github.com/bootlin/sbom-cve-check>`__ command-line tool for post-build CVE
 analysis. It relies on the :ref:`ref-classes-create-spdx` class as SPDX files
 are the input of this tool.
 
@@ -2719,7 +2719,7 @@ configure the behavior of this class.
 =========================
 
 The :ref:`ref-classes-sbom-cve-check-recipe` class uses the `sbom-cve-check
-<github.com/bootlin/sbom-cve-check>`__ command-line tool for post-build CVE
+<https://github.com/bootlin/sbom-cve-check>`__ command-line tool for post-build CVE
 analysis of a recipe. It relies on the :ref:`ref-classes-create-spdx` class as
 SPDX files are the input of this tool.
 

-- 
2.54.0


