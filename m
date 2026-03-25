Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81E6103A9A4
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 10:49:08 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19304.1774435737949385659
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 03:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZizR9HJD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 96121C580A8;
	Wed, 25 Mar 2026 10:49:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBAB7601E2;
	Wed, 25 Mar 2026 10:48:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 168D4104513F3;
	Wed, 25 Mar 2026 11:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774435735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=v3aKusKNrT4sRtDgy9wQCsc3V7OMv+wUbpmwVOWA5Io=;
	b=ZizR9HJDtL07FxVgyi6PRMRUShv21u5x14E+wtZTCDAT1MFV0B/vN0WWFUGDkjFD4lYVRJ
	Fcrd5JfuAfFuDovE2HzYlC3wsPcYzaq0pSjKVqeCVlCeuZSXsBsKeElg8LjWpbmxi8LOLt
	fr6JQB+M0hKSG6DEtHfndN8QbwFtjm/5og8VA6FmyA5jPBFaVNYLPUnfxK1+dIGom2lzZ6
	8LAioO1gxtDZilR6IAuYolaZVrRT1j/0p0Q86Pu7I4NQUxFGil+sD3E73hiOA20ZcabMdv
	4bgJuweAZ1RaTQTmRfn/lcAe1l5PKTsMt0dwxfTQ3httCz/saGaWzMkk+JJ6Cg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 11:48:53 +0100
Message-Id: <DHBSYYEYAFBQ.2LFBJNNJKW87B@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Mar 2026 10:49:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9127

The following changes since commit 2141bc2b04ef4210e008752a97ed82979d817dae=
:

  overview-manual/concepts: list other possible class directories (2026-03-=
05 18:10:34 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 60b1c5e635065acc7a7cd2a22f252fc983da223f:

  migration-guides: add release notes for 5.0.16 (2026-03-18 11:22:05 +0100=
)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.16

 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.16.rst      | 219 +++++++++++++++++=
++++
 2 files changed, 220 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-5.0.16.rst

