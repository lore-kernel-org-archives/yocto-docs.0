Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD428C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 14:04:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14041.1747404287323649050
 for <docs@lists.yoctoproject.org>;
 Fri, 16 May 2025 07:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GcpDbb2f;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ECB7439FE;
	Fri, 16 May 2025 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747404285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IJlfWM/i2AiLlcwakr2ujC2DCd58hUmdSoAAtOgbU7M=;
	b=GcpDbb2fvMJyUB2U8vFrpJonOuQXzzEcEgsBIxanqxZcJ2hzxnFxMo6cg57+/rGTz2GtyY
	7y8GXlzOJP8h3JN5e3vSC9XV3DS3XpRUYSFaMmHVncZ4i6A67SIQHcDlkecj1+LOp78LzJ
	yb/FivxcEWHSVh5gHsoW2sAnL2Rh8EDI+7D97dQ7x5P1E3BQGeW4zyw3JEzYpCzCx4B3mF
	n2aI8mzkyZdkW0Ylp+VGkhNLt4+0Fe9FMaT9mAgwrr3dvpIk0AnSiNVMFNLAp3UCtRVUcf
	JG3w8mR6GFJNmy+1K4cXgrCoraVSjPrPjxSZXl6r4rpIi+6+auNhp4TvNucyfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 16:04:44 +0200
Message-Id: <D9XN4EH61AMW.23ER0Z4RUB4QU@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 May 2025 14:04:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6829

The following changes since commit 81bb2b31c485717c0f3935844266f6610d860a6a=
:

  release-notes-5.2: update download section (2025-05-08 10:00:48 -0700)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to f2e3cf2637ce3ed3475faa472b134a29f019681b:

  set_versions.py: mark Styhead as EoL (2025-05-16 15:33:37 +0200)

----------------------------------------------------------------
Adrian Freihofer (1):
      ref-manual: kernel-fitimage.bbclass does not use SPL_SIGN_KEYNAME

Antonin Godard (3):
      test-manual/intro: remove Buildbot version used
      ref-manual/release-process: update releases.svg
      migration-guides: add placeholders for 5.3

Enrico J=C3=B6rns (1):
      ref-manual/variables.rst: update ROOT_HOME documentation

Lee Chee Yang (2):
      migration-guides: add release notes for 4.0.26
      migration-guides: add release notes for 5.0.9

Leonard Anderweit (1):
      ref-manual: classes: uki: Fix git links

Mikko Rapeli (1):
      sbom.rst: how to disable SPDX generation

Quentin Schulz (1):
      set_versions.py: mark Styhead as EoL

Trevor Woerner (3):
      contributor-guide/submit-changes: encourage patch version changelogs
      sphinx-lint: various fixes
      ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS

 documentation/contributor-guide/submit-changes.rst |  32 ++
 documentation/dev-manual/devtool.rst               |   2 +-
 documentation/dev-manual/sbom.rst                  |  14 +-
 documentation/dev-manual/start.rst                 |   4 +-
 documentation/migration-guides/index.rst           |   1 +
 documentation/migration-guides/migration-5.2.rst   |   2 +-
 documentation/migration-guides/migration-5.3.rst   |  68 +++
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-5.3.rst     |   9 +
 .../migration-guides/release-notes-4.0.26.rst      | 263 +++++++++++
 .../migration-guides/release-notes-5.0.9.rst       | 206 ++++++++
 .../migration-guides/release-notes-5.2.rst         |   4 +-
 .../migration-guides/release-notes-5.3.rst         | 126 +++++
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/svg/releases.svg          | 518 +++++++++++++++++=
----
 documentation/ref-manual/variables.rst             |  31 +-
 documentation/set_versions.py                      |   2 +-
 documentation/test-manual/intro.rst                |  12 +-
 19 files changed, 1186 insertions(+), 118 deletions(-)
 create mode 100644 documentation/migration-guides/migration-5.3.rst
 create mode 100644 documentation/migration-guides/release-5.3.rst
 create mode 100644 documentation/migration-guides/release-notes-4.0.26.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.9.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.rst

