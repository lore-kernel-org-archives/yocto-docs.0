Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3676C83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 08:52:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.76954.1753692752243281239
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 01:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N1fGcOQ1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B86E041DF1;
	Mon, 28 Jul 2025 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753692750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zp6q0H6LVy6ZyqKGrOv4yeKrxA+gWzUzfHv2baKuXJA=;
	b=N1fGcOQ1zQZ0eL8qzDhKpZ2GfU/5MNwA4Prhgp+LsH7MBbZIBf+RjZau7rjHN0yi3LDlhd
	ywJjQaJEvJtxCpj2LZeuqpnBPY1G9NeVEtI3SUU+8Ciyv/7BqDpREdAE+9Gfqf8iFtf1Iw
	zTnJUZ65hx8YJiZQv+rLK28RErvv057fMA/JTndJigquvd9OFZ3InqT2VENGptiFT+2Ic/
	iR2RsPgcc0vqpp4MC1t6xK4Cy0xTdCdGkdRzmKK9E0P7MgRPersuMkleVKJe28fDwFYHfc
	2HK+01WN+HF0kSZedWxZlsxgG5YZtom5ropDzn34Kb/uPBY3AnF2XtgTf9jhNQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/3] ref-manual: gather all QA checks in qa-checks.rst
Date: Mon, 28 Jul 2025 10:52:22 +0200
Message-Id: <20250728-refactor-qa-checks-v2-0-9e0737979f05@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEY6h2gC/32NQQ6CMBBFr0Jm7Rg6DYKuvIdh0dZBJirFljQa0
 rtbOYDL9/Pf/ytEDsIRTtUKgZNE8VMB2lXgRjPdGOVaGKimpm5JY+DBuMUHfBl0I7t7xIGGI2u
 rqDMHKOJcOvLeRi994VFiET7bR1K/9O9cUlijNi25tlHWdPpsvV8eMu2df0Kfc/4Cf07L2bYAA
 AA=
X-Change-ID: 20250723-refactor-qa-checks-f2f9e3b128a6
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MSCLZupqbiM33DPAP/XAa5+/qLWhVEgJce3tY4ZngVA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBohzpNP5u94RLvSLuwEa4MtN1Un1Th1LE2NfVjk
 p7nw5E83M+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIc6TQAKCRDRgEFAKaOo
 NuNOEACMc0lNQZ6SbCEaPOaEU/a6dPXbIiox846S1kb0ihevO7CgPn3kVBLqv7f7e5k+qXoiqu5
 qapIXiE6hkYxmUhWaTdOea+U+b6uefJk5pFP0PhjUkeXAcu5tmg7qAY9UNoLoPx3sY2c+Pm8MMt
 7fDHaOosmgcT79kGaSBwbggsLiN0IYuxz+7a55MCl7TQcwAuLwmS7+4NYQwypz/a27prh6bFH6a
 sLjY4sfHBwRYk+B51TRASO1daPv/Yy1Tylj6YXvAvLbQMJGCt6Aon+NG+DsWXBMWtSnQPT/uhW8
 4M60+8y8ef4D1gWguXMG8NS4EKTzyD/YRdFDKCwRkroRHv90i70tw5tsuqYC1/EPbcApxDOdcZw
 aJDEkkJ2ry5KWC91vSB5clx90dW4IKXNpRhCAcZjeoxD3tkDEszYuJyhsH+ptg2m4GYQO4F/W15
 2BCshaYqw8reCEnsJDu4gPCoi9qTP6+c+d5SZBd48fHh/VTGvbtc0Ayr1LWrB4+EJk86ad2Qwuj
 xuVNPnzQtJdv0XGndZ6Hkb9Wh0aiXGd8UtII+15pMoGPojJ2LFbz07mUvu17nT3J+wnK4XZdUxr
 9IS2KYkvzGOdoHpJJD8x13911rL0KuXWcjo7peWApQ0kPf6bMgmOF3O097EmtM+Gfa9e/8N8yax
 3nDurdXOOGMsfaQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdduuefhleevheeuvedufeegvddtffefveelfeeutdejueetleegleevffdtjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhho
 hhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Jul 2025 08:52:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7389

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Fix broken ref in migration-guide-3.2.
- Link to v1: https://lore.kernel.org/r/20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com

---
Antonin Godard (3):
      ref-manual/classes.rst: insane: drop cve_status_not_in_db
      ref-manual/classes.rst: drop obsolete QA errors
      ref-manual: gather all QA checks in qa-checks.rst

 documentation/migration-guides/migration-3.2.rst |   2 +-
 documentation/ref-manual/classes.rst             | 335 +-------
 documentation/ref-manual/qa-checks.rst           | 933 ++++++++++++-----------
 3 files changed, 488 insertions(+), 782 deletions(-)
---
base-commit: f9f1c87424d307d2df60024bc448bd6778605cf8
change-id: 20250723-refactor-qa-checks-f2f9e3b128a6

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


