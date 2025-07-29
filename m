Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F1AC88CB9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3363.1753783012315420738
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JPD8ed+j;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CED434318E;
	Tue, 29 Jul 2025 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27NrPesp/2d1G7gTFRX/2UtLyhmUBvy+8ic6f2yGZdQ=;
	b=JPD8ed+jvtUYwwbxWg1UQQZB1qn5iLXGWTXXkActEkVB/Z1XjzCzNArOenozmXsIpx/iQI
	PVTUt7qghWsRFQgtfprv7qJXCv9/1bgyc70idEv6fLG3kDl/9xZuL9i02NYf8YrNTAzKiq
	XZis2AolZ8B6OeplzSJl1p9aKCtXrHjBaQDHSuPU1UT1yOgrHnZJNwnX4x8sSPDP3w8zNs
	mIzcDIALMRwG9+5zW07rNWtgyhZ6ugt0Wjsty0Bkmr1WyWxnF/pBvX7F8wiVzEzhGLH1eq
	QpN+s+7TRS6+BEP/fwaKdZmKy+oBMqg3SUHvT1m6Rsn/GsNrcCKVprn932ApNw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:41 +0200
Subject: [PATCH 07/19] ref-manual/variables.rst: document the
 FIT_CONF_PREFIX variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-7-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5m6yiM/cv4axzAIFqzYZbNAg4Og+p7U2QYUhGjeFy9E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJre6zdVqTBUr25SNpKMDi+c9+wRBXDYOf6m6
 6WXa1OV3R6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3gAKCRDRgEFAKaOo
 NqQ3EADD3YxCyRw/mdvyhfu5aEiz881GwnGOTmm8LfLMt2bpngiZUkneHZGvw1MafX2VxKtQaxf
 klHoSxqX4jl+zV3nKxwODG7uPxCoNFImx7scYH+zKKGwJsCCHn9ZGNrJ+XMWeZ4OdzYVR9gZ0OB
 nWysU2+ijYBWgcVPl86wnApvSdJSZ0ksTL1eEUxqqQkSuRpJTN4aRDYcimfqQOdqlcgx9XrwUfA
 WwMVCUx+H1obp/Eg7j5ZrgMuYh81K1RJGoIe2AKqT7rT3P62LY2IkOiYjcP/LvUAcRlU8cEKjgT
 OdqiAwyBL4SrKagAB5ckDv/MOtIPHSLWICSrQ1mdxwS+50OWNRhPRPFJtckv2peAHttFU01DiKX
 OKi93ar362nquf47Xe6pd9icSk5QfY5/2iy5E2xQDFwahcZK1S786NBExNoLDUELNsCLu3tgne1
 VjlUdRb3IOX2h6LlxsK7d/PRR4r5BDz37rj0Iry99GVypoiwi2Q6EtEbodWdePZ8iiQEDBhyWE5
 Bop5E0jWLqdLmnP7qM5J7ibHJ/Pw94J9lTnnVZsS9f/EFkbVu/csof9x5IG6zqmqaQ3Ol07WgOY
 yvBT9MQslhS8cFrE2rb2yukQ1yAOvgPvK0On1lQiS4OVQp04TM3jKXD03Gx2mhCHxk4XOtk731x
 38UlOh4UBIXwTpg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7398

Added by commit 7892ee3dc37d ("kernel-fitimage: allow overriding FIT
configuration prefix") in OE-Core, but never documented.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d8e6a81ea..25879b9b4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3360,6 +3360,10 @@ system and gives an overview of their function and contents.
 
       This variable is used in the :ref:`ref-classes-kernel-fit-image` class.
 
+   :term:`FIT_CONF_PREFIX`
+      When using the :ref:`ref-classes-kernel-fit-image`, this is the prefix
+      used for creating FIT configuration nodes. Its default value is "conf-".
+
    :term:`FIT_DESC`
       Specifies the description string encoded into a FIT image. The
       default value is set by the :ref:`ref-classes-kernel-fit-image` class as

-- 
2.50.1


