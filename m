Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76494C35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 10:40:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.18441.1742553619488419977
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 03:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HsooRt6f;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0241044264;
	Fri, 21 Mar 2025 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742553618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=txcNY3JL1lOZTpinbnja4xnFwf2axSwIy5jwKj2IAPs=;
	b=HsooRt6f7nGoBWSCYfGOTF+gejyFbhBN9sFsSz8m+z0jCon/SctXt0SnWs9hY6/ItZ9sPQ
	/r8CGIwJc76+PMqi/uDvsTe7QLcyCMFIuPhshiI6ifvtK3v6hhzakJ/NpoMQBIXUnzXPBe
	W+FBgY7rFeuHDfo0J4xNCgJACfwoS1zssCHU7snTiHiot5f9RfZfOgtXkX7EhwJzwE8cFj
	VNAwYO4elug9gvHglUHN5gDymonzfQZCCHzyaZYw0n9PPisBC3npR/otsMoKF+hc9+aEZ3
	DN9u9CDxGRDc8MyfQcxGT6tdlF1nhRmnS8of/eeQsCO3XU2PEOZgs50VRnMhkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 11:40:17 +0100
Message-Id: <D8LVPCNFVU31.16B79NQN5W7U7@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 10:40:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6597

The following changes since commit e608902ffae3af5ab0c5308b0550e49a790482f0=
:

  migration-guides: add release notes for 5.1.3 (2025-03-07 11:24:14 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 55a20a4d887c153d27ebb985b0e19ba595ab0d87:

  ref-manual: uboot-sign: Add how to enable ATF, TEE and User defined snipp=
et ITS for U-Boot FIT image (2025-03-20 16:36:21 +0100)

----------------------------------------------------------------
Adrian Freihofer (2):
      migration-guides: cover FIT_UBOOT_ENV
      ref-manual: variable FIT_SIGN_INDIVIDUAL mix-and-match attacks

Antonin Godard (7):
      overview-manual: convert source-fetching.png to svg and fix UNPACKDIR
      overview-manual: convert patching.png to svg
      overview-manual: convert configuration-compile-autoreconf.png to svg
      overview-manual: convert analysis-for-package-splitting.png to svg
      overview-manual/concepts: remove PR from the build dir list
      overview-manual/concepts: add UNPACKDIR in the directory description
      migration-guides/release-notes-5.2: add known issue on stalled NVD

Jamin Lin (1):
      ref-manual: uboot-sign: Add how to enable ATF, TEE and User defined s=
nippet ITS for U-Boot FIT image

Ross Burton (1):
      dev-manual: remove qemu machine name list in runqemu invocation

 documentation/dev-manual/qemu.rst                  |    3 -
 documentation/migration-guides/migration-5.2.rst   |    8 +
 .../migration-guides/release-notes-5.2.rst         |   17 +
 documentation/overview-manual/concepts.rst         |   24 +-
 .../figures/analysis-for-package-splitting.png     |  Bin 68434 -> 0 bytes
 .../figures/configuration-compile-autoreconf.png   |  Bin 70877 -> 0 bytes
 documentation/overview-manual/figures/patching.png |  Bin 57414 -> 0 bytes
 .../overview-manual/figures/source-fetching.png    |  Bin 46896 -> 0 bytes
 .../svg/analysis-for-package-splitting.svg         | 1862 ++++++++++++++++=
++++
 .../svg/configuration-compile-autoreconf.svg       | 1497 ++++++++++++++++
 documentation/overview-manual/svg/patching.svg     | 1224 +++++++++++++
 .../overview-manual/svg/source-fetching.svg        | 1094 ++++++++++++
 documentation/ref-manual/classes.rst               |   13 +
 documentation/ref-manual/variables.rst             |  174 +-
 14 files changed, 5894 insertions(+), 22 deletions(-)
 delete mode 100644 documentation/overview-manual/figures/analysis-for-pack=
age-splitting.png
 delete mode 100644 documentation/overview-manual/figures/configuration-com=
pile-autoreconf.png
 delete mode 100644 documentation/overview-manual/figures/patching.png
 delete mode 100644 documentation/overview-manual/figures/source-fetching.p=
ng
 create mode 100644 documentation/overview-manual/svg/analysis-for-package-=
splitting.svg
 create mode 100644 documentation/overview-manual/svg/configuration-compile=
-autoreconf.svg
 create mode 100644 documentation/overview-manual/svg/patching.svg
 create mode 100644 documentation/overview-manual/svg/source-fetching.svg

