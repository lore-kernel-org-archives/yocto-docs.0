Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B657AD59F43
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:48:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.48790.1730908100636464777
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 07:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FXsFHFdL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BA271C0005;
	Wed,  6 Nov 2024 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730908099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9IO7dk8ervUktvY7uSt9Ge2TIDjCBQcPkpjxFUhGbIQ=;
	b=FXsFHFdLnE5/2oRkZqT58w85OeOi0qXjZR2QVRrYhLslVKqvIOpZ6fqW2qQbizoaHwfqS1
	qaTRLzw6I5iC04AWX2qdnlmzwctYemAtwQ7beGgnPUi6bZcE/4eHr1fw+bx0QVI2GWPEl6
	P9jHvkRtvNFAhs+APA62Tqlh9+jYnCBPj+LBDJd2gxUHrm6tLRWxV6revn89nr5GLRaXqO
	7pm4K8ppn7SN9pWiBEI9OSR1bOQ8XbbYzc1GKCzvesO4segGzp+euF88PJie2xxf4oFKni
	dxrZHTu0ytSyPv0g3VOtBbWWfJqT6BSZpSEU6boXT9FYVZi9YQRu6har66LXHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 16:48:18 +0100
Message-Id: <D5F7PN8RBER0.24LVUO5HJM6V8@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 15:48:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5706

The following changes since commit 5aeb6a6b2799fb72abbfb272271e3175eca14b37=
:

  release-notes-4.0: update BB_HASHSERVE_UPSTREAM for new infrastructure (2=
024-10-31 13:45:11 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to e882cb3e5816d081eb05cb83488f286cca70e0c6:

  dev-manual: add bblock documentation (2024-11-06 16:39:13 +0100)

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
 .../migration-guides/release-notes-5.0.4.rst       |  32 ++---
 .../migration-guides/release-notes-5.0.rst         |  66 +++++------
 documentation/ref-manual/structure.rst             |   9 ++
 documentation/ref-manual/variables.rst             |  47 ++++++++
 .../styles/config/vocabularies/Yocto/accept.txt    |   1 +
 56 files changed, 1048 insertions(+), 844 deletions(-)
 create mode 100644 documentation/dev-manual/bblock.rst)

