Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB42F9EDEB
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83823.1776867783910150639
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=FHFL4ZiS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C6606C5C3CD
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF7185FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFC0110460BAD;
	Wed, 22 Apr 2026 16:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c3z9+x5uJ8fulvLlxpMbtmCQ91QKaBJYygns4/U4v2c=;
	b=FHFL4ZiSGHSNkiElzIFwE/dHxt52bmZT14G7RABtCJYQvNENzCxauSftL0mm+0md8uvPzT
	oKlHumrx7ngYLnQ7NicFdQ/BJlfUD05XIEUO53QArDnlsoqxkJADxYbsG6ghzk0Th746Hk
	Lln7T8jYJBBkA+UMt/94f0bYmTMe/xzXFBz5bgH7W1ycLc8VVdYWc21Ah9PYvNn5vUGCJZ
	PDUQ3izvL4M5V1m8cHI6i+iKQNfbIIt/DTZnzu++aGPKNAy2850CBP76mQIm6M90xNPlcG
	RDyCA6h0nerwG13S6/2pJ3n+pu7CMzV4n6qgHSBwsQ67+6gKca6+1aQQaVv/3Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:46 +0200
Subject: [PATCH 13/16] migration-guides/release-notes-6.0.rst: update CFE
 fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-13-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13043;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=p5EqwZMXJHMPLN07AW5HzS6EG4+FDKJXMWEldc9/JQ8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm6zuUmBX3JS7iRSeBEQ6OXYjp7u/Q370rKZ
 e1qZm+SKOWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZugAKCRDRgEFAKaOo
 NoFBD/wL0TdhyhoFxJeehJd+MWiToYTGXwo9Qd8zvP+PsS/9iYOlCic0lJt2sGbmYmPPEcrvdIy
 BmiYSEpChCxwW8xLgXLvAp1SH5zamZach8lFyW5+MfWL0DRlcxb0InkbGdC/zXV9LKWi71j+/FO
 F7x16rIekEtrxeoXXtRZiFEM4VIfgOqdJNLDMClzdsMy07GQHFxi4AFOHNH9xVF1UTf2g1z3bBP
 c0gs5I/EVNTxKP+H1DP1U4WwkAVnx31ZfkqwCzHrXO0ocf2YDKKWf1GvCbGMpNFFKe8Yq1tHIup
 fTA6EOj8DI9h+3QLEOmkxC9zcO/8DxBkWstbtXq1rpDsL6yNA2XM0pusjj1tFAEhWaOJ+j3nX4E
 j4tyqoUhRdfuGQfsGwM832+gaJdGtHkVIlqgiEBSenOKiZ3xI0JKVNWFjgdKYoNV5m1KLOZV5gE
 yKz4+aG4qbdtptz0D8bJs4ju023Az5CD3S38s1UNv832q8p1EfSjEmmzCLs13v6ly8bvaU+hmyc
 Zx5DgCFN1A3TeWUP7pLfhnSTurh5UuCBQFdoJnhN07yMkPtWR2UO76UUp6mHby/glATJmlY6l4T
 tjs+zpQTJ3m3M4ETUyDux0I+tDfNO8Zw62by25+Z8WLU794X3Hh1cc70GeLus7siON8beIvNZiU
 5WLm5THheqNewnQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9322

Use documentation/tools/gen-cve-release-notes to generate the array.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.0.rst         | 69 +++++++++++++++++++++-
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index d8efd2e86..a37beb30b 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -786,6 +786,9 @@ The following changes have been made to the :term:`LICENSE` values set by recipe
 Security Fixes in |yocto-ver|
 -----------------------------
 
+..
+   Generated with documentation/tools/gen-cve-release-notes
+
 The following CVEs have been fixed:
 
 .. list-table::
@@ -794,8 +797,70 @@ The following CVEs have been fixed:
 
    * - Recipe
      - CVE IDs
-   * - ``recipe name``
-     - :cve_nist:`xxx-xxxx`, ...
+   * - ``avahi``
+     - :cve_nist:`2025-59529`, :cve_nist:`2026-34933`
+   * - ``binutils``
+     - :cve_nist:`2025-69644`, :cve_nist:`2025-69647`, :cve_nist:`2025-69648`, :cve_nist:`2025-69649`, :cve_nist:`2025-69650`, :cve_nist:`2025-69651`, :cve_nist:`2025-69652`, :cve_nist:`2026-3441`, :cve_nist:`2026-3442`, :cve_nist:`2026-4647`
+   * - ``binutils-cross-x86_64``
+     - :cve_nist:`2025-69644`, :cve_nist:`2025-69647`, :cve_nist:`2025-69648`, :cve_nist:`2025-69649`, :cve_nist:`2025-69650`, :cve_nist:`2025-69651`, :cve_nist:`2025-69652`, :cve_nist:`2026-3441`, :cve_nist:`2026-3442`, :cve_nist:`2026-4647`
+   * - ``binutils-testsuite``
+     - :cve_nist:`2025-69644`, :cve_nist:`2025-69647`, :cve_nist:`2025-69648`, :cve_nist:`2025-69649`, :cve_nist:`2025-69650`, :cve_nist:`2025-69651`, :cve_nist:`2025-69652`, :cve_nist:`2026-3441`, :cve_nist:`2026-3442`, :cve_nist:`2026-4647`
+   * - ``cargo``
+     - :cve_nist:`2026-39837`, :cve_nist:`2026-39839`, :cve_nist:`2026-39840`, :cve_nist:`2026-39841`
+   * - ``cups``
+     - :cve_nist:`2026-34978`, :cve_nist:`2026-34979`, :cve_nist:`2026-34980`, :cve_nist:`2026-34990`, :cve_nist:`2026-39314`, :cve_nist:`2026-39316`
+   * - ``ffmpeg``
+     - :cve_nist:`2025-69693`, :cve_nist:`2026-40962`
+   * - ``glibc``
+     - :cve_nist:`2026-4046`, :cve_nist:`2026-4437`, :cve_nist:`2026-4438`
+   * - ``go``
+     - :cve_nist:`2026-27140`, :cve_nist:`2026-27143`, :cve_nist:`2026-27144`, :cve_nist:`2026-32280`, :cve_nist:`2026-32281`, :cve_nist:`2026-32282`, :cve_nist:`2026-32283`, :cve_nist:`2026-32288`, :cve_nist:`2026-32289`
+   * - ``go-binary-native``
+     - :cve_nist:`2026-27140`, :cve_nist:`2026-27143`, :cve_nist:`2026-27144`, :cve_nist:`2026-32280`, :cve_nist:`2026-32281`, :cve_nist:`2026-32282`, :cve_nist:`2026-32283`, :cve_nist:`2026-32288`, :cve_nist:`2026-32289`
+   * - ``go-cross-x86-64-v3``
+     - :cve_nist:`2026-27140`, :cve_nist:`2026-27143`, :cve_nist:`2026-27144`, :cve_nist:`2026-32280`, :cve_nist:`2026-32281`, :cve_nist:`2026-32282`, :cve_nist:`2026-32283`, :cve_nist:`2026-32288`, :cve_nist:`2026-32289`
+   * - ``go-runtime``
+     - :cve_nist:`2026-27140`, :cve_nist:`2026-27143`, :cve_nist:`2026-27144`, :cve_nist:`2026-32280`, :cve_nist:`2026-32281`, :cve_nist:`2026-32282`, :cve_nist:`2026-32283`, :cve_nist:`2026-32288`, :cve_nist:`2026-32289`
+   * - ``gstreamer1.0``
+     - :cve_nist:`2026-2920`, :cve_nist:`2026-2921`, :cve_nist:`2026-2922`, :cve_nist:`2026-2923`, :cve_nist:`2026-3081`, :cve_nist:`2026-3082`, :cve_nist:`2026-3083`, :cve_nist:`2026-3084`, :cve_nist:`2026-3085`, :cve_nist:`2026-3086`
+   * - ``libarchive``
+     - :cve_nist:`2026-5121`
+   * - ``libexif``
+     - :cve_nist:`2026-40385`, :cve_nist:`2026-40386`
+   * - ``libinput``
+     - :cve_nist:`2026-35093`, :cve_nist:`2026-35094`
+   * - ``libpng``
+     - :cve_nist:`2026-33416`, :cve_nist:`2026-33636`
+   * - ``libsndfile1``
+     - :cve_nist:`2024-50613`, :cve_nist:`2025-52194`
+   * - ``libsoup``
+     - :cve_nist:`2026-1467`, :cve_nist:`2026-1536`, :cve_nist:`2026-1539`, :cve_nist:`2026-1801`, :cve_nist:`2026-2443`, :cve_nist:`2026-3099`, :cve_nist:`2026-3632`, :cve_nist:`2026-3633`, :cve_nist:`2026-3634`, :cve_nist:`2026-4271`, :cve_nist:`2026-5119`
+   * - ``linux-yocto``
+     - :cve_nist:`2019-14899`, :cve_nist:`2021-3714`, :cve_nist:`2021-3864`, :cve_nist:`2022-0400`, :cve_nist:`2022-1247`, :cve_nist:`2022-4543`, :cve_nist:`2023-3397`, :cve_nist:`2023-3640`, :cve_nist:`2023-4010`, :cve_nist:`2023-6238`, :cve_nist:`2023-6240`, :cve_nist:`2025-40039`, :cve_nist:`2025-40040`, :cve_nist:`2025-40082`, :cve_nist:`2025-40149`, :cve_nist:`2025-40164`, :cve_nist:`2025-40251`, :cve_nist:`2025-68211`, :cve_nist:`2025-68214`, :cve_nist:`2025-68223`, :cve_nist:`2025-68333`, :cve_nist:`2025-68340`, :cve_nist:`2025-68351`, :cve_nist:`2025-68358`, :cve_nist:`2025-68365`, :cve_nist:`2025-68725`, :cve_nist:`2025-68749`, :cve_nist:`2025-68817`, :cve_nist:`2025-68823`, :cve_nist:`2025-71071`, :cve_nist:`2025-71072`, :cve_nist:`2025-71073`, :cve_nist:`2025-71074`, :cve_nist:`2025-71075`, :cve_nist:`2025-71076`, :cve_nist:`2025-71077`, :cve_nist:`2025-71078`, :cve_nist:`2025-71079`, :cve_nist:`2025-71080`, :cve_nist:`2025-71081`, :cve_nist:`2025-71082`, :cve_nist:`2025-
 71083`, :cve_nist:`2025-71084`, :cve_nist:`2025-71085`, :cve_nist:`2025-71086`, :cve_nist:`2025-71087`, :cve_nist:`2025-71088`, :cve_nist:`2025-71089`, :cve_nist:`2025-71091`, :cve_nist:`2025-71093`, :cve_nist:`2025-71094`, :cve_nist:`2025-71095`, :cve_nist:`2025-71096`, :cve_nist:`2025-71097`, :cve_nist:`2025-71098`, :cve_nist:`2025-71099`, :cve_nist:`2025-71100`, :cve_nist:`2025-71101`, :cve_nist:`2025-71102`, :cve_nist:`2025-71104`, :cve_nist:`2025-71105`, :cve_nist:`2025-71107`, :cve_nist:`2025-71108`, :cve_nist:`2025-71109`, :cve_nist:`2025-71111`, :cve_nist:`2025-71112`, :cve_nist:`2025-71113`, :cve_nist:`2025-71114`, :cve_nist:`2025-71115`, :cve_nist:`2025-71116`, :cve_nist:`2025-71117`, :cve_nist:`2025-71118`, :cve_nist:`2025-71119`, :cve_nist:`2025-71120`, :cve_nist:`2025-71121`, :cve_nist:`2025-71122`, :cve_nist:`2025-71124`, :cve_nist:`2025-71125`, :cve_nist:`2025-71126`, :cve_nist:`2025-71127`, :cve_nist:`2025-71128`, :cve_nist:`2025-71129`, :cve_nist:`2025-71130`, :cve_
 nist:`2025-71131`, :cve_nist:`2025-71132`, :cve_nist:`2025-71133`, :cve_nist:`2025-71134`, :cve_nist:`2025-71135`, :cve_nist:`2025-71136`, :cve_nist:`2025-71137`, :cve_nist:`2025-71138`, :cve_nist:`2025-71141`, :cve_nist:`2025-71142`, :cve_nist:`2025-71143`, :cve_nist:`2025-71147`, :cve_nist:`2025-71148`, :cve_nist:`2025-71149`, :cve_nist:`2025-71150`, :cve_nist:`2025-71151`, :cve_nist:`2025-71152`, :cve_nist:`2025-71153`, :cve_nist:`2025-71154`, :cve_nist:`2025-71156`, :cve_nist:`2025-71157`, :cve_nist:`2025-71158`, :cve_nist:`2025-71160`, :cve_nist:`2025-71161`, :cve_nist:`2025-71162`, :cve_nist:`2025-71163`, :cve_nist:`2025-71180`, :cve_nist:`2025-71182`, :cve_nist:`2025-71183`, :cve_nist:`2025-71184`, :cve_nist:`2025-71185`, :cve_nist:`2025-71186`, :cve_nist:`2025-71187`, :cve_nist:`2025-71188`, :cve_nist:`2025-71189`, :cve_nist:`2025-71190`, :cve_nist:`2025-71191`, :cve_nist:`2025-71200`, :cve_nist:`2025-71201`, :cve_nist:`2025-71202`, :cve_nist:`2025-71203`, :cve_nist:`2025-71
 204`, :cve_nist:`2025-71220`, :cve_nist:`2025-71221`, :cve_nist:`2025-71222`, :cve_nist:`2025-71223`, :cve_nist:`2025-71225`, :cve_nist:`2025-71227`, :cve_nist:`2025-71229`, :cve_nist:`2025-71230`, :cve_nist:`2025-71231`, :cve_nist:`2025-71232`, :cve_nist:`2025-71233`, :cve_nist:`2025-71234`, :cve_nist:`2025-71235`, :cve_nist:`2025-71236`, :cve_nist:`2025-71237`, :cve_nist:`2025-71238`, :cve_nist:`2026-22976`, :cve_nist:`2026-22977`, :cve_nist:`2026-22978`, :cve_nist:`2026-22979`, :cve_nist:`2026-22980`, :cve_nist:`2026-22981`, :cve_nist:`2026-22982`, :cve_nist:`2026-22984`, :cve_nist:`2026-22985`, :cve_nist:`2026-22986`, :cve_nist:`2026-22989`, :cve_nist:`2026-22990`, :cve_nist:`2026-22991`, :cve_nist:`2026-22992`, :cve_nist:`2026-22993`, :cve_nist:`2026-22994`, :cve_nist:`2026-22996`, :cve_nist:`2026-22997`, :cve_nist:`2026-22998`, :cve_nist:`2026-22999`, :cve_nist:`2026-23000`, :cve_nist:`2026-23001`, :cve_nist:`2026-23002`, :cve_nist:`2026-23003`, :cve_nist:`2026-23005`, :cve_ni
 st:`2026-23006`, :cve_nist:`2026-23007`, :cve_nist:`2026-23008`, :cve_nist:`2026-23009`, :cve_nist:`2026-23010`, :cve_nist:`2026-23011`, :cve_nist:`2026-23013`, :cve_nist:`2026-23015`, :cve_nist:`2026-23017`, :cve_nist:`2026-23018`, :cve_nist:`2026-23019`, :cve_nist:`2026-23020`, :cve_nist:`2026-23021`, :cve_nist:`2026-23023`, :cve_nist:`2026-23025`, :cve_nist:`2026-23026`, :cve_nist:`2026-23060`, :cve_nist:`2026-23061`, :cve_nist:`2026-23062`, :cve_nist:`2026-23063`, :cve_nist:`2026-23064`, :cve_nist:`2026-23065`, :cve_nist:`2026-23066`, :cve_nist:`2026-23067`, :cve_nist:`2026-23068`, :cve_nist:`2026-23069`, :cve_nist:`2026-23070`, :cve_nist:`2026-23071`, :cve_nist:`2026-23072`, :cve_nist:`2026-23073`, :cve_nist:`2026-23074`, :cve_nist:`2026-23075`, :cve_nist:`2026-23076`, :cve_nist:`2026-23077`, :cve_nist:`2026-23078`, :cve_nist:`2026-23080`, :cve_nist:`2026-23081`, :cve_nist:`2026-23083`, :cve_nist:`2026-23084`, :cve_nist:`2026-23085`, :cve_nist:`2026-23086`, :cve_nist:`2026-2308
 7`, :cve_nist:`2026-23088`, :cve_nist:`2026-23089`, :cve_nist:`2026-23090`, :cve_nist:`2026-23091`, :cve_nist:`2026-23092`, :cve_nist:`2026-23093`, :cve_nist:`2026-23094`, :cve_nist:`2026-23095`, :cve_nist:`2026-23096`, :cve_nist:`2026-23097`, :cve_nist:`2026-23098`, :cve_nist:`2026-23099`, :cve_nist:`2026-23100`, :cve_nist:`2026-23101`, :cve_nist:`2026-23102`, :cve_nist:`2026-23103`, :cve_nist:`2026-23104`, :cve_nist:`2026-23105`, :cve_nist:`2026-23107`, :cve_nist:`2026-23108`, :cve_nist:`2026-23109`, :cve_nist:`2026-23110`, :cve_nist:`2026-23111`, :cve_nist:`2026-23112`, :cve_nist:`2026-23113`, :cve_nist:`2026-23114`, :cve_nist:`2026-23115`, :cve_nist:`2026-23116`, :cve_nist:`2026-23118`, :cve_nist:`2026-23119`, :cve_nist:`2026-23120`, :cve_nist:`2026-23121`, :cve_nist:`2026-23122`, :cve_nist:`2026-23123`, :cve_nist:`2026-23124`, :cve_nist:`2026-23125`, :cve_nist:`2026-23126`, :cve_nist:`2026-23128`, :cve_nist:`2026-23129`, :cve_nist:`2026-23130`, :cve_nist:`2026-23131`, :cve_nist
 :`2026-23133`, :cve_nist:`2026-23135`, :cve_nist:`2026-23136`, :cve_nist:`2026-23137`, :cve_nist:`2026-23138`, :cve_nist:`2026-23139`, :cve_nist:`2026-23140`, :cve_nist:`2026-23141`, :cve_nist:`2026-23142`, :cve_nist:`2026-23143`, :cve_nist:`2026-23144`, :cve_nist:`2026-23146`, :cve_nist:`2026-23147`, :cve_nist:`2026-23148`, :cve_nist:`2026-23150`, :cve_nist:`2026-23151`, :cve_nist:`2026-23152`, :cve_nist:`2026-23154`, :cve_nist:`2026-23156`, :cve_nist:`2026-23157`, :cve_nist:`2026-23158`, :cve_nist:`2026-23160`, :cve_nist:`2026-23161`, :cve_nist:`2026-23163`, :cve_nist:`2026-23164`, :cve_nist:`2026-23166`, :cve_nist:`2026-23167`, :cve_nist:`2026-23168`, :cve_nist:`2026-23169`, :cve_nist:`2026-23170`, :cve_nist:`2026-23171`, :cve_nist:`2026-23172`, :cve_nist:`2026-23173`, :cve_nist:`2026-23186`, :cve_nist:`2026-23187`, :cve_nist:`2026-23188`, :cve_nist:`2026-23190`, :cve_nist:`2026-23191`, :cve_nist:`2026-23192`, :cve_nist:`2026-23193`, :cve_nist:`2026-23195`, :cve_nist:`2026-23196`
 , :cve_nist:`2026-23197`, :cve_nist:`2026-23198`, :cve_nist:`2026-23199`, :cve_nist:`2026-23201`, :cve_nist:`2026-23204`, :cve_nist:`2026-23205`, :cve_nist:`2026-23206`, :cve_nist:`2026-23208`, :cve_nist:`2026-23209`, :cve_nist:`2026-23210`, :cve_nist:`2026-23212`, :cve_nist:`2026-23213`, :cve_nist:`2026-23214`, :cve_nist:`2026-23215`, :cve_nist:`2026-23216`, :cve_nist:`2026-23217`, :cve_nist:`2026-23219`, :cve_nist:`2026-23220`, :cve_nist:`2026-23221`, :cve_nist:`2026-23222`, :cve_nist:`2026-23223`, :cve_nist:`2026-23224`, :cve_nist:`2026-23226`, :cve_nist:`2026-23227`, :cve_nist:`2026-23228`, :cve_nist:`2026-23229`, :cve_nist:`2026-23230`, :cve_nist:`2026-23231`, :cve_nist:`2026-23233`, :cve_nist:`2026-23234`, :cve_nist:`2026-23235`, :cve_nist:`2026-23236`, :cve_nist:`2026-23237`, :cve_nist:`2026-23238`
+   * - ``mesa``
+     - :cve_nist:`2026-40393`
+   * - ``nfs-utils``
+     - :cve_nist:`2025-12801`
+   * - ``nghttp2``
+     - :cve_nist:`2026-27135`
+   * - ``openssh``
+     - :cve_nist:`2026-35414`
+   * - ``python3``
+     - :cve_nist:`2026-4519`
+   * - ``python3-requests``
+     - :cve_nist:`2026-25645`
+   * - ``qemu``
+     - :cve_nist:`2024-6519`
+   * - ``qemu-system-native``
+     - :cve_nist:`2024-6519`
+   * - ``sqlite3``
+     - :cve_nist:`2025-70873`
+   * - ``systemd-boot``
+     - :cve_nist:`2026-29111`, :cve_nist:`2026-40226`
+   * - ``vim``
+     - :cve_nist:`2026-28417`, :cve_nist:`2026-28418`, :cve_nist:`2026-28419`, :cve_nist:`2026-28420`, :cve_nist:`2026-28421`, :cve_nist:`2026-28422`, :cve_nist:`2026-33412`, :cve_nist:`2026-34714`, :cve_nist:`2026-35177`
+   * - ``xz``
+     - :cve_nist:`2026-34743`
 
 Recipe Upgrades in |yocto-ver|
 ------------------------------

-- 
2.53.0


