Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AED4C369A9
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 07:10:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.19701.1744355431390589901
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 00:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PVxD2ErG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45ADA41C93;
	Fri, 11 Apr 2025 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744355429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zZMfIK2ikTYATdUsZXNHpzZTVV1WSenxkNsDnea5ACI=;
	b=PVxD2ErGZksVTxigdceZQ5bx69u1nu9dylHKNQDcKnTd9+1s93aoWGk0AWZyU62KoRmhK2
	ZyKwi9EACqKrufgiU2oez/x4Kr9K4LeNrE3MMAmIUW5MVOV127CvvP2ErLEbm0tRwqQOgK
	wDudeG4Sq5NGyDkmlUlf8ndyqvIrYck1l4hRzfzOl924F8V5NYo9512cMX1Y6p7vgGPY67
	NTxLBkKqK4dM3rf2kEhwOjIpeysQCFF/B4YLbbSDjgPJwUKiUoGlWCMn+pvI1uxDQHTbxM
	AD8KsNaY9iaVmoVLCeswhW/qMXJL7FSSa/uFQGjukFSXq0pGSl/EGdSS/FngjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 09:10:28 +0200
Message-Id: <D93ME571E1YS.27JSIR96LVVUR@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheefheekfeekvefghedthefftdeigfetieffleehfefggfeikeffteegveeuhfegnecuffhomhgrihhnpeihrghmlhdrihhnnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 07:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6726

The following changes since commit 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef=
:

  migration-guides: add release notes for 5.0.8 (2025-04-03 17:15:55 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 4414430dec3f41a6ad71ba331d4a2620e9cff8b6:

  Fix dead links that use the DISTRO macro (2025-04-10 10:13:41 +0200)

----------------------------------------------------------------
Andrew Kreimer (1):
      manuals: remove repeated word

Antonin Godard (4):
      ref-manual/variables.rst: improve the PKGV documentation
      migration-guides/{migration,release-note}-5.2: update for 5.2 release
      poky.yaml: introduce DISTRO_LATEST_TAG
      Fix dead links that use the DISTRO macro

 documentation/brief-yoctoprojectqs/index.rst         |  2 +-
 documentation/bsp-guide/bsp.rst                      |  2 +-
 documentation/dev-manual/qemu.rst                    |  2 +-
 documentation/dev-manual/start.rst                   |  2 +-
 documentation/migration-guides/migration-5.2.rst     | 16 +++++++++-------
 documentation/migration-guides/release-notes-5.2.rst |  4 ++++
 documentation/poky.yaml.in                           | 11 ++++++++++-
 documentation/ref-manual/system-requirements.rst     |  2 +-
 documentation/ref-manual/terms.rst                   |  2 +-
 documentation/ref-manual/variables.rst               | 17 ++++++++++++++++=
+
 documentation/sdk-manual/appendix-obtain.rst         |  6 +++---
 documentation/sdk-manual/extensible.rst              |  2 +-
 documentation/sdk-manual/intro.rst                   |  4 ++--
 documentation/sdk-manual/using.rst                   |  2 +-
 documentation/set_versions.py                        | 16 +++++++++++++++-
 15 files changed, 68 insertions(+), 22 deletions(-)

