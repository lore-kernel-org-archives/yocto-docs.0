Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC224CCF9E9
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.5038.1761294037136967132
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EwtPTxFq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E77FCC0C41C
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C281360703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A73B102F2488;
	Fri, 24 Oct 2025 10:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294035; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H9j++YqRDDV4C+XQeA5e0P26EXFgANm5h918jEwPgPI=;
	b=EwtPTxFqysAikAYiNYM0AdBJR16NVp67yBUyU0QSFK8FrYzZ5iC+S32EcIfZRkdVYtyozG
	pdVGJK64L/Bw/JZ+fxz6Ibh3e4Pdl6Xaml939u42TPboMw/23suV6Juvzw5hqz87yI3Q5C
	g14U9dbt5cHYmaHXXqcHQOsOcacZAIBah2CHaheEbENgNPYzhPSrUK8Zkwb7ehBLT6HSEp
	WrbffHeiyKXxtpNZFwq5eDeRXzSCaBVD7k475Xtdo8bW5p+w5Jiuc66TxcUTJgvQyQJf4n
	EA3CVB3S3uRtWeBjXLG5j4ViyneNNIDekWLbPDW5w5xXnoENkjvyTf0fswL6tA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:58 +0200
Subject: [PATCH v2 09/16] ref-manual/variables.rst: document the
 REQUIRED_IMAGE_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-9-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=o1PJmzHWWdt+Eq8WMt8sU9SxdTyBXrdRiKwwZdg4PGA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbJEoOqB6bG4E83jhLyvg/0ojzWR6QT0miO0
 KhsDsC46eqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yQAKCRDRgEFAKaOo
 NlEOD/9lF2kNVBRqiMbHWgrvz1xjYLNKOQSaIjELT1GbyAV8ee1cdy3smO7cU5Qm5KS0r1aVS0z
 waxakLMuwPygmOw/UAq9FNcG+Mp73GxhK/J6MQRqzNTBJcjJETt2EBHTPnp1PhSPFshs9RA7LqZ
 JoqeW1nQe3jHB1dwdvCqPo+Z+nZkOAN4ZN+n+HgIMozNwsnCa8PYX5TMNBfot4wDFTtdB8z/Y1Z
 DP9wh1mh1nlnuea8VDWueV+tvVNUIVcoOVIhkSsEo1zS4QlIyYzJbSxePKGydK2nfMfzGC3NQNO
 VlaRvl/yc/BSoPuKfHNpV1grOVJCiKfFDCD6xyWdSK/YRlJrM/H7L+v9abuLO6NGYnGoVDt32TT
 zNEL0RsfP0yrgtFQiA0fvm/2rf5bZZ04n6o7ljKYPwez/FH6JQuowQBKx1Xg3I1LGBxy8OB+yIp
 NELBgjVr5GEtTEqBlYmRlm2WHU8d8WBX8uUpefc+QB8HMedinZ0wsPTrhd35O3qnmb6FUbY0GG7
 2IJqAYbiJoUJ0f8QK7fcjJWiCcDBppTHItkUPkx+x463/vTkKpFicxMFPsxhiBRrLBQNiKwNPw3
 xOXmk8KUi2rbsYpRGnjMQI+CptE335lRjlKzlXlgC9Bq84A5VPU92na4ossX37VfRtXY+Z2QeGU
 7OxKauF+5zDnzRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7798

Added by commit 96a9702a24a7 ("distro_features_check: expand with
IMAGE_FEATURES") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 167f38e86..9d2889877 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7896,6 +7896,23 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`REQUIRED_IMAGE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies image features that must exist in the current
+      configuration in order for the :term:`OpenEmbedded Build System` to build
+      the recipe. In other words, if the :term:`REQUIRED_IMAGE_FEATURES` variable
+      lists a feature that does not appear in :term:`IMAGE_FEATURES` within the
+      current configuration, then the recipe will be skipped, and if the build
+      system attempts to build the recipe then an error will be triggered.
+
+      Compared to other ``REQUIRED_*_FEATURES`` variables, the
+      :term:`REQUIRED_IMAGE_FEATURES` varible only targets image recipes, as the
+      :term:`IMAGE_FEATURES` variable is handled by the :ref:`ref-classes-core-image`
+      class). However, the :term:`REQUIRED_IMAGE_FEATURES` varible can also be
+      set from a :term:`Configuration File`, such as a :term:`DISTRO`
+      configuration file, if the list of required image features should apply to
+      all images using this :term:`DISTRO`.
+
    :term:`REQUIRED_MACHINE_FEATURES`
       When inheriting the :ref:`ref-classes-features_check` class, this variable
       identifies :term:`MACHINE` features that must exist in the current

-- 
2.51.0


