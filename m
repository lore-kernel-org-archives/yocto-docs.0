Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A8AC28B24
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:37:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15695.1741365451512540885
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Mar 2025 08:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HxARkE+D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EA7A4433E;
	Fri,  7 Mar 2025 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741365449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TfbmsCmzp+ob7lpFyaK7xR4e2yxJUHrbcG/u/fE4nLA=;
	b=HxARkE+DM2sqmPZ8ws24Qalib4nZlYAHsvKn3hmlfSR2GdUF4VKGpVBa68RMdJF9l+MMM1
	bx7raKWG4gLQ5aKw2Oe6+sUUJpQe5YYnPHEVtxhNC1CGtuHYpqkA6/SF/b1wKCSzPapOAz
	/ACtSku+RiICMdk5E37jtcmaDflgyCBec8Rgqeaqey9fUMBgrLC95UVFTfzZJf5PKL7eMc
	pn/DQw0rK42a0x53+mPfbeabzb6NoPOQ0aUEw1ZF3NKe2T3aPRPqV9K9L6Fdy0XvLKAyb2
	Pj0oofgHDBxGOlAbK3C3RPePc1Jwlo67RvkhBQZdRTS8KrZNL5QTozyEuw5eSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Mar 2025 17:37:29 +0100
Message-Id: <D8A6J7LVF1FP.1NRZUZ1LYA5GD@bootlin.com>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Mar 2025 16:37:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6513

The following changes since commit 08f4670ef7c7a2071f3634cbf0d9c3d0cd2dde3e=
:

  vulnerabilities/classes: remove references to cve-check text format (2025=
-02-25 17:26:59 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to f0324b8f14881227336f84325cdebd0518e17796:

  ref-manual: remove OE_IMPORTS (2025-03-07 11:58:05 +0100)

----------------------------------------------------------------
Lee Chee Yang (2):
      migration-guides: add release notes for 4.0.25
      migration-guides: add release notes for 5.1.3

Ross Burton (3):
      Remove all mention of core-image-lsb
      ref-manual: don't refer to poky-lsb
      ref-manual: remove OE_IMPORTS

 documentation/dev-manual/customizing-images.rst    |  17 +--
 documentation/dev-manual/qemu.rst                  |  11 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.1.rst     |   1 +
 .../migration-guides/release-notes-4.0.25.rst      | 167 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.1.3.rst       | 160 +++++++++++++++++=
+++
 documentation/ref-manual/features.rst              |   2 +-
 documentation/ref-manual/images.rst                |  21 ---
 documentation/ref-manual/variables.rst             |   8 -
 9 files changed, 343 insertions(+), 45 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.25.rst
 create mode 100644 documentation/migration-guides/release-notes-5.1.3.rst

