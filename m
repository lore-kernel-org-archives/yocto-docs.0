Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2AFD0C5E9
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 08:37:46 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.7523.1729845465885586278
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 01:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=faFmM1K1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A26341BF209;
	Fri, 25 Oct 2024 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729845463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R6iMQ/sNuL6xS1NGW6yJ2mB+Spoa/QO4EXjROf9t1W4=;
	b=faFmM1K1K6u1crpSTn6jL9MmItiyLvCefRJI+phcvekLtVL432JKjNDo1FTCm7fV9HMK1d
	gGVVgp0v0oKrP0X9CSKKIroSuusymtsYNBN/fu6b0wTaJ74WflchkufM3U8f6v0lzUjLVC
	SMowLV+vz4ec08u/m5I+MNiLVIj9mJIXCpKmG7jO/mPBMZ0PeUy3/pHpMvPn2rVJioSaxn
	SyZ7QR/e6HoyIWfjHQZUCLo/0oYzPAQKsXSTGd3a8I8via2a7F3sIWg9grmx3j4U0KV89M
	WWaVrQvNzhXvT1/6TlF7U01lfuC+iuz/Guhnlo2Mcv4N5FekHJb/34NGAEi6nA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 10:37:43 +0200
Message-Id: <D54R1F72YDC7.28MWQFLIJ8IV@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 08:37:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5586

The following changes since commit e1ac30dfffddab6e82c708486f8a31f9ec4b1d58=
:

  ref-manual: structure.rst: document missing tmp/ dirs (2024-10-17 12:04:0=
6 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to f490f72b7356ae2564ca6b3f7e4f1ee515f12608:

  migration-guide: add release notes for 4.0.22 (2024-10-25 09:53:10 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      overview-manual: concepts: add details on package splitting
      ref-manual: faq: add q&a on class appends
      ref-manual: release-process: update releases.svg
      ref-manual: release-process: refresh the current LTS releases

Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.22

 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.22.rst      | 196 +++++
 documentation/overview-manual/concepts.rst         |  61 +-
 documentation/ref-manual/faq.rst                   |  19 +
 documentation/ref-manual/release-process.rst       |  15 +-
 documentation/ref-manual/svg/releases.svg          | 907 ++++++++---------=
----
 6 files changed, 627 insertions(+), 572 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.22.rst=
)

