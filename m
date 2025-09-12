Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7788CAC594
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:54:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.18882.1757688894043956557
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 07:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Jt7+b/y9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC9EB4E40C74
	for <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:54:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9474560638;
	Fri, 12 Sep 2025 14:54:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0051102F2A21;
	Fri, 12 Sep 2025 16:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757688892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=FLcxIpVSGu8Ns6Mxu99INhM6YFaBerPpHFgR9Z5qV1M=;
	b=Jt7+b/y9b1R+OE2Utb/Xf+dQEMzLABysOWh3TThIEF7VesTVKleC+SFlDABCErB8wKSWOo
	zM8Lo+5A+wpETk0kTACNyrDuXZl7OZBP0SaZn4XyuM1fjnxcwKnSeNSawV0uvnyaQszWAv
	WyXuvMYql/zH+/aiATj4JpSmTSu0n+U8cys5XwqQBM094xwk1o8nCdLLBaU9EwSFfMsAI3
	OHF7zDKdMQ2ASQbaqIX+iakRJp9A6q3oUoT5fkyUFP9hWEhM5GsUdUcF2CKfNtfbxBb6ZN
	0B+sLkGhAgXDCLSM4TWsIqfBSoCcbeNK+QWQHv/P1gGrvpy+uSCzQCfFwgBmLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 16:54:46 +0200
Message-Id: <DCQWPIZ73RO4.CWXB9Y7938FY@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:54:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7508

The following changes since commit dd665216fa578a1f2f268790d708c6a5d2912ecf=
:

  ref-manual/classes.rst: document the testexport class (2025-08-08 14:25:4=
0 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 79b37fe79fee03a46a4d791fd9f50e23d4e24797:

  migration-guides: add release notes for 5.0.12 (2025-09-12 16:49:18 +0200=
)

----------------------------------------------------------------
Antonin Godard (1):
      dev-manual/security-subjects.rst: update mailing lists

Jan Vermaete (1):
      sdk: The main in the C example should return an int

Joao Marcos Costa (1):
      ref-manual/variables.rst: expand IMAGE_OVERHEAD_FACTOR glossary entry

Lee Chee Yang (2):
      migration-guides: add release notes for 4.0.29
      migration-guides: add release notes for 5.0.12

 documentation/dev-manual/security-subjects.rst     |  23 ++-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.29.rst      | 178 +++++++++++++++++=
+++
 .../migration-guides/release-notes-5.0.12.rst      | 184 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |   6 +
 documentation/sdk-manual/working-projects.rst      |   3 +-
 7 files changed, 386 insertions(+), 10 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.29.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.12.rst

