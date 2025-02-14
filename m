Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8351CC021A6
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 13:27:29 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.20809.1739539648391999312
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 05:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I/kbCo2I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61FA34431E;
	Fri, 14 Feb 2025 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739539646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9/MMvanWjBZIH/M8ROGolEYS1QH/CD3Fc/i6I5tW2zc=;
	b=I/kbCo2I/t4w4/ea5DhpvmLiF9oVAwng2dHG64uE8sCD2+LzYjhY+ASUqy8MMp1YcH1Jpg
	A6KzX1mH3zPM4miPV2TKP8/WZhL54UXhEL1tm1sf/5jBYI6U7oxg3iZKK0Jndel7hzDff9
	fP6IhOFS+l/cl/MqAMSuMDS70tSa0zUVpvQyR8XOvASx4mOjSxLqnsrFY+JwgWN6dTPfzU
	iEkb96uWgI3kxzLXyQ4Ruv8nOKanmQROtkQDFPF4/CbHUwEgBvV6RDOHM+3LnrQCSpbYHf
	1TuhNjS/Sh+luC9YVtJS364oyv1lNLKp6e1n2wbshg6nJggCaDBpEGeA7NUVRQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Feb 2025 14:27:26 +0100
Message-Id: <D7S7C97XFHFH.36NYEIYPFZH13@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvufesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuudfgjeejkeeviedufefhudevtdduteevgeehteejueeiieeludetieeitdejjeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Feb 2025 13:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6369

The following changes since commit 0e9cc7e9ad5c8bbd7f12a192bff103c118d7f7bb=
:

  migration-guides: add release notes for 4.0.24 (2025-02-04 15:55:59 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to fb677d4289bb00b7807f512a1e3b7c89d3e3d92e:

  migration-guides: add release notes for 5.0.7 (2025-02-14 09:01:08 +0100)

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

