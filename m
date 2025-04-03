Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70CDC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 14:08:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14286.1743689330307860993
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 07:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lkHgbTOu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25D4F443FB;
	Thu,  3 Apr 2025 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743689328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TNGPWN8buKBRdy/fxKkkWBxT7ODVD2wqtYPmyrAEUhY=;
	b=lkHgbTOuNtbyrC/IyYQnTMbSmkSlOrR0izqcIMViXgnOgAlqJU9d4mi32L5MBPsh4IyhYc
	YCa4BV3T63bUimbTnrcY6dQyTkvfpolh+tjl6uz/T2u4o+m7OsYy+wgICx+SxbWJIKBJA2
	OlhWs5s4h9wbDmiAJNgwLRa298rVHxLWiew3pVFTFWrO4YYPMhvuWEmEg0WVMW4mj/5hyk
	IJmKrb85Hn8VDdxQR1rMR2HA2dkkhmOwtG/2fTYvyKf5RK9Dlwq9t9CazgThuWbLBjRXDv
	Fz2JJ8qEQRsQy1SzxBUpLwQcDZGBxUlS+lUT3JvvN8Ijk9lZrjyA841j8x+TYw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Improvements and fixes for the 5.2 release
Date: Thu, 03 Apr 2025 16:08:27 +0200
Message-Id: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFuW7mcC/x2MwQqDMBAFfyXsuQtJNCD9ldJDqE9dkCjZtAjiv
 3fxMjAMzEmKKlB6upMqfqKyFZPwcPRZcpnBMppT9DH53ndcsSIruGwNnDjydx9zg/IkhxFDDqF
 LKQweZJO94g72eL2v6w9TgH4vcAAAAA==
X-Change-ID: 20250403-release-note-5-2-updates-fixes-e8a11355180e
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ggOjt1IOp4RLSrcyrqNL/LgOv/ePduNQItrtgnc147Q=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn7pZvrSUesj6EpPUOIsuKKVXWVWjbLllCLP4ae
 uGMMS+4F86JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+6WbwAKCRDRgEFAKaOo
 NrQaD/wMYIKK7xxhz11x0g8pSiTj9QPvH1S5bHrQzSixQGBObhht7kk8xsB6KiJL2TA3NhpKF4x
 XUGmHO4Fi0ywXmM7ANbA9ypKDsJ8r9pgEpWQJiy/clM8SqUWgTKXLkparqDB5n71rXdtlXGEcHr
 jSfQ4x8JTBko4ztRS2E6DL5diuQNc6ifYY7FXG04PQ+Zh1nrNMgrDQagmwNw4FHps0MEQEE+MLC
 OS6Cz67TAxCqPjeK5Rurk7qdzTJEnovCH+Hkecwwsvc3vBfqt4xUe+22LRCbCYT53cTE2aOZpB4
 qOxfbDy3kEzKERToAT9Us3hn46sH73Hr5DROcrL6UHBn9rJPI166sTuAmaGZ63IR271gNgT78vt
 n7xEfqGuMPyKmmJoOlFLzO8yg2tqqkyrg7w6TvVbDe/F+ii8/S5hLsu4oyUrCayUu0Xi29+UpCb
 QtbBmZZXQ4pvgbvyD3Vuh1ZkilQEAZei7IjPIm+vvTDhNN6CRSjVxCSiDUOtMlKbGvMn254MHTD
 HqAMSZ+Gfmo3tJ3LSpFFgXgMBNGljmExxkPau0GTBZSx6aD/jGR57FKUR6Bvpp0TP+eOQsCgvzn
 Aod0Kbd4MlwRCs/hoSxjQgtsl9Kz6pNtJ1COhE0dn6dagqTFxpDHvdvvlbyZ7X5euhe0WgBz8Gq
 FCdB6wZ/9pM0g5g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduvdefkeffteeluedvgffhjeegffduveegfffghfejteejkedvgfeuvedtudejkeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtr
 dhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 14:08:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6704

Address some of the reviews on the list regarding the release notes and
migration for 5.2.

Previous patches were already merged so address the issues in separate
patches.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual/classes: ptest-python-pytest: improve the current documentation
      migration-guides/{migration,release-note}-5.2: improvements and fixes

 documentation/migration-guides/migration-5.2.rst     | 10 +++++++++-
 documentation/migration-guides/release-notes-5.2.rst |  7 ++-----
 documentation/ref-manual/classes.rst                 |  7 +++----
 documentation/ref-manual/variables.rst               |  2 +-
 4 files changed, 15 insertions(+), 11 deletions(-)
---
base-commit: 7494df521ed9c70e877dbdef1adfe38ad717682f
change-id: 20250403-release-note-5-2-updates-fixes-e8a11355180e

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


