Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29512C369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 07:10:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.19702.1744355433268333973
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 00:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JMa7gWbL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F5084417A;
	Fri, 11 Apr 2025 07:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744355431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OOSDY/2HnbFB9pcaQjjFDOm5Wgld9ydAqfL+XwIOu8g=;
	b=JMa7gWbLatFOOoSuXbQSDtaxCif+SAM52GOuU5YNniSVF0schXJGcyYTuqhd80J5WMrKP6
	BALoaWiCPR+gj0KHgUULIYqsOx4W75O9JPIegZec6ij+8B8yz/45VJoFM/9UIXiEAWZS4Z
	JEkncG3+CQjgZfx48bPJ7TfFF5G8HKsaRdgt/P1POefQFd5NPweUSRQ7WWBjoaQOiFjBtO
	lQUzBfFq6GRk6a/3H6qGp+hgPzH/zSVcMX1CBRXbDOARgdxDyClMvIXsuMgQISFWJIp8EV
	N2ZTQi07Q6Y9w+7Q/i5srBMmgmcZEQa2zI5gXB7uHYNVl1F2ssdb9L8IUP6HDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 09:10:30 +0200
Message-Id: <D93ME62BAS92.2LULTPCHJM7OG@bootlin.com>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheefheekfeekvefghedthefftdeigfetieffleehfefggfeikeffteegveeuhfegnecuffhomhgrihhnpeihrghmlhdrihhnnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 07:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6727

The following changes since commit 85e738e4c0e62f69699fff4bb0482ee3e3121496=
:

  overview-manual/concepts: add UNPACKDIR in the directory description (202=
5-03-20 16:40:47 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to f264569312ffa8a4ad1f9e2022b4eaa14aeb3099:

  Fix dead links that use the DISTRO macro (2025-04-10 10:13:49 +0200)

----------------------------------------------------------------
Andrew Kreimer (1):
      manuals: remove repeated word

Antonin Godard (11):
      ref-manual/variables.rst: WATCHDOG_TIMEOUT: fix recipe name
      ref-manual/variables.rst: document autotools class related variables
      documentation/conf.py: define a manpage url
      ref-manual/variables.rst: add manpage links for toolchain variables
      ref-manual/variables.rst: add missing documentation for BUILD_* varia=
bles
      ref-manual/variables.rst: document missing SDK_*_ARCH variables
      ref-manual/variables.rst: document HOST_*_ARCH variables
      ref-manual/variables.rst: HOST_CC_ARCH: fix wrong SDK reference
      ref-manual/variables.rst: improve the PKGV documentation
      poky.yaml: introduce DISTRO_LATEST_TAG
      Fix dead links that use the DISTRO macro

Lee Chee Yang (2):
      migration-guides: add release notes for 5.1.4
      migration-guides: add release notes for 5.0.8

 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/bsp-guide/bsp.rst                    |   2 +-
 documentation/conf.py                              |   3 +
 documentation/dev-manual/qemu.rst                  |   2 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/migration-guides/release-5.0.rst     |   2 +-
 documentation/migration-guides/release-5.1.rst     |   1 +
 .../migration-guides/release-notes-5.0.8.rst       | 226 +++++++++++++
 .../migration-guides/release-notes-5.1.4.rst       | 137 ++++++++
 documentation/overview-manual/concepts.rst         |   2 +-
 documentation/overview-manual/yp-intro.rst         |   2 +-
 documentation/poky.yaml.in                         |  11 +-
 documentation/ref-manual/system-requirements.rst   |   2 +-
 documentation/ref-manual/terms.rst                 |   2 +-
 documentation/ref-manual/variables.rst             | 356 +++++++++++++++++=
++--
 documentation/sdk-manual/appendix-obtain.rst       |   6 +-
 documentation/sdk-manual/extensible.rst            |   2 +-
 documentation/sdk-manual/intro.rst                 |   4 +-
 documentation/sdk-manual/using.rst                 |   2 +-
 documentation/set_versions.py                      |  16 +-
 20 files changed, 729 insertions(+), 53 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.8.rst
 create mode 100644 documentation/migration-guides/release-notes-5.1.4.rst

