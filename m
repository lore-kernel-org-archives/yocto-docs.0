Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D58C369AB
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 07:10:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.19746.1744355435001941204
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 00:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pAHSWSDY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E10F12047E;
	Fri, 11 Apr 2025 07:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744355433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=miYsxijL+qrZLYpMmkyYaUFCgYkdXNATYYIjohvX/Ns=;
	b=pAHSWSDY/aGplEL/BUhvZW3RPHZIBnJ77JxbIfrJUXjhCCQXTXuRZaIA1l7HZZTbYSaHw6
	Zox3TB0c+XyTZYQpzONUnzpP56U6yQ/IkSNSzO+zEmzspiz4I4AFIudDBAlBj1G/mI00sh
	8GYoHy9kE/zsprc8fdXxWvFV27rpA+eIKAoissGz9yELHzOeK1NZozgQNF+B5l9J8yJ3UK
	gdx11AfVVnX07ogtBCJEZEFDbWXCaQS8UlTSp1m2wQ5ie6NBj906jqZ2UZ1TNo+6C/xs4i
	afRXb/XTqWw+E5+0QLyA96MS4X6QR528rO2lcDz5JSO8zfGEa1/fYhbDFoZr5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 09:10:32 +0200
Message-Id: <D93ME6UY01XV.334VLZZV26YNQ@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefhvffusehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeefveeuieefheeujeehfeejfedvhefgheduhfeiudfhheeugefhfffhgefhteeinecuffhomhgrihhnpeihrghmlhdrihhnnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 07:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6728

The following changes since commit 56db4fd81f6235428bef9e46a61c11ca0ba89733=
:

  overview-manual/concepts: remove PR from the build dir list (2025-03-20 1=
6:42:35 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to d1f3616b373334a5aa75ad7874f05ee4b0e6591f:

  Fix dead links that use the DISTRO macro (2025-04-10 10:16:01 +0200)

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

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.8

 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/bsp-guide/bsp.rst                    |   2 +-
 documentation/conf.py                              |   3 +
 documentation/dev-manual/qemu.rst                  |   2 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/migration-guides/release-5.0.rst     |   2 +-
 .../migration-guides/release-notes-5.0.8.rst       | 226 +++++++++++++
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
 18 files changed, 591 insertions(+), 53 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.8.rst

