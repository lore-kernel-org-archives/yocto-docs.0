Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B83D3C55C
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 07:32:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16935.1729236727414722701
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 00:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FTtGBxyD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D57C01BF204;
	Fri, 18 Oct 2024 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729236725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=TnDV4LOZPz2z1QdwtQjLcD3AjOEChkv3gxgAnsSPnqE=;
	b=FTtGBxyDfMqtuVc+hCmu4AZIPEEUf0cvgqS/3dltjO8yMUY6+KBfghTA409BSmn8lwIcq8
	17hIWuYakd0KN5AGGJdmfnrg/N8H/Rzh+sOxHDiHnpsCaJj0SEh0gHXWVbqXr7OxlwfzJi
	48muWXWDdNDrrneDDjIGjeuoIxgk6wISeSFIzmwNCxt9LiAhxKCcxoEaSamGsxYi6q1ghf
	vdImGf+I8K1ZS9I7fscqH+Ayh5YtK6ZkKfk9PIyLksuGoG6nAJ5nLm4XeljfPSDQlCl2qB
	K9pFnRCgjdXnXy6ANLBrrJAjr7Dn5QmiGfeGjnCl9DsoHE6vRkoTB8G4hasS5w==
Date: Fri, 18 Oct 2024 09:32:05 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [master] Pull request
Message-ID: <bke5sttahounvzajydbpfhononhq5ncrkwyviye4255u2sselc@2bzjjpqnuyjn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 07:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5530

The following changes since commit 65618b0588053d2c4325d995482957b660f5e104:

  release-notes-5.1: update release note for styhead (2024-10-11 17:44:39 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 372b5b4ca55819c294970b20aa8b8d8167144329:

  ref-manual: structure.rst: document missing tmp/ dirs (2024-10-17 09:35:05 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      release-notes-5.1: fix spdx bullet point
      ref-manual: fix ordering of insane checks list
      release-notes-5.1: add beaglebone-yocto parselogs test oeqa failure
      ref-manual: structure.rst: document missing tmp/ dirs

Niko Mauno (2):
      docs: Replace VOLATILE_LOG_DIR with FILESYSTEM_PERMS_TABLES
      docs: Replace VOLATILE_TMP_DIR with FILESYSTEM_PERMS_TABLES

Robert Yang (1):
      release-notes-5.0.rst: NO_OUTPUT -> NO_COLOR

 documentation/migration-guides/migration-5.1.rst   | 12 +++++
 .../migration-guides/release-notes-4.2.rst         |  2 +-
 .../migration-guides/release-notes-5.0.rst         |  2 +-
 .../migration-guides/release-notes-5.1.rst         |  9 +++-
 documentation/ref-manual/classes.rst               |  6 +--
 documentation/ref-manual/features.rst              |  5 +-
 documentation/ref-manual/structure.rst             | 35 +++++++++++++-
 documentation/ref-manual/variables.rst             | 56 ++++++++--------------
 8 files changed, 82 insertions(+), 45 deletions(-)

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

