Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F17BC0218A
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 15:58:31 +0000 (UTC)
Received: from relay0.mail.gandi.net (relay0.mail.gandi.net [217.70.178.220])
 by mx.groups.io with SMTP id smtpd.web10.55157.1737993505238604394
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 07:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l+W9MtsN;
 spf=pass (domain: bootlin.com, ip: 217.70.178.220, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C855044136;
	Mon, 27 Jan 2025 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737993503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z0rSHyV/K10HQgsEXmMRW/StULa1WLEae7eevAZn8Hk=;
	b=l+W9MtsNAibv7QdMUNs9BKgcio+ROVHhpdLqSn3Asm3QSGImR4gfMj3CEuCgri+TvQrQTH
	NOAxGK+C3nYBsoiHLOxNoNdYutbCONNU7+gsEtV58xnSZ/YCeBKmoUntho4v4d/qojBcQH
	KZY9AOk8nHMlU+TtjkDhZK8aMThm9G8THnUwcwkX9xNPs+ESSC41dybBH5FRf19i7m4KpR
	L+6Wv0BXbLhKVj1/AJBk8qssl+KDRrt6lnP6zlElQ3Qe5WXF+GRV2mXmraKDK69hZcXzKm
	XK+WBUFjGynub5d/wZHB9B3+CVKHEBo8+0VLrv/cVmhy8tD4DuxTvLU97Mm4uQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 16:58:22 +0100
Message-Id: <D7CZA0T4U1WS.11AOK6GINWW56@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudefiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefggeejtdetieeuteeijedvieejgfdufedtvefhffeludethedthfdvteefleegnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 15:58:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6195

The following changes since commit 8bd2bc3c00ca80f4c000a2a8d618a9f8ea3aa54b=
:

  test-manual/reproducible-builds: fix reproducible links (2025-01-17 17:26=
:48 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to caedbca4eced4cf5bc74aaae64e4ad2887c2fc65:

  dev-manual/building: document the initramfs-framework recipe (2025-01-27 =
11:28:13 +0100)

----------------------------------------------------------------
Adrian Freihofer (1):
      sdk-manual: extensible.rst: devtool ide-sdk improve

Antonin Godard (2):
      test-manual/ptest: link to common framework ptest classes
      dev-manual/building: document the initramfs-framework recipe

Enrico J=C3=B6rns (1):
      ref-manual: add documentation for the barebox class

Quentin Schulz (1):
      ref-manual: variables: fix spurious parenthesis

 documentation/dev-manual/building.rst   |  84 ++++++++++++-
 documentation/ref-manual/classes.rst    |  37 ++++++
 documentation/ref-manual/variables.rst  |  31 ++++-
 documentation/sdk-manual/extensible.rst | 210 +++++++++++++++++++++++-----=
----
 documentation/test-manual/ptest.rst     |  14 +++
 5 files changed, 315 insertions(+), 61 deletions(-)

