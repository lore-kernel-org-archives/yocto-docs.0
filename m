Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AAFC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 07:48:56 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.7547.1751615326088454074
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Jul 2025 00:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bu392yY+;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1969449D2;
	Fri,  4 Jul 2025 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751615324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SfasJP6X3gTFj+jLmxN88SebNsRaop/wNxAZ672Q7F4=;
	b=bu392yY+i1Au5IF6O6S5aniXQTT22Pl8Tgv+cFTgLX5K6syK4iWtkP/YHqljyAZ5KfIu4j
	a/AMWG+OWvwUcAOjH6WuGFdv0B4agbw6lEJyTwPM5fN9pLcrblkaPARuvLJ6QRZPNA6939
	76kJX21rm+8yI/ZqCaEnTdVI9mHP80dqRE9hU+hFtsrEgz7wqSMeOZZyXdBzC9EcUvnk53
	JpDYZJqkhF+yjXZoUH3UOhGaqBqZfWeFafpeOi0KzZ6dKnaezCiZTUBWeIXhcM56C81c4A
	vZjCKcQodbaHlvWX83joMng7XIPFHDE40Go1ywEN4+txNULzEXUvdY6M6uvAwQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Jul 2025 09:48:43 +0200
Message-Id: <DB33T6SMVFVT.YFSEWJWR5MZI@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekjeeluedthffftdekveefvefftdevffefueduueevvefhueduhfdulefgteevueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Jul 2025 07:48:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7261

The following changes since commit 95691fa4e7d30ee27cb1280df20751bf449538a4=
:

  dev-manual: update list of recipe files showing version numbers (2025-06-=
27 10:16:07 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 80084a4cabdf7f61c7e93eda8ddbd5bc7d54e041:

  conf.py: improve SearchEnglish to handle terms with dots (2025-07-04 09:4=
5:54 +0200)

----------------------------------------------------------------
Bo Sun (2):
      bsp-guide: fix README link for meta-intel layer
      bsp-guide: fix branch listing command

Enrico J=C3=B6rns (1):
      conf.py: improve SearchEnglish to handle terms with dots

Lee Chee Yang (1):
      ref-manual/yocto-project-supported-features: update contact for meta-=
intel

Ross Burton (1):
      ref-manual: classes: add recipe-naming QA test

 documentation/bsp-guide/bsp.rst                               | 4 ++--
 documentation/conf.py                                         | 6 +++---
 documentation/ref-manual/classes.rst                          | 4 ++++
 documentation/ref-manual/yocto-project-supported-features.rst | 2 +-
 4 files changed, 10 insertions(+), 6 deletions(-)

