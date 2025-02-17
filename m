Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970E5C021B0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:50:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.53282.1739803836343952539
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=crSzFnkY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6AE94430F;
	Mon, 17 Feb 2025 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739803835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RGajlzjPDMaTYsj/CLTd+SlY8SM7iFzlGzGsy4EJuQI=;
	b=crSzFnkYAQ+sEd2zxAKNwx+a4fEk+swn3/GUTy/iFs+09SM+ekZq6RI/5d7ngZvgoqXtG4
	OpwDYgIrGhjlMaEdlbdm7b7yojFU1plX4ML26niDGUeqSv+47Sys24fflfMX8AJld+enJE
	fc4cIpksOv7HXcITNvrMnkFq4hkZbu2uqwvf42cAUtO6xJ55EbH/DAFAdSZgnwtK5ypS7d
	kRJIl2Itm/y9i2UHyQxCCNW1BvgapMqH1w1Gm88AmhNaks8SzVza4PDgHzzWtLJoM47IbQ
	7XXnpKgqRD6LuXhBZ6jkpp54BRCWanK9n3m7DNNANcc/490zFaihrYAGlKOr/Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Feb 2025 15:50:23 +0100
Subject: [PATCH v3 4/6] dev-manual/multiconfig: rename to use Multiconfig
 term
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-multiconfig-doc-v3-4-027a9fb282c3@bootlin.com>
References: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
In-Reply-To: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3tXuOnkNMJVDFjFLnzdqPAJTdqcRTcR8Io4W4Qy8Yis=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBns0y5nWSshNP3BYZWuNDg7UVvcps93AElnduLt
 n3aHKP6NEeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7NMuQAKCRDRgEFAKaOo
 NqlWD/9n5G2RUIyk7eVhCkvEeLGQax2GbrttM/YxZeCoTfL5TZKz7F7sko4aitEacvZIJxh+eGh
 QWxcAEhjfTG0MkNhWYhcwQnkby9d0eGAKYwV6w19CbKByoJbTpLpG2lF98RYezXTJcvmBMxzJjq
 l0HRlYLhUGV4hw/z2QyWHvlseG+H0ngeEFhOwjg6++kHiiZMFT/ACgDK2kb6OfbW0TKqeF0EzB8
 Hthgq3LMq0FnZvZIn5Zn/+Pv833dvDdrHKDHQ2kJsZLoQG4u75+t9nUEfEYxSsF4EItldz6qww0
 8hwg8rXE7ql4YydmSZh1BTQ5yuPSbWhVzTU65uxNd3MRXen+1uMNKzW2LgulgTFfGNXJ9RJelDR
 qPv+TwKUT+QqdS5XHyaRj4TUA8XIDZvzvd/YKLiDWoy4jJNd+lMAaAxPVI+fhmZppu//0rSumXX
 wcnnbCwpjhdkKpCJLbcRCt1ipmBYYR5d38SJTkMI8mjL5cuKzcefs1FMoDG3ApmduLM/PyeriLQ
 ucKMzHZv/wvxuBpo1ROwj7tGrrBMvzxjdynI+bLa8NBIVQynYlruNHZTF3XlDN6le3T6f8q89wR
 N6ByzA21xzAcR0HBRFpS+alTLSriHkV1yTmCUpQ7bagYuJ9gamKpGxT7CMRpwDloTggRt7d3EgH
 R09489+KBZ6UfAw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:50:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6398

Rename this section to explicitely name the multiple configuration feature
"multiconfig".

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/multiconfig.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index 8464f80c3cb8191fbcf23928828a2d6a369e12a8..d8f6470d516be9b57084228f33bceb69a9341388 100644
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


