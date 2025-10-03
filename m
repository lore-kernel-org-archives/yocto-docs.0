Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50361CAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 15:01:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.9829.1759503700511447871
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 08:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rhBqbTDC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 18A1C1A10DF
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 15:01:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8E1D606EC;
	Fri,  3 Oct 2025 15:01:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62BA0102F1CBF;
	Fri,  3 Oct 2025 17:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759503698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=lTxUXknUlsKrYY0oSXsWgtWIdT56J8Nurelda/o6krc=;
	b=rhBqbTDCptYqP2m6azTVks71lDQ93V33u/hE1vLRBrOJ2isp4kfKuWBOWkW5pyBBUU/XHK
	NCHsHbPaMf84j0h4dFCKAZZYfQK1GqSNqqYbliabvTaJhhomIJguf4EuZcuTcJ/x3USgUu
	ULBMGyl4BQMvLD/zmnK7G201nALU5/pZv+jdhdlpqYMlmosHMfG86l4K6auuwVkbJakOWf
	wbFSxpxBBHSyJQPFD3ToHmaYIH1scw7CKf+T7K720jse356NwfKUftY5RTqZ588EHOe6TA
	Yt9LIB76I/FfrUxY7RRFA7tZ6ObrjwaBBT6pJoMmmfXnMicUbK5UBq7R9jiVyQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 17:01:36 +0200
Message-Id: <DD8S07LA8V5T.3H7JWZFCKS0TB@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 15:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7641

The following changes since commit 6b248c541580eadab663f605ce6310302d7a2dae=
:

  test-manual/yocto-project-compatible.rst: fix a typo (2025-09-26 10:13:01=
 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 6f086fd3d9dbbb0c80f6c3e89b8df4fed422e79a:

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

