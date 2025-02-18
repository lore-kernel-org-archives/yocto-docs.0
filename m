Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21062C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 15:55:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.22781.1739894144390068043
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 07:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tt28lXkM;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f378498c9so3012952f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 18 Feb 2025 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739894142; x=1740498942; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxJkJrYEn4i1EjMKt9rGqSyEGjnCFcze/FYZ5Y9Acz8=;
        b=Tt28lXkMsoozjK05Hae5dmdvzL7PZ/1VbT2neHurE6RNfMEP+EePywi8vIgyDJW4D1
         K9oMuQWIs0iXeptgNfRnec+TcIGAtfY9ZmNqQwwO3YDgYbFSJ6vCiMopyHzYIJQOasG9
         QLKjYpi5QMeFRXO7/PLMih8uhMDaedh5vb+foqVuqynCnqk0m1Ho60uEpRapzzpI9Y3p
         5s76yUip9l6xDmd2u22S/zl185MoyuR7PGkADchrnUPA7rIF5VdiyND06/yAFlhQIkFN
         j+Yxd2xV2hrupKC1S2ghK7BY6oiYCPnTQccvMjKA1IEMCsaYwJBvn9g+QEbty2eVh0b4
         lzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894142; x=1740498942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxJkJrYEn4i1EjMKt9rGqSyEGjnCFcze/FYZ5Y9Acz8=;
        b=XmVWJWAtp588YV5J7pQZK+oTmeKqgizDhY1n3egoOC1hBR+/sh/xx2EwyTuilPSC7b
         GCQYKEEao7agUzlntWl5JLk640ZQsI48olS564uQDHt3SiflO7gqDUW0SttNwexWgWPS
         p3Z/NHrLdYWAShDFFxdFAUZh1eGVDxufrt9l9ztxhsW/ExktmtpsPg9ZM1xykDmg4NGq
         U87/3zqEaHgZxz6PSc7nyXEreJkhI23HdiHfTGDlEaFt4BYVV3yEV4I+VFA2d42aztsi
         0KjBsiQOLQiOglW62ggKZzK8CYaFf/UAnsUe7QWEqUOliHXCsWQi66ofXiIjlJmLM9dU
         uXeQ==
X-Gm-Message-State: AOJu0YwxJTanPZnVgiXy9Hf8AYwxr9xRX8mm3p4eTpRCnxVifuGqdxN8
	7M/DhIwL+ss9EJJ8XfpucaFidJowAZaKBxBfF3Y5KUCdBcSGceLqXHNTSQ==
X-Gm-Gg: ASbGncvTUM9ORhuYYnVgwnl4X9rtLh4JX4pvISw6xObmUxMSGwX+WSVv7Po5qr90fbs
	h2T+bygC88xhgebvZWX8zQ3j4u6G63znVAKIfuA7Ps+A0/uhJuyMVEiSzohSpNg3EPMnBWbDCZu
	xE68GW+fp65IMNK1ClWkYNYK4BZ+SsrYcZEcg9BAjx/5qLL/Dd788+uALffl0Egg5ocZf1LyahN
	qpas46H8teGR/FV44H7pO4RdQ+m/EHx+KyMEenuMn8n26kUW8zj0zy50B1eIdb5B/eyR+DqzVUa
	nlo1UwZfH3bXSx2wYNWQXN5lblU=
X-Google-Smtp-Source: AGHT+IHzaFeO/Hir2E1ERqmxwbFOEgWBp7blmLmHXQ5/IzwE64UDpemZz6mG2coAArADfLn4zamfJg==
X-Received: by 2002:a5d:6481:0:b0:38d:d299:7097 with SMTP id ffacd0b85a97d-38f33f12527mr16308706f8f.5.1739894141995;
        Tue, 18 Feb 2025 07:55:41 -0800 (PST)
Received: from voyage.lan ([2a0d:3341:cd51:2e10:d277:cf7f:82d1:a7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8273sm15017422f8f.89.2025.02.18.07.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 07:55:41 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: docs@lists.yoctoproject.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH] vulnerabilities/classes: remove references to cve-check text format
Date: Tue, 18 Feb 2025 16:55:29 +0100
Message-ID: <20250218155529.60917-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Feb 2025 15:55:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6417

The text format has been removed, so also remove references and examples
using this format. Replace with examples with the JSON format.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 documentation/dev-manual/vulnerabilities.rst | 96 ++++++++++++++------
 documentation/ref-manual/classes.rst         |  2 +-
 2 files changed, 69 insertions(+), 29 deletions(-)

diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index 983d4ad3c..d901ff975 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -66,37 +66,77 @@ found in ``build/tmp/deploy/cve``.
 
 For example the CVE check report for the ``flex-native`` recipe looks like::
 
-   $ cat poky/build/tmp/deploy/cve/flex-native
-   LAYER: meta
-   PACKAGE NAME: flex-native
-   PACKAGE VERSION: 2.6.4
-   CVE: CVE-2016-6354
-   CVE STATUS: Patched
-   CVE SUMMARY: Heap-based buffer overflow in the yy_get_next_buffer function in Flex before 2.6.1 might allow context-dependent attackers to cause a denial of service or possibly execute arbitrary code via vectors involving num_to_read.
-   CVSS v2 BASE SCORE: 7.5
-   CVSS v3 BASE SCORE: 9.8
-   VECTOR: NETWORK
-   MORE INFORMATION: https://nvd.nist.gov/vuln/detail/CVE-2016-6354
-
-   LAYER: meta
-   PACKAGE NAME: flex-native
-   PACKAGE VERSION: 2.6.4
-   CVE: CVE-2019-6293
-   CVE STATUS: Ignored
-   CVE SUMMARY: An issue was discovered in the function mark_beginning_as_normal in nfa.c in flex 2.6.4. There is a stack exhaustion problem caused by the mark_beginning_as_normal function making recursive calls to itself in certain scenarios involving lots of '*' characters. Remote attackers could leverage this vulnerability to cause a denial-of-service.
-   CVSS v2 BASE SCORE: 4.3
-   CVSS v3 BASE SCORE: 5.5
-   VECTOR: NETWORK
-   MORE INFORMATION: https://nvd.nist.gov/vuln/detail/CVE-2019-6293
+   $ cat ./tmp/deploy/cve/flex-native_cve.json
+   {
+     "version": "1",
+     "package": [
+       {
+         "name": "flex-native",
+         "layer": "meta",
+         "version": "2.6.4",
+         "products": [
+           {
+             "product": "flex",
+             "cvesInRecord": "No"
+           },
+           {
+             "product": "flex",
+             "cvesInRecord": "Yes"
+           }
+         ],
+         "issue": [
+           {
+             "id": "CVE-2006-0459",
+             "status": "Patched",
+             "link": "https://nvd.nist.gov/vuln/detail/CVE-2006-0459",
+             "summary": "flex.skl in Will Estes and John Millaway Fast Lexical Analyzer Generator (flex) before 2.5.33 does not allocate enough memory for grammars containing (1) REJECT statements or (2) trailing context rules, which causes flex to generate code that contains a buffer overflow that might allow context-dependent attackers to execute arbitrary code.",
+             "scorev2": "7.5",
+             "scorev3": "0.0",
+             "scorev4": "0.0",
+             "modified": "2024-11-21T00:06Z",
+             "vector": "NETWORK",
+             "vectorString": "AV:N/AC:L/Au:N/C:P/I:P/A:P",
+             "detail": "version-not-in-range"
+           },
+           {
+             "id": "CVE-2016-6354",
+             "status": "Patched",
+             "link": "https://nvd.nist.gov/vuln/detail/CVE-2016-6354",
+             "summary": "Heap-based buffer overflow in the yy_get_next_buffer function in Flex before 2.6.1 might allow context-dependent attackers to cause a denial of service or possibly execute arbitrary code via vectors involving num_to_read.",
+             "scorev2": "7.5",
+             "scorev3": "9.8",
+             "scorev4": "0.0",
+             "modified": "2024-11-21T02:55Z",
+             "vector": "NETWORK",
+             "vectorString": "AV:N/AC:L/Au:N/C:P/I:P/A:P",
+             "detail": "version-not-in-range"
+           },
+           {
+             "id": "CVE-2019-6293",
+             "status": "Ignored",
+             "link": "https://nvd.nist.gov/vuln/detail/CVE-2019-6293",
+             "summary": "An issue was discovered in the function mark_beginning_as_normal in nfa.c in flex 2.6.4. There is a stack exhaustion problem caused by the mark_beginning_as_normal function making recursive calls to itself in certain scenarios involving lots of '*' characters. Remote attackers could leverage this vulnerability to cause a denial-of-service.",
+             "scorev2": "4.3",
+             "scorev3": "5.5",
+             "scorev4": "0.0",
+             "modified": "2024-11-21T04:46Z",
+             "vector": "NETWORK",
+             "vectorString": "AV:N/AC:M/Au:N/C:N/I:N/A:P",
+             "detail": "upstream-wontfix",
+             "description": "there is stack exhaustion but no bug and it is building the parser, not running it, effectively similar to a compiler ICE. Upstream no plans to address this."
+           }
+         ]
+       }
+     ]
+   }
 
 For images, a summary of all recipes included in the image and their CVEs is also
-generated in textual and JSON formats. These ``.cve`` and ``.json`` reports can be found
+generated in the JSON format. These ``.json`` reports can be found
 in the ``tmp/deploy/images`` directory for each compiled image.
 
 At build time CVE check will also throw warnings about ``Unpatched`` CVEs::
 
-   WARNING: flex-2.6.4-r0 do_cve_check: Found unpatched CVE (CVE-2019-6293), for more information check /poky/build/tmp/work/core2-64-poky-linux/flex/2.6.4-r0/temp/cve.log
-   WARNING: libarchive-3.5.1-r0 do_cve_check: Found unpatched CVE (CVE-2021-36976), for more information check /poky/build/tmp/work/core2-64-poky-linux/libarchive/3.5.1-r0/temp/cve.log
+   WARNING: qemu-native-9.2.0-r0 do_cve_check: Found unpatched CVE (CVE-2023-1386)
 
 It is also possible to check the CVE status of individual packages as follows::
 
@@ -115,10 +155,10 @@ upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
 The variable supports using vendor and product names like this::
 
-   CVE_PRODUCT = "flex_project:flex"
+   CVE_PRODUCT = "flex_project:flex westes:flex"
 
-In this example the vendor name used in the CVE database is ``flex_project`` and the
-product is ``flex``. With this setting the ``flex`` recipe only maps to this specific
+In this example we have two possible vendors names,  ``flex_project`` and ``westes``,
+with the product name ``flex``. With this setting the ``flex`` recipe only maps to this specific
 product and not products from other vendors with same name ``flex``.
 
 Similarly, when the recipe version :term:`PV` is not compatible with software versions used by
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 8763e9e17..b93279ff6 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -600,7 +600,7 @@ You can also look for vulnerabilities in specific packages by passing
 ``-c cve_check`` to BitBake.
 
 After building the software with Bitbake, CVE check output reports are available in ``tmp/deploy/cve``
-and image specific summaries in ``tmp/deploy/images/*.cve`` or ``tmp/deploy/images/*.json`` files.
+and image specific summaries in ``tmp/deploy/images/*.json`` files.
 
 When building, the CVE checker will emit build time warnings for any detected
 issues which are in the state ``Unpatched``, meaning that CVE issue seems to affect the software component
-- 
2.45.2


