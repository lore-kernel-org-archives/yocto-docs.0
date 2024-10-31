Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B92D74958
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 12:47:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.11658.1730378835564483808
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 05:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oZzIEED5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B30D1BF207;
	Thu, 31 Oct 2024 12:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730378833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UKyNAkIC/+ZqCOTDikABuRmgpP8cJQwM3/DNE69BMRE=;
	b=oZzIEED5w1hhlhXU8+LsehHc8EUOvHjSEeoogE6gzuErUtaYSO8o1vqezi3e06c390UCOs
	nRoHTi7VIQbedcftHWp3t4/KEMcjrWp08tQOU4dy01ysbGzUJJMr3jD5yOXhBEZ6xvBmxa
	QblTcM9EfwtYtmUD6uHZrtIp0ikL8LMeV/LP8thpG6NuMzNSFQzZT6d2FPFiyXh7oRLSf4
	o3db5hwJgjaZMJeaOqvWgKJhOMVxCmUQFMrjBrUonYn42dqDDDlENN9RI4tjiHMtHisEq+
	kR+eYPjPnsqFKjKruu0lS5UctJkv/JQAPcCnqyXIdL/Rh4+j+o24cRCpr50IJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 13:47:13 +0100
Message-Id: <D5A03PXY5KFO.3U6OMKYGX77Y2@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 12:47:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5630

The following changes since commit 74369923b34b879275cd1d5af6d73e57be757078=
:

  migration-guide: add release notes for 4.0.22 (2024-10-25 09:53:10 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 5aeb6a6b2799fb72abbfb272271e3175eca14b37:

  release-notes-4.0: update BB_HASHSERVE_UPSTREAM for new infrastructure (2=
024-10-31 13:45:11 +0100)

----------------------------------------------------------------
Antonin Godard (4):
      ref-manual: release-process: update releases.svg with month after "Cu=
rrent"
      ref-manual: release-process: add a reference to the doc's release
      ref-manual: devtool-reference: refresh example outputs
      ref-manual: devtool-reference: document missing commands

Steve Sakoman (1):
      release-notes-4.0: update BB_HASHSERVE_UPSTREAM for new infrastructur=
e

 .../migration-guides/release-notes-4.0.rst         |  2 +-
 documentation/ref-manual/devtool-reference.rst     | 72 ++++++++++++++++++=
----
 documentation/ref-manual/release-process.rst       |  2 +
 documentation/ref-manual/svg/releases.svg          | 18 +++---
 4 files changed, 73 insertions(+), 21 deletions(-))

