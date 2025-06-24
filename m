Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773FBC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 11:53:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.6389.1750766037032270346
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 04:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bUBHKoCq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FBCF43B32;
	Tue, 24 Jun 2025 11:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750766035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C3gQt/IsdNk/BSX4DSvl5uj9HJLB6tr4WSxI7kA6IUs=;
	b=bUBHKoCqe8ZJXGZb/On5lG650Qhfrig5WPvd6sNEL9K5SYGIEgqrs6XPRn603tv4yE5Aa1
	H9lfN70HCA83Nf/wJKwrLmYaghf7/cMp6xEzwzwGaeCSbSy7Tmg125+qEMkgXYRL3Y0sGr
	zy8ORE5d6Kizi3PMi8ZpNZgPVQ41AZOB7DEeIT1sYmmqpWHB2Nz8JYYKX32Ho+2JzA8zxg
	i1E5qI09GlFK+jE74GYYRFTYTgPOnK8pAaIKmq2YNnXRh69khiP9rF18Hpw4e4+gwlIQsN
	fT1Jxxr6Mzzsg6AzNB+s7QmcWYVWyK22lsFXfTZgu9oP08TY1KKFyTmsZdL3Ow==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] migration-guides/migration-5.3.rst: add guidance
 for breaking WORKDIR changes
Date: Tue, 24 Jun 2025 13:53:49 +0200
Message-Id: <20250624-migration-5-3-unpackdir-v2-0-3b258b758b27@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2RWmgC/4WNQQ6CMBBFr0Jm7ZhSBaMr7mFYQDuFidKStjYa0
 rtbuYDL9/P/+xsE8kwBbtUGnhIHdraAPFSg5sFOhKwLgxSyEa0848KTH2JpYYMnfNl1UA/NHq8
 k6TIqQ1RrKOvVk+H3br73hWcO0fnPfpTqX/rfmWoUSKYlI4Ru1Ki60bn4ZHtUboE+5/wF8tWru
 MAAAAA=
X-Change-ID: 20250624-migration-5-3-unpackdir-9e2e7bcfee1d
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Alexander Kanavin <alex@linutronix.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rvToqYyG6IRRE/xL6CcZ9CtfQF206lQlyHwFPCRfd8M=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoWpHSqsj1mTkLWcKMOtGAFRQoOWmW+3cI2CjJp
 G2HW36PuAeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFqR0gAKCRDRgEFAKaOo
 NpU1D/0QvumvAWDq+NbQ7Fr7+a3ZJM9+WfLM6UBWffF1clCDpMxrPPICsQIBkzM6mNjaqK7BuAe
 CjBy+8SlJy6GT/1d9jUe9K0B0BwmCDLzQICn0PjPxoEMMMK4eJuzEfUOvXXZXNap4QuyJejMMJl
 3q/RCC3mAEJueqmP12SZcADxriPvi7T7/hbV3XJCW6vPXof03BHSxIF2rgRwyZgv6+bFdsqmMNh
 94L+c+39mFpnXQCfS2pbekZn459Zn8RM7IuW1zgWqHMECE4EXkoCEWHc7zjjqAYZwCq/T8MeAE9
 CHHvXEVm5O1jd8aE/6c2qPZ6ZJ5dTTB+afOcu9Dk2w6WwdprfC7nmmEPJLW97qtf5IBtQL1IWAO
 p2jTo2t5kyGPoJmpFlLz/JU4aTCMATU+qkUWxnZx5UfNsdEQdJMfGyD/YLfKI1NmirEB0GyFdif
 XngigEZB0p4lcKH5gv9GJCpDoa6bCUfTx1GkUgJgbvTugM4njciq1aUxewwLzRwcmZYZEqg8XAR
 m9lNarLDahP49DKprYz5sUbBUgqzOEwn0ZuLNs2oiLAFsIQIZUhZg9PhenRarRMNwkxM1ZRcl0S
 J98yjWREafAGoBkOuha+QSXmplPoT14vV+lHvD0OXbMVJF0d+8fkeNHpo2fl8eNXxeEhHNqi/t5
 FcMpGTPlVYiIidw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdduuefhleevheeuvedufeegvddtffefveelfeeutdejueetleegleevffdtjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepr
 ghlvgigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 11:53:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7212

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Fix BB_GIT_DEFAULT_DESTSUFFIX link in description (thanks Alex)
- Link to v1: https://lore.kernel.org/r/20250624-migration-5-3-unpackdir-v1-0-ef6ef00d5cbc@bootlin.com

---
Alexander Kanavin (1):
      migration-guides/migration-5.3.rst: add guidance for breaking WORKDIR changes

Antonin Godard (1):
      ref-manual/variables.rst: document BB_GIT_DEFAULT_DESTSUFFIX

 documentation/migration-guides/migration-5.3.rst | 50 ++++++++++++++++++++++++
 documentation/ref-manual/variables.rst           |  7 ++++
 2 files changed, 57 insertions(+)
---
base-commit: 8a64ef83efcd5df70706a651751c8198f7c27c13
change-id: 20250624-migration-5-3-unpackdir-9e2e7bcfee1d

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


