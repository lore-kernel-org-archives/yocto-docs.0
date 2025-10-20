Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACEBCCD1A4
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:27:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.12698.1760945266275064133
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 00:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vo47xKFB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 85D001A152B
	for <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 07:27:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C528606D5;
	Mon, 20 Oct 2025 07:27:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD335102F2390;
	Mon, 20 Oct 2025 09:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760945263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=I1v8kaLGShg4b2iGCEzO28hLKcMpmlUVcYCgJ2DE+fg=;
	b=vo47xKFB2cNZwAyKTnUAQS5Y9Z5FfV1r9l/8SsWPAfR/v8UKOc0sKgEZuvTnnsEMEAsr5U
	0XdxE0iC7f10m0IKkONB4Z2+1czGf1SWCzNDRpsSPfTjZNbeab1tRdL1ajFfmcHDHX422J
	KIW3vpRBKfRLz9A9hu/2p58vJurJNhLlmQVgf9KgZw/JhEFKP5/FQ/YPtIclcmpnzHBZVv
	qMJ6QoV4A06CQcpWG1OvBeDALETE2XfoezqcAxZf+u3v8426vI1rMamc30QJDGeMW589yx
	YlRvNIxSoXtlhzCq/8irPbngSB6MXxPrw1JmZqlnuT5iLUp0ceUJ+To/3I0MOQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 09:27:41 +0200
Message-Id: <DDMYZX87CCIO.78SKB3615H1Z@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 07:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7748

The following changes since commit 8b85245490ae0b19a9c3880ec31e55b42e19d094=
:

  ref-manual/variables.rst: add note about PSEUDO ignore/include precedence=
 (2025-10-13 17:08:12 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to cb3a165fcbff10d1c5729ef78f663fb5f636f0d9:

  ref-manual/variables.rst: fix a typo in UNPACKDIR description (2025-10-20=
 09:16:06 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      ref-manual/classes.rst: extend the uninative class documentation
      ref-manual/classes.rst: uboot-config: improve documentation
      ref-manual/variables.rst: fix a typo in UNPACKDIR description

Lee Chee Yang (1):
      migration-guides: add release notes for 5.2.4

Pierre-Loup GOSSE (1):
      ref-manual/variables.rst: document IMAGE_EXTRA_PARTITION_FILES

 documentation/migration-guides/release-5.2.rst     |   2 +-
 .../migration-guides/release-notes-5.2.4.rst       | 320 +++++++++++++++++=
++++
 documentation/ref-manual/classes.rst               | 103 +++++--
 documentation/ref-manual/variables.rst             |  68 ++++-
 4 files changed, 472 insertions(+), 21 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.2.4.rst

