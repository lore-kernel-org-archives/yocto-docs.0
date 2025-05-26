Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC71C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:55:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.24362.1748246109404484170
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ohqNEp/3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B91F442D3;
	Mon, 26 May 2025 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748246107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ciYF+SCtj/+Cc93597zzhOhCQOesoDL0JhZcbeGxGS0=;
	b=ohqNEp/3UZoJ6eY0wZ5atyvvAyXScsLJldot1bMJLMBYbz2bxhSGuV4vWvikhgddZ/Ors7
	6eWZHHhtellDaD2gYFfCnRX0eiQ4/luBnfyp0cekQM4UEP1nqljpqJOJYc0fECoDnY01x8
	E59VT1KtYzNXJCkPe9vsH3Op/Ify++UQg4BrqCaxPgDLsF6CdPS07G+MrS/UdQ3jnkSbxK
	7LhbPJvakFIGM2fGI/9gAiOzTESPUtGVI2CMsGWZ1V2sw5vL5S1N5ayzJaPJZP093tjOpB
	s+c+s/mWTxHEzS2hAnbb/B8EcF2vOlpy4xsuoCg64EZA4WaVxaRw1r6kgFolYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 09:55:06 +0200
Message-Id: <DA5XIU4LD3X4.2X27RUZG7P7VS@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieeljeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggfegjedtteeiueetieejvdeijefgudeftdevhfffleduteehtdfhvdetfeelgeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:55:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6913

The following changes since commit 6b7019c13054bf11fb16657a3fac85831352cea9=
:

  ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS (2025-05-16 15:2=
9:37 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 953c203cff5f936b34530c150343cf54ade16653:

  brief-yoctoprojectqs/index.rst: replace removed macro (2025-05-26 09:45:0=
0 +0200)

----------------------------------------------------------------
Alper Ak (2):
      ref-manual/variables.rst: document INHIBIT_DEFAULT_RUST_DEPS
      ref-manual/variables.rst: document INHIBIT_UPDATERCD_BBCLASS

Antonin Godard (1):
      brief-yoctoprojectqs/index.rst: replace removed macro

Christos Gavros (2):
      ref-manual/variables.rst: document the IMAGE_ROOTFS_MAXSIZE variable
      ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable

Enrico J=C3=B6rns (1):
      conf.py: tweak SearchEnglish to be hyphen-friendly

Etienne Cordonnier (1):
      ref-manual/variables.rst: document SSTATE_SKIP_CREATION

Trevor Woerner (2):
      sphinx-lint: superfluous backtick in front of role
      sphinx-lint: unbalanced inline literal markup

 documentation/brief-yoctoprojectqs/index.rst       |   7 +-
 documentation/bsp-guide/bsp.rst                    |   4 +-
 documentation/conf.py                              |  19 ++++
 documentation/dev-manual/debugging.rst             |   2 +-
 documentation/dev-manual/new-recipe.rst            |   2 +-
 documentation/dev-manual/sbom.rst                  |   4 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/dev-manual/upgrading-recipes.rst     |   2 +-
 documentation/kernel-dev/common.rst                |  14 +--
 documentation/kernel-dev/intro.rst                 |   2 +-
 .../migration-guides/release-notes-4.3.rst         |   2 +-
 documentation/overview-manual/concepts.rst         |   2 +-
 documentation/ref-manual/devtool-reference.rst     |   2 +-
 documentation/ref-manual/structure.rst             |   2 +-
 documentation/ref-manual/tasks.rst                 |   4 +-
 documentation/ref-manual/terms.rst                 |   2 +-
 documentation/ref-manual/variables.rst             | 108 +++++++++++++++++=
++--
 documentation/toaster-manual/reference.rst         |   6 +-
 18 files changed, 150 insertions(+), 36 deletions(-)

