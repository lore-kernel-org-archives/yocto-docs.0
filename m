Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E105C02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:03:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.65401.1738919021062508127
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JaXTso/a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CD334445C;
	Fri,  7 Feb 2025 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738919019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gnm5Qp72vLOE4rnn9iTO6/yXnlyEs4tRF4AHtxGcwIk=;
	b=JaXTso/afxy/nAs7hX3jGxqYZfxswo61R3dHhhHnwGmgGwHiWVQPXe3croRcwwA/3kNiTH
	31jwuRnoj8L8m5FR6tm7PH0xr61KX1C/Pr1geC3PY+IbSsF5duKgBv+o9Js3W18SAeJu/I
	QLzAYbOumg4DL/Et4vXACDcjIXE3BQnYxsaRldfebd1wX9OgtTVhus7EdUQQdHJhHh0rtb
	G4TjaPZTT6/jkz38aXS77DMC9OXFpk2ryMyWZQVjBhURx5ml5eiOx/Gxutbseoy6C9o8hD
	WlmwzASRQEk0olgrVWGekKYeH8uoxEs/WEmKXHUzYj+zyAUVQRUUCLA8Vv0eBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:03:38 +0100
Message-Id: <D7M3CH1L2MMX.3HAT5ZI4OZ2F@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [styhead] Pull request
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvufesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuudfgjeejkeeviedufefhudevtdduteevgeehteejueeiieeludetieeitdejjeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:03:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6279

The following changes since commit 2df1f56e4863354f05a352d4f61cc797d85100db=
:

  dev-manual/building: document the initramfs-framework recipe (2025-01-27 =
11:29:27 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to a61a3a32fad3b28dd69dda36ef8f4bcf5c3d0b0b:

  migration-guides: add release notes for 5.1.2 (2025-02-07 10:01:02 +0100)

----------------------------------------------------------------
Antonin Godard (1):
      ref-manual/faq: add q&a on systemd as default

Lee Chee Yang (2):
      migration-guides: add release notes for 4.0.24
      migration-guides: add release notes for 5.1.2

Simon A. Eugster (1):
      documentation: Fix typo in standards.md

 documentation/migration-guides/release-4.0.rst     |   2 +-
 documentation/migration-guides/release-5.1.rst     |   1 +
 .../migration-guides/release-notes-4.0.24.rst      | 383 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.1.2.rst       | 312 +++++++++++++++++
 documentation/ref-manual/faq.rst                   |  22 ++
 documentation/standards.md                         |   2 +-
 6 files changed, 720 insertions(+), 2 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.24.rst
 create mode 100644 documentation/migration-guides/release-notes-5.1.2.rst

