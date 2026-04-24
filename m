Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480FDFC0379
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:29:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16699.1777019345732188058
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ztGTUKUx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 271004E42AE6
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F358E604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38B5010720741;
	Fri, 24 Apr 2026 10:29:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019342; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iI+ZlDHwKZOimjYZu9lajByXQpNXp0hse7dEvwzcuUQ=;
	b=ztGTUKUxXymI9iGnwlvTsyfshcIA7cmbq6Y6BE6xM4wfyFseA73dOv4A3RjFV2SwDb9ujA
	H9M9zPSjL3HNGTkJGjh6Ee2QpX5pEXNy4wH543VOaZl8IbtfkxAKv0zoCF7Q4RfMyEptsd
	z3KCqIwbVmZ3tNjJJ9NFGO2kjYr446qhbrqoSMgMkbfhAX7vZ2CXsigTci6SeL9Pc17MN/
	iq+7n7ZWaKDtXuZ8Ds2pm/kBS5aRY7y/Z4kfDpy290AFP0vjtconTEHLXjqiyrYPKex67/
	RmYASuGyNnf8ddt14QhLqLpuP1dP27rFt4egQXWThuF/a6/qZDBYYqtxKBf7tQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:42 +0200
Subject: [PATCH v2 14/18] migration-guides/release-notes-6.0.rst: update
 CVE fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-14-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13043;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Mn4UGtP4BgmloJmKvd2rK8UvSqnwBfeGl8JS4PvDi6w=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym/fZ0bPNJVwa4UWYJsytj9m40yraT/U8qKM
 Zu9GLbYctWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvwAKCRDRgEFAKaOo
 Nl+nD/9DZjrjsbgq7sWU+BM7kQiuh71uCgu/5TdeDQKNFupGq3/CGSWujIUatwTFPviJUVM9RGq
 8UHHNgWcZwLarE22xWuL44yrxUMMygdlvWGXdmSTqXewovadXkYSza/S1aiG1er/g4XcHsgt1Cp
 /cYQTZ3zFct56LIIfmG7pgouqGRepiaiVWvKSZGcZXrLSxg9OXQizEh1m75QGeIL45vRuyKkLWP
 krc8w7CX8hewB2JfDxOSHb+PTtR7ocM1Vx6W2JeLRZbM8cHwoK32mD+XBt0n8nmHyhvg4GBEHN0
 bcLJvblrNjxuTuQfBYTufFztKPpGcuDCh/A+HU4YR+zIDt1ycsadelDTodLbRAk9gOfnyFlbD2e
 CaFtXCzYsz5Ip1cYeWGmWZBsBle2Tk2KlUbrNlDgZzKlSXhb3q8KMAjJQ07wxw8G9cYrgNCii/N
 hE7/GFxPmvugrU1RWKpIaJA2DBB1z0LZ0E0X7P+vOliiBJtVPICEpEo4OuMXvCoxbmWvmHNUqJw
 nxcFxtJEySF+8ZscQC0ausRxjt0xcTSKX6jDUmYrg2+P2vqK5Lj4SlpnNYdKOoZkn2sU/STsKjw
 PfRwL/vaAe6Nke3thqLxdgSjhWRkB56J1P5d8pH7bQio1R+yc7RU6xuwNnzXBjXRVFxb5NYAsCE
 pKmD6f/ApenvTvg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9352

Use documentation/tools/gen-cve-release-notes to generate the array.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.0.rst         | 69 +++++++++++++++++++++-
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 16cd2a8e3..c447292fe 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -802,6 +802,9 @@ The following changes have been made to the :term:`LICENSE` values set by recipe
 Security Fixes in |yocto-ver|
 -----------------------------
 
+..
+   Generated with documentation/tools/gen-cve-release-notes
+
 The following CVEs have been fixed:
 
 .. list-table::
@@ -810,8 +813,70 @@ The following CVEs have been fixed:
 
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


