Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C06BC8303C
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 08:34:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.9155.1752222854054683522
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 01:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jKGTdFdO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAD0B41C93;
	Fri, 11 Jul 2025 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752222851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FNBJZbyCv3vbJRgyqTphX0gf0nN4CzHiczihHNwJjS4=;
	b=jKGTdFdO4JsCYaj9MSZu/j00xDYB9mADYsOwovWxoTBApzxjQBGpg6HuLf7HwCEmcyJ9PA
	pL0a2uj1kn8S28Nr5T0VWJPuHVxynchdgBB7xUYzgKpVqeKKq0vjnk06ARYtO0K8fd0SgV
	xVqyxIFndltC1B+BGAL79CHU4CUprI32+IdXSWcstG915eXQ7qaM5RZImEjqZRpgRsk//p
	JHZI7pMJdSESyLYrTQcYHgpC3m/WEtAuSh4M3kLUPzg/cxMBuT5j7I7p9Dyuc0bocyeCid
	JwNkBtAcG/kZeV3HI0931766Rm2cJEnr92ysuENsfVxhmP5RgX4ydIrXc1gL2A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 10:34:10 +0200
Message-Id: <DB935SV06QXJ.2WABJPS2VY7C4@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggfegjedtteeiueetieejvdeijefgudeftdevhfffleduteehtdfhvdetfeelgeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 08:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7312

The following changes since commit 9de9f17abfc6ee11ffa599e45eff8bafd6de801c=
:

  ref-manual: document KERNEL_SPLIT_MODULES variable (2025-06-27 10:39:47 +=
0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 02cc810c17e37563a206629d703dc21fc4280cbf:

  conf.py: improve SearchEnglish to handle terms with dots (2025-07-11 10:3=
0:41 +0200)

----------------------------------------------------------------
Antonin Godard (1):
      overview-manual/concepts.rst: fix sayhello hardcoded bindir

Enrico J=C3=B6rns (1):
      conf.py: improve SearchEnglish to handle terms with dots

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.28

 documentation/conf.py                              |   6 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.28.rst      | 224 +++++++++++++++++=
++++
 documentation/overview-manual/concepts.rst         |   4 +-
 4 files changed, 230 insertions(+), 5 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.28.rst

