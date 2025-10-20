Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6824CCCD1A7
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:27:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.12700.1760945270117527240
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 00:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wr/sxv/j;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C63074E411E1
	for <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 07:27:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 978B6606DC;
	Mon, 20 Oct 2025 07:27:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19725102F239E;
	Mon, 20 Oct 2025 09:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760945263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=pfoDMaWSiUTbgC5Cg2ZUtrsNyurxnb2pAgWQUiOhcGI=;
	b=wr/sxv/jt5pXtLWt1CPuvzmpasm7JtVjlQt/wxe+VBOMb9BrGBLBcdfAP+Cd4BqBon4jMr
	kIkejSxaEVRJqJW9i03d6ybmbe58weX3DTX4llUQ0fkoM0q1qmlWtUh5/G+HX7eTT4dWkG
	UopHrri+nsZBl+qyGXTl3CcnrbYLHqAku+9eTw4nAPDItwJWXuGScBxIVtMXXXdIyS7Inb
	k14JmaDwSMhSfdINyp678KUzqGBhE1CZpERbxvs8FBpli76lBxO4t9eSKwM3LBEl6/D2IA
	rLo3XwKfnAZvYlOZm3DSu5/2Ay+CJ+36F/pZpS9oM4okNfFUkvbfi3To6Q5ZPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 09:27:42 +0200
Message-Id: <DDMYZXHFDJPC.A3Y5PV971V1X@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 07:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7751

The following changes since commit fca48e1239950ccf10f6b1b805c5734104144ded=
:

  vulnerabilities: update nvdcve file name (2025-10-13 09:13:46 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 6843c42261ff765d91016d96ac0154355587dda9:

  ref-manual/classes.rst: uboot-config: improve documentation (2025-10-20 0=
8:58:36 +0200)

----------------------------------------------------------------
Antonin Godard (3):
      ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      ref-manual/classes.rst: extend the uninative class documentation
      ref-manual/classes.rst: uboot-config: improve documentation

 documentation/ref-manual/classes.rst   | 103 +++++++++++++++++++++++++++--=
----
 documentation/ref-manual/variables.rst |  16 +++++
 2 files changed, 100 insertions(+), 19 deletions(-)

