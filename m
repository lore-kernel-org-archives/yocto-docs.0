Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A79C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 16:57:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.13746.1740502615555027120
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 08:56:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mwzN3Yt2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 313ED441C2;
	Tue, 25 Feb 2025 16:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740502614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5A9riOu6hUP2dOcCOiZP9u1KXKdV/y28sQ9d+yA8Kfo=;
	b=mwzN3Yt2kQZghX+2DXCbIYc4yUEp+iStUSqhxKQlZNyQXJTVeSt3AUEGiuQTQXYXryMxTK
	V7yV9IYv2zmAkqoOx8SQ/dMVxfKQo8brWOIQgp3rzB/KxqvWRANaRZHzJOrFA2LD99fWVb
	3CD2yxM7nJqK0mzwJ9bJUKF3GdVZNCTAkg8i5JcO977IfC0MO2JfuzS4E4wAiJyXv2J4w7
	5nSLibzudmH/7D0qkuSMAODYibTBzsT33gQP5Qef/Ud2pq8AOzMZjDMWh8ZyNaP3LInAVG
	UymLRJqweSv3rWYLitPT6bzlODNGirx4Bbh1BubEOXjuyiaSqUer+vlw4WFk8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Feb 2025 17:56:53 +0100
Message-Id: <D81OOMKVOC19.1F13PU0WMSQO4@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekjeeluedthffftdekveefvefftdevffefueduueevvefhueduhfdulefgteevueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 16:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6453

The following changes since commit 73119a723b48a4038479591f0443c5acb3d21337=
:

  Add favicon for the documentation html (2025-02-14 09:02:18 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 9798689e4f4b74163c2e8594f3d1ce082d295aa1:

  vulnerabilities/classes: remove references to cve-check text format (2025=
-02-25 17:26:59 +0100)

----------------------------------------------------------------
Marta Rybczynska (1):
      vulnerabilities/classes: remove references to cve-check text format

 documentation/dev-manual/vulnerabilities.rst | 96 ++++++++++++++++++++----=
----
 documentation/ref-manual/classes.rst         |  2 +-
 2 files changed, 69 insertions(+), 29 deletions(-)

