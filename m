Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9148DC87FDB
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3365.1753783012528769335
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Tt9tdZGL;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9BB743180;
	Tue, 29 Jul 2025 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+T6vnj+X2Bb8ShLG/WxgSdA4oMrfozA94hSgBSSkrM=;
	b=Tt9tdZGLma0q66qltIP0862yCdiebOO8Asa78KhKJqVPmLdQaGraFxu2vTgZHvUJTSwFyX
	gxcQjVv62FTD/uE796TJyfsC1J62iYK7aXN18EKFWSsMzP/ck94l/jy2mm6ZPx6N4rEm5U
	DNBDxwxVIDE63JvdOVaON5xzhG6kPJ43kku5OKa+LcP2hmJWjVa8HVRlSuzhPAVKshxcUf
	4sNA0F0EtEzFab0Gja73WLeXv1h1jv7KwaATuTgsFM4Rv6fsWP8jp1j5t+QlqgPI2CX0x1
	z+0A5FodwEDFrsCFip4eTy9YT4Mib0KjkIVwmIhwASOqcQIjiJ5K5kS7qauMug==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:36 +0200
Subject: [PATCH 02/19] ref-manual/variables.rst: document SPDX_PACKAGE_URL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-2-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=G+yM72uOxaUZ06mdC1MJ40Y9F+/yN0vQWHq1WFNcFEw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrd3NSz7KpD3qVPgVK5/0TDpe4Bu/CTdeTl7
 7/A7iMNR5SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3QAKCRDRgEFAKaOo
 NpjWEADCaOS/Xod6evbQjRCkO2sgwwv7aORb89yPo0YXP7YFNhlUOIkGIQSGtGNdjX9bHIq4o6C
 VcV76moFoj7EEmSVqKjh6SDf+wxfWd3oEM0m6Jf1v3VNW0hFMo80qhkooG9Sj7ZqzJX0/TsajQQ
 Euy1/WrWswKHeMqQM7mKtxhOy1v6FIQ+7xBx7yIMHwbEwdMDpig4TuUZRj/z5gt2G6ck2c8BDAB
 bAMZ1Q0OM84h9t8uJUx13crDamcudNPVccfVKf2hnTecoJN46WWWQ8jGrDikcyYT6tCV3fTXxX7
 PX6F/rdmYJl5gZ03P2KpfXinblaoQpvGNECDEedHGErTZSsj1/wtEKWdEhS3rYNTRnE95fG4p53
 O3w0hXyBUiS21c6aPnjBhO1tzgz8Ik0LJXuszZ0L4XNgbec9miyKwLLHwWG3V5/wwX3A9EIb3i1
 82Hph47FPE501HIYRuA8T9dspfCqyJq7PK2IWfnwBhA4EYXYUwQ3e0US/wAK6tegptkLOk8sVdk
 kqAp/P/AKgF+9uwlN7di/dCARLJ5NmHMCuzpN4n7T2Z8Lv1pBRzDRMRkSD1BiseYAbCJVaaPbSm
 nhEDwsXEUjjwJpcCGlNhEn0Le4F9GRYT7Bz2nLe08J2jqobxgQSDxxuP6t5JSe307amNh97f7hN
 XmlsvSioQOZ7DNQ==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7400

Used for SPDX3 software_packageUrl field.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 038e5541e..03839ac0a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8875,6 +8875,12 @@ system and gives an overview of their function and contents.
       output (``software_packageVersion``). The default value for this variable
       is :term:`PV`.
 
+   :term:`SPDX_PACKAGE_URL`
+      Provides a place for the SPDX data creator to record the package URL
+      string (``software_packageUrl``, in accordance with the Package URL
+      specification) for a software Package. The default value of this variable
+      is an empty string.
+
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
       identation and newlines, instead of the default output in a

-- 
2.50.1


