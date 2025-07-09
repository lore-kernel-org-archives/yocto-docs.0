Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE783C83F0F
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 07:58:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.10191.1752047873780093507
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 00:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k6nTPf7J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1ECE443B1;
	Wed,  9 Jul 2025 07:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752047872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VPBupWs0cxXE8B6xNlEyr+yS4JuxLjoVZKLZmF+bU3w=;
	b=k6nTPf7JD6Uv/V4yw8yRMMgVyIhAgrg8UViXpFnCepoeOEyI/8gvLcFnuOXwTMtXQVzyZZ
	cVZrm5gcyYCer+iyflqMmhvmhyz/TixG85IFb5OgQMPMOgXia/TsWwQBksccOcyw9CFRC/
	haR0tj4TRKqIEwAV5eGaIk7M2HNw60xHbpgcmtlV5TnpZj1yaeqjf/sJt6HJ4K+0Mkzyu4
	mKuOkjCQ/Mxd+o9dLLeJ7tGhy6aZQdO3Q7H7t9z5avjUMdRxwOJMBM0RA1azZ+ZVXo5RqN
	LtCsZpYFo6FLPvEBD/vepTGNoBz0FVAD3nFhbEsNl8BjixrWnPUV6typuKcA4A==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/4] Improvements around PERSISTENT_DIR
Date: Wed, 09 Jul 2025 09:57:26 +0200
Message-Id: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYgbmgC/x2MQQ5AMBAAvyJ7tkmRauMr4lDtlr0gXUQi/q6cJ
 nOYuUEoMQl0xQ2JThZelyxVWYCf3TIRcsgOtaq1MsrisQW3E4rsHwInDKsXtKZtxqqxJkYNOd4
 SRb7+cT88zwtzsYp9aAAAAA==
X-Change-ID: 20250708-update-sstate-dir-docs-8763b1387ff5
To: docs@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dZqfTzSDxQBEXWYrnml5QfDFmSzcbQmGWTyQaQ5egtI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBobiD+AUD0kWAlKuRVOLlHor9qIoCQH0qtGAeGX
 j4eO1x+RWKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaG4g/gAKCRDRgEFAKaOo
 Nsw2D/9DXTpgOWdqpp2yvcBA6iXYMQfu4oI78JcuiuLKNvGM71RmirQSepjkzy0SarTwmSvTKxW
 E94OK76vU+ITYP0pWogaznOaKRyWC3YTlVVlGY/VIuW2cgXem0eVXuIJStu/AUIKT1n62Xe/MI1
 Y4AMrdwzsq1dUC7kNnLuFP+6XPnGfB6Svphv9MgJP+1nPMayxoLGsfdMS54qaIgBgugJBzIz/bP
 nAjzybn5KkIRWBE5aFhF2mEoFaTZ7Gr1kUbUWXQPPWB/+2te+vx1Zo3FOqzSVblNI0OZbwZm36T
 iiv2nUidHra7xrq0zbTL6EKE/lPLNHpkc7uBkQF2hvoU7hSQ8tRFdPCfFtJtX3KWP2vvVcRwHwo
 lWX/9G1GJLphEGqnNN1S+B8m4FnYv23GdAZoxKU+8UrQd3R4DtsjiP5PViaZGqJurZodciPHmss
 AZ0h/e7JVSoleM9jOCvnnwArtFyRwulU9UKSKmuDw54Wng42MeN7721H9kLgPMbElm0XlfBYUkb
 58pJLINfkcsmWKlXmXOF4w7JoByij3K5iiUQSrsjzHQePaMsU3ovASh1QXzH/nkSl+CJEz83Zxr
 EwWRUhuRlNOk8anA5XN7t18xVjeT0+zwj+d6xxpQcxXY8b4GNFjvu978wXsCHku5tfkDpbFn728
 ORgIUzE8Pj5aE/Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtkeegveffteetfffftdfgleeghfffgffggefhkeffudfhveefgfeggfegffdvnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtp
 hhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrthhthhhirghsrdhstghhihhffhgvrhesvgifrdhtqhdqghhrohhuphdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 07:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7284

The PERSISTENT_DIR directory should be shared along the sstate cache to
ensure that the hash equivalence database is also shared. Otherwise this
can result in bugs described in YOCTO #15921 [1].

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15921

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (4):
      test-manual/understand-autobuilder.rst: mention hashequiv server
      ref-manual/structure.rst: update with info on PERSISTENT_DIR
      dev-manual/start.rst: mention that PERSISTENT_DIR should be shared too
      overview-manual/concepts.rst: mention PERSISTENT_DIR for user configuration

 documentation/dev-manual/start.rst                   |  5 +++++
 documentation/overview-manual/concepts.rst           |  3 +++
 documentation/ref-manual/structure.rst               | 14 +++++++++++++-
 documentation/test-manual/understand-autobuilder.rst |  6 ++++++
 4 files changed, 27 insertions(+), 1 deletion(-)
---
base-commit: 80084a4cabdf7f61c7e93eda8ddbd5bc7d54e041
change-id: 20250708-update-sstate-dir-docs-8763b1387ff5

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


