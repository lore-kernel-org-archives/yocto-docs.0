Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A30BCCD182
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:03:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.33254.1759755798706256730
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 06:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dBa4XpnN;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6AC541A117A
	for <docs@lists.yoctoproject.org>; Mon,  6 Oct 2025 13:03:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42AC9606B7
	for <docs@lists.yoctoproject.org>; Mon,  6 Oct 2025 13:03:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B5F4102F1D6A;
	Mon,  6 Oct 2025 15:03:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759755796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OFwgZ0/c8RBfydbxSrxAahD6IXgQpZO1kV8fJZD/jtE=;
	b=dBa4XpnNwhRu7vrI2kwYoIumJ8Nnz9iEw3zAp2Of+II/3V+vMxEKAXD4n3GxyRpuQLrrnD
	1vchO8dTmD54ovLxkfZ8VBQWxXUGwgIIeA+uzooC2FRGnqfKvN6Fxg4RZ22umfQh9wEHuo
	BMnPG7JrPDltidHKPUZXEQM3ptSp0AIpNxd6kd96qgGLpFgRvTZx3EKBQtAyweZV7hpASY
	FrwEXpRmQoy45ucNk9YL3+LxQx4Bu3OmYphWn7xpByca1ZriNWkMliSKcQ+ncJGcJDcwSW
	2IVuFzVzLSbRd5hJyTJz7EEHsIk8Oq98kvBEdTQxktSRHJlGC2T+clUMULOtdA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 06 Oct 2025 15:03:04 +0200
Subject: [PATCH 1/2] ref-manual/variables.rst: document
 UNINATIVE_URL/CHECKSUM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-uninative-class-extend-v1-1-1a9e30e95e8f@bootlin.com>
References: <20251006-uninative-class-extend-v1-0-1a9e30e95e8f@bootlin.com>
In-Reply-To: <20251006-uninative-class-extend-v1-0-1a9e30e95e8f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PoaXEIBFNMvTEuQ63Eg4IVG068LZQstAzfrk3WfB2Z0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo474RB2OS7zjrUiFG2gB7ooVqIfZeYwyH7gcxq
 NcJd8lK8rqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOO+EQAKCRDRgEFAKaOo
 NisaD/9mP5yu3nWhjG5Zbp0AobmsD7E3bqtSDjMmHlAH/i/n1z+dPe3sR5v1eLCH3A5Aob4lb7w
 sASNNa8tfNv8TNDHABPDmsWLhXqUzOVVQ/Qaq2QK8EFx5bYjMMkPiytbPse3Iy5P7qPvUquV31U
 CrHTaZrGIt6U6JNyvC94I5K8W7GVpihYILu177IsML0IhG3a4mA6GIJiEO7ivYcYGLUqfC68rOm
 xIwfkQez0prwDyP2ONRMdhTK92/N9O6dbENa5U/UA7IeZptrQQ81TJIbEU88o26N9FMjqwnze6H
 Wd3LOS2pfGvhSvTZPvOQoiwTFOQKw1up8V+GZaV9Onghs45LutZH40VnmxoVHU0ERtCOYx3b42g
 SOTtJGs1hE5GaxrORpcyctgpGcpWmYAJfKdYQxRM2mvfEKFi50Y48YGIz5epOkyzga1TE6s3mW7
 0nhTZIVgXgrSym14sfNEfhLSWGwGqDUpE1yMvc38rn//nbVgFaLuFdIQyHBSVf/bh6bNO4YtpyT
 cIHouoqXaB47Frcc4b4OIWnwjcPasBxNVHAmuXqs8WjIZVNq4/zf292rgiPcqV5jM2N4/Dn6s+M
 zMHEDZDHYlRdDqPj3aLe2Z+67GUGou5lAAS2u5hAOIDzfWMfI6DfAScZB92F+Tspe/THrmIi4aj
 YT+wH6Zau7cqmEA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 13:03:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7654

Document the UNINATIVE_URL and UNINATIVE_CHECKSUM variables.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1d4ec413c..5cae725c2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10909,6 +10909,22 @@ system and gives an overview of their function and contents.
       `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
       Defaults to ``ukify build``.
 
+   :term:`UNINATIVE_CHECKSUM`
+      When inheriting the :ref:`ref-classes-uninative` class, the
+      :term:`UNINATIVE_CHECKSUM` variable flags contain the checksums of the
+      uninative tarball as specified by the :term:`UNINATIVE_URL` variable.
+      There should be one checksum per tarballs published at
+      :term:`UNINATIVE_URL`, which match architectures. For example::
+
+         UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
+         UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
+         UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
+
+   :term:`UNINATIVE_URL`
+      When inheriting the :ref:`ref-classes-uninative` class, the
+      :term:`UNINATIVE_URL` variable contains the URL where the uninative
+      tarballs are published.
+
    :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the

-- 
2.51.0


