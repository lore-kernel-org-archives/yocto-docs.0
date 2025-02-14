Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E23C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 13:27:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.20814.1739539651461731765
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 05:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lf3wPpZr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D58344261;
	Fri, 14 Feb 2025 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739539649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3WCTqw7jrFurAthV3x04v7RDyXfJjwBPXdpKA8ieVuE=;
	b=lf3wPpZrZjNuUk1Sof2m4lhlvn2+86vRZFmW1nqYHYKHpGryXRtIMqJ83YccdBYtQ0A+ME
	4Vd0JRkoDMdwULi7nU9wzKnrGrH+3r1Y6q2MvvoAlxR6W36LB/4wD72m/6dHct4ZqyYDVA
	vJFC0yQ+NkiCmChhPDYqvu3XjtswKMjM/8iRF1ZCki6VprYg2ap5PNWU6ne+8oNQRkHI/u
	mc7G30h1Y9/vzs7D46MqeyPLbydZYCtV4nkmogLCu2WUlgWdRkZevL8gOp1e2bArlZ5ID7
	c3tr66YKPTvWcRFwTK1mjeVTt8pVFyYsWGZMpJ62h6QO6187sDHSWhPxCgLzUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Feb 2025 14:27:28 +0100
Message-Id: <D7S7CAFK06LP.2CBJHHSCG6HOO@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekjeeluedthffftdekveefvefftdevffefueduueevvefhueduhfdulefgteevueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Feb 2025 13:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6370

The following changes since commit c6dce0c77481dee7b0a0fcdc803f755ceccef234=
:

  migration-guides: add release notes for 4.0.24 (2025-02-04 15:56:24 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 73119a723b48a4038479591f0443c5acb3d21337:

  Add favicon for the documentation html (2025-02-14 09:02:18 +0100)

----------------------------------------------------------------
Antonin Godard (2):
      contributor-guide/submit-changes: add policy on AI generated code
      Add favicon for the documentation html

 documentation/conf.py                              |   1 +
 documentation/contributor-guide/submit-changes.rst |  49 +++++++++++++++++=
++++
 documentation/sphinx-static/favicon.ico            | Bin 0 -> 1291 bytes
 3 files changed, 50 insertions(+)
 create mode 100644 documentation/sphinx-static/favicon.ico

