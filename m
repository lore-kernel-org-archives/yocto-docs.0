Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEC6C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:37:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.15694.1741365450895010587
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Mar 2025 08:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Nrmf5zRJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE25044333;
	Fri,  7 Mar 2025 16:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741365449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k9kMzAJtV7/l3jh6kktzmBZl4VDmfSCfrOpgE2GLlDY=;
	b=Nrmf5zRJq7I4J6s4ST+Giyz3/36rW/INNPoVT6xdu32W8Ws58ETYeXWi93UZxn0VmGyPYW
	AvttmvPROHe2QPllI8qK/2z4lZg/g9qUcpg67X0iYRtfWiNiG+Sn9e6zWPX+g8SX2LgEmw
	EuZO5CUy1mE4cUKjN7862WvjiFiI6pDi9LUwzBUrJ8S3agbVD0tAWj8KA0/VuNkz+ZAtUW
	pdKn2juLw2X08t3fQlvXHvTMc08/AFarbYSw8iy68Ocb78IJ8abSZtOGkd2d2i9RA/dHvX
	cadnISpbP6M0IAEj9c+2Uek0nY4KgPoatvl4WfIMoTkwq3T0CQRRLcZX5A7/EA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Mar 2025 17:37:28 +0100
Message-Id: <D8A6J79X8LV5.3KYFRCD5CQ9TA@bootlin.com>
Subject: [master] Pull request
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6512

The following changes since commit 36fb1e9e5099aa0d858d5478530143e9bac39588=
:

  dev-manual/multiconfig: add suggested best practices and baremetal sectio=
ns (2025-02-25 15:20:18 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to e608902ffae3af5ab0c5308b0550e49a790482f0:

  migration-guides: add release notes for 5.1.3 (2025-03-07 11:24:14 +0100)

----------------------------------------------------------------
Adrian Freihofer (1):
      ref-manual: cover UBOOT_ENV variables

Antonin Godard (1):
      ref-manual/variables: document KMETA* and KCONF_AUDIT* variables

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
 documentation/ref-manual/variables.rst             | 139 ++++++++++++++++-
 9 files changed, 474 insertions(+), 45 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.25.rst
 create mode 100644 documentation/migration-guides/release-notes-5.1.3.rst

