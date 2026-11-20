Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8596.1795189320405326266
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 07:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jvT0rBJX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 98D384E41687;
	Fri, 20 Nov 2026 15:41:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69B3E603CF;
	Fri, 20 Nov 2026 15:41:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87F2511BC0404;
	Fri, 20 Nov 2026 16:41:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795189313; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+YXWYg8y1QKaNFrUmEiacF8NHgQf5JlbA9/C6QfmRJI=;
	b=jvT0rBJXS3cAmc+iU51fPoSLQnrXFrQlPteFhMCiwQIxH2JAzvdPd8WCImhrP6rKZr1UuH
	TNUrecjbO5DMlm664vUrRZ2ww74hgvbuk10Irn40MCUv6jGGHo0VMWCcABAGrRidukqCr7
	FMe/oMb8YyHcR50lqu5xHPMB0o23cFqjJAU/45odD5GBmJffI+zl6zXsNLgDOE42juNc7t
	yZ4QdR0+A8pmKychBGTILgfZ1iEg3uC8KkyDgfUEGFHCv5/nCZgbNPMat/75DSus6kbJfG
	cb1H0fNcEQfUDbQMgkHCvwLFhk09p8BucnotFHw6vAobMwd+V+Koi0Z47OrO7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 16:41:52 +0100
Message-Id: <DN05I0X15ICV.18A9APWAILIGZ@bootlin.com>
Subject: [blacksail] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 15:42:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10815

The following changes since commit 28a708ecb3c2ce1669094f9f4c1bdcbc28438bcc=
:

  governance: Add start of project history and leadership sections (2026-11=
-06 10:10:29 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs blacksail-next

for you to fetch changes up to 47e90081e183a871a94a048193eded1452001c58:

  migration-guides/release-notes-5.0.17.rst: fix the oecore download URL (2=
026-11-20 13:21:58 +0100)

----------------------------------------------------------------
Antonin Godard (3):
      ref-manual/kickstart.rst: add a section for commands and directives
      ref-manual/kickstart.rst: warn about the include directive only worki=
ng for .wks
      ref-manual/kickstart.rst: document location and variable expansion

Erik Lindsten (2):
      kernel-dev/maint-appx.rst: fix the kernel cache repository name
      migration-guides/release-notes-5.0.17.rst: fix the oecore download UR=
L

Robert P. J. Day (1):
      ref-manual: add a terms entry for Wic

 documentation/kernel-dev/maint-appx.rst            |   4 +-
 .../migration-guides/release-notes-5.0.17.rst      |   2 +-
 documentation/ref-manual/kickstart.rst             | 140 +++++++++++++++++=
+++-
 documentation/ref-manual/terms.rst                 |   6 +
 documentation/ref-manual/variables.rst             |   8 ++
 5 files changed, 153 insertions(+), 7 deletions(-)
