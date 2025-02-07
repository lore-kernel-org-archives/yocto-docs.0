Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1171EC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:03:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.65186.1738919028651732207
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FKAu0Kmr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B94A544495;
	Fri,  7 Feb 2025 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738919027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E71HwMJVC1YrY+RJKezjXO5EM5Iw8EkyoRuppAx6DSw=;
	b=FKAu0KmrwUCTqhothLoHIx9/6X2yoGweiEza48tuD0Yj7gjbJW9yUDuVp6Baq1mjtu6aoF
	MJOojuqaan+oTI2WygpqTV8BU/1lZVw2CQPWIcz3T2ZH/jDgTBYe4ZtwEFfYud1UPAsDHf
	JBpYSrGDgYbTHNRoIH/CUu6nuzrdQVZf/fusiUVmqXvaojM6w5d8flUw52zJhRfcFBYi6G
	+3lqCjf3Hvjbx4ULpz5zzQeMm6mQ7v1aRG6KZm6sgRi0ltQ6OICo08omFcUb/b8PjyDi4o
	Fqf3JUOip6ULiVxsfE/axUyguPVn2F6kbFP1j6nA6RUgCQCVrrw/TmCUmC01kw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:03:46 +0100
Message-Id: <D7M3CKH3GCY2.VJLU4F12XL9E@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekjeeluedthffftdekveefvefftdevffefueduueevvefhueduhfdulefgteevueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:03:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6281

The following changes since commit b1a7dd6d34a291e2250e7169f4f9d93e61700a63=
:

  dev-manual/building: document the initramfs-framework recipe (2025-01-27 =
11:49:59 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to c6dce0c77481dee7b0a0fcdc803f755ceccef234:

  migration-guides: add release notes for 4.0.24 (2025-02-04 15:56:24 +0100=
)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.24

Simon A. Eugster (1):
      documentation: Fix typo in standards.md

 documentation/migration-guides/release-4.0.rst     |   2 +-
 .../migration-guides/release-notes-4.0.24.rst      | 383 +++++++++++++++++=
++++
 documentation/standards.md                         |   2 +-
 3 files changed, 385 insertions(+), 2 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.24.rst

