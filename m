Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8108D59F48
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:48:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.48791.1730908100725202386
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 07:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O3z+i/o+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E14CFF802;
	Wed,  6 Nov 2024 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730908098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aCsqsInXwPuL5mAunhci/5ANvMpr/ziYW/X/bVHfJSM=;
	b=O3z+i/o+7cPqwuErxnJgWeIqCnQREl9sonxe+qWEM4j1eXs5qAFqx5L6EFklNWKHXeYErw
	PfzlFTMHlE4RLCTXhIeC6JeuEiueaUWPnSfDPQ6W5GqX/ERlO/yyzHwu0FDWn5Px6pdD3D
	qNXuXMlAXuBoPgFJj72+Ex9X+Ze2i0BnTkpkHYcY3WLX3DbcDNx44HfHQMumV6RYZHJOQx
	lC5hPvgJ6L6F9ZR1jnn0/gqOB1a6AaI/4XQ2Rrejr55nPZHXegZ9yFFUAfTAWq7bizKR66
	1ZRJw3CAmQNQ9wi3d5KqSW7s1q4a/BzH0povdXh334JYsAN7x5hjm9Z6MeuGWA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 16:48:18 +0100
Message-Id: <D5F7PMX6XVCJ.1RTQN0IPZKRVZ@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 15:48:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5707

The following changes since commit 4716ef9098a297d3183efbbd2c477bc6b48df226=
:

  release-notes-4.0: update BB_HASHSERVE_UPSTREAM for new infrastructure (2=
024-10-31 13:45:05 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 5692ad6f023289dda63567c1f79132854ae3899d:

  dev-manual: add bblock documentation (2024-11-06 16:39:02 +0100)

----------------------------------------------------------------
Antonin Godard (1):
      conf.py: rename :cve: role to :cve_nist:

Julien Stephan (5):
      README: add instruction to run Vale on a subset
      documentation: Makefile: add SPHINXLINTDOCS to specify subset to sphi=
nx-lint
      styles: vocabularies: Yocto: add sstate
      ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables
      dev-manual: add bblock documentation

 documentation/Makefile                             |  23 ++--
 documentation/README                               |  18 ++-
 documentation/conf.py                              |   2 +-
 .../contributor-guide/recipe-style-guide.rst       |   2 +-
 documentation/dev-manual/bblock.rst                | 129 +++++++++++++++++=
++++
 documentation/dev-manual/index.rst                 |   1 +
 .../migration-guides/release-notes-3.4.1.rst       |  14 +--
 .../migration-guides/release-notes-3.4.2.rst       |  40 +++----
 .../migration-guides/release-notes-3.4.3.rst       |  10 +-
 .../migration-guides/release-notes-3.4.4.rst       |   6 +-
 .../migration-guides/release-notes-3.4.rst         |  56 ++++-----
 .../migration-guides/release-notes-4.0.1.rst       |  10 +-
 .../migration-guides/release-notes-4.0.10.rst      |  42 +++----
 .../migration-guides/release-notes-4.0.11.rst      |  24 ++--
 .../migration-guides/release-notes-4.0.12.rst      |  48 ++++----
 .../migration-guides/release-notes-4.0.13.rst      |  68 +++++------
 .../migration-guides/release-notes-4.0.14.rst      |  56 ++++-----
 .../migration-guides/release-notes-4.0.15.rst      |  34 +++---
 .../migration-guides/release-notes-4.0.16.rst      |  30 ++---
 .../migration-guides/release-notes-4.0.17.rst      |  42 +++----
 .../migration-guides/release-notes-4.0.18.rst      |  32 ++---
 .../migration-guides/release-notes-4.0.19.rst      |  36 +++---
 .../migration-guides/release-notes-4.0.2.rst       |  14 +--
 .../migration-guides/release-notes-4.0.20.rst      |  16 +--
 .../migration-guides/release-notes-4.0.21.rst      |  48 ++++----
 .../migration-guides/release-notes-4.0.22.rst      |  30 ++---
 .../migration-guides/release-notes-4.0.3.rst       |  30 ++---
 .../migration-guides/release-notes-4.0.4.rst       |  22 ++--
 .../migration-guides/release-notes-4.0.5.rst       |  10 +-
 .../migration-guides/release-notes-4.0.6.rst       |  44 +++----
 .../migration-guides/release-notes-4.0.7.rst       |  40 +++----
 .../migration-guides/release-notes-4.0.8.rst       |  20 ++--
 .../migration-guides/release-notes-4.0.9.rst       |  42 +++----
 .../migration-guides/release-notes-4.0.rst         |  62 +++++-----
 .../migration-guides/release-notes-4.1.1.rst       |  22 ++--
 .../migration-guides/release-notes-4.1.2.rst       |  24 ++--
 .../migration-guides/release-notes-4.1.3.rst       |  36 +++---
 .../migration-guides/release-notes-4.1.4.rst       |  34 +++---
 .../migration-guides/release-notes-4.1.rst         |  60 +++++-----
 .../migration-guides/release-notes-4.2.1.rst       |  14 +--
 .../migration-guides/release-notes-4.2.2.rst       |  30 ++---
 .../migration-guides/release-notes-4.2.3.rst       |  34 +++---
 .../migration-guides/release-notes-4.2.4.rst       |  72 ++++++------
 .../migration-guides/release-notes-4.2.rst         |  64 +++++-----
 .../migration-guides/release-notes-4.3.1.rst       |  16 +--
 .../migration-guides/release-notes-4.3.2.rst       |  24 ++--
 .../migration-guides/release-notes-4.3.3.rst       |  22 ++--
 .../migration-guides/release-notes-4.3.4.rst       |  34 +++---
 .../migration-guides/release-notes-4.3.rst         |  80 ++++++-------
 .../migration-guides/release-notes-5.0.2.rst       |  22 ++--
 .../migration-guides/release-notes-5.0.3.rst       |  48 ++++----
 .../migration-guides/release-notes-5.0.rst         |  66 +++++------
 .../migration-guides/release-notes-5.1.rst         |  52 ++++-----
 documentation/ref-manual/structure.rst             |   9 ++
 documentation/ref-manual/variables.rst             |  47 ++++++++
 .../styles/config/vocabularies/Yocto/accept.txt    |   1 +
 56 files changed, 1058 insertions(+), 854 deletions(-)
 create mode 100644 documentation/dev-manual/bblock.rst)

