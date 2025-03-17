Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A79BC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.47826.1742202393267363708
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bRusb9py;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 182E74328A;
	Mon, 17 Mar 2025 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KAWGnChFPaDypjmOnit5Dry2+iG090RXD8I3t+DOnR0=;
	b=bRusb9pya9OEUO06wIGulr4M6TU1Av4Bne7O7cQ0JBnvQs9TMUNlz0G1YRmkuxP1LsIOPJ
	g9qnQA9j0zfHpmgCT9vQxVQo2ifoVhFC517tOhGC/G1rhqStoAj0y/w8MOLqcNKFBl6bYq
	5wHAgg0E50Mv32wJnIXbaJ4tnUa7MCnuBjnAblXRnRfO5FLfTXKecwVGTjj0ZqgVVSJPFZ
	8OVvOYdKxN4591/xyhp4Yzsuq4N7OKrjvW0v0LPaHp5bYtr2stc4i2C93o8IRyWUVxHKXs
	J5Mesqk+kJrOD/P1P9SwKv2Xy512dwN9gH96UTiYJL/ivBARnhA8DOtTlScfMQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/11] Updates for upcoming 5.2 release
Date: Mon, 17 Mar 2025 10:06:06 +0100
Message-Id: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP7l12cC/x3MQQqDMBBG4avIrDsQR0KrV5EugvltByRKRkshe
 HeDy2/xXiFDVhgNTaGMn5quqaJ9NDR9Q/qANVaTOPFOxHPGgmDgtO5gz8LHFsMO49hJ79soXf9
 8Uc23jFn/93p8n+cFe09ogmoAAAA=
X-Change-ID: 20250225-release-note-5-2-updates-d32951d23978
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Ross Burton <ross.burton@arm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hkdnuR5Nn5gZDHmjeQirJAcIZ0MfLZ0PGEhMOzAf0LA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YVtUcnlquSaBohKCsQmVM4MXmYR7Lefhywl
 GtREdMO6XiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFQAKCRDRgEFAKaOo
 NoHcEAC/vUEzy4kZUWpZWCWmeSP68jZdKotkaHuDyXaUnW73ZcCqvGz/AjT+5dWRDo1RL426Gu/
 aNRCFHdGGQaB3N4wwOz6n6vJiKQkicU1XC2dNV149X0QL8FGZC6MiD1zNYrKSi04vj0RI65/M6S
 NWYF54QNzDgV9xeEHHxoNnOWfQ6HXyZ6HAAt7H9a7rEq60how2IA1c8QYYOb/IRvI9NpOYIqtZa
 BIphm/v6qOhEvyFhs7uQXN2Gwt6q2Q9qZ0RLmiqJ1hTtJpmpT2VFf4dHujRGq9NuMXx/YplWtWP
 Umio16OPeTJh9dICf6FJSNunW/XI8MdPle/dCN4VCMB1NZCdQZUUdGgyyo1EWuIaFZLbVov/uO4
 2E1yJpyjD/eoF0vQZ6f9vp/epcDpcqBCOt7XS0gTXCiL2ofNtJcOJ3i+NWooXMY+UV4+LwZ8MH+
 q33lO13THN4SExzc1qlx6QHPf2avP9Xf60LwH2s/U51r4xjMxWwauOaftz1f77CWSD6eWCLnDH/
 iwNy11JJxG4ymHwfhI5dk0W7M5Kb/D/MtB0satwM0vWhfy6SJjnGyF1yf6r/BgbccsAKRR8iBjR
 R/maUbA7hZyEsi86iCD5Wt+JgBiL/Vwu761C3wqlzINdNGooq2Ta6Kwwnh0vNT+RLhIodquSpyz
 YCBrRDpr3T2uJHA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduvdefkeffteeluedvgffhjeegffduveegfffghfejteejkedvgfeuvedtudejkeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6561

First series of patches documents the missing or deprecated bits of
documentation.

The last two patches update the release note and migration guide for
5.2.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (11):
      ref-manual/classes.rst: document the ptest-python-pytest class and variables
      ref-manual/variables.rst: WATCHDOG_TIMEOUT: fix recipe name
      ref-manual/variables.rst: document the WATCHDOG_RUNTIME_SEC variable
      ref-manual/variables.rst: document the MOUNT_GROUP variable
      ref-manual/features.rst: drop ld-is-gold
      ref-manual/variables.rst: document the MESON_INSTALL_TAGS
      ref-manual/variables.rst: document the NVD_DB_VERSION variable
      migration-guides/migration-5.2.rst: add information about autotools changes
      ref-manual/variables.rst: add a link for BB_USE_HOME_NPMRC
      migration-guides/migration-5.2: update for upcoming 5.2 release
      migration-guides/release-notes-5.2: update for upcoming 5.2 release

 documentation/migration-guides/migration-5.2.rst   |  52 ++++
 .../migration-guides/release-notes-5.2.rst         | 310 +++++++++++++++++++--
 documentation/ref-manual/classes.rst               |  15 +
 documentation/ref-manual/features.rst              |   3 -
 documentation/ref-manual/variables.rst             |  43 ++-
 5 files changed, 391 insertions(+), 32 deletions(-)
---
base-commit: e608902ffae3af5ab0c5308b0550e49a790482f0
change-id: 20250225-release-note-5-2-updates-d32951d23978

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


