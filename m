Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF718CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 13:56:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40777.1792072606369939268
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 06:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VbEEf6+y;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C3244E41255;
	Thu, 15 Oct 2026 13:56:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D381360360;
	Thu, 15 Oct 2026 13:56:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3583910328B9A;
	Thu, 15 Oct 2026 15:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792072599; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=31rTaUmAkTUChJvzdtWkZPOOnnzNeq25GKU5ilbK/Wg=;
	b=VbEEf6+yTwpis3yqbsi5pCCI7epzRe7jD5Dw/HDqxmEfZxvurEDgtElOH5Af7UQ/o4HEez
	sYdKWgcHuEMYjThNJuKyddnFu5XUxFQzLBNdQe74ccgzh1L4c/CV7cQ6BxynnTE6rbx+2t
	v0hT1Me6EoNqN9zEmDMzUSc14dKMQoyK+qBKpMpDdQaRklWaNDZgSVwJFrvxtbX2ddum5l
	MxDanpVkfI8BH7T5t/0rvSFKVPKgPX9nKTVaJAdT8aA/XauhEOi94g8pscC8qqIPg+zMVj
	cVCVnQgLI6GpRgeuVeYOZlrayLydge+CB+8ejtY7Md1Prlcxo7SZlie42KA6qg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 15:56:37 +0200
Message-Id: <DM5GPTWWFHZY.II59TGVXOVU2@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [blacksail] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 13:56:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10682

The following changes since commit f26faba8568a3c8fc81d81d3650cc419847a4e17=
:

  migration-guides/release-notes-6.1.rst: add contributors (2026-09-21 17:1=
5:14 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs blacksail-next

for you to fetch changes up to c75568b0e658c275ae08e1664353e7aeed41a174:

  dev-manual: correct directory name for oe-core wic files (2026-10-15 15:5=
4:20 +0200)

----------------------------------------------------------------
Adrian Freihofer (1):
      dev-manual/devtool: fix non-patch local file handling docs

Jo=C3=A3o Marcos Costa (4):
      migration-guides/release-notes-6.1.rst: add recipe upgrades
      migration-guides/release-notes-6.1.rst: add CVE fixes
      migration-guides/release-notes-6.1.rst: update contributors
      migration-guides/release-notes-6.1.rst: add latest changes

Robert P. J. Day (1):
      dev-manual: correct directory name for oe-core wic files

Trevor Woerner (2):
      ref-manual: drop "partition" as a wic kickstart command
      dev-manual: indent a list continuation so the code block ends

 documentation/dev-manual/devtool.rst               |  91 ++++++++-----
 documentation/dev-manual/packages.rst              |   2 +-
 documentation/dev-manual/wic.rst                   |   2 +-
 .../migration-guides/release-notes-6.1.rst         | 149 ++++++++++++++---=
----
 documentation/ref-manual/kickstart.rst             |   9 +-
 documentation/ref-manual/variables.rst             |   2 +-
 6 files changed, 165 insertions(+), 90 deletions(-)

