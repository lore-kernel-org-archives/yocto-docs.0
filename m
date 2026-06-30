Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842FFC44502
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:13:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16076.1782807201479586287
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 01:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mxg9p8UO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 99EF04E40BA0
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6935C60233
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9F79106F1C21;
	Tue, 30 Jun 2026 10:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tQbVrb5Qvmf1ckN34VZzl1D7MpFsN1Zohyh1jPQYdL8=;
	b=mxg9p8UOQM1ym1BpvGK3qapadvbcNrCr5AOx2ljtlP0mB7jqv5+YkqjbiNgdf/SHJqYhKw
	nIjxxcJ75UR/TpK8EZG0DCjg1mm2D4gd1Zp9Y8dX5ZGFi8naFpxBXrwT29tMRn4j62sx5m
	NeJWSPhPBc2HckkmGySJreEVGUnTcsSalVPehq6a26GnuVDEkFOG+6Tgqo0DzP8H2bDQ3j
	1wITiZZPLZ5okjOz1ckEIN41mfz3IrVUSL4t0b2t8kyi2KANrd4ACjayPDSJ1UyB8xWR9h
	rWjm9wybvGdV5oEQ/sPV2RFsEELGQ56FwPSnNDBeC3FcCE9mfhUuane+EzRG/Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 30 Jun 2026 10:13:11 +0200
Subject: [PATCH 1/7] ref-manual/variables.rst: document the
 CCACHE_NATIVE_RECIPES_ALLOWED variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-sync-documentation-conf-v1-1-da14b40cb515@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
In-Reply-To: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hkgxLtFgVnaO0yA64l/LVih+1RKw3XN2omEN3kHY2xw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQ3qc7RpsnskguW5s8NCSm6U2Ha2WFluNvY/BV
 SATtCaN0zGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakN6nAAKCRDRgEFAKaOo
 NlanEACXr+GGrfEPNvcVheM8WJxAEZ54/VX11072tNDT7khFdufdJX7GBZbYnuZ6VV+BQXcQs2C
 hVxtFmD2S+iMopBFczOKZzV88fmxo24qHUpcftkTCYuYE/vrDmv3SfnRyiUU7HB9wcLZVHQqKLH
 qf7Lkc989s7piMl+kkcb7TkTvAwKETdvoWU4M6kv6qQ0MOXFt1rB+UVA5N8mmFyTuBN+9mKQemW
 u2YfZPwZ1h4nskcD3t++D61zy/hNNhCfTm+16GRS7XoWJnOBQnGE3xiuMYIACl98oGJNUruUraj
 nG5wInD1XqFZzzD0TNFZIDBtLxUz49JJLo9MCQe4QyVNad+GhuPJXn8yVqSbxNmWFBjN4FVyePJ
 wzEw9Rd9J6cg5x5VgQM/dAcgHJ3rmTGiNFzj6krdf2qwIrBz/6ITs8X2cD8cmEPAzqDVZSZRDcK
 I5lvqf71caNrEyrygpxZ8OmOyFH4eXHrEaTRkbv6rBYKoPDaF2Xq137cVwJFfv9QYmZj14LUiPA
 0G6sOUY6/ghPEnruBwgTwNjctCd/Hwa4wTTKB3VyZlxIbD/MAGPxNufXOOdP4ONUoCrIoK5t+To
 +/S514cCbYL7RnT2OhlEfIh+Uw9QiVIa14BfUPEvBjcPefqlX2vU6yA4sZIVtDSM58oXg6AmURi
 uECVEcCNJWRQ9wQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9984

Added by commit 87cb2be71e0c ("ccache.bbclass: Add allowed list for
native recipes") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b4c6bc957..f8765e084 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1530,6 +1530,11 @@ system and gives an overview of their function and contents.
       :term:`CCACHE_DISABLE` variable can be set to "1" in a recipe to disable
       `Ccache` support. This is useful when the recipe is known to not support it.
 
+   :term:`CCACHE_NATIVE_RECIPES_ALLOWED`
+      The :term:`CCACHE_NATIVE_RECIPES_ALLOWED` variable can be set in a
+      :term:`configuration file` to a list of native recipes that are allowed to
+      be optimized with the :ref:`ref-classes-ccache` class.
+
    :term:`CCACHE_TOP_DIR`
       When inheriting the :ref:`ref-classes-ccache` class, the
       :term:`CCACHE_TOP_DIR` variable can be set to the location of where

-- 
2.54.0


