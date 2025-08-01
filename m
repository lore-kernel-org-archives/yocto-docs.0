Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2D1C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:12:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.84196.1754043169494849607
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 03:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UmeVdyXI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E43F24327B;
	Fri,  1 Aug 2025 10:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754043168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l7tofN4qMxTRcRafffMNNCZ7TXTFL/ey9/0O6SNCC2E=;
	b=UmeVdyXI8O6YaYtGSOh6uETPYud7Iaph1YX80Zvn5ZWvJPFXt66o7rqxBLBBf+pSeiClm9
	1xszNF8z84HWhw5WJLxS+/XtMGai6h4vWEGZhkimSPnXQzCAYGN9wx2UwWlmYUdZ3TkQXI
	YH0CSfmzBMULNsgV9/m4DgHXYamuGcHkWII+zlSgjgsfju8JgXEf0N+paRkiMfrFZVJdDB
	lU6DI66OhvXQlIRFghhGHeh0PbT/S5xwop410nCWyahAcTB9ReNKreaCC9qNrtv8VTNCR4
	GNGK3Qc4WUrH/64YaS2ZNB3YpdjyHyorEO6Llase4mpJyABgjXt0Z2DKReN4XQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 12:12:47 +0200
Message-Id: <DBR0ER3T2GPB.238KLK8V3DALL@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Aug 2025 10:12:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7421

The following changes since commit 3f88cb85cca8f9128cfaab36882c4563457b03d9=
:

  conf.py: improve SearchEnglish to handle terms with dots (2025-07-11 10:3=
0:38 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 0c154c1f431be918c4c9ce3047c12099925a9c53:

  variables.rst: remove references to obsolete tar packaging (2025-08-01 12=
:05:31 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.11

Marco Cavallini (1):
      dev-manual/start.rst: added missing command in Optimize your VHDX fil=
e using DiskPart

Robert P. J. Day (1):
      variables.rst: remove references to obsolete tar packaging

 documentation/dev-manual/start.rst                 |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.11.rst      | 219 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |  14 +-
 4 files changed, 225 insertions(+), 10 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.11.rst

