Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF19DC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 17:15:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.649.1749230119289362437
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 10:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OqbOkTZc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A1C043218;
	Fri,  6 Jun 2025 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749230117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1zkMa9LEF/RQYz8YgUG9sf/qRe8LmnfWEbY2aO8sUpw=;
	b=OqbOkTZcBuYMmqUv2gDno5pvorJxLuGrH6plDPNrk292VrglFoxVC4Uq0gc5mM2+LyosXj
	B4mpm1r+UMDkvGX+BFIuUJycpFI/5lDpztXeVpt091rFRyLGBOEkRyapkmHowU3uWDsvrm
	9iIJeD08JqWmYRpC/ZOfgMDIyPAS4Y1fRpGkaH2jVwqdW9wE9krJ7cediRbFDI8wtHwaLt
	2zqS5TJvBVBsFnmR7xtaLsROgvsPbep3qWM1ThKEyWksaYyp4z6CXKdn8hFwL0QvzByobz
	sauD5dU76Us0lIiu0UQk64KEpxkJANWpYQlVlW1P3mm1qAXT0yBZCAEfd5pb9A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 19:15:17 +0200
Message-Id: <DAFMBQ8SWEOR.2HKSE8SYUO8E0@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefggeejtdetieeuteeijedvieejgfdufedtvefhffeludethedthfdvteefleegnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 17:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7028

The following changes since commit 406e8a8e30404c0538f5aa46f211540bae2b206b=
:

  brief-yoctoprojectqs/ref-manual: Switch to new CDN (2025-05-29 17:33:27 +=
0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 040556cc9bc998970eb6152f8748d359b15b4bf9:

  docs: remove lz4 from required packages (2025-06-06 18:51:12 +0200)

----------------------------------------------------------------
Carlos S=C3=A1nchez de La Lama (1):
      ref-manual: clarify KCONFIG_MODE default behaviour

Lee Chee Yang (2):
      migration-guides: add release notes for 5.2.1
      migration-guides: add release notes for 4.0.27

Quentin Schulz (4):
      docs: README: specify how to contribute instead of pointing at anothe=
r file
      deduplicate README
      docs: conf.py: silence SyntaxWarning on js_splitter_code
      docs: remove lz4 from required packages

Robert P. J. Day (1):
      Clean up explanation of minimum required version numbers

 README                                             |  32 +---
 documentation/README                               |  21 ++-
 documentation/brief-yoctoprojectqs/index.rst       |   4 +-
 documentation/conf.py                              |   2 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.2.rst     |   1 +
 .../migration-guides/release-notes-4.0.27.rst      | 153 +++++++++++++++++=
+++
 .../migration-guides/release-notes-5.2.1.rst       | 161 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |  11 +-
 .../host_packages_scripts/almalinux_essential.sh   |   2 +-
 .../host_packages_scripts/fedora_essential.sh      |   2 +-
 .../host_packages_scripts/opensuse_essential.sh    |   2 +-
 .../host_packages_scripts/ubuntu_essential.sh      |   2 +-
 13 files changed, 345 insertions(+), 49 deletions(-)
 mode change 100644 =3D> 120000 README
 create mode 100644 documentation/migration-guides/release-notes-4.0.27.rst
 create mode 100644 documentation/migration-guides/release-notes-5.2.1.rst

