Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06654CCF9EE
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.4943.1761294034744783042
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zEfvWa4g;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 67B611A163C
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FA8960703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C5F1102F2482;
	Fri, 24 Oct 2025 10:20:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k69E9/5LVr66vaBpzwBRCaR+CFzSaVAMmxYbZbnXxpM=;
	b=zEfvWa4gE1k2/tJ2e+/mtgG9WcMz3c5jXYaxSS0HsUH3IcoAGGkFOrWE7X2ys1zMwJy7FO
	Rm1YM+nOIxgmNLbcoGzG2GEmmdf9ZCHR8/fdE2J5oANy8ysWLB53aNUT42/6my4B0ZLDqX
	J+tqOD3yYXHNZiP2Frn2mnqPB1vl8bk1tf3/bIWyV4EzvgEGM889mlocdYvWTuNiNTSUD2
	c3lKqBBoW6FUxZIdi/udRN2LnSv6xXDq4AmiQ78JxfmxujzSxttx8a9A9bmzR16JClATNe
	0fS07jTkiwCywCRGy/60urw2TPpg9xjr/Tp35wQo32R+KHsludVxeZNjt3mqJw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:55 +0200
Subject: [PATCH v2 06/16] ref-manual/variables.rst: document the
 REQUIRED_TUNE_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-6-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wugvFGGpHV1ddD0KYOVWCXbyGOMtm/XZvDnbXdFZBOI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbIKk8x75Uf7RZujcF2lGfAA3BFkyZT+JJR+
 10j7+tliEiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yAAKCRDRgEFAKaOo
 NiF/D/4gpRggIfEkbFbObqg7OC/FfK+UgH4F1PPTdTpazvuqiFgBfRUzmjBIEbOA7DxDM/aFlhj
 jN9fZMBA3/DfMgSqAs8wrWiLzZyHpMcAlu0gSe+mcH/+bVWdwXu6gFuC5Olle3y7bo22k1PjfZo
 rmGMiZ4uO5EZRXFf2guOj4phv3wws7U5XTi8Ej6+jKeakoIQ2+gWja0g2X5iIPYq5yZFM9tnkNk
 wdkmQCngaHirStQV+SWa4eMJTaV94cEdHANWGjkOMN2MGUWj+khscwlpgR0QdQusPPtgIqBYSkq
 M0NefGgLWZdCLuReKE61JenYLhUqINGsqJSaKllxkaGyOHI0S3xaClyq8Ko9FZDtRTuMeQDGHa5
 JU0ZPmcWhH2jJJFZd87gZdkA5WjTT6505bVenePOuITncQTjD4z2HD+bzTZ56Brl8Hl56rKdnQE
 BcczPscpBycUsjY7An7fy+DNUNnFSLjyOOXSpxR6V/mh6HwXsWXIqilTgmGN4zmE6OVTQ4y5TSj
 oudQKFFwMjI62YSTfe2DQxHbkw8GFbdVkLLwcH3BEhFeOeFzM5XUVaDYrQOw6ArbJ+Mabnl+K9T
 Kb8Dd8+GZFBc8WJaVLAEQppZD8SnHnftj13uKiy/Z9LKVhMvPcIF1UrL+kMamLiQCHh6ujPZHEb
 mkrve8K2SiOrupg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7794

Very similar to REQUIRED_DISTRO_FEATURES, added by commit a8ef7339ecb9
("features_check.bbclass: Add support for required TUNE_FEATURES") in
OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 63f29575b..27f761b72 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7886,6 +7886,15 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`REQUIRED_TUNE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies tune features that must exist in the current configuration in
+      order for the :term:`OpenEmbedded Build System` to build the recipe. In
+      other words, if the :term:`REQUIRED_TUNE_FEATURES` variable lists a
+      feature that does not appear in :term:`TUNE_FEATURES` within the current
+      configuration, then the recipe will be skipped, and if the build system
+      attempts to build the recipe then an error will be triggered.
+
    :term:`REQUIRED_VERSION`
       If there are multiple versions of a recipe available, this variable
       determines which version should be given preference.

-- 
2.51.0


