Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32796D6B6C1
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 12:47:17 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.11644.1730378833474681071
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 05:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HDlsTQh7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87FF72000C;
	Thu, 31 Oct 2024 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730378831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kpw23M+GF2OFoNNoUp150K3wZN8V9+kxer6KEtAGQzw=;
	b=HDlsTQh7YaIr7Us17JE2GHCwusw3qSTkY6YhFnk3C8/sW7Vh1HOVz3zq2nJowp7hicOzId
	qbBd5bJOV5mN7MmsY9/EOUlPsCcC+aR7BXhowsOBUB9Sl3vgoY2k+dWDsNU4k3g4COtmk1
	lQ23rt1u2tbMp1gLUCjoxQDj6bJtZ0o8IZsr+q+l7CMP+/NwPGTUJOtNn9fLoNGoFeovjH
	pxNxkpVNgI5fgc3Lv5InpmSJr34ExdPXATGKvtlIZCrtlWLRxXPOvfvXL35CRHw/tvK3UJ
	ftGR6qSCte6RLdrmn7BISz25P7wJjr9f6Hvov7HIBtIOFbSmPe5A2+q1Ss1cMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 13:47:11 +0100
Message-Id: <D5A03P05GCOK.1N1HALMMGED7R@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 12:47:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5629

The following changes since commit f490f72b7356ae2564ca6b3f7e4f1ee515f12608=
:

  migration-guide: add release notes for 4.0.22 (2024-10-25 09:53:10 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 4716ef9098a297d3183efbbd2c477bc6b48df226:

  release-notes-4.0: update BB_HASHSERVE_UPSTREAM for new infrastructure (2=
024-10-31 13:45:05 +0100)

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

