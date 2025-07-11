Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC11C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 08:34:16 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.9245.1752222853040405902
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 01:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Lzbe+HVM;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16E2C4313F;
	Fri, 11 Jul 2025 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752222851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5RzEWqdNS1zItATJQhvlJ76DHCk68gncepLXbNxmkYo=;
	b=Lzbe+HVMWxv7/ViQbSZGB2Ksy+2KHwtS4bsXCT0CZ0j8ktgv6bSf3xhRXcb8cRx7DCn0Du
	ia4ho0ShgeU9L/0ak+Uiqu9H8qiLxAn39wZ/UT00GRWm2ca6LiDda58rhXa0hiTYLuvnjV
	E9vHok9oB/O4QuoC4k1vpJ2AvG5pjv8/xg3tXcOBpAZXRYRx8pQ94pem0u+qK7fYIuugaT
	rflUEM6LaN5UOgKspXdyAWvGcrRk+nXubvk9xdSNCp1sKRm8agQ7zMP0f0Lv3rrlzSNzmE
	gJq2XfiOMDUmqrZ8Rrcq639qofwyFPRHxA3A2FiU3KsaeMrWZsL6xJXYxxj/RQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 10:34:10 +0200
Message-Id: <DB935T2TPKV1.42GFG4F4NTBM@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekjeeluedthffftdekveefvefftdevffefueduueevvefhueduhfdulefgteevueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 08:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7310

The following changes since commit 80b3bb27e4efa73b982f4bfeccca4deedf78c0d7=
:

  ref-manual: document KERNEL_SPLIT_MODULES variable (2025-06-27 10:39:47 +=
0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 3f88cb85cca8f9128cfaab36882c4563457b03d9:

  conf.py: improve SearchEnglish to handle terms with dots (2025-07-11 10:3=
0:38 +0200)

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

