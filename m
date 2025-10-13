Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02F5CCD18D
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 16:36:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.49179.1760373366218546345
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 09:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NTYbcZR6;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E25D5C093B0
	for <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 16:35:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3B456067B;
	Mon, 13 Oct 2025 16:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92A24102F2240;
	Mon, 13 Oct 2025 18:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760373363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vlSlzwh3JH/+7NBwwe6RJEuUHrLrpbN69LPeljdokqE=;
	b=NTYbcZR6GzCvGrmh5QhWk2bA9AEFrgcjJmcwc97ve7CvfGWX32zVxlu3zmPguoqKNtX1EI
	QFbD1DAeeL2ZwYroZPagcRY1NvzJ+7HnDwggxphr+m7S6N632F8BOjch887A04qa/b8fOy
	XQgj7z8n5NLgT5qKnL6ShL7lDGbi/Vn2Ux7LRJ/cAVrPDlTuLxpEqqFOXLUNvXG7q5Y8se
	HEMIDu+GrZVIWwczIy3iTXDgKiPn6bKL5VKpD0As7kDnBdstrMPmCARq42ZegF1O1brE45
	jmgTm4YH+P90bFIQTWAyEEs6BYFmh9pzen+PrgTwXDgjkY9F904BCxHg+hx3lQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 18:36:01 +0200
Message-Id: <DDHC9XSKSX65.BXV2ISINBNEK@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 16:36:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7695

The following changes since commit 09c7800333b17b21e50d2a089a3ae1b123697243=
:

  tools/build-docs-container: update with newly supported distros (2025-10-=
03 11:43:15 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 8b85245490ae0b19a9c3880ec31e55b42e19d094:

  ref-manual/variables.rst: add note about PSEUDO ignore/include precedence=
 (2025-10-13 17:08:12 +0200)

----------------------------------------------------------------
Alexander Kanavin (1):
      ref-manual: correctly document the difference between auto.conf and n=
ewly added toolcfg.conf

Antonin Godard (7):
      dev-manual/layers.rst: yocto-check-layer: mention --machines and --de=
pendency
      dev-manual/layers.rst: yocto-check-layer: update list of test
      tools/build-docs-container: add option to install essential packages
      tools/build-docs-container: remove obsolete comments
      ref-manual/qa-checks.rst: fix references
      ref-manual/fragments.rst: remove duplicated built-in fragment note
      tools/build-docs-container: use the basename of OCI to append args

Gyorgy Sarvari (1):
      ref-manual/variables.rst: add note about PSEUDO ignore/include preced=
ence

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.30

 documentation/dev-manual/layers.rst                |   35 +-
 documentation/migration-guides/release-4.0.rst     |    1 +
 .../migration-guides/release-notes-4.0.30.rst      |  170 +++
 documentation/ref-manual/fragments.rst             |   12 +-
 documentation/ref-manual/qa-checks.rst             | 1104 ++++++++++++----=
----
 documentation/ref-manual/structure.rst             |   15 +-
 documentation/ref-manual/variables.rst             |    9 +-
 documentation/tools/Containerfile.apt              |    4 +
 documentation/tools/Containerfile.dnf              |    4 +
 documentation/tools/Containerfile.zypper           |    4 +
 documentation/tools/build-docs-container           |   41 +-
 11 files changed, 899 insertions(+), 500 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.30.rst

