Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA6FCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 15:01:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.9831.1759503700870916065
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 08:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2lHvcHj3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B58D24E40E9F;
	Fri,  3 Oct 2025 15:01:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B22160683;
	Fri,  3 Oct 2025 15:01:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54C1E102F1C98;
	Fri,  3 Oct 2025 17:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759503698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XsMM21nYhsvp6mhRKoJbr40hKKLpKOhiXyYErMjtflw=;
	b=2lHvcHj3E0Aa7qrAb85sLYTjtw0PEHF/oeKqTJnbNrVPfypY6fpCKoRQIx66UOWUuPNhJ/
	h+clh3f4g7m7QeFbxn524E84YxDmsK3crJ2tLcdxdvq6l+NGW0+awO4hMCa4Trn//tgkNZ
	nF6cGfyyIz0uwyanCa/4gVi2XuLBdbNRm4iEqQIcxBzjPRPOB3O7A49YSh9pFUT1D9hELo
	8DfQAauaK1hswBvfCUNsM1BML3hnbDeiBGau/TUBMaWPrUaQRSuWgKM+K95d3JBMglTsC4
	UXoqwioOja/UHZUDXgV/Yd+rYGsnwZPFrfS0UXG/zAmNo5pwoH2vWLYn/jALJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 17:01:36 +0200
Message-Id: <DD8S07DOSPEA.3SO0ZOQVP8A34@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 15:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7640

The following changes since commit c76ea1be1e08184d162c92aba168a44fd5573c58=
:

  test-manual/yocto-project-compatible.rst: fix a typo (2025-09-26 10:12:45=
 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to f50c146ea9d9b56144fc1faafd8e13f9ac9dc4a0:

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

