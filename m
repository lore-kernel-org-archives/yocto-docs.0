Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DC6C36002
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 10:40:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.18442.1742553621126567737
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 03:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QdREHhk6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B7FD44154;
	Fri, 21 Mar 2025 10:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742553619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qgslYyMn6Kfkdckk58of03cUkkDR1N+ZNT0eMBl5O+w=;
	b=QdREHhk6iZRtOkaj4/rI89LaqUb4vB1rs0eo5DMJUwHHCNBzeXa+F80VfU9PoNg1cRC8QU
	kgf+572f6ZwG+iWXBm/TwOOQKF5ROwVgFOYwUzPjwyv+mKmW2jQjXKZeV6an9WUb6ysAD1
	E8ucrPM8KJo8NDguY2GNzlSzlCHEhNf9ENwRO1rwcSWOlFB1ZMT2PX261rJzgMzrlrfWv9
	w5xSbTU02d1rJkqLK9e8JKpW0Tt8ghDETIBFe+HiHtQcCIEcF0LzxPzjOotzgF1jvZ7BkA
	U4/ZFSyCqlcvpqOdr4tjT1AVROO/LlgaYo2xiuMnQU+bSV1gsz72GYcWt+QyGg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 11:40:18 +0100
Message-Id: <D8LVPD6948YU.15S76NWMFJUJO@bootlin.com>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 10:40:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6598

The following changes since commit f0324b8f14881227336f84325cdebd0518e17796=
:

  ref-manual: remove OE_IMPORTS (2025-03-07 11:58:05 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 85e738e4c0e62f69699fff4bb0482ee3e3121496:

  overview-manual/concepts: add UNPACKDIR in the directory description (202=
5-03-20 16:40:47 +0100)

----------------------------------------------------------------
Antonin Godard (6):
      overview-manual: convert source-fetching.png to svg and fix UNPACKDIR
      overview-manual: convert patching.png to svg
      overview-manual: convert configuration-compile-autoreconf.png to svg
      overview-manual: convert analysis-for-package-splitting.png to svg
      overview-manual/concepts: remove PR from the build dir list
      overview-manual/concepts: add UNPACKDIR in the directory description

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
 9 files changed, 5689 insertions(+), 12 deletions(-)
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

