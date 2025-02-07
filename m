Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10ADFC0219B
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:03:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.65184.1738919025503943782
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WbwtXvPe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 626A2441ED;
	Fri,  7 Feb 2025 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738919023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SSjFX4bfhMc9U5wT++mueaplvaFUo2hL+kDJECkqsBo=;
	b=WbwtXvPeTSOb9dO8viu3XO4brlEDCFyIh9yatBWqQMH/gDwELrR0WLuHVu2mr1MCf26SzI
	1TKYduSjNiNLuhUgw2H40G2UuDWjne1DaQbtKqUjJjH9nmtLyoxxAzNA9gPHOBgZZAmcl+
	sTG7Z+T0DXxbfnQmFvHkg/3MjlZwDScfHft/+SFoSmwZMxi9jbgwjc6WolLRItgSN6cIdE
	qBj3b/MALsC20N6853ANROpB/4OQo7iCQ3a954WGQ6J0s3HVEoAK/5f5mvWyTykayK9a6A
	31zL4Zdk8BVvrT2icHb0VYkGXp8WQhdkdUBvZ4l5crU2ZhyiAILKRpgN9Dy37g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:03:43 +0100
Message-Id: <D7M3CIZWMMJQ.1MGAD6XL0RYVW@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggfegjedtteeiueetieejvdeijefgudeftdevhfffleduteehtdfhvdetfeelgeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:03:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6280

The following changes since commit e1aa69d00e20a5d3c948c430ed10eb01e7baa574=
:

  dev-manual/building: document the initramfs-framework recipe (2025-01-27 =
11:29:27 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 0e9cc7e9ad5c8bbd7f12a192bff103c118d7f7bb:

  migration-guides: add release notes for 4.0.24 (2025-02-04 15:55:59 +0100=
)

----------------------------------------------------------------
Antonin Godard (1):
      ref-manual/faq: add q&a on systemd as default

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.24

Simon A. Eugster (1):
      documentation: Fix typo in standards.md

 documentation/migration-guides/release-4.0.rst     |   2 +-
 .../migration-guides/release-notes-4.0.24.rst      | 383 +++++++++++++++++=
++++
 documentation/ref-manual/faq.rst                   |  22 ++
 documentation/standards.md                         |   2 +-
 4 files changed, 407 insertions(+), 2 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.24.rst

