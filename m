Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E768C83F1D
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 08:34:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.9156.1752222855369326376
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 01:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cUQEnCda;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F6944320A;
	Fri, 11 Jul 2025 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752222852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1bTDSxAFH7Dt/a2OPKDA1Ev69vVXoMeiTSl+uUErAbc=;
	b=cUQEnCdaHYhbAfsiMyMP2Ox+hWF1GF9f/n/fMEbvskqgD8qmbldAY/ba+qerd+aGeUzqam
	CrKwb12Cxkki3B4G0BqhiCYtRSWmxRQpUIWqlF31zNa6nWSeK4pWMwozJXupegQ4H78tj8
	BVdTxrF2mJMFd+Ds2FeMP/nMjyRCUjDxx9bNaHdqYhLwLtW7qlyTUjco+9jLt8jO5G+pxn
	tmrbLp+7/4uRGYcIquyOaPuN6T+C5/I2pXOtXTFLg8FvXeAvEyOawxqReXXn7oCA8qzKsS
	k7omLMg4Ua0ECL/6rPisyR9jw6HeLH++eStCP7mUgcj3Ilq/zvG33UDJwpPjfA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 10:34:11 +0200
Message-Id: <DB935TI11LAB.Q7HL5BI8FXOS@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehfeehkeefkeevgfehtdehffdtiefgteeiffelheefgffgieekffetgeevuefhgeenucffohhmrghinhephigrmhhlrdhinhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 08:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7313

The following changes since commit 80084a4cabdf7f61c7e93eda8ddbd5bc7d54e041=
:

  conf.py: improve SearchEnglish to handle terms with dots (2025-07-04 09:4=
5:54 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 576677eae6960dbc2d2ececeba0fde5bba7bb69f:

  overview-manual/concepts.rst: fix sayhello hardcoded bindir (2025-07-11 1=
0:14:42 +0200)

----------------------------------------------------------------
Antonin Godard (8):
      Add a document on limiting host resources
      ref-manual/variables.rst: make reference to new limiting-resources do=
c
      poky.yaml.in: increase minimum RAM from 8 to 32
      test-manual/understand-autobuilder.rst: mention hashequiv server
      ref-manual/structure.rst: update with info on PERSISTENT_DIR
      dev-manual/start.rst: mention that PERSISTENT_DIR should be shared to=
o
      overview-manual/concepts.rst: mention PERSISTENT_DIR for user configu=
ration
      overview-manual/concepts.rst: fix sayhello hardcoded bindir

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.28

 documentation/dev-manual/index.rst                 |   1 +
 documentation/dev-manual/limiting-resources.rst    | 138 +++++++++++++
 documentation/dev-manual/start.rst                 |   5 +
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.28.rst      | 224 +++++++++++++++++=
++++
 documentation/overview-manual/concepts.rst         |   7 +-
 documentation/poky.yaml.in                         |   2 +-
 documentation/ref-manual/structure.rst             |  14 +-
 documentation/ref-manual/variables.rst             |  32 ++-
 .../test-manual/understand-autobuilder.rst         |   6 +
 10 files changed, 419 insertions(+), 11 deletions(-)
 create mode 100644 documentation/dev-manual/limiting-resources.rst
 create mode 100644 documentation/migration-guides/release-notes-4.0.28.rst

