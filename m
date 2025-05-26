Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254C0C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:55:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.24365.1748246111395785838
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=byeX4W14;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10BC0442BA;
	Mon, 26 May 2025 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748246110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6UVjB3rKWDRW7pUROfsX0uekHlQ+koqbd4i3Np9g+wY=;
	b=byeX4W14QjZ+BWmb8XVmmDaIEEIx7M+DsRyna+eyQTMJdkrBO5F/7PRI7cVjt9/H2eyoQm
	mmmrouuYiXS/k8e/tBgkNjeTF0jFZoFh60osQCv563iZU43ceoOP9yA7fFCm0aVcz21odF
	9WVqon6QTWcXTYwLvXsHUkCYYycMxikMi93Pt3timUj2YZ9Qf9E3hUowGx7HJuRQkAzld1
	3c28Ds9vcpqbklC1hzxZtj8QG37KmIneFQIoyxN8UkODlJ1ke6sBDMYh9N2UpHqHs3KOj3
	2txbjAVC51rr2GwLHMVLm8tOYHPw9nEqBy3Es1LAoxukfsdNboU9X2VtSqTszQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 09:55:09 +0200
Message-Id: <DA5XIVGS7H74.1CU9PJGVE625V@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieeljeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggfegjedtteeiueetieejvdeijefgudeftdevhfffleduteehtdfhvdetfeelgeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:55:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6915

The following changes since commit 8e893cc8cabba4b4f21556561d1ca9656ca1ff9f=
:

  ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS (2025-05-16 15:3=
2:51 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 76a4dd5ce041b38f4cab714017a38b035d9530a3:

  ref-manual/variables.rst: document INHIBIT_UPDATERCD_BBCLASS (2025-05-26 =
09:48:14 +0200)

----------------------------------------------------------------
Alper Ak (2):
      ref-manual/variables.rst: document INHIBIT_DEFAULT_RUST_DEPS
      ref-manual/variables.rst: document INHIBIT_UPDATERCD_BBCLASS

Christos Gavros (2):
      ref-manual/variables.rst: document the IMAGE_ROOTFS_MAXSIZE variable
      ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable

Enrico J=C3=B6rns (1):
      conf.py: tweak SearchEnglish to be hyphen-friendly

Etienne Cordonnier (1):
      ref-manual/variables.rst: document SSTATE_SKIP_CREATION

Trevor Woerner (3):
      sphinx-lint: trailing whitespace
      sphinx-lint: role missing opening tag colon
      sphinx-lint: unbalanced inline literal markup

 documentation/brief-yoctoprojectqs/index.rst     |   2 +-
 documentation/bsp-guide/bsp.rst                  |   4 +-
 documentation/conf.py                            |  19 ++++
 documentation/dev-manual/debugging.rst           |   2 +-
 documentation/dev-manual/new-recipe.rst          |   2 +-
 documentation/dev-manual/upgrading-recipes.rst   |   2 +-
 documentation/dev-manual/wic.rst                 |   2 +-
 documentation/kernel-dev/common.rst              |  14 +--
 documentation/kernel-dev/intro.rst               |   2 +-
 documentation/migration-guides/migration-4.0.rst |   2 +-
 documentation/overview-manual/concepts.rst       |   2 +-
 documentation/ref-manual/devtool-reference.rst   |   2 +-
 documentation/ref-manual/structure.rst           |   2 +-
 documentation/ref-manual/tasks.rst               |   4 +-
 documentation/ref-manual/terms.rst               |   2 +-
 documentation/ref-manual/variables.rst           | 108 +++++++++++++++++++=
+++-
 documentation/toaster-manual/reference.rst       |   6 +-
 17 files changed, 148 insertions(+), 29 deletions(-)

