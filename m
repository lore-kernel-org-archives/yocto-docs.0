Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0904D3C55E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 07:33:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16941.1729236795472383438
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 00:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eHD95zhB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 005601BF203;
	Fri, 18 Oct 2024 07:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729236794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=muVcZcnT7QHWdyJGvq2JJZxVGsmP1IH8nkqfrpsDX70=;
	b=eHD95zhBsRU9ta+V0w2KGEk8RoqcRYMRkCTwZ5hEHnD2Fi6YdvBUK9C+c00FNFhCnlxmA8
	ESvepfHQZla0Myib6s69E5+Ui6SQma2vQWCe3sFlvdcNTnxTDwfUFdAa4L9pPr/sL5Xz5w
	MCYyPi1kByEjiEJ6StIx+B884PTZUC9l/9tE5ICKrBnIMYx/eD0l4b1s4YqTciIgeWsMJ1
	69QfrbCYil0b6bspznwmO4o83PioZs4YbdDsdVdVQNZ+yfVLZBZgEuj+ndW57cPLMEECFh
	6ZquFr+BzseS1htdnup30f3isiRZaSUhBV40P2l3Zbz07LUsDHO5eufBQuQuwQ==
Date: Fri, 18 Oct 2024 09:33:13 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [scarthgap] Pull request
Message-ID: <rhoqabq33ukijtgm2izyrdk547a7h252sdkdlk7dtwzints7xm@5yronfvlhk2h>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 07:33:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5532

The following changes since commit a854b398db797394677ac8e15b5459373c1c3cd3:

  migration-guide: add release notes for 4.0.21 (2024-09-25 17:24:23 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 5958b3c7546d71fdd1693c26747e0196c6aaf277:

  ref-manual: structure.rst: document missing tmp/ dirs (2024-10-17 12:00:11 +0200)

----------------------------------------------------------------
Aleksandar Nikolic (1):
      ref-manual: introduce CVE_CHECK_REPORT_PATCHED variable

Antonin Godard (6):
      ref-manual: add missing CVE_CHECK manifest variables
      ref-manual: add missing TESTIMAGE_FAILED_QA_ARTIFACTS
      ref-manual: add missing EXTERNAL_KERNEL_DEVICETREE variable
      ref-manual: add missing OPKGBUILDCMD variable
      ref-manual: merge patch-status-* to patch-status
      ref-manual: structure.rst: document missing tmp/ dirs

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.4

Robert Yang (1):
      release-notes-5.0.rst: NO_OUTPUT -> NO_COLOR

 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.4.rst       | 212 +++++++++++++++++++++
 .../migration-guides/release-notes-5.0.rst         |   2 +-
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/structure.rst             |  35 +++-
 documentation/ref-manual/variables.rst             |  37 ++++
 6 files changed, 286 insertions(+), 9 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.4.rst

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

