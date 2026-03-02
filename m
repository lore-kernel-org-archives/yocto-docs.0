Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5545E9B346
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:38:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157029.1772444284611439870
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bozijRFb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1B10E4E424D9
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6ABE5FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42B7C10369537;
	Mon,  2 Mar 2026 10:38:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772444282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jSk5Esan4NaL/h3bW9zOmNZ3BK3V8Lappa876lPiPqA=;
	b=bozijRFb3YCMN9HOwWQPN+hrcYnS/pmQEvRtvaaXvFPW8bS3Fhq7vc3EWJyDilYJU0GeWa
	R2l4IZD1Ft1TEhgXZLb+XmGQrbNBcIebus0k1kbgYnl1Gx9jqCsGzWwDQVYq0PylMxkMNO
	4ZOjI/ehbup5WPOTVdg1Q1VZf4YLiPRjWQ2zA2UfEeOf7Ltct6zK1c9OTJ+V8QD7dhyNGW
	MYNB+Ai3OWMu50mZfxMHF8qR7BeNuxv1tW9fuLo7UktnuZFK1YdXIhuB3HKHCi5OCJ3Q6n
	ucOR0CZYFlv3sf8u/19jP2Q/4BOVJlfk6GMdiqFgRO38mocDg0tQ5EB8qmYs0Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Mar 2026 10:37:52 +0100
Subject: [PATCH 5/8] ref-manual/variables.rst: document the
 SPDX_CONCLUDED_LICENSE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-release-notes-6-0-v1-5-9662dee58591@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
In-Reply-To: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=L3x60NXLkqYbgw2lKVBbplX2o89uNTfLgRXCS59xJB0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBppVp1VR3UijZ/wN5yvpUI9/+fKjo9yuwe2RWA6
 SioM8i042yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaVadQAKCRDRgEFAKaOo
 NqH+EAC4oiqtBqbzPGjXkIP7zPyuq5idHEz1D3w9i4eGjzHjXNhf7yL7Ho8ZCECznCs6O+duf8Z
 aeJhZjeA02o3f2RaC2k0Iq7opu/caWtuLsRoRZR7RusYYyVZRHTeMglDvvf5iNIVpJ2T8CrcXPw
 4vondmUemAA8ewg3F6aWh2beHan2w+s9fNZ3g3QJeEjXaBWQ/aSeOS8VxLNakWM6e7gb1lGfUzM
 r6nZHysLcZRtHJnh0QEZt/w/m3Hyx2yCVyrK3+nMqghFUQT0x/M8nnIFamHMEoHGNMDqa3SNWLX
 KIbGPw6WJlnjKQHldgSPthQmD7/sX9yZIr8BXv0jY94lbURyZmxeyLON9JJvdu4qHNbqzdp+LAp
 m1lW/+CnlCGYyQbq5MZKku1m1wxhsYQPx4k462bCobTxPB8yJ7VrapQCETTAy3DCuZ3EPIHX2kw
 gfItwfbIsUXf5kRjKqO6tvLEiCw40/WhJan0J9kyF9/x/4E2gmcujy9N8m07knPaTSrt6xbxwuU
 HtZhc5Y8KGGJ8x145xB2HLxnpKAgrxN/Fy/RYHJ0w/A6365o7xLL5tsKjMMxN8PGAFm9B7adBDq
 /aCVm5v8qIBhyH8x4SB/wF4t4Bc9rNV+WlGq65lfGfTWNia/7yS37uCmGxNfqguAN3YqOIW2dfj
 s10oXO8zy3JmIbA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9022

Document the SPDX_CONCLUDED_LICENSE variable, added by commit
bb21c6a429a2 ("spdx30_tasks: Add concluded license support with
SPDX_CONCLUDED_LICENSE") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 579faf7be..f8056b03d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9194,6 +9194,22 @@ system and gives an overview of their function and contents.
       (+ 0.07\% with the tested image), compared to just enabling
       :term:`SPDX_INCLUDE_SOURCES`.
 
+   :term:`SPDX_CONCLUDED_LICENSE`
+      The :term:`SPDX_CONCLUDED_LICENSE` variable allows overriding the
+      ``hasConcludedLicense`` object to individual SBOM packages. This can be
+      used when the license of a package was determined to be different than the
+      original license string value, after analysis.
+
+      This variable can be set in two ways:
+
+      -  For the entire recipe::
+
+            SPDX_CONCLUDED_LICENSE = "MIT & Apache-2.0"
+
+      -  For an individual package produced by the recipe:
+
+            SPDX_CONCLUDED_LICENSE:${PN} = "MIT & Apache-2.0"
+
    :term:`SPDX_CUSTOM_ANNOTATION_VARS`
       This option allows to associate `SPDX annotations
       <https://spdx.github.io/spdx-spec/v2.3/annotations/>`__ to a recipe,

-- 
2.52.0


