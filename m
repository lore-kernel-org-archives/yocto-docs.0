Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D49CC83F22
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 08:34:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.9154.1752222853755161738
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 01:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AkQKsCC8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96F31204CA;
	Fri, 11 Jul 2025 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752222851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U6THJN4cZN+zbZfvYxDpwfw1ySz9zEvX6GPCgq5Ej2A=;
	b=AkQKsCC80wW9OPMLnn/LkO5/rV/YHqDfMZ3HIqItO6i7TldXLQ2E29/V/kWYhoe2PAkX4h
	oozxzXtcv529tS65Dwi2EBvfWQ3ikHCwidRljd+wqOR4Opc14YmFofDTbEiHzG4lZD9rO9
	8ZXN4T+x/RSCCsIAKxnvXATrcnGx9blxv2CxUE97qWK5WJf5S7zgDtKo3fmnOmSwzS1Naj
	yV49PtAuY2V1C9Xo7xvtDOIelVefb9xAtpo4qEjLJiWp17AXwoiy0t2u/zquq23eogcoLN
	sTXfKKdAks+wuKDhfdLRd+c2FCfpXPeQoZ6cDikmkLMTqI9aAQIU8QBhLlB4sQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 10:34:11 +0200
Message-Id: <DB935TAG41UK.3CF595Z5M5SHV@bootlin.com>
Subject: [walnascar] Pull request
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7311

The following changes since commit 85f8e5c799ef38c6dcca615d7cc6baff325df259=
:

  ref-manual: document KERNEL_SPLIT_MODULES variable (2025-06-27 10:39:47 +=
0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 462059ebbf25ed362a5ace1987f0684444441a7f:

  conf.py: improve SearchEnglish to handle terms with dots (2025-07-11 10:2=
9:52 +0200)

----------------------------------------------------------------
Antonin Godard (6):
      poky.yaml.in: increase minimum RAM from 8 to 32
      test-manual/understand-autobuilder.rst: mention hashequiv server
      ref-manual/structure.rst: update with info on PERSISTENT_DIR
      dev-manual/start.rst: mention that PERSISTENT_DIR should be shared to=
o
      overview-manual/concepts.rst: mention PERSISTENT_DIR for user configu=
ration
      overview-manual/concepts.rst: fix sayhello hardcoded bindir

Enrico J=C3=B6rns (1):
      conf.py: improve SearchEnglish to handle terms with dots

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.28

 documentation/conf.py                              |   6 +-
 documentation/dev-manual/start.rst                 |   5 +
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.28.rst      | 224 +++++++++++++++++=
++++
 documentation/overview-manual/concepts.rst         |   7 +-
 documentation/poky.yaml.in                         |   2 +-
 documentation/ref-manual/structure.rst             |  14 +-
 .../test-manual/understand-autobuilder.rst         |   6 +
 8 files changed, 258 insertions(+), 7 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.28.rst

