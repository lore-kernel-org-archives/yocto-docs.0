Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C748D0EE15
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 15:56:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.15481.1728662162770890406
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Oct 2024 08:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lnwdfIIk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E180D2000A;
	Fri, 11 Oct 2024 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728662161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=MqZbVI7Tu5IK7ynQ3Fi2jT5K4i5XFPoiyhuBmg5VZsE=;
	b=lnwdfIIk1z0eHs9ZPQ0OK8fzrUoDMH9nC7d6I7shRx6iT/16GuGW6PgFDxogrZbK5/R5oJ
	PLh/deO/mvOU4F15xPQ7vv2t3wDBCYZhulTC0Mt7m1UiMQyoz4K+K8yTv2PRt42q7RvguM
	j4TSPOSBqpe+cQ8B2lTw9+f8TD+cyBjgKFIlsyeSmDYHwEh1gZVluMAa/HC15nr2fqcY7m
	FVv4noTljBIbKpjx6RhpHVR5YsJ9ZLKnReenyxvdx7m7ubdpb1jSsr5nvXkOMeSZmBeq67
	/+l51nGXyQVIB4FKeV4cuWF4z1wAQQvNFqIGegPn/gQdCPR0gKr379qeV1pMLg==
Date: Fri, 11 Oct 2024 17:56:00 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [master] Pull request
Message-ID: <f6dtgbobbfxlegxjtpcnb7rfnmcv2hsfnkrbnagipoti3uegqf@6pptrkb6uhl4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Oct 2024 15:56:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5472

The following changes since commit 98e7f378bc5670d23a6c2bdfcd3b7af965f7c450:

  release-notes-5.1: document spirv-tools reproducibility (2024-10-08 15:33:38 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 65618b0588053d2c4325d995482957b660f5e104:

  release-notes-5.1: update release note for styhead (2024-10-11 17:44:39 +0200)

----------------------------------------------------------------
Antonin Godard (15):
      ref-manual: add missing CVE_CHECK manifest variables
      ref-manual: add new vex class
      ref-manual: add new retain class and variables
      ref-manual: add missing nospdx class
      ref-manual: add new RECIPE_UPGRADE_EXTRA_TASKS variable
      ref-manual: drop siteconfig class
      ref-manual: add missing TESTIMAGE_FAILED_QA_ARTIFACTS
      ref-manual: add missing image manifest variables
      ref-manual: add missing EXTERNAL_KERNEL_DEVICETREE variable
      ref-manual: drop TCLIBCAPPEND variable
      ref-manual: add missing OPKGBUILDCMD variable
      ref-manual: add missing variable PRSERV_UPSTREAM
      ref-manual: merge patch-status-* to patch-status
      ref-manual: add mission pep517-backend sanity check
      release-notes-5.1: update release note for styhead

Lee Chee Yang (1):
      release-notes-5.1: update for several section

 documentation/migration-guides/migration-5.1.rst   |  63 +-
 .../migration-guides/release-notes-5.1.rst         | 976 ++++++++++++++++++++-
 documentation/ref-manual/classes.rst               |  70 +-
 documentation/ref-manual/variables.rst             | 118 ++-
 4 files changed, 1172 insertions(+), 55 deletions(-)

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

