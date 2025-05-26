Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9DDC5B542
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:55:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.24281.1748246107584802362
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BgJ8cEQC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B69B41DF1;
	Mon, 26 May 2025 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748246105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jt5dxXaG2y1Px3MZE9cuaKGrkzjKvsghBOKcIaF7u5Y=;
	b=BgJ8cEQCyvK+bvEVy2TQuDRtfVAauX4HwdvYZem561MImqRzT746aYkJ9re/lttzAhgxcv
	MIzRX9AYn2c9rH1aCsmS1jNQRmQ0xKrpWLZVeNtWdmXRi/jA2cNVqyfkhBjjQHQN9VBujt
	UWGtRawme1lHSh8KUT3yNxCzA6KaXpbWWk+nb0H/MaldKOqHcogwKji9zxTXUbBQvUwkXF
	CWArspghIfWlYMyTp1apyYU/bza/PE/UAxuSsQ121yYUNQCdBbSPkVJCtfCjIXTM+MXq+J
	22nnpRNR2zPeZe2ukq+3y10UKvzogWsWWKH2TfH5z1ibj6XTrC5oTFiV7/ISVA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 09:55:05 +0200
Message-Id: <DA5XITD3FC1U.JVKW0YODM7R@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieelkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekjeeluedthffftdekveefvefftdevffefueduueevvefhueduhfdulefgteevueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:55:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6912

The following changes since commit f2e3cf2637ce3ed3475faa472b134a29f019681b=
:

  set_versions.py: mark Styhead as EoL (2025-05-16 15:33:37 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to f72fc69e2d2a074d5eaf1cc36b30726de58e3ab5:

  ref-manual: uboot-sign: Support firmware property in FIT config (2025-05-=
26 09:37:20 +0200)

----------------------------------------------------------------
Alper Ak (3):
      ref-manual/variables.rst: document INHIBIT_AUTOTOOLS_DEPS
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

Jamin Lin (1):
      ref-manual: uboot-sign: Support firmware property in FIT config

Trevor Woerner (2):
      sphinx-lint: superfluous backtick in front of role
      sphinx-lint: unbalanced inline literal markup

 documentation/brief-yoctoprojectqs/index.rst       |   7 +-
 documentation/bsp-guide/bsp.rst                    |   4 +-
 documentation/conf.py                              |  19 +++
 documentation/dev-manual/debugging.rst             |   2 +-
 documentation/dev-manual/new-recipe.rst            |   2 +-
 documentation/dev-manual/sbom.rst                  |   4 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/dev-manual/upgrading-recipes.rst     |   2 +-
 documentation/kernel-dev/common.rst                |  14 +--
 documentation/kernel-dev/intro.rst                 |   2 +-
 .../migration-guides/release-notes-4.3.rst         |   2 +-
 documentation/overview-manual/concepts.rst         |   2 +-
 documentation/ref-manual/classes.rst               |   2 +
 documentation/ref-manual/devtool-reference.rst     |   2 +-
 documentation/ref-manual/structure.rst             |   2 +-
 documentation/ref-manual/tasks.rst                 |   4 +-
 documentation/ref-manual/terms.rst                 |   2 +-
 documentation/ref-manual/variables.rst             | 135 +++++++++++++++++=
++--
 documentation/toaster-manual/reference.rst         |   6 +-
 19 files changed, 179 insertions(+), 36 deletions(-)

