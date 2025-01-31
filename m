Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02C6C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 11:14:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.17001.1738322067526285247
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 03:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WKHdjawq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BED3843196;
	Fri, 31 Jan 2025 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738322065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UU7Nnqb+51B4afuZwgDED7tJEZFoU9vSG8lOiDUd0uE=;
	b=WKHdjawqBlQ+J5mOf1RtmE1bRuRl2VAHidUFDSd8YzUkz7YLH2dyIIENN8cHORkegb6Qok
	d9qtDneKePZPMhSLZ4fj2OBslp8pKACFWfEMp3/CbtMF+LUm8f07Qo1VscIEeVKW59qLhy
	VW5yj8QDuLLqGb+fpZoyfv33qWKTcYARnfVbyZKoEeKJXph3jlnHONtMYYhN2CSXoR9dnm
	wYTGa3Iq2RV9UDzbe60k0efL/x3ddA0NQbwCbV3Su60PTI6OeCoXI6aitxBueIJ3ZDzyx5
	Wx9qjc1mjs9YPv+0UP58eB50dMmLOY2wZCxzakmjmFnQlk1v2tVBs0zdR1DRaw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs][PATCH v2 0/2] migration-5.2: Add entries for virtual
 provider and multiconfig changes
Date: Fri, 31 Jan 2025 12:14:14 +0100
Message-Id: <20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIawnGcC/4WNTQ6CMBCFr0Jm7Zh2+LG48h6GRQsVJhFK2ko0p
 He3cgGX38t739shWM82wLXYwduNA7slA50K6Ce9jBZ5yAwkqBaSWpx59DrmFtZI+FoHHW3A3jS
 yNILMUNaQt6u3D34f3nuXeeIQnf8cN5v8pf+Mm0SJrapko6tLo0jdjHPxycu5dzN0KaUvsssYa
 bwAAAA=
X-Change-ID: 20250129-migration-5-2-updates-cb613b02bd35
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nnaH5C0Lmj0uAH6bL9RvlwgochHkso8UFXwGqVzpaKQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnnLCR9KGuqXedgCuoBeSgfFQDsNn/x40W7V798
 O0W8ftQhwOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5ywkQAKCRDRgEFAKaOo
 NhkvEADDX+QSG5G94H2cEdNyXLNxyKoQWRTP/o+R5h1l9Kgn5QGgZbEzBodwlN2nsktMhYlwd2M
 7yU8s14KlX03YI/WG6GhspMbIMNlKUVPuhtFKteyYxOSOuY/wmcvktY920Qz5qtws7KEdmHbT7W
 kHknBBgdXydYuO80+YbQNN8a/zjbugkaMimuMFv1Yuz0WVXEGVoXKQiNod5MddR7iQbgGje2LG1
 OR7lJMPVnhiEf4TaROl6Edg1TZjDVl+X/PGOkLNF9Y2R6ovIunw9DpXmuy3bKYRn9w3Dr76+udw
 IdhcSGro+CpyeZpmNUDQAOVnIXAA8ffvhsNcTYqNuzwI+uIjfbb0t4b4yZwY1P3Zmg6waWmjpES
 Y0lrFTz/6tUXU+cKzW/3N5REkLwluVW27Q5W5vMkuI7ocsGOO1Gr1Pdo5c375bccE/IA+kolZjD
 DO3KtWeES7VJFnIbCyj9Zl7M7NS+HscRVmiKIJvhOpco6QLWq+mruhveFR+xlG6y/bkfpYlX4BU
 gtTPc0zGSurEX0lApaj8EBcY13uDDELriWVhhDRoFzNi/6PwTrWwUQpScfWlrSE4Lzi0juZIE/4
 RmEnC+AD/YJl2IZCVEu69QyYBgu9eCxkYYRrw4N84F3OP0FaFoiblr7YMtQzWGYhNTt7WxXdu1t
 N8xgL9Y2hn1MsnQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeugffgueeuvdevhfdvheffjeduudejvefhieeufedtvdfgkedugeefteekueffvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 11:14:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6225

Notes:
* original patch by Richard Purdie:
  https://lore.kernel.org/r/20250126111850.2609298-1-richard.purdie@linuxfoundation.org
  This patch is just reformatting/typo fixes.
* The BB_CURRENT_MC should ideally be documented, but that will come at
  a later point with
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=15709.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Split BB_CURRENT_MC and virtual changes in two commits
- Review from Quentin (thanks!):
  - virtual changes:
    - Add more examples to instruct how a user should migrate
    - remove spurious "-" in example
  - BB_CURRENT_MC:
    - suggest to update logic based on BB_CURRENT_MC
- Link to v1: https://lore.kernel.org/r/20250129-migration-5-2-updates-v1-1-98416a476828@bootlin.com

---
Antonin Godard (2):
      migration-5.2: document BB_CURRENT_MC default value change
      migration-5.2: add virtual provider change

 documentation/migration-guides/migration-5.2.rst | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
---
base-commit: e6745669cc26de8f61d5d1ccdd5a95b552eece97
change-id: 20250129-migration-5-2-updates-cb613b02bd35

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


