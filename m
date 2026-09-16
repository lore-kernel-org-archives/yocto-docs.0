Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5514EC982C1
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:02:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10621.1789549360424602437
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 02:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AvfWGSfY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 302551A088A;
	Wed, 16 Sep 2026 09:02:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 049C660337;
	Wed, 16 Sep 2026 09:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66D6511C7AFE2;
	Wed, 16 Sep 2026 11:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789549357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Dko8X8K2hc2K1h73pGopgRjGqlpCewyYPNP5PbVGHTs=;
	b=AvfWGSfY+DdmFPwuf95sNV4X8cAd1lNSHGCVp3NXYjRIJDhDMgFXnD/2pYXbgcfW2SGyik
	YTXWfi8w49lt/CubiRrmbqz8MsJj4joRo9Qg02Jbxv74t7yY6/sB5Xs7eB2vO9PRDmxbYc
	DV4zkP9WfmkWbjomavrCoaQhJFoG/Mm956CUkSsXopsEYpJp3URstYJ8CiPRAGUeitZu88
	P9IG1hWM3uvEmDLK44zOUwRdPVhagfz22+zx/TQh75uqDGv2Bwa2qWsgaCLvMFs+Hdu/9x
	lnagjheLEqJcNGnwLGM6aP+ivKQaLdGjQrz0VJDnv09O0MpVko6RtrV4X0Avwg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 11:02:35 +0200
Message-Id: <DLGMAWNP21XB.10DRAHGJTR8TI@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Sep 2026 09:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10519

The following changes since commit 728c63c050c22ad1469d9efa5d81e96c42f83c93=
:

  toaster-manual: spell the json code-block language in lower case (2026-09=
-02 14:52:28 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 9d2cb790abf5ad37b2b1f35823d238c57f4e21a5:

  migration-guide: add release notes for 5.0.20 (2026-09-16 10:33:35 +0200)

----------------------------------------------------------------
Antonin Godard (5):
      bsp-manual/bsp.rst: fix a "local.conf" -> "layer.conf" typo
      ref-manual/structure.rst: fix a "local.conf" -> "layer.conf" typo
      ref-manual/varlocality.rst: remove BBFILES from local configuration a=
ssignments
      ref-manual/features.rst: add tools-profile
      ref-manual/variables.rst: BBMULTICONFIG: fix a typo

Lee Chee Yang (1):
      migration-guide: add release notes for 5.0.20

Robert P. J. Day (2):
      dev-manual: drop link to out-of-date wiki page
      dev-manual: correct OVERRIDES to FILESOVERRIDES for FILESPATH

 documentation/bsp-guide/bsp.rst                    |   2 +-
 documentation/dev-manual/layers.rst                |   4 +-
 documentation/dev-manual/start.rst                 |   3 +-
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.20.rst      | 779 +++++++++++++++++=
++++
 documentation/ref-manual/features.rst              |   4 +
 documentation/ref-manual/structure.rst             |   2 +-
 documentation/ref-manual/variables.rst             |   2 +-
 documentation/ref-manual/varlocality.rst           |   2 -
 9 files changed, 790 insertions(+), 9 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.20.rst

