Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E0EC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 08:44:05 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.8604.1751013837614180241
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 01:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F5/rWLq5;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79DCE4317A;
	Fri, 27 Jun 2025 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751013835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=06tif72sLbpgm0wRf2usOn378oC8MV2yahj+NdFV8OY=;
	b=F5/rWLq5Gh71XW+z1s2pUZb131mROtIGz9JfRAjsk4u3Fiv/p9AF2cSMl3taTi4nn5pg8I
	p5/m1BdUmIToolCT4bQ8lXrDootJAUmqADupFxjWFwcL/c1BoVc8TKocl+BfUsrI1P/NWT
	pMEXhYahIgnG8keRj7G8U8RA/nAAJZRmrLDE6F13ZIigCZOkh/TMtVD8785DdlmleuWT1L
	8DhoF821/drQUq4Fh2UWcmVTQv+6MQfORHDKYVBfBw748GjcDMNUQlS3rp45By4EzFD8gI
	hpVsn39FArTV/ez4BkNXqJYha2RTaT4qwelJYAwksROQdIcEaVDYCTxPR9RXeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 10:43:55 +0200
Message-Id: <DAX6LMZ1Y7OQ.836NUWN9QUWC@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefggeejtdetieeuteeijedvieejgfdufedtvefhffeludethedthfdvteefleegnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Jun 2025 08:44:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7231

The following changes since commit 0627cfafb9c191763855f5d31c09e88dc5495a87=
:

  bsp-guide: update all of section 1.8.2 to reflect current beaglebone conf=
 file (2025-06-20 09:35:45 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 85f8e5c799ef38c6dcca615d7cc6baff325df259:

  ref-manual: document KERNEL_SPLIT_MODULES variable (2025-06-27 10:39:47 +=
0200)

----------------------------------------------------------------
Dixit Parmar (1):
      ref-manual: document KERNEL_SPLIT_MODULES variable

 documentation/ref-manual/variables.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

