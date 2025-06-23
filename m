Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25E1C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 12:43:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.18640.1750682585453224587
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 05:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iFqfk0Lq;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2298558f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 05:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682584; x=1751287384; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aA7L5yEbVSgty1kHaBbBXw0qhz/IqAibYZZEHMkMlDM=;
        b=iFqfk0LqxV2p1zP8VjVJII9yOIXv6fIiuEwRR5gV5lYgtLLg9GElbrl2OE1sZ2b7Dw
         bdmv4u8FTEs07oSxq56DisHfdUs8k630b03WQpiPU+qAS9+c9oYRcsnkZ8RYCMDaUBP7
         /0iXeuMfCpEaRCHJpkwJ90imKGu6EVb+tJjwW2TkzPM7swFSNriMukeUfueht8AEMbCw
         /rbyylbTRrXu8xJ8coNPPUovYnYHD6c5rXwqNDnbDPSAveQdqs/4g+2/OylZY7zAIZLe
         kekkhxwdXWRmay78u4JxQK6wnbgDCF/pDBfAy6Jh/gF6hsWdQFIsyZwv4RHkct6A3CdY
         lbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682584; x=1751287384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aA7L5yEbVSgty1kHaBbBXw0qhz/IqAibYZZEHMkMlDM=;
        b=h9jmODBAQbBOg3LCkcRPOfdIbfFQU4PL8TEf4csVJFNHfdv9hWNUg28K3Ycfg6GK4q
         ld+GrJBzs6b0X3MLQ0LdhzmJR3CjgUYD+1HPqdhulpguQTpiTt5Hf50gx1Z2Q0DxRnuf
         OAyd02tIyi7G2QW++rdHwAQbN2DUkux/w2SawzxB/YqtzCIsmzFaKBTv1aHC2pyicaeh
         uh+2lHb4dpHb8STvjJdNSoSW7q+Nbfq8qtVBKTsRRn/Un/7iz7mRsZy//2QxSrvHKRg1
         p7Okcy5aJ23K3AyO+fW1+EwU74s8UhYe0M4ZINb0e+G0IG7hiTqj9zVk/omxX7u3pfTd
         DPhA==
X-Gm-Message-State: AOJu0Yx0cO2CWZK8mQVLb+G6XN/ababDAjAV0THrJw91Sy1F1w1g/0hh
	nM/CoTZIYl/O2Od5n6X/5nIsXJgmcUvAcm/iOwHFEVREKmFzgX9q9qSG+93Tag==
X-Gm-Gg: ASbGncvPINN6kZEsKfRCekn+M8BwDqGz1FFOGmY07/Ko1ORZBuo9VoTydZymUFB37gB
	Ur9jwEIisk3jf4LhoSODu6Gh14uDres8nqA1vde5RuUGkFkZvxzEIOs2BqpBP2FOaF6+BWQnFIZ
	SeiYBUgW7+FN3PQTyhCSmtLF0zr/SdtkgNketZ/hAOGoCtRS/0+QJduzPDFtebqmvussTIRoo5N
	QDm0Gr3sbtc+QhbovpVLWTu6P9DQL+8t/SaFN/xpMhSD+3j+guQCAJyaVO3yFKC0N0uhUlc8pNt
	K5neUAacO6u09WbduKGq5HGgEyDZJneFEyuUr1c1k/xkHFfEzj8OF3tz1suhMOoa4isVCuT8qFx
	xyzAOeTgfUXAXePaBdHCSPxI84Rttg6MBYw==
X-Google-Smtp-Source: AGHT+IHau8bX5wKGwQRPjQZIvZ5JxzSN8do7wIThtQUxP0t7wbh1dkNO8s1EXpkjlopK/FCMNTV16Q==
X-Received: by 2002:a05:6000:1888:b0:3a5:8600:7cff with SMTP id ffacd0b85a97d-3a6d12fb1f9mr9815099f8f.1.1750682583488;
        Mon, 23 Jun 2025 05:43:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190b00sm9157170f8f.87.2025.06.23.05.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:43:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/6] overview-manual: correct value of UNPACKDIR and put S under it
Date: Mon, 23 Jun 2025 14:42:52 +0200
Message-Id: <20250623124257.1544615-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 12:43:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7145

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/overview-manual/concepts.rst                | 2 +-
 .../svg/analysis-for-package-splitting.svg                | 8 ++++----
 .../svg/configuration-compile-autoreconf.svg              | 8 ++++----
 documentation/overview-manual/svg/patching.svg            | 8 ++++----
 documentation/overview-manual/svg/source-fetching.svg     | 8 ++++----
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index c9405cdd338..590055501f9 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -704,7 +704,7 @@ the Yocto Project Reference Manual.
 
 Each recipe has an area in the :term:`Build Directory` where the unpacked
 source code resides. The :term:`UNPACKDIR` variable points to this area for a
-recipe's unpacked source code, and has the default ``sources-unpack`` name. The
+recipe's unpacked source code, and has the default ``sources`` name. The
 preceding figure and the following list describe the :term:`Build Directory`'s
 hierarchy:
 
diff --git a/documentation/overview-manual/svg/analysis-for-package-splitting.svg b/documentation/overview-manual/svg/analysis-for-package-splitting.svg
index 3ea42808823..16e831d65d5 100644
--- a/documentation/overview-manual/svg/analysis-for-package-splitting.svg
+++ b/documentation/overview-manual/svg/analysis-for-package-splitting.svg
@@ -1483,12 +1483,12 @@
          x="291.66635"
          y="381.29614"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan15">          sources-unpack &lt;─────────────────────── UNPACKDIR</tspan><tspan
+         id="tspan15">          sources &lt;────────────────────────────── UNPACKDIR</tspan><tspan
          sodipodi:role="line"
          x="291.66635"
          y="394.62952"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan29">          ${BP} &lt;──────────────────────────────── S / B</tspan><tspan
+         id="tspan29">            ${BP} &lt;────────────────────────────── S / B</tspan><tspan
          sodipodi:role="line"
          x="291.66635"
          y="407.96289"
@@ -1543,12 +1543,12 @@
          x="291.66635"
          y="541.29663"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan32">          sources-unpack &lt;─────────────────────── UNPACKDIR</tspan><tspan
+         id="tspan32">          sources &lt;────────────────────────────── UNPACKDIR</tspan><tspan
          sodipodi:role="line"
          x="291.66635"
          y="554.63"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan33">          ${BP} &lt;──────────────────────────────── S / B</tspan><tspan
+         id="tspan33">            ${BP} &lt;────────────────────────────── S / B</tspan><tspan
          sodipodi:role="line"
          x="291.66635"
          y="567.96338"
diff --git a/documentation/overview-manual/svg/configuration-compile-autoreconf.svg b/documentation/overview-manual/svg/configuration-compile-autoreconf.svg
index c0de45681a5..3be08018cb3 100644
--- a/documentation/overview-manual/svg/configuration-compile-autoreconf.svg
+++ b/documentation/overview-manual/svg/configuration-compile-autoreconf.svg
@@ -1277,12 +1277,12 @@
          x="287.2186"
          y="300.76147"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan21">          sources-unpack &lt;───────────────────── UNPACKDIR</tspan><tspan
+         id="tspan21">          sources &lt;──────────────────────────── UNPACKDIR</tspan><tspan
          sodipodi:role="line"
          x="287.2186"
          y="314.09485"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan22">          ${BP} &lt;────────────────────────────── S / B</tspan><tspan
+         id="tspan22">            ${BP} &lt;──────────────────────────── S / B</tspan><tspan
          sodipodi:role="line"
          x="287.2186"
          y="327.42822"
@@ -1322,12 +1322,12 @@
          x="287.2186"
          y="420.76184"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan35">          sources-unpack &lt;───────────────────── UNPACKDIR</tspan><tspan
+         id="tspan35">          sources &lt;──────────────────────────── UNPACKDIR</tspan><tspan
          sodipodi:role="line"
          x="287.2186"
          y="434.09521"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan36">          ${BP} &lt;────────────────────────────── S / B</tspan><tspan
+         id="tspan36">            ${BP} &lt;──────────────────────────── S / B</tspan><tspan
          sodipodi:role="line"
          x="287.2186"
          y="447.42859"
diff --git a/documentation/overview-manual/svg/patching.svg b/documentation/overview-manual/svg/patching.svg
index b0de175a205..5c56b5ac23d 100644
--- a/documentation/overview-manual/svg/patching.svg
+++ b/documentation/overview-manual/svg/patching.svg
@@ -1074,12 +1074,12 @@
          x="283.34647"
          y="318.12881"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan21">          sources-unpack &lt;──────────────────── UNPACKDIR</tspan><tspan
+         id="tspan21">          sources &lt;─────────────────────────── UNPACKDIR</tspan><tspan
          sodipodi:role="line"
          x="283.34647"
          y="331.46219"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan31">          ${BP} &lt;───────────────────────────── S</tspan><tspan
+         id="tspan31">            ${BP} &lt;─────────────────────────── S</tspan><tspan
          sodipodi:role="line"
          x="283.34647"
          y="344.79556"
@@ -1099,12 +1099,12 @@
          x="283.34647"
          y="384.79568"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan35">          sources-unpack &lt;──────────────────── UNPACKDIR</tspan><tspan
+         id="tspan35">          sources &lt;─────────────────────────── UNPACKDIR</tspan><tspan
          sodipodi:role="line"
          x="283.34647"
          y="398.12906"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan47">          ${BP} &lt;───────────────────────────── S</tspan></text>
+         id="tspan47">            ${BP} &lt;─────────────────────────── S</tspan></text>
     <text
        xml:space="preserve"
        style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
diff --git a/documentation/overview-manual/svg/source-fetching.svg b/documentation/overview-manual/svg/source-fetching.svg
index b7bab327734..39d7e0c2a78 100644
--- a/documentation/overview-manual/svg/source-fetching.svg
+++ b/documentation/overview-manual/svg/source-fetching.svg
@@ -1017,12 +1017,12 @@
          x="281.13275"
          y="317.37775"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan22">          sources-unpack &lt;─────────────────────── UNPACKDIR</tspan><tspan
+         id="tspan22">          sources &lt;────────────────────────────── UNPACKDIR</tspan><tspan
          sodipodi:role="line"
          x="281.13275"
          y="330.71112"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan32">          ${BP} &lt;──────────────────────────────── S</tspan><tspan
+         id="tspan32">            ${BP} &lt;────────────────────────────── S</tspan><tspan
          sodipodi:role="line"
          x="281.13275"
          y="344.04449"
@@ -1042,12 +1042,12 @@
          x="281.13275"
          y="384.04462"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan36">          sources-unpack &lt;─────────────────────── UNPACKDIR</tspan><tspan
+         id="tspan36">          sources &lt;────────────────────────────── UNPACKDIR</tspan><tspan
          sodipodi:role="line"
          x="281.13275"
          y="397.37799"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
-         id="tspan44">          ${BP} &lt;──────────────────────────────── S</tspan></text>
+         id="tspan44">            ${BP} &lt;────────────────────────────── S</tspan></text>
     <text
        xml:space="preserve"
        style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.5555px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-- 
2.39.5


