Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26912CCF9F0
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 08:36:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.2521.1761726973491702065
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 01:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k4eVbhm9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C34454E413CB
	for <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 08:36:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 938CE60709;
	Wed, 29 Oct 2025 08:36:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 139E41031151A;
	Wed, 29 Oct 2025 09:36:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761726970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TkhjY0xIMNbVhH9VP6Rhz0gmrWnnRxT0/bUl6bV8ePo=;
	b=k4eVbhm9RAadMVcg4ysgDcSXDM+Dt7GyIegCPN486MhQ2Uc55QR5T+c0ZP3aDc76G8gnGa
	fW0wCO8H37x0edCCHiTHhkHSEPoR84OGJ5LLGTuyhMm99NyFs4m4Fg/A2EAyh4vGqW+Xnl
	7PIDQfFu4w1R81Zt5FWcB/Gd/0oZnlHajeanOHxRuYK0IkEVlzUNFA5jPXmHaGVxuHHouT
	6+76J5APD6HuwxCK+XTOOSYwnXh5g1h+ICK8DPeIGGSXycjtupMsvKN+NbuLNl5ZLiWcyd
	rZS6IBhf/h1/Em/GG0K+0vRqjzk+6XGnMbmqgSwwZSD+MkM+xM/1XzRQ0G9L/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 09:36:09 +0100
Message-Id: <DDUO391B8U3V.1PFKOVDH6732C@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 08:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7891

The following changes since commit 6cd7492bf83232744390f34e496367e94b63e701=
:

  vulnerabilities: update nvdcve file name (2025-10-13 09:13:32 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to a8687e4bb2e822670b6ad110613a12fa02943d3d:

  ref-manual/classes.rst: document the relative_symlinks class (2025-10-27 =
17:07:07 +0100)

----------------------------------------------------------------
Antonin Godard (9):
      ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      ref-manual/classes.rst: extend the uninative class documentation
      ref-manual/classes,variables: document the CCACHE_DISABLE variable
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

Jo=C3=A3o Marcos Costa (1):
      variables.rst: fix LAYERDEPENDS description

Paul Barker (1):
      dev-manual, test-manual: Update autobuilder output links

Robert P. J. Day (1):
      overview-manual/yp-intro.rst: update on-target packaging info

 documentation/dev-manual/vulnerabilities.rst      |  2 +-
 documentation/overview-manual/yp-intro.rst        | 11 +--
 documentation/ref-manual/classes.rst              | 96 ++++++++++++++++++-=
----
 documentation/ref-manual/variables.rst            | 71 ++++++++++++++++-
 documentation/test-manual/reproducible-builds.rst |  2 +-
 documentation/test-manual/test-process.rst        |  2 +-
 6 files changed, 157 insertions(+), 27 deletions(-)

