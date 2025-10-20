Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551B5CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:27:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.12431.1760945269301684083
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 00:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=h6KqdEeI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F13DB4E411D9;
	Mon, 20 Oct 2025 07:27:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C872D606D5;
	Mon, 20 Oct 2025 07:27:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E84CE102F2396;
	Mon, 20 Oct 2025 09:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760945263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=zILVHBG6+2CPM1QZSWTVhq30FNJO/+fyFJzrmbdWtlA=;
	b=h6KqdEeIJILaotY4fRgaBUrDGd+4RpsxOp3qcdLLQN6YHZoe3pBP6HE1NoPYXhWac/x712
	py1H8O8EjbSaqSdWB4w83h82ugmlHRqQ5G+oYdLIzYrqX/KN0XdK/qeKE0WJ+r0AklEltJ
	ZdE2BPEkujyQTOlTcZTUaR2jhgvHeScEEg4JjRis9PA8oq0q+Id1slaoEUDQxlIPDuM5EM
	mYeQy7w54QSHxQoG5T0S2/YJgB+s4a7OZT/mUUzQ238DNRUB8inRjkAB+HkLJ7vhpD+kCO
	VDn5W/NvegcJq31NW2aGZsqsMStKIkRgWax046JBDHDYiFa4S5jIJxhpuo1Viw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 09:27:41 +0200
Message-Id: <DDMYZXBEVQ5Y.2FI9JLKSZDZPA@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 07:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7749

The following changes since commit 96a8e3e2ad95873a9069d10ba448080e32c71fd0=
:

  migration-guides: add release notes for 4.0.30 (2025-10-06 09:56:36 +0200=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 312ab26e1aaa6d18df7fd31dbeb6231f2279502c:

  ref-manual/variables.rst: fix a typo in UNPACKDIR description (2025-10-20=
 09:12:01 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      ref-manual/classes.rst: extend the uninative class documentation
      ref-manual/classes.rst: uboot-config: improve documentation
      ref-manual/variables.rst: fix a typo in UNPACKDIR description

Lee Chee Yang (1):
      migration-guides: add release notes for 5.2.4

 documentation/migration-guides/release-5.2.rst     |   2 +-
 .../migration-guides/release-notes-5.2.4.rst       | 320 +++++++++++++++++=
++++
 documentation/ref-manual/classes.rst               | 103 +++++--
 documentation/ref-manual/variables.rst             |  18 +-
 4 files changed, 422 insertions(+), 21 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.2.4.rst

