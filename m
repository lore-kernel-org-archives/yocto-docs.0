Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F25CF11EA
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41794.1728562260949037119
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AZnXbzyL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BAC4FF80B;
	Thu, 10 Oct 2024 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArdR+3U20hyIn6GgDd/vwTXcRCNEKjai03Hh8oLXeo8=;
	b=AZnXbzyLgZmDLZ5gYJuK+NQkv7/FGULbys/fExVFItOmErk6T111ZC5mW4fW5fWvSslN54
	ik6zBOh9HVR1bdw2H9xeioE32NweCUuDfNIFCpQL6ubJ37D75nsZy8unR2BQEMEfLmRwq+
	FpIu7SudFhivSL60luvQCd+3ubWboOSt7we5y4lVDaQYPE5BZ8ivcWuaEEO82lQ71fXNZU
	ch1gS5cgB0Hj2sY69i6oE9cQCEn0euRBEkILEp8JBxW5H4xGO46kjspUTcn76jcv3egFq4
	EZwjSCYzy8TP3xf8fHT5ddk0UVG400gUVCBGUfzEz0GdeWC1R+Z2oHRvFCDaHg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:34 +0200
Subject: [PATCH v3 09/16] ref-manual: add missing
 EXTERNAL_KERNEL_DEVICETREE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-9-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=2ElhSPTmrDGBd5p+yWK4/CaWcnDA0d8kNpqV9OcTlx8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8ROx0HO+UYWj2URqRsC4h4jQ/qpYk4Esjc8x
 QRs0SZ7QD+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 Np3HEAC88SgSbu++awrexuF+QAjfX7wiHDA3D6P6GPQbZ1N5VBl7ZIoR5sqd9c59Z20LWM4ZwDi
 diG+SIRnuK2EtttS9mDtsgYdlaOF/9luzr+Bp1B8Zewz8aXigYzaIYyERQK5l+OlrOrU9x1Q+jW
 iukvnK2p5xdY/DMah88akFH5oeb1irxQoZFqn0dQJslQ1e40BopSrRwxTVpa/ufH1oZu4czybii
 tuTswtNNFVnp3aXqxxwAHCrXktny3Ck3YwdQ5MG7Y/WGAd1cdni6USaIbtRkaIeRzqr2wxmxIzC
 9qKLlIX8pqss0GO0ANVv45/nHD4xtQDcJRgIJtxragaAoUUKTf+vaIMm7Sp75SkRqPnBkdva+Fz
 unzqWhgD/WL1nXf+b8p1qPwr8tFpKP0nS32uLBbhmCIwN0+2xW6qu0zdRh3fIgyod2S/hV4OAdy
 Og0G19SuJ0FPr755la4SwrjJCetfN1OZ4KuWnXnOI5J/ThizGJM0HCVD8zXZpXEmJZZmcFGXnEk
 1cmVo4Be3Al4rip61eqKnDnM78P1rXQXvTEvw29MzdqtjLs34nw22GNkJvUdOew9MRlleK7S4NM
 HcZs1+AY/+fncSpQg5P0ih+as3bDHiFSdTchKdTgIHBrAJyWQpTvrhGbRfvtr6VqA/EHeNCruly
 DolF3d30tMNMEaw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5465

This variable can be used to specify one or more compiled device tree or
device tree overlays to use in addition to the one compiled by the
kernel.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 40771a51b..206e75833 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2526,6 +2526,13 @@ system and gives an overview of their function and contents.
       external tools. See the :ref:`ref-classes-kernel-yocto` class in
       ``meta/classes-recipe`` to see how the variable is used.
 
+   :term:`EXTERNAL_KERNEL_DEVICETREE`
+      When inheriting :ref:`ref-classes-kernel-fitimage` and a
+      :term:`PREFERRED_PROVIDER` for ``virtual/dtb`` set to ``devicetree``, the
+      variable :term:`EXTERNAL_KERNEL_DEVICETREE` can be used to specify a
+      directory containing one or more compiled device tree or device tree
+      overlays to use.
+
    :term:`KERNEL_LOCALVERSION`
       This variable allows to append a string to the version
       of the kernel image. This corresponds to the ``CONFIG_LOCALVERSION``

-- 
2.46.0


