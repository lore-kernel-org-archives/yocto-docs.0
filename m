Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC07D6EBEC
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 08:08:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.111920.1732867678751781082
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 00:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I2DNjbQF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC339E0005;
	Fri, 29 Nov 2024 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732867676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/jHzRm5T13ElOo7MVNWAqrybpuJ80SgJKcaDYxV9Fec=;
	b=I2DNjbQF6x+9LL4T/nfofT9yyyk5XPQmHkDkUClu0MDI3aS5DcbtyrtFEPOp1M2+P3z/rA
	DwAw+biSqhOsInCIeeYCe8uX8QXOMy33DattAgtpgZhq48zMDMA9OcUpZWeGEscJGJySH2
	qga/gKCFOBw6HJUhEBRdExdJWevW1xLhTYSwZQbhVdfLPd7HVCBnIBDter/MUwGsuj/5Vh
	nF7WooRc87KRjQLWb4yMiUfEysGBXiCFnQziNxdaNadIj9SYLqH/RU+qkXw7V9wEZHsyn/
	D42YJNtXKgSFPKq+789nVcglOCuRs8tmRTp69rzVVjlhaPxBOhpsw804Hy5t3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 09:07:56 +0100
Message-Id: <D5YIBOQE7XKA.2WSZZX34247CN@bootlin.com>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 08:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5845

The following changes since commit 8288c8cae7fe7303e89d8ed286de91fc26ce6cc3=
:

  dev-manual: bblock: use warning block instead of attention (2024-11-15 08=
:14:39 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 59c219067c6e47968d07d1f34ff0530f2411fd11:

  migration-guides: add release notes for 4.0.23 (2024-11-29 09:03:30 +0100=
)

----------------------------------------------------------------
Alexander Kanavin (1):
      ref-manual: merge two separate descriptions of RECIPE_UPGRADE_EXTRA_T=
ASKS

Antonin Godard (2):
      standards.md: add a section on admonitions
      ref-manual: classes: fix bin_package description

Lee Chee Yang (3):
      migration-guides: add release notes for 5.0.4
      migration-guides: add release notes for 5.0.5
      migration-guides: add release notes for 4.0.23

 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   2 +
 .../migration-guides/release-notes-4.0.23.rst      | 209 +++++++++++++++++=
++
 .../migration-guides/release-notes-5.0.4.rst       | 212 +++++++++++++++++=
++
 .../migration-guides/release-notes-5.0.5.rst       | 227 +++++++++++++++++=
++++
 documentation/ref-manual/classes.rst               |  45 ++--
 documentation/ref-manual/variables.rst             |  11 +-
 documentation/standards.md                         |  15 ++
 8 files changed, 699 insertions(+), 23 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.23.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.4.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.5.rst

