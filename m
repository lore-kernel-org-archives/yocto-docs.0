Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E97C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 16:03:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.56740.1742227418810984131
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 09:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LE82Rn4p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 578EE442C4;
	Mon, 17 Mar 2025 16:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742227417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l6EsDcD3JPw5lC/Av0rz19Shbtf0s1bHb/DHOPHIUQ4=;
	b=LE82Rn4pNbhpAvdZ68Gf6ALjkC77ul2CSakgs8Jyd6DSQEQhm2Ywl2177hmK7U43PjEi0j
	TAo2ARAV7lUkdDcYPvNzhlTYVtCq5lb8zu4jYsRGZWLS5NycjZtWXWzZNV7xohF8qhLJmq
	DSqT/DtWuskOFLNfEdNL5AX9riTxzdkkiQnRQ9nTDpRyP7yTnQtPY7oYIDuQH5QjyBAYl4
	N9ao9496WU08fV1Q4NcKIPcrZ05fUyAo6rin/42zKBIHjpcoU9uy39+K+cusTVwh2Eo9Xz
	AdYRwjfm/K72SnW0kCtswueKLiezHSDu7ci5rRkGYVDCygrGmUNwP0oi0bfpqg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 17:03:31 +0100
Subject: [PATCH 4/4] ref-manual/variables.rst: HOST_CC_ARCH: fix wrong SDK
 reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-cc-vars-v1-4-25edbadfd054@bootlin.com>
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
In-Reply-To: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Qujd9CTL3Yel8pO9+XM9lOCqvRx+08paUmOf6m95EsY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2EfYGdSjzB9JcRmNXXl1Ir7h2OzCCf+MIEo6X
 iB4kPZCyEWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9hH2AAKCRDRgEFAKaOo
 NjLtEAC28C6o3afAfI7Cl1EzNiGaOnhl/e4QF4PpDckskLUDqp9BPtZ2bN5ArY2UXkjnM1rgJ+V
 gDy0hTjSu7nZ1DBw2qbX0qyZbDAgAs9wNaE3CscyJldJpAMIaykxQ4Dk/l/7Kd0AxvoqOArRGma
 6M8Vt3MhWO8iW7xgkAogB9frq5JtKXOa9dsBQvjfeMCr/MyAHzbJWwOqWW74h69WXASNd1Kwg6R
 jGyj94M5+reMkwHdK77WE9L5N2dyDWCXI6dOwJAy/PgRc9mILYsG0URhnls3zD27omvX0iODu6v
 AiWvhhXSCfbuXTl18HpTGmh7FKkncjAZZXGzy9esAsJAayuAzNP1F8QdU1XkXHtAuOHfIoKLAZ2
 UGU8Kty6+ns5ZbNTNWMuWpWi/nKnztIniWn3j9bMWazPWgEREVxvuSWRf4HYL02nOldx05f5weh
 0ls/I7Zi1yQ/5SzeJxu8MgE8Fy59+CjGJSZROG8uXqiNHWTr1uQooKDBrx0B+MHh10nRi4h5hRb
 6A1R/NMw7JBBGoCaMnsDEG8dLoIslCWH6wSbs8K7CIBUZ7dKuQUDRHYuXeVEHQjzwEEAjvwzYr1
 58ZnaMBb6HFLwJ6iqAFkozdEfaawtH1DIdItGgxM8jUsYcPvnYFMHVttusp81rhn/cS2xXQRBty
 1LVuiQZ98eFJVWg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 16:03:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6582

When building for nativesdk recipes, HOST_CC_ARCH equals SDK_CC_ARCH,
not BUILDSDK_CC_ARCH which doesn't exist.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f339e409e..20f78a7ab 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3574,8 +3574,7 @@ system and gives an overview of their function and contents.
       -  :term:`BUILD_CC_ARCH` when building for the build host (i.e.
          ``-native``)
 
-      -  ``BUILDSDK_CC_ARCH`` when building for an SDK (i.e.
-         ``nativesdk-``)
+      -  :term:`SDK_CC_ARCH` when building for an SDK (i.e. ``nativesdk-``)
 
    :term:`HOST_LD_ARCH`
       Specifies architecture-specific linker flags.

-- 
2.47.0


