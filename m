Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E131CCD182
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 15:01:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.9769.1759503700476076777
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 08:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2j+6ni+C;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 12C891A10DE
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 15:01:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C955560683;
	Fri,  3 Oct 2025 15:01:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7C55102F1CC1;
	Fri,  3 Oct 2025 17:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759503698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3liE0mDFCRD8qe3jWc9SyzI9cSFXNGssj1nZxG2sDlw=;
	b=2j+6ni+C62M1CYp8TiR7GsD9YDy5p4P7UQ9/ChBiD3EjW583s2fzlEOC10ATQXf5MfAt5r
	ZhSnSgUtlf67bCcsCIV1KPBlO8txiHL/MG28nY1EAgtftn+EDaXyPvnysocFvasfERAJ8E
	fLuPcmTdI53mNibu/wDL2I0W7GnEJEH0EgIrsRsNLU/d/vnGCvQlxPq9l1a9zb7RdjVAqc
	tL3Cp38YgIjwVTHedbqlf8yIuKoe+8MV7nk3e9Wql7fxrPZqiOf1ibK8PWgnU3hm5YR02N
	0OxEVal+EzwQmcsKQdMUwGjaMYNNFZlBJRAH7/D5pgNbaZjmCAFLS7gA9DX8kg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 17:01:37 +0200
Message-Id: <DD8S07RV7STG.2P6MUVRJE8D5@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 15:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7638

The following changes since commit 95f31030628d0f7681401b1de6fb8e7a362963c1=
:

  test-manual/yocto-project-compatible.rst: fix a typo (2025-09-26 10:14:22=
 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to eca2cb23eb1fd4186d1f5cadc3280d73e8f52631:

  ref-manual/variables.rst: fix the description of STAGING_DIR (2025-10-03 =
11:49:14 +0200)

----------------------------------------------------------------
Adam Blank (3):
      kernel-dev/common.rst: fix the in-tree defconfig description
      ref-manual/variables.rst: fix the description of KBUILD_DEFCONFIG
      ref-manual/variables.rst: fix the description of STAGING_DIR

Antonin Godard (1):
      ref-manual/structure: document the auto.conf file

Talel BELHAJ SALEM (1):
      dev-manual/building.rst: add note about externalsrc variables absolut=
e paths

 documentation/dev-manual/building.rst  |  5 +++++
 documentation/kernel-dev/common.rst    | 10 +++-------
 documentation/ref-manual/structure.rst |  9 +++++++++
 documentation/ref-manual/variables.rst |  5 ++---
 4 files changed, 19 insertions(+), 10 deletions(-)

