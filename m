Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B748C7EE33
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 08:44:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8605.1751013838122326329
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 01:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Pl1tgIVq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7E4F43AF8;
	Fri, 27 Jun 2025 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751013836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ykw2ycGdSQUuJfUuvvQFgoTo6ARVxw0GgMW9A+7Zf28=;
	b=Pl1tgIVqw+QdYZBJE/gh0jOqctS4gj3Tue4350nHdydIrRuwqdhll4oxi1/0JSl3gD1BEM
	5abXA/W2xDO0s+9J3xVcpmKFBuLL+X9HHL+qfDcrFRFHoBrt4QuMH7G/21W/5WAxS0wEDf
	d6lMGWX7eOevDfoGHXqOD1Lmdv/FpAmYADYkeCQfYKSlkp2BJzHbCqXzT9jWjG/qprZBdq
	rQV72WJPp3aafcf/8bypps9iGeY732RngsHO9qXKBNtb/mUQYpyNbgQzWsKAWpGZeY/H6s
	/NvXM5eJtPNJqd802zBPKVMurWC4wypXSTRyiLhXChvd4ll7cUlZPXCn7uTcTA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 10:43:55 +0200
Message-Id: <DAX6LN52JXDI.27YL9M403ARI4@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Jun 2025 08:44:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7232

The following changes since commit 6b45207c8db40ef416f12348e066601975a0ca36=
:

  ref-manual/yocto-project-supported-features: Set riscv32 maintainers as T=
BD (2025-06-24 11:29:06 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 95691fa4e7d30ee27cb1280df20751bf449538a4:

  dev-manual: update list of recipe files showing version numbers (2025-06-=
27 10:16:07 +0200)

----------------------------------------------------------------
Adrian Freihofer (1):
      ref-manual/yocto-project-supported-features: add ppc maintainers

Alexander Kanavin (7):
      overview-manual: correct value of UNPACKDIR and put S under it
      ref-manual: drop a sentence about a 'legacy way' to specify UNPACKDIR
      dev-manual: replace WORKDIR with UNPACKDIR where appropriate
      overview-manual: correct the bitbake tasks map section and diagram to=
 account for sources in UNPACKDIR
      ref-manual: correct references to WORKDIR to account for recent do_un=
pack changes
      migration-guides/migration-5.1.rst: correct S/UNPACKDIR patterns for =
file-only recipes
      migration-guides/migration-5.3.rst: add guidance for breaking WORKDIR=
 changes

Anibal Limon (1):
      test-manual/ptest: Add info about fail state of ptest-runner/ptests

Antonin Godard (1):
      ref-manual/variables.rst: document BB_GIT_DEFAULT_DESTSUFFIX

Dixit Parmar (1):
      ref-manual: document KERNEL_SPLIT_MODULES variable

Robert P. J. Day (12):
      dev-manual: minor grammar correction
      dev-manual: correct misspelled reference to sstate-cache-management.p=
y
      dev-manual: CH 2, small number of clarifications
      dev manual, CH 3: update code snippets to be more current
      dev-manual: shorten bitbake.conf snippet related to static libs
      dev-manual: replace "on the contrary" with "by contrast"
      dev-manual: fix broken rendering of bullet point
      dev-manual: show bin_package example wireless-regdb recipe
      dev-manual: correct statements that source is always tarballs
      dev-manual: fix rendering of ${PN}
      dev-manual: simplify recipe names to use "oe_git" links
      dev-manual: update list of recipe files showing version numbers

 documentation/dev-manual/building.rst              |  4 +-
 documentation/dev-manual/disk-space.rst            |  2 +-
 .../dev-manual/efficiently-fetching-sources.rst    |  4 +-
 documentation/dev-manual/init-manager.rst          |  2 +-
 documentation/dev-manual/layers.rst                | 20 ++++----
 documentation/dev-manual/libraries.rst             | 32 +------------
 documentation/dev-manual/licenses.rst              |  4 +-
 documentation/dev-manual/new-recipe.rst            | 53 ++++++++++++++----=
----
 documentation/dev-manual/packages.rst              |  2 +-
 documentation/dev-manual/prebuilt-libraries.rst    |  6 +--
 documentation/dev-manual/start.rst                 | 16 +++----
 documentation/dev-manual/temporary-source-code.rst | 15 ++++--
 documentation/migration-guides/migration-5.1.rst   |  6 +--
 documentation/migration-guides/migration-5.3.rst   | 50 ++++++++++++++++++=
++
 documentation/overview-manual/concepts.rst         |  6 +--
 .../svg/analysis-for-package-splitting.svg         |  8 ++--
 .../overview-manual/svg/bitbake_tasks_map.svg      |  2 +-
 .../svg/configuration-compile-autoreconf.svg       |  8 ++--
 documentation/overview-manual/svg/patching.svg     |  8 ++--
 .../overview-manual/svg/source-fetching.svg        |  8 ++--
 documentation/ref-manual/structure.rst             |  2 +-
 documentation/ref-manual/tasks.rst                 |  3 +-
 documentation/ref-manual/variables.rst             | 44 ++++++++++++------
 .../yocto-project-supported-features.rst           |  3 +-
 documentation/test-manual/ptest.rst                | 17 +++++--
 25 files changed, 193 insertions(+), 132 deletions(-)

