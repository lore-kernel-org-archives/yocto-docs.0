Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E43C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 07:56:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13190.1750146977642134028
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 00:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lyA+woxm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7BFF442CC;
	Tue, 17 Jun 2025 07:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750146975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ZLOqrg9GenVEAbeQq+sjNv8Kske2KoupKHE9Iuw8A0=;
	b=lyA+woxmVSNS8RLzx56irUsBnlqacJmhGrY+8jAHMKhkA/6Xt0sxaey1bsUMf4LgCiaTWM
	3KdjGhkxjf3+KkPniXK2SxrfaOoZiCP7vnCaRHRKFxJeR/HVwXbmmeh+k//FLFtas0dYiD
	EeuyInPlD96I9Dm/4TPXTWvs8A6ZArXgVNsl5VUJgN/phiHijA9pQW79zd1Qi792HY/fOd
	0vczmgTJ9Ln+DF7gAwsgi9WR0tkD/3XySq29rfnIi0vqH1/oKa4/ALQz76h3+9uzm98Wxv
	9696glcOw/uwTjGq0E2EaA0mE/hNqTRBtB9AuVGY9cilSwkF/CLBhzN7NClmIA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Jun 2025 09:55:59 +0200
Subject: [PATCH 1/2] overview-manual/yp-intro.rst: add RISC-V to supported
 archs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-supported-architectures-fixups-v1-1-e6c4d2c1cc3f@bootlin.com>
References: <20250617-supported-architectures-fixups-v1-0-e6c4d2c1cc3f@bootlin.com>
In-Reply-To: <20250617-supported-architectures-fixups-v1-0-e6c4d2c1cc3f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9lfi69hxEcSVXIduDFXcl4driJq3qaJNPaiSOKap/yc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoUR+ef/SolfvbO3p9tasJ1T6/5dWuEdIaOep5v
 +K5cM+T5oWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFEfngAKCRDRgEFAKaOo
 NtiYEAC5CNdDAdcls9vfq8YYTGsnfPvcMxWQysI6DzYYk9XqRkiTrXcgsW4HAF7knSjsP3XhzPZ
 3lsDq8vW2p/NBRs7CkSsMEhPCn4Uxe2sGwmhGCtDzkwZ0Vp1/OlctLHmOo5cUlDF+7GsJDpP4uQ
 QAX/oaqWyxJkwBm+H13o9Vrb7PL0N9DdRTtWMHx1MZ+Sn3MZGPZD7xZQ/WbySDb5/X3zRAhKqI9
 LILsbbQeLc1yCuRb4zD2nQ0cn22E02cPUfQpLpTKsIcaEu4dQGFFROF2yQWD6Fvs7y0XEtGUFu7
 Zx6fHcro4qozJurCVTIFWySTc+lXSFFDOv4x0FpQoSLVdkw+vB3YozQ1PK5QEi1DuYnFWRyAWOd
 4QInbmWGBJR2YfHNlBPkYd4qcRKYCLlfR/AmQRAOSssGEYgkfd0FUS4L6480v3E3IO0lBlu1Ev0
 rJvHSYRkk26ZgwyssShjJay0R0VCUCPwsNAzyjL+GsMyUI4cdvb4PZGNHuf0x4eD8GuoiyNCDTq
 eHRYMSPGicbQgxwdbHl+S8lss7r3J426g/z8qZxtQ6pZ+Ea7CYVZeyTrsLbhBUv2n5Z1rZ+M1bK
 b+msD3BzJZUEI8sU4TV/qfICIZ8g1ZkNkcD5q6wBwSfI7cOvPoWQaAaTSqi8i8OSRC3vKZpTg+u
 ycGbYVLSxRJ/9bA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvkeekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 07:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7080

And mention the new supported features document.

Suggested-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/yp-intro.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 11e6d99e3..15dfb3a6b 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -47,10 +47,12 @@ Here are features and advantages of the Yocto Project:
    see the "COMMUNITY" and "ECOSYSTEM" tabs on the
    :yocto_home:`Yocto Project <>` home page.
 
--  *Architecture Agnostic:* Yocto Project supports Intel, ARM, MIPS,
-   AMD, PPC and other architectures. Most ODMs, OSVs, and chip vendors
-   create and supply BSPs that support their hardware. If you have
-   custom silicon, you can create a BSP that supports that architecture.
+-  *Architecture Agnostic:* Yocto Project supports Intel, ARM, MIPS, AMD, PPC,
+   RISC-V and other architectures. Most ODMs, OSVs, and chip vendors create and
+   supply BSPs that support their hardware. If you have custom silicon, you can
+   create a BSP that supports that architecture. See
+   :doc:`ref-manual/yocto-project-supported-features` for details on the level
+   of support for some of these architectures.
 
    Aside from broad architecture support, the Yocto Project fully
    supports a wide range of devices emulated by the Quick EMUlator

-- 
2.49.0


