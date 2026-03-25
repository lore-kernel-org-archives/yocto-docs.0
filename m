Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0249D103A9A7
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 10:49:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19305.1774435738392005373
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 03:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Rk72ZYhs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 452311A2FDE;
	Wed, 25 Mar 2026 10:48:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14C4F601E2;
	Wed, 25 Mar 2026 10:48:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FFD7104513F4;
	Wed, 25 Mar 2026 11:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774435735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YwgU7xqXr5KK2DHDD4BpwTozWR9nHjzzABwOX8sZz/U=;
	b=Rk72ZYhsgrLCHtVbsPHK9z05GiOkjx4RTtxYzFJAcCZ7q0ZJfm27wG24lMR3hPOI4FbVas
	vXbRv0+ru75YwImff1YTdwu9LMLMvq83UAUScrtyp7lvbPo7tJtX5fM+Ab1VasygdHb0yB
	QXZQMgSDvlwNkjWjfZyvbD+jlY5jyJVpXvztIGP/jjw5NDf5lUypjVSUVwc1jwFuSnAGHg
	zU/KttfB5f99m+BbuaeVbNOT1kgm442xMiAXrlJPgz45/zliiH37rULn6x9QpueRCz2si5
	NFj+p97H5BrpZOQVTV+z2Q+XbZqM9jLyfS4n2HGnf0zZ/vRJPXSG8nWaEH6I+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 11:48:53 +0100
Message-Id: <DHBSYYM0BW1Z.3B2PR15KGEH55@bootlin.com>
Subject: [whinlatter] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Mar 2026 10:49:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9128

The following changes since commit 82bd1a71e6e6a707d0009725969976cf2256af36=
:

  overview-manual/concepts: list other possible class directories (2026-03-=
05 13:56:17 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to 351f86e67db6f42cf385cf3d002ad41dc294e54e:

  migration-guides: add release notes for 5.0.16 (2026-03-18 11:21:58 +0100=
)

----------------------------------------------------------------
Lee Chee Yang (2):
      migration-guides: add release notes for 5.3.2
      migration-guides: add release notes for 5.0.16

 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-5.3.rst     |   1 +
 .../migration-guides/release-notes-5.0.16.rst      | 219 +++++++
 .../migration-guides/release-notes-5.3.2.rst       | 639 +++++++++++++++++=
++++
 4 files changed, 860 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-5.0.16.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.2.rst

