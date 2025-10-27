Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3F0CCF9F0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.31744.1761569071568619414
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=j4ye8/94;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4724D1A16B4;
	Mon, 27 Oct 2025 12:44:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D8866062C;
	Mon, 27 Oct 2025 12:44:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3A47102F2502;
	Mon, 27 Oct 2025 13:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/d9AjYCoGrhxDg3RqC52o+CCl6aK8Tw3j+8OEspbkYk=;
	b=j4ye8/94TH3b+sld1DnSAKpLe4MC+Q/2R3fQk56uYpS14SKpHcCqhmfbbgnhCQDFgtTutb
	0JyQTEu1imt1TMmNlwEGovERyhAMeKtGCyVtE8Jwgboioxoc1c76Zv1CZQ5WtXWHFTY3zA
	l19UHXfBhnB6/yUudXd5iD3y3J5ApDvV6byql2fGsyluRP26raJ8XI9c2lm/RdeHGTlwlt
	yhCLdIsI7b1kw4nk4sbCR6sYxd1ekvI+afwom3h3QzyRaOB6RMu7CU4qq8rRSrLL94XLoR
	kjEs9ju7FDXmvdWyjcIgLLdHxlCdxJApUn/qERluKSKBTdo61GVmH83rvTluoA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:39 +0100
Subject: [PATCH v3 07/16] ref-manual/variables.rst: document the
 REQUIRED_MACHINE_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-7-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fIxThbGqy8XUsrACN0fv0RQgveYGhSQAjsGDQ5PxBxE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kFAO5gVXHf1wDbzD2/+7PiUAre85mIvNxmd
 wAh3iEWG9yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBQAKCRDRgEFAKaOo
 NvICD/48o766DW66f7gqQQTDGl589YyxlOdne+Iu/llo9xl+kIOctvozceiJPTWM3HNo4RRFsnx
 bA0H2fK0rLhxK7dCuGwXDX41qRHHm0RgHVZyONrZ2ob0LAXm6/aeNwT1XvOaXOsrS8CoZy+4mE6
 wIx50e5hgtf27/qjaB3JJq3Bfjnm+xpPMRncqlpn4B9JuyWhsysoWI71a1Du+MMFSa7f6/u6yLp
 lSy7dxOcqMCfdF5Pu59tRF48S0xwM/GJ5Z7UgS+n3HE9DUKG8P4fgrJsfZ91BBLCGOM03w58J8O
 BDBKbI3sAC61eTzSdHu/4y76ChqiCjrKzZXDgnIDTzX9JJM4GmARlxrEmSDrXIIAPiownIqjadf
 CAoRZoqLOz4mbnqxlIIoXAAh+EQbyTCFJoSmysDoWGZuuRvrqcHlIONBnDOH0YEl/SlO12IuLQg
 Hi0/QQ6WYDVTzY6WxyHJJJW0T3AvYO7e67wSsixkDlKo84YoPR2gz/DmjRZ6ScD9mHOuBdcxA8r
 hut4V18gx5Bg+skueNAU74OcqCKR8cp6Ki98wfrOqIqJEjVxzxfbqQUZfzEX8E8eKAZ7yXoVmy3
 G8Y/+3f6+u+YJUgYxqqMGXrBa+nyPI82pxohH4O8PVtnn0XKO7qhi2K3k+j0Y3WtMxPAd27+65z
 nj7tafp5zehlxOg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7856

Added in OE-Core commit: 5f4875b950ce ("distro_features_check: expand
with MACHINE_FEATURES and COMBINED_FEATURES, rename").

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5af64a018..40232ba0e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7950,6 +7950,15 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`REQUIRED_MACHINE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies :term:`MACHINE_FEATURES` that must exist in the current
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


