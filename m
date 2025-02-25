Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727BDC021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 16:57:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.13664.1740502614294016584
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 08:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZBefmNBX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A405441B6;
	Tue, 25 Feb 2025 16:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740502612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SwfteD3LFAnBrrfzAB1RvixnWt5raMd4PZi01HMUXpQ=;
	b=ZBefmNBX+oDsCRThXyfpIdX0MGTfBMEAmzPAb2xAQMkzsvsqOeshfFGjarSAcUJNoVM6P2
	+iBe1CqLalC58bOI8uUZxPngkuPW26urAj483Ag6rKgLOHJX1qj2nTbGrUB3ZgUv9Vg7uj
	RukdYjM3GgWVy7srtvTvqQ91C650AseZmQV3EliiUuaBDW0TVodRx3dxnGaNJ0DmsJc6z7
	IoXiI0EgUhweTB98llSxCYRbh07mvo8VoyPE/Bo2s8MdG/h6lcjF9Ej2UbaIbYJjr+swQy
	wjofuoR6JkCHevjbd+ZbXv20+HwnCzgaU2J/t2RHvtZ+h6a80MASb9myanypTg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Feb 2025 17:56:52 +0100
Message-Id: <D81OOLOPJKJ5.FO6NEDDTDJRW@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekjeeluedthffftdekveefvefftdevffefueduueevvefhueduhfdulefgteevueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 16:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6452

The following changes since commit fb677d4289bb00b7807f512a1e3b7c89d3e3d92e=
:

  migration-guides: add release notes for 5.0.7 (2025-02-14 09:01:08 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 3757ace0581e6279aa7c065b21cee56edfe985dd:

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

