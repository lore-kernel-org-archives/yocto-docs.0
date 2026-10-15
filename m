Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC01CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 08:01:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34669.1792051288581026166
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 01:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Wn0Bhojl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5DEF6C63455
	for <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:02:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 152E960360;
	Thu, 15 Oct 2026 08:01:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FE5F10328BAE;
	Thu, 15 Oct 2026 10:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792051281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9NRcu6lV/euLoXDif6s6TZRy6eJn+UkoeH7Hir7jMe0=;
	b=Wn0BhojlGUFUu/dx2Fug3wAzt5tHN0AGEUF2OVCtT/YUmp3GwYjiXEx/AtjFvXD5nTgHBq
	lNjudhTYSSDvrgT7H8gK0B7K5z5CL4gxaRVywqSdbUGkaHtIW9rz6OD+TZqXtQwZszb92x
	yqReEBUuWr49DbIh7l4lee7IlCIqhgmz/aXcbC5ux4zs4DtjYc3J9UeWwIUutyhoflQRv6
	a6mMo3iHbl1y7pKb+DzO/7dEqSNA9Xj3fExHHuibwWz26U0cxNQ9L0a9WyGlV+kBlJMyCf
	HzE5pjYPJnkKFmXvyaCPwV/ak9f8LpTE4xs0AC3bzp703+xHrTDcxjR+YmuM0A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 10:01:14 +0200
Message-Id: <DM595QANG72T.18G5EGWMU3S9J@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10671

The following changes since commit 9d2cb790abf5ad37b2b1f35823d238c57f4e21a5=
:

  migration-guide: add release notes for 5.0.20 (2026-09-16 10:33:35 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to a34ca7357403feea970d27909e3529cf18e708d5:

  ref-manual: drop "partition" as a wic kickstart command (2026-10-15 09:35=
:47 +0200)

----------------------------------------------------------------
Trevor Woerner (1):
      ref-manual: drop "partition" as a wic kickstart command

 documentation/ref-manual/kickstart.rst | 9 ++++-----
 documentation/ref-manual/variables.rst | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

