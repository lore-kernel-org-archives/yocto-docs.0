Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAAACCD182
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 15:01:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.9768.1759503700453427039
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 08:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ftFWTtmX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E40D61A10DC;
	Fri,  3 Oct 2025 15:01:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1D29606E5;
	Fri,  3 Oct 2025 15:01:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 190E3102F1C37;
	Fri,  3 Oct 2025 17:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759503698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rNEOC3u3gaV6lg8Zj1caqHE2UYsT1e5TwWDAqO+j+SQ=;
	b=ftFWTtmXus6dXoVUxQ0+CJ2lo5xbOucxwNw76UUKKC8kWZU6ajUV4U9RmqaGdBdwDkXInK
	+n5vxyr4akT5Z/M8mdpxtH88Q5L1RIb0VDbQYZKqI47H3hXyt+7uDqwm1k+K9ZC4LDPySF
	YFsNRPRbqQkTcnK4IKrj/TVUOXh/8WC2vM7uOWP3PG6dYhMa3f1fcJYODrliqgTLDcPdRf
	qDUxZBw37s1sO/24+fwekpb5bw/Vky4IFc7SyjLYHctlExOBzqV+QEmiFPXIoQa0ewpSvi
	1GMWAEYb/B4NhgV/GP5ZdzyCmMM3V5PxpdTvJj4Y3lez7duo2tnPghA75tjeyw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 17:01:35 +0200
Message-Id: <DD8S075GR9ZO.R4BLAUNOTN4C@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 15:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7639

The following changes since commit a84c234acfedfa714419006c743405e2f9acaedc=
:

  test-manual/yocto-project-compatible.rst: fix a typo (2025-09-26 09:56:59=
 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 09c7800333b17b21e50d2a089a3ae1b123697243:

  tools/build-docs-container: update with newly supported distros (2025-10-=
03 11:43:15 +0200)

----------------------------------------------------------------
Adam Blank (3):
      kernel-dev/common.rst: fix the in-tree defconfig description
      ref-manual/variables.rst: fix the description of KBUILD_DEFCONFIG
      ref-manual/variables.rst: fix the description of STAGING_DIR

Adrian Freihofer (1):
      docs: add util-linux-script package for Fedora 42+

Antonin Godard (5):
      ref-manual/structure: document the auto.conf file
      Add documentation on fragments
      ref-manual/system-requirements.rst: update supported distributions
      set_versions.py: fix subprocess.run call for older distros
      tools/build-docs-container: update with newly supported distros

Quentin Schulz (1):
      tools: build-docs-container: remove comment for unsupported distros

Talel BELHAJ SALEM (1):
      dev-manual/building.rst: add note about externalsrc variables absolut=
e paths

 documentation/dev-manual/building.rst              |   5 +
 documentation/dev-manual/creating-fragments.rst    | 146 ++++++++++++
 documentation/dev-manual/index.rst                 |   1 +
 documentation/kernel-dev/common.rst                |  10 +-
 documentation/ref-manual/fragments.rst             | 258 +++++++++++++++++=
++++
 documentation/ref-manual/index.rst                 |   1 +
 documentation/ref-manual/structure.rst             |   9 +
 documentation/ref-manual/system-requirements.rst   |   5 +-
 documentation/ref-manual/terms.rst                 |  92 ++++++++
 documentation/ref-manual/variables.rst             |  44 +++-
 documentation/set_versions.py                      |   2 +-
 documentation/tools/build-docs-container           |  25 +-
 .../host_packages_scripts/fedora_essential.sh      |   2 +-
 13 files changed, 575 insertions(+), 25 deletions(-)
 create mode 100644 documentation/dev-manual/creating-fragments.rst
 create mode 100644 documentation/ref-manual/fragments.rst

