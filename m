Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD347CA0EC3
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3362.1753783011894549108
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JpmqRZ5T;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65A8943190;
	Tue, 29 Jul 2025 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vOijNZRflcQlitqQJrWmMBoWDcj01b4jgQ0eXCsOhvo=;
	b=JpmqRZ5TWFoPAmLbCDn7cnhrQYOt255pS5OcYolE94dhmX3D183dXV2kru3xPIjquUBL2x
	dr3McPmKHzVEpUWJ0DUif3b6JidEp/sSnK/gzGkaHn0cbbC8m3m2vonxd0D6qOdtJwejoa
	6GzIaVSMDqLGrXsY1JzSqo6mE5JcN5upSja4GuveltCttD2XsF/KsGgvIEimkOOjJkz3WF
	xtnn0PwuDdRx1E1UEsjnhU8O3uHKsFPH4qgqA2Q813gH3E6MkTdKqcR2gMjq647wAVOEkt
	0qknr6TbiYNNRrs/fPaHA37vzaKxA2y9Sj5kUZRV+qjvx123uplGPSmnHl3USw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:39 +0200
Subject: [PATCH 05/19] ref-manual/variables.rst: document
 PSEUDO_INCLUDE_PATHS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-5-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mG5WZI+m6svWrxFXCssF7zcnlbtZ/nSbRfBWMMlv6TY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrecYHfN5E5wc2TMIRngzPNBqgNfR9P2T5iK
 kTE04Q9rruJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3gAKCRDRgEFAKaOo
 Ns74D/wNeuBpnjG/LN0ru16Qi+fEXQDIpwCyHzY5Ojugoa4PYTkaVrQIU4YLbKtWKt6xNWk+iP+
 cYM6PBqgoN5qKfEBWmVz5akX5VuDVYkeFGsiMBB6rm6Ifk3Q/FAPD2CArw648t3XMLrgD91rApY
 O4zDP39u7LcAmcN6cp2ubU0ntm8Kkwo7w9U2gvEWxJ/n/IlA4U47dHRsmzjQFy5OD2sRdJiT3rB
 4ZQ7qf3Jp7HI9vJUSmycSfJl8xk8htTdIOl+DZ8njhQjrS3qi3sAvRAwm3uf+mzAQZuk9xYfPdC
 28Ya502x2xnqZY8bQ/0OjY5OxuS/AKvMwU/vxY6pjTGU5c1+CkRoG7YroaTe+98E8VTORbMFadq
 UmfPrBHwWN58yqiusD+uGr711kzdp0ttwpIzOO/M3BACzrmlTerFFCPrgLCgwtH2pYLNw/c848L
 I/cajY+J/NIz8+qfjRel9xXFK2a4PEO9Rkx+pOPt2OVfo3jM6Wj4SoKDWTuOnXRt0dyFVRV1Pcv
 qxbv2PovqB9XB1k7forS4JbL3UoFyiwOCzFxnw62qjT1WrqLLfd0ZwPVjySmMRsMfy5Kkf4Nh6q
 yg/oAEcmeMyWFeFbUN3J657vkVbUMs/PmbD0ZxYRDL3Y4UFh/d2jzNfwxaCNEFi+3s82XVAVXLA
 G+JJea67awH/YpA==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7397

Added by commit 2502da81709f ("bitbake.conf/pseudo: Switch from
exclusion list to inclusion list") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a5d43966c..a6962bb9d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7585,6 +7585,13 @@ system and gives an overview of their function and contents.
       reduce pseudo's overhead. A path is ignored if it matches any prefix in the list
       and can include partial directory (or file) names.
 
+   :term:`PSEUDO_INCLUDE_PATHS`
+      A comma-separated (without spaces) list of path prefixes that should be included
+      by pseudo when monitoring and recording file operations, in order to avoid
+      problems with files being written to outside of the pseudo context and
+      reduce :ref:`pseudo <overview-manual/concepts:Fakeroot and Pseudo>`'s overhead.
+      A path is included if it matches any prefix in the list and can include
+      partial directory (or file) names.
 
    :term:`PTEST_ENABLED`
       Specifies whether or not :ref:`Package

-- 
2.50.1


