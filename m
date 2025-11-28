Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338DDD116F8
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18708.1764344118225739530
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=LNHZZGYS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A34121A1E0C
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7448860706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC7B010B02067;
	Fri, 28 Nov 2025 16:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2jOapu7xcKewfmJqHKMRszxLg7WXGN9ijDjVSS16ExU=;
	b=LNHZZGYSUnSbgOI9Y9Jq4fsl8QrY8kmoE5eArnshsF+jd8qpHGRDy+GDlWfm4db+JiPEb9
	gVzUXvYwaau04Hkbnlu08hyf9kYBHiEbFn1G4SeOYakdny6OAq9d+4IZoXpcRaNDWVaNkx
	DxA2madAu4qeqpZA0wKCQ48dXCE6H1j7MwwADVdc1pSSzc9PAC4PM2OfPpWjRT7r9hmiCB
	+wDLQ8OttqPv+SUOdV1HAebSjk0ZAhCdKrEyj72o14lNsgHPZ+rhv01MyWlBklwS4KQEvy
	XhMEHKx5jMeWZRcnxC5Mp7Ofq+94ox18+HDaK5SpRAZaP7Ia4OzQtDy1cNnpdg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Nov 2025 16:35:02 +0100
Subject: [PATCH 5/9] migration-guides/release-notes-5.3.rst: add fixed cve
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-release-note-5-3-updates-v1-5-6ef679198e80@bootlin.com>
References: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
In-Reply-To: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4392;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1GvG0h6q9RiJLgLhjZEN9VJM9UCoMfoAwIeAC6lgkiQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEuB8/r1Q3Uje3v3S1/vMeQAaxEkhrM3gu6/
 5Ke99duSS2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLgAKCRDRgEFAKaOo
 No6WD/4u9eniqPtb4NEUVZw4+1m2gVoiX2LUe4zeKzgVGU9GieMEtoIwyP47cDUfH6hy3H25Nqp
 LPXP5fdEMeWg1uSGy1UkYp3WUA0e/HeoVrOCJZj3R+zwjzRARp5gO9Y6OZgpe/VsIGzRT2PSUNb
 c/nImKhJcTyUERzsY2cTItMKTdiqiBQcn1i1VEpKtE8JFFII/1Dz+6l9k8G1oXxEjh2N/TN9eSv
 taF43X64PoMglTBonZrMbY1gShdouJdn7CryrSbSW3/zXW+AD6816YBDQvc90Hy57KYdUVPc8eB
 fg1MbHfm6PwTwB7L1hfHrc2Yp7DcW7aSmGI2G7zmj3s6kS/qB+EfhR631jMpAma7OQ0zhdgQBOe
 ezP9GyZcdA7up9dZFu06knygw1vb+phH0hgCeyuftaI2GKaAqtssY0zx6yemZh7aLAMyRteklMC
 PTpnduwX0Uu2r3rXhRyyXHClCuZP5Zq2RWljUIO6gIK6/IlTeIv6sBym6jQJcrfFfFu08mmtGxX
 D5p7HVcpeH9RA0ooF76ldI/98tOmVML4DwMd7CgqVihj4RaQA2c03cbHZ2vqIHPX5S21nXaXgZk
 UA/WcpLuFNQjWUahhokDXz20aEAVCkoO8Lie9AtDi7X7md4/2SLXvBEPhqpzQnBAe6Qh+tFMNjz
 RBKBYjZVc+tILAA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8168

Use documentation/tools/gen-cve-release-notes to generate the array.

The input files that were taken are:

walnascar:
- build link: https://autobuilder.yoctoproject.org/valkyrie/#/builders/103/builds/2306
- metrics json: https://git.yoctoproject.org/yocto-metrics/plain/cve-check/walnascar/1764226917.json?id=55a7d752d032748d82404fdff5198bc6e043437c

master:
- build link: https://autobuilder.yoctoproject.org/valkyrie/#/builders/103/builds/2307
- metrics json: https://git.yoctoproject.org/yocto-metrics/plain/cve-check/master/1764314382.json?id=6c5eae8350a406320f6228e463568c47e6710519

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.3.rst          | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index b3a96c2d9..f6722fe15 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -981,6 +981,9 @@ The following changes have been made to the :term:`LICENSE` values set by recipe
 Security Fixes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+..
+   Generated with documentation/tools/gen-cve-release-notes
+
 The following CVEs have been fixed:
 
 .. list-table::
@@ -989,8 +992,22 @@ The following CVEs have been fixed:
 
    * - Recipe
      - CVE IDs
-   * - ``recipe name``
-     - :cve_nist:`xxx-xxxx`, ...
+   * - ``busybox``
+     - :cve_nist:`2025-46394`
+   * - ``ghostscript``
+     - :cve_nist:`2025-59798`, :cve_nist:`2025-59799`, :cve_nist:`2025-59800`
+   * - ``libmicrohttpd``
+     - :cve_nist:`2025-59777`, :cve_nist:`2025-62689`
+   * - ``libpng``
+     - :cve_nist:`2025-64505`, :cve_nist:`2025-64506`, :cve_nist:`2025-64720`, :cve_nist:`2025-65018`
+   * - ``libsndfile1``
+     - :cve_nist:`2024-50613`, :cve_nist:`2025-52194`
+   * - ``linux-yocto``
+     - :cve_nist:`2019-14899`, :cve_nist:`2021-3714`, :cve_nist:`2021-3864`, :cve_nist:`2022-0400`, :cve_nist:`2022-1247`, :cve_nist:`2022-4543`, :cve_nist:`2022-38096`, :cve_nist:`2023-3397`, :cve_nist:`2023-3640`, :cve_nist:`2023-4010`, :cve_nist:`2023-6238`, :cve_nist:`2023-6240`, :cve_nist:`2023-6535`, :cve_nist:`2023-39176`, :cve_nist:`2023-39179`, :cve_nist:`2023-39180`, :cve_nist:`2024-52560`, :cve_nist:`2024-57995`, :cve_nist:`2024-58015`, :cve_nist:`2024-58074`, :cve_nist:`2024-58093`, :cve_nist:`2024-58094`, :cve_nist:`2024-58095`, :cve_nist:`2024-58096`, :cve_nist:`2024-58097`, :cve_nist:`2025-4598`, :cve_nist:`2025-21709`, :cve_nist:`2025-21751`, :cve_nist:`2025-21752`, :cve_nist:`2025-21807`, :cve_nist:`2025-21833`, :cve_nist:`2025-21949`, :cve_nist:`2025-22104`, :cve_nist:`2025-22105`, :cve_nist:`2025-22106`, :cve_nist:`2025-22107`, :cve_nist:`2025-22108`, :cve_nist:`2025-22109`, :cve_nist:`2025-22111`, :cve_nist:`2025-22116`, :cve_nist:`2025-22117`, :cve_nist:`2025-22
 121`, :cve_nist:`2025-22127`, :cve_nist:`2025-23129`, :cve_nist:`2025-23130`, :cve_nist:`2025-23131`, :cve_nist:`2025-23132`, :cve_nist:`2025-23135`, :cve_nist:`2025-37743`, :cve_nist:`2025-37746`, :cve_nist:`2025-37803`, :cve_nist:`2025-37860`, :cve_nist:`2025-37880`, :cve_nist:`2025-37906`, :cve_nist:`2025-38029`, :cve_nist:`2025-38036`, :cve_nist:`2025-38041`, :cve_nist:`2025-38042`, :cve_nist:`2025-38064`, :cve_nist:`2025-38105`, :cve_nist:`2025-38132`, :cve_nist:`2025-38137`, :cve_nist:`2025-38140`, :cve_nist:`2025-38187`, :cve_nist:`2025-38199`, :cve_nist:`2025-38205`, :cve_nist:`2025-38207`, :cve_nist:`2025-38234`, :cve_nist:`2025-38248`, :cve_nist:`2025-38261`, :cve_nist:`2025-38284`, :cve_nist:`2025-38311`, :cve_nist:`2025-38359`, :cve_nist:`2025-38426`, :cve_nist:`2025-38584`, :cve_nist:`2025-38591`, :cve_nist:`2025-38597`, :cve_nist:`2025-38605`, :cve_nist:`2025-38621`, :cve_nist:`2025-38627`, :cve_nist:`2025-38636`, :cve_nist:`2025-38656`, :cve_nist:`2025-38678`, :cve_ni
 st:`2025-39677`, :cve_nist:`2025-39678`, :cve_nist:`2025-39745`, :cve_nist:`2025-39762`, :cve_nist:`2025-39764`, :cve_nist:`2025-39789`, :cve_nist:`2025-40325`
+   * - ``qemu``
+     - :cve_nist:`2024-6519`, :cve_nist:`2024-8354`
+   * - ``webkitgtk``
+     - :cve_nist:`2025-43342`, :cve_nist:`2025-43343`
 
 Recipe Upgrades in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
2.51.0


