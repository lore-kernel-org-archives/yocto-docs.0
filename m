Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7BFC0219E
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 16:29:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.73797.1738945738846100012
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 08:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nM25MOqc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65F1744347;
	Fri,  7 Feb 2025 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738945737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIyJN1K3RKNDbbUtL9Q9UeBjT1PESbNHuWKzPsmXyvA=;
	b=nM25MOqcU1AWemBPN/go+y0TqSsduqxFn9NdbpzPRIH6m7gwIeNbEdIjRVh+WXUkMpQg0s
	u4yl3r/EXqkvkgoKNRbw3Lj4lXCjwjElt3O8m89cl3CS7y52egIOIlYtQOFcz1VBJZk/ky
	kA9M2ZQNGDc/UGEHbvMd0mxLfpuU9T2KUNOrDM8FVw70UMbfRNoBwNJAYXse5uiMH7ZgHd
	ImxX6zvduc17rS7ncPKN0efkGjDTyBEEGC3wns2tDO67L2iilXxRWAGLuX9V27Fg019/db
	/JST4nGc50v5qDp6uQueM+HMZZxj0CB+HC+W+5k4l4yl1wuukr6GqMhe7K3jUg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 07 Feb 2025 17:28:54 +0100
Subject: [PATCH 4/6] dev-manual/multiconfig: rename to use Multiconfig term
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-multiconfig-doc-v1-4-f63cdab1fad9@bootlin.com>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
In-Reply-To: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EDv8xrq/TbNTNFDRAJj11QoVVaryXSFFpmeTst5AYTA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpjTHY2WiL+3DXN4vm2jqFBn7oPekte6BAO/80
 IEavb6Oe6CJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6Y0xwAKCRDRgEFAKaOo
 Nk7VD/4nBYh5YVEIzJwwhw4DZgQK7Hv9hDyFmpG0kYONYMoCEynpmqqt80W9tXY4jyNR1esab8u
 73+ioIjdZTe5eQ9+vBkD3f8h0kXg/PjrNykEqBcz95tayhgyhXheP3JXwFHuQpYO4lmAzTirxBv
 Fz4NBP9xPdYp1/RCaEpJnCDtflU2j9oCQ0+OwkAvllBiCUuwhvwaMT4UCQ+P4neVT3nAhLW5zDR
 CFX1k45LJlztk6dmBqSnsZnIw4PqsNQDDW0lmV5uXhMHFCV+cECNxO/1kaj8551eIxtSAy8iTVS
 /jlRtHM3rG+1wguFtxkoqYSHYE8tq7MQuWOJwUBbKH3K0Bi+xzcD9JxEhEy7Sk3QzXIKHOG3TVy
 Fh9EldsRrtRTFvkx4c0Pm6qtMV3iQPfPhFp5bJGOQKemZRVH6Zu3V3wglbD2OiWLhlo3NowZ4r2
 VGYs5QlrTDLj7IcGxJzjlrGr9bNneHaMAT9TTRZ2X3eX95Jvkm8JA/JKDMAOPFddcMaYtHvykT3
 k4OtEpOJfs6vL0WQ11fSHmltWnQ7WvqlKXgoBH5uACProZz6nf4pxkOs4gaOn6cInvCUg60DA15
 +SZ0JxmpdlmZVMJhDBpV+OclrxjHaOV7M1b9YInKfQky99L7aX/rMFBgGVdzsdamMHfnBp+9AiY
 ffnogVb49gNy7TA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6305

Rename this section to explicitely name the multiple configuration feature
"multiconfig".

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/building.rst    | 4 ++--
 documentation/dev-manual/multiconfig.rst | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 62b5e6b2e..2ac898881 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -113,8 +113,8 @@ The following figure and list overviews the build process:
 Building Images for Multiple Targets Using Multiple Configurations
 ==================================================================
 
-See the :ref:`dev-manual/multiconfig` section of the Yocto Project Development
-Tasks Manual.
+See the :ref:`dev-manual/multiconfig:Building Images for Multiple Targets With
+Multiconfig` section of the Yocto Project Development Tasks Manual.
 
 Building an Initial RAM Filesystem (Initramfs) Image
 ====================================================
diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index 8464f80c3..d8f6470d5 100644
--- a/documentation/dev-manual/multiconfig.rst
+++ b/documentation/dev-manual/multiconfig.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-Building Images for Multiple Targets Using Multiple Configurations
-******************************************************************
+Building Images for Multiple Targets With Multiconfig
+*****************************************************
 
 You can use a single ``bitbake`` command to build multiple images or
 packages for different targets where each image or package requires a

-- 
2.47.0


