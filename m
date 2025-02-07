Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3DDC02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:03:41 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.65400.1738919017875959133
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E83+JLXI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D603944191;
	Fri,  7 Feb 2025 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738919016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OUHwsVWJKvjBN7JUwTWDqzMAqXZA4AdSyEKKFx30KmI=;
	b=E83+JLXIFZhAV1akixburxwGxM7Ri2BEMhYHC9WctzG64RoqW0wIhKzeY5iaaIN2TGuKrQ
	vTTPL/QHs3qAnqWhqCutM7+sVZZ/MwKfvbBjyboo/CwQycMVOpH1BqZMcQFNWp9xpVXEXR
	vsBUFCCOxP5G1xlRg6RnTJtxFjwT4CjGGOygVP21A9C8GP47Kab33Ut00MlxaQnyqaxqiL
	1MuOUqHhBQjigal7QoN3P+OptfFpkkLEZZ2XZu63gfuT5CzdvfNu2TTsxlpVSvImfKPehT
	cMhgR7VnEkreNMxkdaHI9RdSyfTgNM31XL2pGypaVCzMKgawqE8U8tZEtN+3FA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:03:35 +0100
Message-Id: <D7M3CFJWF4ZG.1905IO72HA6BP@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggfegjedtteeiueetieejvdeijefgudeftdevhfffleduteehtdfhvdetfeelgeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:03:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6278

The following changes since commit caedbca4eced4cf5bc74aaae64e4ad2887c2fc65=
:

  dev-manual/building: document the initramfs-framework recipe (2025-01-27 =
11:28:13 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 2b21ca55db84ec02b7dd4f1176b63802caef8fd5:

  migration-5.2: add virtual provider change (2025-02-07 10:00:14 +0100)

----------------------------------------------------------------
Antonin Godard (5):
      Move devtool doc from extensible to dev manual
      dev-manual/devtool: remove reference to the extensible SDK
      ref-manual/faq: add q&a on systemd as default
      migration-5.2: document BB_CURRENT_MC default value change
      migration-5.2: add virtual provider change

Lee Chee Yang (2):
      migration-guides: add release notes for 4.0.24
      migration-guides: add release notes for 5.1.2

Simon A. Eugster (2):
      documentation: Fix typo in standards.md
      ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE

Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (2):
      release-notes-5.2: add information about rpm and sequoia
      dev-manual/packages: add information about signing changes

 documentation/dev-manual/devtool.rst               | 1322 ++++++++++++++++=
+++
 .../figures/devtool-add-flow.png}                  |  Bin
 .../figures/devtool-modify-flow.png}               |  Bin
 .../figures/devtool-upgrade-flow.png}              |  Bin
 documentation/dev-manual/index.rst                 |    1 +
 documentation/dev-manual/new-recipe.rst            |    2 +-
 documentation/dev-manual/packages.rst              |   16 +-
 documentation/dev-manual/upgrading-recipes.rst     |    2 +-
 documentation/migration-guides/migration-2.1.rst   |    2 +-
 documentation/migration-guides/migration-5.2.rst   |   46 +
 documentation/migration-guides/release-4.0.rst     |    2 +-
 documentation/migration-guides/release-5.1.rst     |    1 +
 .../migration-guides/release-notes-4.0.24.rst      |  383 ++++++
 .../migration-guides/release-notes-5.1.2.rst       |  312 +++++
 .../migration-guides/release-notes-5.2.rst         |    4 +
 documentation/overview-manual/concepts.rst         |    2 +-
 documentation/ref-manual/classes.rst               |   16 +
 documentation/ref-manual/devtool-reference.rst     |    2 +-
 documentation/ref-manual/faq.rst                   |   22 +
 documentation/ref-manual/variables.rst             |    7 +-
 documentation/sdk-manual/extensible.rst            | 1323 +---------------=
----
 documentation/standards.md                         |    2 +-
 documentation/what-i-wish-id-known.rst             |    2 +-
 23 files changed, 2137 insertions(+), 1332 deletions(-)
 create mode 100644 documentation/dev-manual/devtool.rst
 rename documentation/{sdk-manual/figures/sdk-devtool-add-flow.png =3D> dev=
-manual/figures/devtool-add-flow.png} (100%)
 rename documentation/{sdk-manual/figures/sdk-devtool-modify-flow.png =3D> =
dev-manual/figures/devtool-modify-flow.png} (100%)
 rename documentation/{sdk-manual/figures/sdk-devtool-upgrade-flow.png =3D>=
 dev-manual/figures/devtool-upgrade-flow.png} (100%)
 create mode 100644 documentation/migration-guides/release-notes-4.0.24.rst
 create mode 100644 documentation/migration-guides/release-notes-5.1.2.rst

