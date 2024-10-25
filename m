Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF278D0C5E6
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 08:37:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.7516.1729845461814048923
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 01:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dvtzOthP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6F12FF806;
	Fri, 25 Oct 2024 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729845460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ClplZjdU8sSPehDUSoE6KGr7MlcIedMgty2Y04TdE9U=;
	b=dvtzOthPrFD84EhOlgp1sF0I7kQ/SmpIQppOsW9Nt3Ll3jJd7Q6I1geL05cp4zIaIrw40n
	XKyyFHOp/Wv0UzqySUifTID78UDu4yvGc7DpJEfzR67+RBNtEcN9I/ltuKmRQ51cShK1XJ
	WaTgTeIuJyJUOnUk9oKp7Jn4jJoE1lfXEYoVFGtvYhp5jASq4wYWvSy92PrnK8/ZORODXc
	pwLZWMfM6ux8g+LKwX/jDA5ebdlP62/6FS/zu/Px4AFkkdiU+8XQkvhlTgik73Ci136PY9
	aPGUaVxLSL0TKR2hMWfnHdwN54P/PVc3B25lKRioGgiJmhv1jeXcRDJLebCo4Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 10:37:39 +0200
Message-Id: <D54R1DDPOYBV.1F9780OX1XIOU@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 08:37:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5585

The following changes since commit 372b5b4ca55819c294970b20aa8b8d8167144329=
:

  ref-manual: structure.rst: document missing tmp/ dirs (2024-10-17 09:35:0=
5 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 9563855ccd92e21fb6f8320c96a3a83e115c947e:

  migration-guide: add release notes for 4.0.22 (2024-10-25 09:52:03 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      overview-manual: concepts: add details on package splitting
      ref-manual: faq: add q&a on class appends
      ref-manual: release-process: update releases.svg
      ref-manual: release-process: refresh the current LTS releases

Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.22

Niko Mauno (1):
      ref-manual: Sync variables letter index

 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.22.rst      | 196 +++++
 documentation/overview-manual/concepts.rst         |  61 +-
 documentation/ref-manual/faq.rst                   |  19 +
 documentation/ref-manual/release-process.rst       |  15 +-
 documentation/ref-manual/svg/releases.svg          | 907 ++++++++---------=
----
 documentation/ref-manual/variables.rst             |  10 +-
 7 files changed, 632 insertions(+), 577 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.22.rst=
)

