Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA1DCCD1A7
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.3545.1760604888466926411
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eoEP1/Sv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F57D1A1415
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 051646062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 631BA102F22F8;
	Thu, 16 Oct 2025 10:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wHgBFWDbXfqX2za+p32mXIehcClTORAYNUgICucpaCo=;
	b=eoEP1/Sv6dB8xQcv8ElwGiD5lEm1TwjJnxxoQ7lCTx1uStgV0hwfO2J/F6+yOK/a1jWob6
	mxeB8tU+dgr1SEjHtDchs6QgjRgaz38LNwMOuL+DgXeWN3A++UShZMhQpgnA27Tpk7kVBQ
	ZEfHJCbO0qgFKNBHtWkx5BIpak5+Xwceq9NnK3hG7gR8ayGUPbaIROTAj2I6VB5eA6mcK6
	XFP84fT8bM1IngH5U86jWS2xqTx13RE0GJWv3hLuXA8ZU8GCpGqndIKiqbORR9iuCwccwW
	1bDjGsZ5w6FHd9GFlh96ecSbSVCUbHQJwhNv78C0Fmh0920HIwDnEpcFOjHEVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:53:57 +0200
Subject: [PATCH 07/17] ref-manual/variables.rst: document the
 REQUIRED_MACHINE_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-7-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7XCECC4CF7kchbY8LwSiq0qZj5bo58hyOsfd+Zpu3Tg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLQxUPxFk/QV6VfXL9SGXhyflttGPoRuEOCf
 IzGcbrq0xOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0AAKCRDRgEFAKaOo
 Ns3vEACSu8SBM/CcvZBKQE22+opPA1xDsV7PyfjWGgKdNB6d0seWqJASrBelhg1JVO2/NH0S7V/
 +q+x0VvLrWSp9LmQWONrvSz71ZG2wx5XsJy91v/yJZ0YVXnxKHdAuLnPo82x+wzhs9kLyj2thXv
 JcYnRPJ+S14b7C/t42a1VhtUz2XkAjwJVbfNda6N+nXO/HxfSeFNh1IgimjI7uZUlLUG9AHBVsE
 R13Pw1vxRYmTAuH3NatcAh3lgmV1PH5u2wLqeeRgEUnuykk0HA0fShHfFBKN7y2WRyTwiG0I3I9
 bdgaeFhB8heKxjkWb07PD0NpDKgZ8G2zyRFOfXPXLGU5QT3ixSbimgBbykGaoh4yoxKcP/7+slt
 Sv6AHfVY/7LEmMX1wCRtr0Ijle+TfsN0/hcDd/FN8h54WeHvI+/sfmDo1Ci4/y9ob5K9ox2BMgM
 6oCyEFWVjZ4HX+cbzjdJdTdOmmkU/x3AhIrK+zKZ8IWF9etsD1ZGk9I/pUnsJPNc9NTgTEHkO6T
 UJKt/vc57D0Cua3xTelZ1SsesP+0EIl63EMtM1zCnS/DGVARDPc0n+40k9tOzdksSITCOmLT4ZT
 gXZYjhIRNrlcvOEJr8t+knedx1hvsciLJNT26xMKIvfKWaus9Y9yoCENoe4D/aK5hOQLHtQMAFY
 UXx5zOt/5wjq4gg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7717

Added in OE-Core commit: 5f4875b950ce ("distro_features_check: expand
with MACHINE_FEATURES and COMBINED_FEATURES, rename").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3e80e075f..2b01527b4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7936,6 +7936,15 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`REQUIRED_MACHINE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies :term:`MACHINE` features that must exist in the current
+      configuration in order for the :term:`OpenEmbedded Build System` to build
+      the recipe. In other words, if the :term:`REQUIRED_MACHINE_FEATURES` variable
+      lists a feature that does not appear in :term:`MACHINE_FEATURES` within the
+      current configuration, then the recipe will be skipped, and if the build
+      system attempts to build the recipe then an error will be triggered.
+
    :term:`REQUIRED_TUNE_FEATURES`
       When inheriting the :ref:`ref-classes-features_check` class, this variable
       identifies tune features that must exist in the current configuration in

-- 
2.51.0


