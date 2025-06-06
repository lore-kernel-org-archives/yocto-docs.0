Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F089DC61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 17:15:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.650.1749230122024185874
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 10:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aBRS/Etx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD17F43867;
	Fri,  6 Jun 2025 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749230120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=APkS/lZ3Az/Ht5qA5hXOuS11cZK9csqKG97ukSV6Hhg=;
	b=aBRS/Etx7mrRgU6WzLsutr3mZGsxTUbfQ/uQNnOY5snu1+/ajsKgGMjFUu1gfwfS+5WUbw
	lBUfLPrg1gyHk9YXtR0e1EVsPpyv7T7/Ho/vUkhWICi4XomjoYV1PYyT9iK/cnRNPCLFgU
	83+roacWvoj59DA9mAKSjwCnfUs/oFyERca8iM1onnQ7G6Fq9yV5oM5TdSLLCgFdnSW9m9
	2yS8E+Gc36c29dylH3aVK5kIxRZi7iehybjxpXTqnM8BJ7a9J8NrEVvM7id9nvAUhRUI1w
	7zzRBZ+qcFE9qF2B7mx95wGaJfO7Ip05TGEydMiOt3s1j15U1q9pLLhS2RvN+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 19:15:19 +0200
Message-Id: <DAFMBR84E4JH.17EGCKU7E86X7@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 17:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7029

The following changes since commit 953c203cff5f936b34530c150343cf54ade16653=
:

  brief-yoctoprojectqs/index.rst: replace removed macro (2025-05-26 09:45:0=
0 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 1fc92ff2af72118ae041183d395d0a0323ecc1a9:

  docs: conf.py: silence SyntaxWarning on js_splitter_code (2025-06-06 19:0=
9:24 +0200)

----------------------------------------------------------------
Carlos S=C3=A1nchez de La Lama (1):
      ref-manual: clarify KCONFIG_MODE default behaviour

Lee Chee Yang (2):
      migration-guides: add release notes for 5.2.1
      migration-guides: add release notes for 4.0.27

Quentin Schulz (3):
      docs: README: specify how to contribute instead of pointing at anothe=
r file
      deduplicate README
      docs: conf.py: silence SyntaxWarning on js_splitter_code

Richard Purdie (1):
      brief-yoctoprojectqs/ref-manual: Switch to new CDN

Robert P. J. Day (1):
      Clean up explanation of minimum required version numbers

 README                                             |  32 +---
 documentation/README                               |  21 ++-
 documentation/brief-yoctoprojectqs/index.rst       |   6 +-
 documentation/conf.py                              |   2 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.2.rst     |   1 +
 .../migration-guides/release-notes-4.0.27.rst      | 153 +++++++++++++++++=
+++
 .../migration-guides/release-notes-5.2.1.rst       | 161 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |  13 +-
 9 files changed, 343 insertions(+), 47 deletions(-)
 mode change 100644 =3D> 120000 README
 create mode 100644 documentation/migration-guides/release-notes-4.0.27.rst
 create mode 100644 documentation/migration-guides/release-notes-5.2.1.rst

