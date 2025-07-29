Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD325CA0EC1
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3367.1753783013277544941
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m/3Gla9L;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D09BF4313C;
	Tue, 29 Jul 2025 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NJuW9Y5GVpajV4ho/+hDORY2kmgEoSQ1IrgIgcXuagU=;
	b=m/3Gla9LmbNvRj7JhhGu20PoH+7/5EqZelGCXSxa1JgUeTjLC2KSPTqHqD8xKorm4Tmjve
	ZLvjOIfm+6mOzX6+a/XWuscm7nL69O0yn4s6wMXHusC4KCzfhjJF7ARFnOVCDJl9FlBLrg
	QFiRXFWjTiplJRnG5kihB/mmW9rgEgRKYZyT/pLOHjVm29XXAsYyQ405ViW8xyykhPmlbn
	dT6bCneDgxrPSsOajCpEhqteux+wENwrSeuFqLtDgd+wQBP2FULkvdhMIGMN5jK7scBir4
	sUVTU8MKoc5iRgazXQ4vz472AOaPeVJxtqaHvoxzYxAZ3u8luTejDiPtc8Q1Gw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:46 +0200
Subject: [PATCH 12/19] ref-manual/variables.rst: document OE_SHARED_UMASK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-12-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=2lfmgWmWYqRz8VmQud0tyrrb3+lVb/g0ZO6jrhF3SAI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrffJnN9C+L1wbFL4voLYhC7kL40AA6+h3Fo
 FpN8czjV4+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3wAKCRDRgEFAKaOo
 NtDcEADBuOTGm0G+qt1iKHgBC07k1fImCXqLrQGm63BAKpTMNOKkk9iJDeunyfeZnI/H0XKoGvr
 7CZsIGY27tWsU/n475K/73vKbbds3PpDAccl8S7+CVZhhCjbRJlfp3JXYoUr2woeaHqIW2NxUHM
 LPItlW99nux25lRSil807+grDXcFtxJ4Bp7r1jxy06o4KVpe6pltwL63LWz4SW0gvL5Q1SAqiX/
 CO+o7WtzdiMcv6S/3vVBzMruYUSAchSvz4q4AM8p6fU3wGiyEvxLGGkO2+IvzBAnzd8vVlnz6XZ
 Uijp+ZXNX18k4hVjNb2FvQhiNCKaiRyroEE5c/hJeR56x8khiRQD/C16VhyXUYaNbd8iyoL/fRm
 1b0Og6ZcKDsHS6PT/IUR9pSgOevES5scqLVrGP+8B8u2ISaZ7SvyLJYHCFmcrxbfB+YkkvugOXB
 An+T1y9g6IeAh+zBH4JH+0Wy0kW1Yc+ddo3UIsuWzS0BqgMaSBir6jcJzbRvZb3neo3L8Qbph+G
 50RUKXEsnV6QhCwL4YqeJZc3Z4aQIR1QBwlDA3fMGh4qtS/qm1Bv0LVxTf3h02rMED2zkGKyFur
 v8SjFwITJQRXmxGL5+0vTZAOIlOngRF4uwNE+/nQiwDPxGgQ0OtmBU0leiVXdtYlHFbytbRIjRJ
 J49fTdPPV5ZEilA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7403

Added by commit ce32daa9843b ("bitbake.conf/sstate: Introduce
OE_SHARED_UMASK to standarise shared area umask") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a41fa951a..d918446db 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6230,6 +6230,11 @@ system and gives an overview of their function and contents.
       If you use a custom script to set up your build environment, set the
       :term:`OE_INIT_ENV_SCRIPT` variable to its name.
 
+   :term:`OE_SHARED_UMASK`
+      The :term:`OE_SHARED_UMASK` variable contains the :manpage:`umask`
+      definition for shared files (for example files in :term:`SSTATE_DIR` or
+      :term:`DL_DIR`).
+
    :term:`OE_TERMINAL`
       Controls how the OpenEmbedded build system spawns interactive
       terminals on the host development system (e.g. using the BitBake

-- 
2.50.1


