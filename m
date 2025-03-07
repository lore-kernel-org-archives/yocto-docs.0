Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6D3C28B23
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:37:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.15696.1741365452611251186
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Mar 2025 08:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JsKBxhYm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F69644246;
	Fri,  7 Mar 2025 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741365450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pBJQ/nS1aodrVdENIVyNJKd8GvXrM2cA4UgNr13QVpk=;
	b=JsKBxhYm5JRiSBs4US6wCsura9ZPjMtVICBr+7qCO/0PT61s7CTreC2YSpSFhNZjl1BXLy
	WYlVznbSH7H1B9m3Snq8HqnjcYvIl5r1QlwFxU45DRjn8HxtBYoel829mA46IYJ86pfXLY
	w9Pbv9bAJKPEPm55CiUT/cDl6xHLfikbOo6dm/Ix2eSrjJooFBV5upWhDXwoEpGfKkY9yc
	W/uM0F2XIlkn4m1LSIDal5BhzSCyUXEM7vlMfJb6SQ2x8vykk5BLW51b6Xr/Ym3J0KunVP
	F3AJpg7qTzGyKRWhAyGRXLrAz1/ZhQy36HPRQH8ErBqrMccFsMe0PeVvXjq1Jg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Mar 2025 17:37:30 +0100
Message-Id: <D8A6J839ZJCX.1MSQZN2OR9YVZ@bootlin.com>
Subject: [kirkstone] Pull request
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6515

The following changes since commit 9798689e4f4b74163c2e8594f3d1ce082d295aa1=
:

  vulnerabilities/classes: remove references to cve-check text format (2025=
-02-25 17:26:59 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 9b4c36f7b02dd4bedfec90206744a1e90e37733c:

  ref-manual: don't refer to poky-lsb (2025-03-07 11:28:03 +0100)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.25

Ross Burton (2):
      Remove all mention of core-image-lsb
      ref-manual: don't refer to poky-lsb

 documentation/dev-manual/customizing-images.rst    |  17 +--
 documentation/dev-manual/qemu.rst                  |  11 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.25.rst      | 167 +++++++++++++++++=
++++
 documentation/ref-manual/features.rst              |   2 +-
 documentation/ref-manual/images.rst                |  21 ---
 6 files changed, 182 insertions(+), 37 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.25.rst

