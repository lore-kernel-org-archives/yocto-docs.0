Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82751C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 13:27:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.20851.1739539645828184930
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 05:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E10yvtIK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B19584419D;
	Fri, 14 Feb 2025 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739539644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VJFy5C6Dq/vcO8TpHI75jWhupSPmAZ0HyHsgzsaR9+4=;
	b=E10yvtIKff2SmZTc0I8tQopFJLjM0nTBqRvQxVBiFYMogcHLWGDKIFgNkO25ey6v5yxckq
	XjvVJsaQFUzpkgOU9wgDO9t05IgzJdnfuTy4Z3fPQ3ufj5yg2QaM36+G8/ufrmP3TXZ4n+
	TpLNoFdiGh4wEFL56tJyGAlXW9jsMZUkA4iOAK+0qJeSKg58ffj9iX4uO6tYtPFzA4Mg92
	JlZ7lU0tr6PNpLyQK5Ik1m4GM1MxA+cpazzZe3NJjEzIYQ6CsmY6qa7rk28rYgBurqXB0M
	mLDKTVg2LLUyqdZ+hsPJGPXJzXuu+f3hWwehB1cvX5jIHNwSCg+5dKIIfW4IvA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Feb 2025 14:27:23 +0100
Message-Id: <D7S7C80PBNHK.33ZUOM45EJ53K@bootlin.com>
Subject: [styhead] Pull request
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
 <docs@lists.yoctoproject.org>; Fri, 14 Feb 2025 13:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6368

The following changes since commit a61a3a32fad3b28dd69dda36ef8f4bcf5c3d0b0b=
:

  migration-guides: add release notes for 5.1.2 (2025-02-07 10:01:02 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to fd9c744d6e73a5719e61a3c0063b1602ca386e91:

  migration-guides: add release notes for 5.0.7 (2025-02-14 09:01:21 +0100)

----------------------------------------------------------------
Adrian Freihofer (1):
      sdk-manual: extensible.rst: update devtool ide-sdk

Antonin Godard (2):
      contributor-guide/submit-changes: add policy on AI generated code
      Add favicon for the documentation html

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.7

 documentation/conf.py                              |   1 +
 documentation/contributor-guide/submit-changes.rst |  49 +++
 documentation/migration-guides/release-5.0.rst     |   2 +
 .../migration-guides/release-notes-5.0.7.rst       | 331 +++++++++++++++++=
++++
 documentation/sdk-manual/extensible.rst            |   7 +-
 documentation/sphinx-static/favicon.ico            | Bin 0 -> 1291 bytes
 6 files changed, 387 insertions(+), 3 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.7.rst
 create mode 100644 documentation/sphinx-static/favicon.ico

