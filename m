Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C32C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 07:10:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.19743.1744355430777131569
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 00:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Bfp/d5uH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E98C44440;
	Fri, 11 Apr 2025 07:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744355428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GTBLqXapVVW8Ekrr/+l8yr6d7JSN6hoIBVADEvnYLAE=;
	b=Bfp/d5uHB0Uzy/c0PcRoB32b9LFhSr1cpUEM2KjZeEFFKx1tN27YjAItb7s5gHh6caAUJ9
	myvez/DCNYKekdIz0wEz+6H+YUNLGQ4JycUmUhAEaIBZUZyPW8KNlQDHdiPblviQIGoe3W
	wxwSK36HZ1fytWa9TymmhNCg1adubDaVsBkTboW6S0wbVgUBLCI5JITMnjNjuhNP4YSlw2
	k3dZZGD/M/o7OphldZ4iu+SBiBW0wCVqcv8DvunB8AbOUPw3wtXPUhjZ7jGrTr6vJHb8R2
	iL334GG+MAbdNIZYfoi+wtreBDWmnDQZN13pI+LW+780hI6VEL3SSM5IS4k+og==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 09:10:26 +0200
Message-Id: <D93ME4CPM331.2BQ0RRYFC871M@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteefkeeitedthfdtudfggfejteegveefieffieefleejjedvhfejueevgeelffetnecuffhomhgrihhnpeihrghmlhdrihhnnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 07:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6725

The following changes since commit 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef=
:

  migration-guides: add release notes for 5.0.8 (2025-04-03 17:15:55 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 29be069ebbf2c55d72fc51d99ed5a558af37c05e:

  Fix dead links that use the DISTRO macro (2025-04-09 14:11:06 +0200)

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

