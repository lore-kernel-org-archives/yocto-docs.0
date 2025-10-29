Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1722CCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 08:36:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.2523.1761726973630191068
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 01:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kOHVamsj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 93C624E413C5;
	Wed, 29 Oct 2025 08:36:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67271606E8;
	Wed, 29 Oct 2025 08:36:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E37310311E4F;
	Wed, 29 Oct 2025 09:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761726970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5zBCxDP6oYfIUyKevV+OG3s/2VETZFwxwbjGR/SLH4Y=;
	b=kOHVamsjEBgmOCgbfTYbhWGmmeR2JyLjFFx2SJWBYXR+955tm5ihaMEJDcuip2xp30CYFT
	i+F++Q1iC1Cf+n2k9SLa2HQwR/JzkeNsmPewI09ETSsiidfsU/gyDk+n9t+1zOsP+v2E1B
	LN/eL38m7hwR5nagWlpbJvTozZ7ORBXxURXslJjVrMnzKXkPJD9eiDDi1feILxcdjSWy9n
	JxIpEQ1Ys7mNA092Gq2C7TOPZXWCIpFKeFStMeIMJTXbCcewhhDY5KrDsMfYYjbSqClXXj
	izTiB7dRCAvdRtQLAFqLMVVE8fJB+cCJBIwktl25xbvzqhKCmjYngezAiQt2QA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 09:36:10 +0100
Message-Id: <DDUO398KZ96F.A6ZTHXSVF374@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 08:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7888

The following changes since commit 96a8e3e2ad95873a9069d10ba448080e32c71fd0=
:

  migration-guides: add release notes for 4.0.30 (2025-10-06 09:56:36 +0200=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to aef25e0ba434384a60b3e9733040ab266e0429c3:

  ref-manual/classes,variables: document the CCACHE_DISABLE variable (2025-=
10-27 17:04:52 +0100)

----------------------------------------------------------------
Antonin Godard (10):
      ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      ref-manual/classes.rst: extend the uninative class documentation
      ref-manual/variables.rst: fix a typo in UNPACKDIR description
      ref-manual/variables.rst: document the REQUIRED_MACHINE_FEATURES vari=
able
      ref-manual/variables.rst: document the REQUIRED_COMBINED_FEATURES var=
iable
      ref-manual/variables.rst: document the REQUIRED_IMAGE_FEATURES variab=
le
      ref-manual/variables.rst: document the USE_NLS variable
      ref-manual/classes.rst: gettext: extend the documentation of the clas=
s
      ref-manual/classes.rst: document the relative_symlinks class
      ref-manual/classes,variables: document the CCACHE_DISABLE variable

Jo=C3=A3o Marcos Costa (1):
      variables.rst: fix LAYERDEPENDS description

Lee Chee Yang (1):
      migration-guides: add release notes for 5.2.4

Paul Barker (1):
      dev-manual, test-manual: Update autobuilder output links

Robert P. J. Day (1):
      overview-manual/yp-intro.rst: update on-target packaging info

 documentation/dev-manual/vulnerabilities.rst       |   2 +-
 documentation/migration-guides/release-5.2.rst     |   2 +-
 .../migration-guides/release-notes-5.2.4.rst       | 320 +++++++++++++++++=
++++
 documentation/overview-manual/yp-intro.rst         |  11 +-
 documentation/ref-manual/classes.rst               |  96 +++++--
 documentation/ref-manual/variables.rst             |  73 ++++-
 documentation/test-manual/reproducible-builds.rst  |   2 +-
 documentation/test-manual/test-process.rst         |   2 +-
 8 files changed, 479 insertions(+), 29 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.2.4.rst

