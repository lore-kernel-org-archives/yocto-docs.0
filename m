Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB2AD74957
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 12:47:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.11659.1730378837531493479
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 05:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LSOgsoRl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75E0440005;
	Thu, 31 Oct 2024 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730378835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UYOPKBQ+QmoyWdyOIyfUFiI8fM2kQDElbE47PT3Flbw=;
	b=LSOgsoRlRDofIYphcJFfnbc/TC5uDg7/u0/hcdLYIRd8RVlLo2qFh/Jr2lIiOJZQMVGaJu
	RImr51isrYYIy1GfRQMLRwUu8Fr28s3qG3KKSGLnSSAYQxz8AAFir943wd2bq/e88LQsxW
	DNU/izs3sSzHjxt7u88xBV4DrUqpfBF0GtrTftqBEUYwHp9IrQXXnXkLfkfeslVX10WD/b
	fdwGxtGneYb7SLp8r3A7R2QarqFcW1UCXbxyGSaJjtPviJ4OOuWX0L2zVdEb26E6cQ4SNW
	PSdwUZ9IyMw/A8jtkbs9qiOtzCEYmRCV7m4EaEtgQJFxivLgFylih7WlQA64Pg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 13:47:15 +0100
Message-Id: <D5A03QT5V3OY.20S0H8FTN0JXE@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 12:47:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5631

The following changes since commit f08f4c664ffd49d23c7318d88604d1c940f0298a=
:

  migration-guide: add release notes for 4.0.22 (2024-10-25 09:53:10 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 0bef2bc76d1313aec0988284d6ed550bfc887951:

  release-notes-4.0,brief-yoctoprojectqs: update BB_HASHSERVE_UPSTREAM for =
new infrastructure (2024-10-31 13:45:16 +0100)

----------------------------------------------------------------
Antonin Godard (4):
      ref-manual: release-process: update releases.svg with month after "Cu=
rrent"
      ref-manual: release-process: add a reference to the doc's release
      ref-manual: devtool-reference: refresh example outputs
      ref-manual: devtool-reference: document missing commands

Steve Sakoman (1):
      release-notes-4.0,brief-yoctoprojectqs: update BB_HASHSERVE_UPSTREAM =
for new infrastructure

 documentation/brief-yoctoprojectqs/index.rst       |  2 +-
 .../migration-guides/release-notes-4.0.rst         |  2 +-
 documentation/ref-manual/devtool-reference.rst     | 72 ++++++++++++++++++=
----
 documentation/ref-manual/release-process.rst       |  2 +
 documentation/ref-manual/svg/releases.svg          | 18 +++---
 5 files changed, 74 insertions(+), 22 deletions(-))

