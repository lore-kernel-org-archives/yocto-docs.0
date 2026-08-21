Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF80C5DF94
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 14:45:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8985.1787323544030818562
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 07:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fFG7jQGS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD0F51A177F
	for <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 14:45:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B23F8604AA;
	Fri, 21 Aug 2026 14:45:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A31A311C77296;
	Fri, 21 Aug 2026 16:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787323537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wWij3Hgd/dwLi+S6TzCBj/+TP/sSrO6p7RRV3p79oC8=;
	b=fFG7jQGSrYogrpbiDAuimowvoMNfFFoIttvGAPPzViXqTcDTaygiEgo+aJGuUYLMTL47f9
	m8cbNWAYvW+2+icSlgjjZYQScszH+nJG6yUdeEsIyss/7r/F0W1NioguZLg0qPMmfF21M8
	W4nXNilGYy7iutejrE/mdR77aKdODusmxmjTMcgqbRsGq1xSTcqG6YQMAMpHLkYtE+5ocb
	iLEdYOgwWInjx84NPQRrL4kxVGJTE3uxDraBMHWL/8ar+eXXJT8dTqpyEuzyvBpZF7jMpT
	yVDJgsyuqMkC1Ih553Bs7AhsTFVkyffPOpN0PonqRf2Wr940tznKS/sV6CAhtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 16:45:36 +0200
Message-Id: <DKUPBDDQLCZT.3SZR7B29P5ACE@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 14:45:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10310

The following changes since commit 3660b8085a5e790c1ea8bf75236fff4b216fe19c=
:

  brief-yoctoprojectqs/index.rst: fix a replacement typo (2026-08-13 10:19:=
54 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 9955b0f099b6b42a9750f0d544944a2d8e5a39b2:

  README: update instructions for installing vale and sphinx-lint (2026-08-=
21 14:47:36 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      ref-manual: add uboot-extlinux-config class documentation
      index.rst: show the intro paragraph only for html-based docs
      ref-manual/variables.rst: document the PACKAGE_NO_LOCALE variable
      ref-manual/variables.rst: document the PACKAGEFUNCS variable

Daiane Angolini (2):
      ref-manual/features.rst: fix some cross references
      docs-wide: fix manual names in cross references

Joshua Watt (1):
      variables: Update variable documentation for SPDX license expressions

Peter Kjellerstedt (1):
      ref-manual/variables.rst: Correct the default value of FILESPATH

Quentin Schulz (1):
      README: update instructions for installing vale and sphinx-lint

anis (1):
      ref-manual/tasks.rst: make do_clean description more explicit

 documentation/Pipfile                  |   2 +
 documentation/README                   |  27 +--
 documentation/index.rst                |  10 +-
 documentation/ref-manual/classes.rst   |  62 ++++++-
 documentation/ref-manual/features.rst  |   6 +-
 documentation/ref-manual/qa-checks.rst |   2 +-
 documentation/ref-manual/tasks.rst     |   9 +-
 documentation/ref-manual/variables.rst | 293 +++++++++++++++++++++++++++++=
+---
 documentation/test-manual/intro.rst    |   2 +-
 9 files changed, 361 insertions(+), 52 deletions(-)

