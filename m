Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C60BC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:07:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7296.1785316016671011356
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 02:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wLVgT5Ct;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C96A91A12F7;
	Wed, 29 Jul 2026 09:06:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96B3C6039A;
	Wed, 29 Jul 2026 09:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8429A11C14B2B;
	Wed, 29 Jul 2026 11:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785316013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=MazLlI1VW7cqsEGWLAbwMXF96KTfGT0Jhq4gSiCATnY=;
	b=wLVgT5CtQJ1xaLvntuyV1RGRBE07HnN1ClvBApFPah6rgtX30siWDLdj55MABCaVJLisb5
	Yfiz3m6a6QkTKil12dJhr6uZCLgmH7vr3prcxglOTw+c27H6crbWYSNX4BhwlmB0G2Eg53
	CT8T212Gv/7V9dWH436Eyc6WWM0bZo6cd6FGg0ojrIFqNrcEKONzBciv993h6pmB7D/7a/
	KCci4/Ia1G5lgdZIgO84G4ITebnM0MNszsmD66efXm4cAsWRedUlrmCO09fyTs9Si5wvHR
	gTuK9euyl/JDq5iLUAIRVuaLPgUN7bSLOYkksQMtZKfj0v/GDfOOdUE9+NiKfQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 11:06:51 +0200
Message-Id: <DKAXPHBD0C57.1O6IYNLN2UEKJ@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 09:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10182

The following changes since commit e0ad133aca131941e9c8b7d66d6723762185662b=
:

  docs-wide: fix various broken links (2026-07-15 14:57:11 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to c8431f833c8f663621793033bbc1b61ccfdf4d28:

  dev-manual: Fix missing whitespace around '=3D' operator (2026-07-29 10:5=
7:00 +0200)

----------------------------------------------------------------
Antonin Godard (2):
      migration-guides/migration-3.4.rst: replace rlbl broken link
      migration-guides: replace broken link with archive links

Daniel Turull (1):
      ref-manual/release-process.rst: update LTS supported versions

Lee Chee Yang (2):
      migration-guide: add release notes for 5.0.19
      migration-guide: add release notes for 6.0.2

Niko Mauno (2):
      ref-manual: Fix occurrences of omitted space with :prepend
      dev-manual: Fix missing whitespace around '=3D' operator

 documentation/dev-manual/layers.rst                |   2 +-
 documentation/migration-guides/migration-3.4.rst   |   2 +-
 documentation/migration-guides/migration-5.3.rst   |   2 +-
 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-6.0.rst     |   1 +
 .../migration-guides/release-notes-4.3.rst         |   2 +-
 .../migration-guides/release-notes-5.0.19.rst      | 663 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.0.rst         |   2 +-
 .../migration-guides/release-notes-5.3.rst         |   3 +-
 .../migration-guides/release-notes-6.0.2.rst       | 273 +++++++++
 documentation/ref-manual/faq.rst                   |   6 +-
 documentation/ref-manual/release-process.rst       |   2 +-
 documentation/ref-manual/variables.rst             |   3 +-
 13 files changed, 952 insertions(+), 10 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.19.rst
 create mode 100644 documentation/migration-guides/release-notes-6.0.2.rst

