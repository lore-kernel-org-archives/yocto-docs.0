Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE72FD5332
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:01:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92243.1772186449384890821
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 02:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SqJhZ9Ey;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA2554E412D9
	for <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 10:00:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7571A5FE74;
	Fri, 27 Feb 2026 10:00:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81470103693FA;
	Fri, 27 Feb 2026 11:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772186443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=LOD3QD3D8WsFpwC3Dvj6itsI/n+392RgGNbfs8fhb1c=;
	b=SqJhZ9EyhPT/IqwhWIK13u5n68COuyHgEdN56oGlU6uhuwS/+7x2Qh9Ffkv1DATiHyQfsf
	nNWVK/VXjc3BqnEc+mwLkjWAYPrxEIKgsxcol7VYlFRjbHq123MZpvn3Jk9jooctznyX4Y
	ahSBQNKmPWxn7zGa0Qx+Md/cZKRlXp9/2Deq1nJxzVuGvol5wMoRSncOsD9mEgrKAeUUZj
	cx0IsGPZc0S2droO+YWyZa9m+1WJom9nyoP9kTbp6NMew0aOASQXhm7XWASoSkR93cCCvn
	GZE2H2v6is8/OsaF/RnUyOEYto/M6a9KEVJWseGSWgp36pUlYhQXbTAWPF00tA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 11:00:39 +0100
Message-Id: <DGPNNUY36YSP.322M79HQTDXSP@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 10:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9004

The following changes since commit 369f3307368eaea605983e80047377fd19ebd6bf=
:

  migration-guides: add release notes for 4.0.32 (2026-02-11 15:19:17 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to e7cbf979deb9739ee4b968672d4b03ae65b24424:

  dev-manual: delete references to "tar" package format (2026-02-25 13:13:2=
7 +0100)

----------------------------------------------------------------
Antonin Godard (2):
      what-i-wish-id-known.rst: replace figure by the new SVG
      Makefile: pass -silent to latexmk

Michael Opdenacker (1):
      ref-manual/classes.rst: fix broken links to U-Boot documentation

Robert P. J. Day (1):
      dev-manual: delete references to "tar" package format

Yoann Congal (1):
      ref-manual/system-requirements.rst: update untested distros

 documentation/Makefile                                |   2 +-
 documentation/dev-manual/packages.rst                 |   6 +++---
 documentation/figures/yp-how-it-works-new-diagram.png | Bin 219234 -> 0 by=
tes
 documentation/ref-manual/classes.rst                  |   4 ++--
 documentation/ref-manual/system-requirements.rst      |   5 ++---
 documentation/what-i-wish-id-known.rst                |   2 +-
 6 files changed, 9 insertions(+), 10 deletions(-)
 delete mode 100644 documentation/figures/yp-how-it-works-new-diagram.png

