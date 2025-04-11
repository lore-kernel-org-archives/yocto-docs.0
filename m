Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C38C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 13:31:41 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.25994.1744378292593118716
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 06:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QDgsMlhW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C54A441BF;
	Fri, 11 Apr 2025 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744378290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2bJVsilAnYdPm5HUkMZhy16YyLGxLSJjgDlffz3Nh3Q=;
	b=QDgsMlhWJoXxz73ufwt7LqeWHpx2O3GqywPgUUgmEyMGIhySDrFl1ytImi5DoD/IY1TEcD
	y301QBnECGHtD5n2XNX+dA7Vt4FlFMvISLJ+eDjWs74HpIibj6EewR+Hz0au4FBifclBen
	iYzhS9/uzbmcyFSchwH0N3WpKG7RT15/7N+jJ/dw9JmR5CjzTfkQEVh+mc6t7p/xtA4ZVt
	vQwEM0mu4jAWsJ4fviD+3Kv7ANLyLbo1+u9WPnw9LG2KhwrtMWkASCE2uX3gZaJZQ+4uTp
	iEGsAHs78pgZTB96YsdkE2Z5JGFEXnvpoSrGrvcwdU8OKid5L8sNUg3P8Gy2DA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Apr 2025 15:31:26 +0200
Subject: [PATCH] test-manual/intro: remove Buildbot version used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-ab-remove-buildbot-ver-v1-1-77bfbf35b460@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAK0Z+WcC/x3MQQqDMBBG4avIrB1IUu3Cq4iLJP7agdbIRENBv
 HtDl9/ivYsyVJBpaC5SFMmStgrbNhRfflvBMleTM643nbXsAys+qYDDKe85pIMLlJ2Be/i4mGf
 oqca7YpHvfzxO9/0DdZjsiWgAAAA=
X-Change-ID: 20250411-ab-remove-buildbot-ver-20e23acf06b5
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1925;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ETuUjoA3wxHA8iYk6Xxh2y0LyjWgcsxjc6MnT40P1iI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn+RmyxhB/LQIqFFOrfow7y4T1Zc0He0gRLZLw3
 z6H5+YVBBOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ/kZsgAKCRDRgEFAKaOo
 NoflD/4uXTeMBveiE7Rpt/vvn++VriytmDvYgsmMyJqcAj8Ez+r4rLFRiFqb1c5mlRCU82jQ8ky
 bJcKR+xHwgzdaM/auWV7FG1hZu4T1c13Jaww4Qp5BHVpJIzFokcBmC1cn12AlN+R7c/iQNeizxk
 gsS/RAw4JxZW1JTXerfaCKgQKmbflHy9Wiz/+xsEHH6Ndoy5wOmddjOmegLgm3vXHj8gHkAN842
 7Qdwbxs4FXrtJfK/GAfTs96Pv5JnftusbrAYM8K39i+hruh4IxCPuENJiC1ugnFJbJnlqJjgR5e
 7TaDexV1QK6zCy6dpyHoIFAAdAOSroHok8vbSZAiZLlsrgkCPnHMKONF1buvWgPZnir3MI+169s
 sBY95Xl+s3u2JeHCHq03rld+0VeEdJwR904vji3LM3qeF2OSivKzhCFQWQkHOxUK0Z3fb5NBn8b
 VuHl6c7MRxhHG8f6A/+y5Mamq5KOffVSFYqgr7DEXcE5R0L21r6VRvRD6UljFobZJQKukkH2X3E
 o4HDHmFaNhiVsqDg6HHeOaFhZ3k2rrphVvOGB7wX8uSlERLpWj5gUgQYIYcN9W+2Aca9hXDdmu3
 jJoj3t8auKqlN//8GuD8UPuKY/M+i2+zwxWY/nX8D7FATj1eRBWmr4gca7fXOpyJSFPCXCgt632
 gxBKvGlhpiBR7MA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfeejheelteekiedvteejvdekvdelvddvhefgudehueehkeffhfehffefheduheenucffohhmrghinhepsghuihhluggsohhtrdhnvghtnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhto
 hepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 13:31:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6733

The version has changed now (3.10.12 as of writing). Avoid having to
maintain this information by removing the version info from the intro.
Also fix a typo ("uses now uses") and give a link to yocto-autobuilder2.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/intro.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 1a8e938a2..d55540c8d 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -51,13 +51,11 @@ fashion. Basically, during the development of a Yocto Project release,
 the Autobuilder tests if things work. The Autobuilder builds all test
 targets and runs all the tests.
 
-The Yocto Project uses now uses standard upstream
-Buildbot (`version 3.8 <https://docs.buildbot.net/3.8.0/>`__) to
-drive its integration and testing. Buildbot has a plug-in interface
-that the Yocto Project customizes using code from the
-``yocto-autobuilder2`` repository, adding its own console UI plugin. The
-resulting UI plug-in allows you to visualize builds in a way suited to
-the project's needs.
+The Yocto Project uses standard upstream Buildbot to drive its integration and
+testing. Buildbot has a plug-in interface that the Yocto Project customizes
+using code from the :yocto_git:`yocto-autobuilder2 </yocto-autobuilder2>`
+repository, adding its own console UI plugin. The resulting UI plug-in allows
+you to visualize builds in a way suited to the project's needs.
 
 A ``helper`` layer provides configuration and job management through
 scripts found in the ``yocto-autobuilder-helper`` repository. The

---
base-commit: 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef
change-id: 20250411-ab-remove-buildbot-ver-20e23acf06b5

Best regards,
--
Antonin Godard <antonin.godard@bootlin.com>


