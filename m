Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2044CCD190
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 16:36:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.49178.1760373365905425120
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 09:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lUNIO/J9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 352294E4106F;
	Mon, 13 Oct 2025 16:36:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F18E0606FB;
	Mon, 13 Oct 2025 16:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF6D1102F2273;
	Mon, 13 Oct 2025 18:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760373363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7EmRdA6wIsyJO28d5hvanqrAB0E38zCPx07VW2pIU6s=;
	b=lUNIO/J9uN2qdWPMkFiM9tkDcPFVObc9CIVIn8pNwoWE+Q+GhqyOuSPjNo92858t/y6VUm
	4ntoZ8/3VOMiGkX881xCVi8OXESk0XaWEpEks3EaQ5fVx7NWYufCHj5/pZ4fSAawJRKRGV
	BNE10RaI2WP0yoiU7dI0UR1jvjhwXS+E11FyUYHDfvlNCeg/u4BWeT9lwEPMYJhuicu1HL
	KAKP2gFMHrq+5TDfnvBukF4aI+E+tNZ67Euzv/mw+xOLKIdoVf7h9n9igEXmkr6j71UKsE
	xjquCk2nV71WMZ6pNs9fwBanbLZ4xqeRkrUpQXjN/QaGNpxP9GOrGRhpWPgBhw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 18:36:01 +0200
Message-Id: <DDHC9Y1P68BC.1ADDQH681RMV@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 16:36:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7694

The following changes since commit f50c146ea9d9b56144fc1faafd8e13f9ac9dc4a0=
:

  ref-manual/variables.rst: fix the description of STAGING_DIR (2025-10-03 =
11:49:14 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 96a8e3e2ad95873a9069d10ba448080e32c71fd0:

  migration-guides: add release notes for 4.0.30 (2025-10-06 09:56:36 +0200=
)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.30

 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.30.rst      | 170 +++++++++++++++++=
++++
 2 files changed, 171 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.30.rst

