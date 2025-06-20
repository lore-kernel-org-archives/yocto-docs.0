Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D037C7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 07:43:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.2512.1750405409096909986
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 00:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B4y4trIf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFB0C1F433;
	Fri, 20 Jun 2025 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750405407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LvMKrTikelS22BS72Ff1aSkME0+dNi8RScqcZ+7hNZw=;
	b=B4y4trIfTMfHNDllTzzqAvkeplh0lvBYi3Sjh+VJlkNLyoIH2yj8My/hGk7T+3Q8E52dPn
	rcFGCEhMjOQcmj8VTrkV81hen1WH3XqFqatiQa7Db93IMpsRsIf0eNxf7XfzlkFDWiMoOr
	AlaVQObsy1ArGxdDHIfurVuSYvG4h9Lb2wUFrzSqW0oMJdI758DSoEiuq8qXvOxVw2/XLQ
	7ddcw4NOg09Y6OoeAc1aV1p28+cF4kEZDtTUJOBkI5sORvKDuKaMI5TlIunWxPcfi+Sk7T
	DkMn+hpAObQhRw7bxpqG/8hr1TtA0zueJrurVR1gFL+Cq6dmSm+xo/DhkvDq6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 09:43:26 +0200
Message-Id: <DAR6XIPYGMAK.LBD84XAAGWN7@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 07:43:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7117

The following changes since commit b13bccbf3fb1890ac428a396f8c5081057edf555=
:

  ref-manual/yocto-project-supported-features: move meta-exein to primary (=
2025-06-17 10:25:32 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 4dbc63ed1381fe47723d6ba5b7baf2a3b7fd19aa:

  Add SPDX_INCLUDE_COMPILED_SOURCES documentation (2025-06-20 09:31:47 +020=
0)

----------------------------------------------------------------
Adrian Freihofer (3):
      ref-manual: replace kernel-fitimage by kernel-fit-image
      release-notes: drop references to kernel-fitimage
      migration-5.3: replace kernel-fitimage by kernel-fit-image

Daniel Turull (1):
      Add SPDX_INCLUDE_COMPILED_SOURCES documentation

Lee Chee Yang (1):
      migration-guide: add release notes for 5.0.10

Quentin Schulz (4):
      ref-manual: classes: reword to clarify that native/nativesdk options =
are exclusive
      ref-manual: classes: nativesdk: move note to appropriate section
      tree-wide: make the :doc: directive use absolute paths
      document how to use :doc: directive

Robert P. J. Day (5):
      overview-manual: small number of pedantic cleanups
      yp-intro: new doc reference is missing leading slash
      bsp guide: update kernel version example to 6.12
      bsp-guide: update lonely "4.12" kernel reference to "6.12"
      bsp-guide: update all of section 1.8.2 to reflect current beaglebone =
conf file

 documentation/README                               |  10 +
 documentation/bsp-guide/bsp.rst                    |  54 +++--
 documentation/contributor-guide/submit-changes.rst |   4 +-
 documentation/dev-manual/building.rst              |   4 +-
 documentation/dev-manual/debugging.rst             |   4 +-
 documentation/dev-manual/new-recipe.rst            |   2 +-
 documentation/dev-manual/sbom.rst                  |   3 +
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/dev-manual/vulnerabilities.rst       |   2 +-
 documentation/migration-guides/migration-5.3.rst   |  42 ++++
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.3.rst         |   4 +-
 .../migration-guides/release-notes-5.0.10.rst      | 208 +++++++++++++++++
 .../migration-guides/release-notes-5.1.rst         |   2 +-
 .../migration-guides/release-notes-5.2.rst         |   4 +-
 documentation/overview-manual/concepts.rst         |  25 +--
 .../overview-manual/development-environment.rst    |   6 +-
 documentation/overview-manual/yp-intro.rst         |   2 +-
 documentation/ref-manual/classes.rst               | 245 ++++++++++++++---=
----
 documentation/ref-manual/resources.rst             |   4 +-
 documentation/ref-manual/system-requirements.rst   |   2 +-
 documentation/ref-manual/variables.rst             |  84 ++++---
 documentation/standards.md                         |  11 +-
 .../transitioning-to-a-custom-environment.rst      |   4 +-
 documentation/what-i-wish-id-known.rst             |   4 +-
 25 files changed, 552 insertions(+), 181 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.10.rst

