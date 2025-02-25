Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9202BC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 16:56:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.13661.1740502610121742265
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 08:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VHbOK3Mu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AA294429C;
	Tue, 25 Feb 2025 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740502608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i8Y7cHuq/grPVV1449Cm9D7y1VbWsz7ofVawR87BIyk=;
	b=VHbOK3MuzigGvAorLrHwtSwnuo4kb6IG4qufsqG6MWo4SYCJqE1ERd3wzd1EdKtqTeQpA1
	Xig/orcYGVYf5bBGNQ2iv8Hbv83HoYo0u4hYwMh+5ZD5/F4sBOHrFXnFDBSzFBrZkLZ2cB
	C+vb6wVJoSRtjhxqDMbc+UR66r4mQdTfYe7Qfv6c4FFO926dznIfRdF4TwsuHNSWXXXeR6
	6v6J19VwOv/ijHSwqPKwIo2zI3riRNznEYwBw1fCYrrHfS7ixSz8TZc7ecGIWY7cWx4fQ5
	/Uf8AwPqUWXPko2379jG5vQBB6Sk+GP0tcHJWCNoGc0vjmEO/260mon6U3UmeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Feb 2025 17:56:47 +0100
Message-Id: <D81OOJQC1854.3DW82W3S1S3AY@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvufesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuudfgjeejkeeviedufefhudevtdduteevgeehteejueeiieeludetieeitdejjeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 16:56:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6450

The following changes since commit 9f1f9f1a3a2a541ed70df72d4fe391b5b7fd3733=
:

  migration-guides: add release notes for 5.0.7 (2025-02-14 08:59:32 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 36fb1e9e5099aa0d858d5478530143e9bac39588:

  dev-manual/multiconfig: add suggested best practices and baremetal sectio=
ns (2025-02-25 15:20:18 +0100)

----------------------------------------------------------------
Antonin Godard (6):
      dev-manual: move multiconfig documentation to its own document
      variables.rst: add a reference to BB_CURRENT_MC from bbdocs
      migration-5.2: fix references to BB_CURRENT_MC
      dev-manual/multiconfig: rename to use Multiconfig term
      dev-manual/multiconfig: improve the current doc
      dev-manual/multiconfig: add suggested best practices and baremetal se=
ctions

Marta Rybczynska (1):
      vulnerabilities/classes: remove references to cve-check text format

Weisser, Pascal (1):
      ref-manual: Add missing variable IMAGE_ROOTFS_MAXSIZE

Yoann Congal (4):
      ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
      reproducible-builds: change/add titles in the "How" section
      reproducible-builds: add a "How to" section with OEQA* variables
      release-notes-5.2: Add new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGE=
TS

 documentation/dev-manual/building.rst              | 156 +----------
 documentation/dev-manual/index.rst                 |   1 +
 documentation/dev-manual/multiconfig.rst           | 312 +++++++++++++++++=
++++
 documentation/dev-manual/vulnerabilities.rst       |  96 +++++--
 documentation/migration-guides/migration-5.2.rst   |   4 +-
 .../migration-guides/release-notes-5.2.rst         |   4 +
 documentation/ref-manual/classes.rst               |   2 +-
 documentation/ref-manual/variables.rst             |  16 ++
 documentation/test-manual/reproducible-builds.rst  |  32 ++-
 9 files changed, 435 insertions(+), 188 deletions(-)
 create mode 100644 documentation/dev-manual/multiconfig.rst

