Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A615C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 08:44:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8752.1751013837184980280
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 01:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nCPa/Zwj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3979143292;
	Fri, 27 Jun 2025 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751013835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PI3OhBChTuSfar9SbU5OYW/lZ2FePT/vqCp9tUnpy/I=;
	b=nCPa/ZwjHey794SmbGAByeN0eqea/S1W5/QEg0FaW/lCEc68AixiROmaSngjeiWP3sA37Y
	QKKyKp5+XOWOKsGrF56fczyts+SbTlaRhJXJNrcowXWM6lThCDS9WWwxfdeosOSygs7ka+
	718qT/Nh8CDMnWZ67nxKUYcn2cGCKU2jssFGOfwBb6slwfZTPgsncXXnd41JdlDDuvL5aj
	7Eh3H0MSY/qJnAQLFBJUKpmRRkRqameZ9h5WURXMKYXmcp4oyaoHkfSmvnudyyus3G7VI4
	XFDWwS/luALBRo4jZ5/tnAAN+Rl+wlHLB4gI5usHgHZErZCcwQYUeUSuA1IwOw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 10:43:54 +0200
Message-Id: <DAX6LMPYYGYO.OJ0IJG6TFQ6C@bootlin.com>
Subject: [kirkstone] Pull request
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7229

The following changes since commit 97cd3ee7f3bf1de8454708d1852ea9cdbd45c39b=
:

  bsp-guide: update lonely "4.12" kernel reference to "6.12" (2025-06-20 09=
:37:28 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 9de9f17abfc6ee11ffa599e45eff8bafd6de801c:

  ref-manual: document KERNEL_SPLIT_MODULES variable (2025-06-27 10:39:47 +=
0200)

----------------------------------------------------------------
Dixit Parmar (1):
      ref-manual: document KERNEL_SPLIT_MODULES variable

 documentation/ref-manual/variables.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

