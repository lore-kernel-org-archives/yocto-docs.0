Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71CCCA0EC0
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.3504.1753783012902679403
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lizVx2g4;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BFDD44208;
	Tue, 29 Jul 2025 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cqgg5xZV9v1vzUsNqmXlDNkdLp7NzGS9MZI68++ht2s=;
	b=lizVx2g4x21FU/Qw+o0WMHLe9ZtJ+2doDF0AlxYO4JMto75e3rUxzPEBqfi3vrC/iA7yQb
	4/vkPO/f6YXHDRrLiWLbDrtIpduta+cuSPKk+ylNqy5X4j7p+ZWRozHsTzYl6glJjpIE9Y
	xtMsVpCBSKTlbK2HgL7+vUpWXpgDWXDTFJuNnDeiWmLW3NH+wqtIRhAkfnLhkGv5cod+vm
	I6Oz6F8OpFzXjzeGkut+ulU5rHxnaemyjUVZksXZu61PAskak4q8hohsex/iiZnXNh053/
	Vineba9frgSGf+lV6D3bRc60WYzhnaf3ovwnxtJgQra4N8Aeoda2qZ78SM3K6Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:44 +0200
Subject: [PATCH 10/19] ref-manual/variables.rst: document UBOOT_VERSION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-10-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fByutRjjxfJCWKo/tfMwSNib33E6aliPMNrNkURck6Y=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrfwcx1pspNGg8FSRAC4Kqh4a/Lxs7t56j8R
 /g1ag2/dK2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3wAKCRDRgEFAKaOo
 Nm6iEACVKKWR+8bj+PDQ80+r8ymEL3YcykdVBbjXaQgE0zq4KaWDD1UgEAWvE6mwL9Ccb0PaDX6
 3RSLPoXhPaj5D6CuKBOxAhPTxq82lMX4Zg0IyJsnCG4i0EBGB8E6ZuhNOhtQUJX1JGKelnb1gMa
 LhF62s4zfKL+vP5PdT3VukPBqsdgzFqDHZ9lLTRE8+sIjXAw5LLEW9tp4ggecQjWsOoxS4Ns7W3
 GwYkZmVJ8Lbth56s4YJt3EaVaDwoKUHqZBpq2qRNpdz1KgPyAGtjFLFbSpcmZXLf85KKRYLA34S
 EPB9tGBFKU49NhGujje1a1efZ1+eW/2r2llvsjBnYh3szuYeehgCweFOSWYFM981tytzFGwX4Zl
 1MKB9bXv7ryI/Ru4t5KPCnsFMlqxRgCESIk2RCZoPSLnJhw8+DAUj/YSNMEdxd7yCYqOLop9dEA
 ZT6/DAV/UeBdJy/brtb4PyPBEvwPE++2XrYFN2YP0stSYc2LtyHI90Y7fjEd/GsywQFT86pap/6
 YVujjeX5EvU8D5pP9Yn8D2mWO/Vor3scfGCBH/yZSSQ6t/ShS6jJQyLi/GF/+xkkDMkhroBWMAW
 gGQ4guFG3jv3W8B4T4ezOBtHJZQKAjBQME0MAU330Mfn0wNEX5lflEaGdsPoB55VJ7a5gxUFw+0
 8lyyXVyyF1i6vdA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefhfeduvedtjedugeffgefhueeuleehkedufeeugfeiveegteevgefflefgleffnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7401

Added by commit debc691853e2 ("u-boot: Allow for customizing
installed/deployed file names") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d722d722f..a41fa951a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10804,6 +10804,12 @@ system and gives an overview of their function and contents.
       passes and uses "all" for the target during the U-Boot building
       process.
 
+   :term:`UBOOT_VERSION`
+      When naming the files that are installed and deployed, the package version
+      (:term:`PV`) and revision (:term:`PR`) are part of the filename. The
+      :term:`UBOOT_VERSION` variable contains this information, but can be
+      overridden if desired.
+
    :term:`UKIFY_CMD`
       When inheriting the :ref:`ref-classes-uki` class,
       `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build

-- 
2.50.1


