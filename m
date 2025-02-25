Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8739AC021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 16:56:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.13662.1740502612096621237
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 08:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fo3jdiTM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C825442AC;
	Tue, 25 Feb 2025 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740502610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HwxQge5arTnrf23v3bMkBUKaYpt4XawQCuBq6PqLo7o=;
	b=fo3jdiTMc9GYTtyIlL1FsmOz1aVtSRvNT1oAUwl3pg22BLyCg9wP3570L6LU+0DE9vioma
	WwIU/xncD6kqRHqSz0un6VbixBv8l31dj+6GPLMiJsxLKXd5PH7urqOQaYRIWetTj0+EXG
	SoWFBMtyL7D/PTG/vfsWcKiM5+079szm73OU2H3yJ28FVBwm/vmd4P41awhrwCd0FSYjXU
	qpmjp+I2SGHYpdvrhKa7AQx47tLBw9FqO6t4GO/6c3d8GQfi5jMHzY9EhKuNE5cXTBHaYG
	A47wdXL8OUpNzlrQs+yE3LZHpIkbWNjC85xLBQVuYOWqJvqDFe1qV3kBJKC+xA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Feb 2025 17:56:50 +0100
Message-Id: <D81OOKY9D7VS.15SA8XO526SL2@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggfegjedtteeiueetieejvdeijefgudeftdevhfffleduteehtdfhvdetfeelgeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 16:56:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6451

The following changes since commit fd9c744d6e73a5719e61a3c0063b1602ca386e91=
:

  migration-guides: add release notes for 5.0.7 (2025-02-14 09:01:21 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 08f4670ef7c7a2071f3634cbf0d9c3d0cd2dde3e:

  vulnerabilities/classes: remove references to cve-check text format (2025=
-02-25 17:26:59 +0100)

----------------------------------------------------------------
Marta Rybczynska (1):
      vulnerabilities/classes: remove references to cve-check text format

Weisser, Pascal (1):
      ref-manual: Add missing variable IMAGE_ROOTFS_MAXSIZE

 documentation/dev-manual/vulnerabilities.rst | 96 ++++++++++++++++++++----=
----
 documentation/ref-manual/classes.rst         |  2 +-
 documentation/ref-manual/variables.rst       |  6 ++
 3 files changed, 75 insertions(+), 29 deletions(-)

