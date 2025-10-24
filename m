Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1C1CCF9ED
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.5039.1761294037717133759
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xuiCe/sk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76826C0C41D
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5137460703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5851102F2484;
	Fri, 24 Oct 2025 10:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294035; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wFP7LdxcTT4l0mbLbD9Y1XGFET2uN8Uk9NUumlJZCZ4=;
	b=xuiCe/skyFRh9T1WUe6O3YgvCRyL+C5K/K3AffNEZZTL+m12dpp+YL1ZmWiK4I5P6f/PVN
	eVkB7Pzcn5zy8ugDyk40yFQn4FLeWhaHkOqB13U9VvoBUrF4BfUGDWLIyyq4EwNS/FGLDf
	xBdFLLqlUKYPivhHZMgiWX84sSAjzCLh54aaprk4Ig8FjAFkpkF/cFDMWZM1AQDbA/9OOO
	yNBBt46WDAVrvP/5PS7U0Qcz6deI6Rm+lP4rkrxN1bopaFHdyLJliy08b8lBmzbR/YFbgY
	HBx7GyQCVvOIzeM6jq0nxHQv9hg12NjCfjMa7sN6JJplU0yeFRbay/ZZUm7RgQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:59 +0200
Subject: [PATCH v2 10/16] ref-manual/variables.rst: document the USE_NLS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-10-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=85cBiz6nTZ7/zkpYh1tc2cgHVhTdCkEvr3vqwEQugs0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbJ5eEuE/TTdcdG6noDv4Q9pIi1SVPi+mKZF
 svynnGaNpKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yQAKCRDRgEFAKaOo
 NqFhEACAfd9KihxZ5lvvs1faHEMQnqSwaGXL4JTVhbw5vuznU6EpchdnSeGA4To39IKx53dldey
 FqfrOp2Yd6gSX1LpLYfjJmg2JQP8nJmW3RDsJYAvPpG9lD0KK1pXub2qTdLyEeknUsyeLzl316I
 OYne6A+QgeElpdk7zm0DBhwxbs7e8OgY/YG31ORB7/h8ZnHx3vI0tbzIZGrgKBD007DL86q49qp
 ENrlj4DxKbG748YzSo2Ar4O7FfIB7uqZ9WAnbt/uzgBR74/puHq4uqMKfLMtDtbCFlTi5mUfIbA
 1HnX/DDBGaRaHoEqR4+7dVDJ2qrYelvv4TBKMia+kVensZLylke4gyeVPM4o5qT/WBZNWr9jzdj
 KeLuHDJ3O+J3BMak7Rk/jOx528gGRkHMXxiqUCbS5X+wEyU/zQ2tsJyC7085uXTFooNGQG8k2BP
 qTsLJp3JfL3U6L+6GPB9u8RTo48UcNq2vf9j3qixr/1jZACWciPi3JghBG9Zuj7+epil28JHWeI
 fWJjISF6YnzgZTGwX/prg2rc4AKDiRSuDPhWcB/BjxOLAUhN2wQKRNlbqmoXGXwRD/GNnML5uPu
 +CPrpr2YLqk9tOTTg4o2W7l1tvCD5NGfWiohl4E2HL4AWceO0si+YYHjiUcSzluQtQZyujTFaJ5
 QOSEWRUJVulUifA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7799

Part of bitbake.conf, this variable allowing to enable or disable
translation was undocumented. Add a entry to the glossary.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9d2889877..d249ca383 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11075,6 +11075,18 @@ system and gives an overview of their function and contents.
       the Yocto Project Development Tasks Manual for information on how to
       use this variable.
 
+   :term:`USE_NLS`
+      Determine if language translations should be built for recipes that can
+      build them. This variable can be equal to:
+
+      -  ``yes``: translations are enabled.
+      -  ``no``: translation are disabled.
+
+      Recipes can use the value of this variable to enable language
+      translations in their build. Classes such as :ref:`ref-classes-gettext`
+      use the value of this variable to enable :wikipedia:`Gettext <Gettext>`
+      support.
+
    :term:`USE_VT`
       When using
       :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,

-- 
2.51.0


