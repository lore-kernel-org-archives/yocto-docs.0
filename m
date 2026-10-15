Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3BCCC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 08:01:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34670.1792051288723769369
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 01:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V/03yMuu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8AEC14E41247
	for <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:01:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 514316075D;
	Thu, 15 Oct 2026 08:01:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A17B510328BAF;
	Thu, 15 Oct 2026 10:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792051280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=51cZQW80+5unCLcHIHYwVZLKA06w2BFz3SecoWTWPP8=;
	b=V/03yMuus6AE1gF4hah/m3TXI6785mFkNzILyNAhL5t+qyyjvWS+D8kGtuZDG9avX0m48y
	GRNMEyzoBHjPHhGLd3nkJD8OoOoMvCsKU8bXULMJgZZjodNRdagpiO93obHf37ZYWiH7wq
	/PGOMW8xe8nczNjUYFinxwEbTNYhteizj3MOeflaIxb4RoKRtflikrfLI2UBYcUylKvsld
	Z8QDF5zsqk4ThagHpMJfO2mdnpagreZTlxmIuNXt4UjwYtUeiFomqCJFARQ537lMdHWWcr
	jgaRN83QQBNCPfSqgD/6VdkCYKkVIno78iXn4V+l+HXRz7ZjCBav8kSqy3cRoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 10:01:14 +0200
Message-Id: <DM595QHVVJWP.2XIEA5OX1HD2S@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10670

The following changes since commit a2cc1f5b86f3cdc9ad3257a2545322c5169da3ca=
:

  ref-manual/variables.rst: Document SPDX_AUTHORS (2026-09-16 10:41:42 +020=
0)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to 4328c23c4df10dc9a04426f4ec3081bd17a05e2e:

  dev-manual: correct directory name for oe-core wic files (2026-10-15 09:3=
9:36 +0200)

----------------------------------------------------------------
Adrian Freihofer (1):
      dev-manual/devtool: fix non-patch local file handling docs

Robert P. J. Day (1):
      dev-manual: correct directory name for oe-core wic files

Trevor Woerner (1):
      ref-manual: drop "partition" as a wic kickstart command

 documentation/dev-manual/devtool.rst   | 91 +++++++++++++++++++++++-------=
----
 documentation/dev-manual/wic.rst       |  2 +-
 documentation/ref-manual/kickstart.rst |  9 ++--
 documentation/ref-manual/variables.rst |  2 +-
 4 files changed, 67 insertions(+), 37 deletions(-)

