Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA65C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:55:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.24364.1748246110992539609
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KaDI8mXA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93925443AD;
	Mon, 26 May 2025 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748246108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fFkoa739T8TIXqhGdzlRKEIlViob36oJkdBBE3t5JiI=;
	b=KaDI8mXA0IoqRGR8zs154/doiefno0IlPovnjmY7bXfxvF7a5b+alQnJ6GYGDFTRAy/E41
	CiVHvfSfpZhHQxTPaCFBAVTe7aqDCsBCt4JE9pwy0HSvlSSYDfcWUzEnkqzQvjZfjFJYB7
	NUXA7YDNP3T3gCGM/a9eetFrLlaoDZTuF15ailnHPrxD/lwqFDmTI9MFgVlYy3FBE7A/iA
	wuo3DVx4gXtA/iySjyD8Tmz+ZQLzE4YUkabWjqsYz5dNstVWXYTK3FMFmphmqfzopttWG6
	N+FT0MuNIeVCfkiay8RXpwTT8XXOUfhfRadtBxKKDYlizPaHv42wHjq0nC2yjw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 09:55:08 +0200
Message-Id: <DA5XIUSKFYYJ.28HABXSV87HAU@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieelkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekjeeluedthffftdekveefvefftdevffefueduueevvefhueduhfdulefgteevueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:55:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6914

The following changes since commit 38706f0e743447da9a39a6369620fa039ab6df3b=
:

  ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS (2025-05-16 15:3=
0:43 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 3996388e337377bedc113d072a51fe9d68dd40c6:

  ref-manual/variables.rst: document INHIBIT_UPDATERCD_BBCLASS (2025-05-26 =
09:46:38 +0200)

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
      sphinx-lint: missing space after literal
      sphinx-lint: unbalanced inline literal markup

 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/bsp-guide/bsp.rst                    |   4 +-
 documentation/conf.py                              |  19 ++++
 documentation/dev-manual/debugging.rst             |   2 +-
 documentation/dev-manual/new-recipe.rst            |   2 +-
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
 documentation/sdk-manual/extensible.rst            |   4 +-
 documentation/toaster-manual/reference.rst         |   6 +-
 17 files changed, 146 insertions(+), 33 deletions(-)

