Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3DEC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 08:48:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14632.1786610921465163233
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 01:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aUbXDt6D;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B018D1A15EA;
	Thu, 13 Aug 2026 08:48:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 755D6604AC;
	Thu, 13 Aug 2026 08:48:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB7EC11C4DB88;
	Thu, 13 Aug 2026 10:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786610918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=0GpSdeJU2wUcNunqvYs+yW/ljGjzS6iaEEXZhWT/v00=;
	b=aUbXDt6Da+lj3oSj3ErCe37BExdpy8xc2PJAMICcTHmefXZOyB0o9ZM0/exwhdm50susx/
	+itF81HS44+Ef6HC1B1lM46T60Oiby6AO4Bfh9MYOqxtws9XoqMBjB8sZGL1+wGmnbVief
	F0E0IphqipTkc3iZ9roithSSJqaV1VSxPgjC5fXdPC2cEOrGwRaRFB0qbPZgP4OHYtt3gL
	XBX+6TmKTC8iwlqzg9qJ5WiNEN3lam0hoveRMjx+gYSe+iNIki+FujDKjR0FCe5L2Xhg5F
	mBoTxkFOP6IDoKmVOX1pjBr/HSkMW2I2/fNQCeS5pK1LR0M8L0YOnFnooSJ9rw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 10:48:36 +0200
Message-Id: <DKNOPO7V8IW9.CDSW7O613GIJ@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 08:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10275

The following changes since commit c8431f833c8f663621793033bbc1b61ccfdf4d28=
:

  dev-manual: Fix missing whitespace around '=3D' operator (2026-07-29 10:5=
7:00 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to 5b1ff88511d90634bb3077b878176de577464e12:

  brief-yoctoprojectqs/index.rst: fix a replacement typo (2026-08-13 10:39:=
52 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      docs-wide: remove CROPS references
      ref-manual/variables.rst: document the QB_DEFAULT_BIOS variable
      brief-yoctoprojectqs/index.rst: use pip to install bitbake-setup
      brief-yoctoprojectqs/index.rst: fix a replacement typo

Paul Barker (1):
      contributor-guide: Note patch complexity requirements for stable bran=
ches

Ulrich =C3=96lmann (1):
      dev-manual/creating-fragments.rst: fix typos

 documentation/brief-yoctoprojectqs/index.rst       |  39 +++++---
 documentation/bsp-guide/bsp.rst                    |   3 +-
 documentation/contributor-guide/submit-changes.rst |   6 ++
 documentation/dev-manual/creating-fragments.rst    |   4 +-
 documentation/dev-manual/start.rst                 | 104 +----------------=
----
 .../overview-manual/development-environment.rst    |  16 ++--
 documentation/overview-manual/yp-intro.rst         |  36 ++-----
 documentation/ref-manual/variables.rst             |  19 ++++
 documentation/sdk-manual/appendix-obtain.rst       |   3 +-
 9 files changed, 70 insertions(+), 160 deletions(-)

