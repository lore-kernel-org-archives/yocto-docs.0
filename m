Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7898FCCD19E
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:55:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3670.1760604893403668176
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OUNkM8Km;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F6211A1417
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA7FB606DB
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16AE7102F22DB;
	Thu, 16 Oct 2025 10:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604891; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RWZ0pLIq7BEwzwK9x4AezQ+95ppwLE0Lf0EyBQ14yuQ=;
	b=OUNkM8KmniliQBjRSYpIHmGMvxzlY+kLXrS8rMSW9EVAzea2MDc/VpsXlJXERkoEd0/FZS
	TrEkEr24Mxd2CvVb7fKtDNSBkKIUWJeIIOJlyEL0eqRD4ps6M7PxJyrLe4tVqXvnfCdUVL
	qBqlW0UJXCGNE9TNmqV+SbWaHp16j+nhO3OK1zicYEt8ACi8Ly1uKaouXZFN5ZcM4yZDYd
	Wu+LaosDxHBjOl0lWtXJpf1s5w+aCOi2Brp8yrzCNfTbUXcvj2YlB3Z+67w/RSc7E/wlNA
	1Uz50jCX0xLmNTA4AwbY96XtW/4qRfirldbt6GU5Wms2hzwEhRIZcU7UB16lxQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:54:04 +0200
Subject: [PATCH 14/17] ref-manual/variables.rst: document the FIT_LINUX_BIN
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-14-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Q4vLqOWEjUNidi5H2o/fuzxvgaV8RpkPiis6WLVCqkM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLR5WvQm88n0LB0BKQ/faknkgcWvUBwH2Kb8
 xvbsw14cLOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0QAKCRDRgEFAKaOo
 NqTvEACcWWFfP4YFtWMs0EVswmb/INYJNqtk8uS73i32z/fBUSMWCGWbxA7Yp95ws5EsS6WIFQP
 u5wp4J/yjZ8KG4OaEbzk5e0iY2Jceo1yn4aLr8v5uRLnm5vBduUZ26O/GICwm/5aCvpNZeqEdNN
 L1KYaI2mnHEyAZothLOT9F+3yG8i9B2tjt6/0RPdabyvs+xgBAxPFzSe9Do5xvQ8CFRn9PKq/PX
 0fipStDXBCFnUBhIBC8ePtmVeZGvv/m1jqE+G/ZTSNuTOW84hHscZjRmyuOWVR8a9VVTHrLFbO7
 9btv1ix1ouUPH0B3Wxg+3OP8kDhuPiI/isWiZeOIsUR5/L2T3zAw/Kvg9BDGRHVxIgNZKL9W1sN
 JpEWHsVpTdnFE1F5e21yIbRE5TCI4sCq8qYsUNWFIGV9pNdVqnrcWoXuSY5dyCEy5cEwWwncpGM
 gObKZhnnAwOb/abK1pBvh3VTwwrwRTYTb2T8iweFXCydZxU8dOW3Z5c+3gAlhHFp0FM+ewV0OOJ
 wq6SHnIZQwoYAOqe5TqnErAVGnY8leeR+riA4om7g2V+aBW2HgRZIfanH2541oZ+0mNKz1V6k+x
 7mPL6tJwxlsPBIeGQKvJUdXlVmgPGDoNodtVovxyhN39acm5tIfjZY/KWc1kjb4dfziMIHY1JCO
 +rCLKvNC2aBrffQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7724

Added by commit d077777cbdb4 ("image-fitimage: add FIT_LINUX_BIN
variable") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f16ef9aae..140be47a9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3435,6 +3435,16 @@ system and gives an overview of their function and contents.
       The default value is set to "x509" by the
       :ref:`ref-classes-kernel-fit-image` class.
 
+   :term:`FIT_LINUX_BIN`
+      When using the :ref:`ref-classes-kernel-fit-image` class, the
+      :term:`FIT_LINUX_BIN` variable specifies the path to the Linux Kernel
+      binary. Setting the variable to an empty string allows use cases where the
+      kernel binary is not included in the FIT image itself. This is
+      particularly useful for UKI-based setups, where the Kernel and Initramfs
+      are bundled into a `Unified Kernel Image (UKI)
+      <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__,
+      and DTBs are provided separately in a FIT image.
+
    :term:`FIT_PAD_ALG`
       Specifies the padding algorithm used in creating the FIT Image.
       The default value is set to "pkcs-1.5" by the

-- 
2.51.0


