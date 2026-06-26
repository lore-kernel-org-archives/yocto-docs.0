Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FC6CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 08:24:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30619.1782462258223955977
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 01:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gDjrlXzo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0A5481A0614;
	Fri, 26 Jun 2026 08:24:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C99A260232;
	Fri, 26 Jun 2026 08:24:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 336C4104C9594;
	Fri, 26 Jun 2026 10:24:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782462255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=x12H825XVoiWnmstPRXh12Xk5PkXjQ4O0dPxFTykco0=;
	b=gDjrlXzoRDq4G/vgy7f23L3YeNWwdRcABsEX5Rkosz7EUJ1VH6Y+ccs147dMTjp39ZxZZQ
	N10eXOyubZNSsEu2SZTwIMgIyeZwxMreBUuK4/T43UyMbtY74nYMclmneAWRVNPn859Fv0
	aAZmNAAtPSFQN3Bf3TD2aRjXGM9jkyuKOjlgTOJZF44dMoRBGUfU49dVcahdn9sfPeyE4E
	yGrDBdp4nlrw+MsMci+pLtam1A5w9Mkday1WTtGq1c7ONsDRyA8KRk53Xcr6DdOdeShyWz
	ivn5CvDC+nlDibHCRfJYPiVxCX/L4aUdYJ43B7UDo9HBGX+NOdwLqLvxGVw0vQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 10:24:13 +0200
Message-Id: <DJIU4UVDJ9JW.1B5R3Y3VVBD0J@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 08:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9906

The following changes since commit 2c59a23fc39d92831cb55a0e5f713d20f94730d4=
:

  ref-manual: add more explanation to glossary variable LICENSE (2026-06-22=
 10:37:34 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to 78bd02a51fcc740180df95028c33045d23e31500:

  migration-guides/migration-6.0.rst: fix wks file move note (2026-06-26 10=
:20:38 +0200)

----------------------------------------------------------------
Antonin Godard (1):
      migration-guides/migration-6.0.rst: fix wks file move note

Robert P. J. Day (2):
      ref-manual: fix incorrect heading level for site.conf section
      ref-manual: under meta/files entry, mention Wic files

jaekyu.lee (1):
      migration-guide: 5.1: Fix typo

 documentation/migration-guides/migration-5.1.rst |  2 +-
 documentation/migration-guides/migration-6.0.rst | 13 ++++++++-----
 documentation/ref-manual/structure.rst           |  7 +++++--
 3 files changed, 14 insertions(+), 8 deletions(-)

