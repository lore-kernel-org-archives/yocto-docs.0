Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97085C83000
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 08:44:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.8603.1751013837589122068
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 01:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mMrnOJrp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AD664326B;
	Fri, 27 Jun 2025 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751013835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6dLCK1+KYm54GwDhVy+CVKruJh+v7OFSWy88wSe1qIQ=;
	b=mMrnOJrpA1dEhqJ/p+godDVoLhOxaBxb6R2MPP+6yXDIURHNQOHjS5m2sDiWTfe1NKkzwt
	N/qeHEFJiXHOZnWHTCkH+JWNV4xMwbftjanmTSqgaH21mKRRYlan6orLxveoEwbuMNqsxB
	w35dADnEJymYbdGCLLlidGBqxe5dsY1L5fCXrSN1+LlBuOhOFNPZWCcsV1PZTCW0YF1GyR
	gYwCh4vFc27Cja9n1xlGkcT0PJC8fXo8rUKn1Jssi6FpipTBtxQpCXH31j19urPT1WyqSJ
	N/fjr9zdpW19TZhuoJRSN6+27LtLc4R1qBYa3/Iyb1uarWvNIkZ3h3jIMZTkZg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 10:43:54 +0200
Message-Id: <DAX6LMU8U3OP.139BHLT1TKGTM@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Jun 2025 08:44:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7230

The following changes since commit 731bb4a7d58f16e7920b4798409a4db1b57a0344=
:

  bsp-guide: update all of section 1.8.2 to reflect current beaglebone conf=
 file (2025-06-20 09:36:30 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 80b3bb27e4efa73b982f4bfeccca4deedf78c0d7:

  ref-manual: document KERNEL_SPLIT_MODULES variable (2025-06-27 10:39:47 +=
0200)

----------------------------------------------------------------
Dixit Parmar (1):
      ref-manual: document KERNEL_SPLIT_MODULES variable

 documentation/ref-manual/variables.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

