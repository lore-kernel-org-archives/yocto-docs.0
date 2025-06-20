Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C105C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 07:43:35 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2498.1750405407922595039
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 00:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cPaAT+lb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CBEC44357;
	Fri, 20 Jun 2025 07:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750405405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oz2c39KiVAHmiXSLli+DnNPY53NkGZI7OcVmT88rHsM=;
	b=cPaAT+lb2ahBhBKxWTT8f9Ng/pzxWXGOU5AOPoXxC5rOg/FpckN5g2ONGeJcKw2KiTfyI3
	kZSg1ehIho45H+xs+GwSSy7aOjqUjSPBYjCfF40GbkA3f9TGh3Nm34NP778WKQZhBTh/KS
	odyGg2P07zjy4pRFfw7KTmosBjc6uotAFRPAGJHCvxhtE9LdDPF/BaI9t0tIMUgZe541Uc
	zi/35VC2QBet1jsreRpm0MwATiDvppDslwkuxzQ2CGctiFsSCwmXc0IfPUj3Cf0ECGy4hr
	8ynqzd2xZQUr8mGX2D8dGlrY4h24uA9QDeJgzMMywwRPJt0fDXgLsDQvJtph7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 09:43:25 +0200
Message-Id: <DAR6XI39DOY0.2E31B20B7PSZO@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetgeeuleektdfgvdffgfegleefleevtdduueegfeehhfdvkedtvddvueeigeejnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 07:43:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7114

The following changes since commit 92bc958301d0aeab0a19e75b8604f01770358195=
:

  docs: conf.py: silence SyntaxWarning on js_splitter_code (2025-06-06 19:0=
9:30 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 97cd3ee7f3bf1de8454708d1852ea9cdbd45c39b:

  bsp-guide: update lonely "4.12" kernel reference to "6.12" (2025-06-20 09=
:37:28 +0200)

----------------------------------------------------------------
Quentin Schulz (2):
      ref-manual: classes: reword to clarify that native/nativesdk options =
are exclusive
      ref-manual: classes: nativesdk: move note to appropriate section

Robert P. J. Day (2):
      bsp guide: update kernel version example to 6.12
      bsp-guide: update lonely "4.12" kernel reference to "6.12"

 documentation/bsp-guide/bsp.rst      | 23 ++++++++++++++---------
 documentation/ref-manual/classes.rst | 26 ++++++++++++++------------
 2 files changed, 28 insertions(+), 21 deletions(-)

