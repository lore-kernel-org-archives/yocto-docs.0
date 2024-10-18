Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025C7D3C55D
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 07:32:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.16938.1729236759568430704
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 00:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R/Ln7KLw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C840C000D;
	Fri, 18 Oct 2024 07:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729236757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=gQ5r8P7YtTXFzFg5qX2STQ+8aAQRqdNZnnMZzcA0jNg=;
	b=R/Ln7KLwDNVLtRn4GF6E+y6deA/IpegDDbqjbKJ+4lLP6cif+avV8GfMGGeyZOhwRJ+G6K
	zr34IlwPEv8X0xpgokcjbyEgnsvfc+o2HRAxLDV7J8NoQI4TelLaadoh5wVADPquIGHsiw
	jrCS57M+pnZbnh8TB07AIw/cx7i+mqVYz1LT5GwSknRJYHiHjiviTnwkOaApx0EApNipKJ
	izBnFHjrUpoVVVrf8DWwfGj+PktnLEk8B7/vf3JLFqlg36f+N6lLwy2juNagM5WcgblBO8
	PAPXNHtz+9qRquuJGe6yQC58Pe2Cw1zTH9TpLqk40UG2cgCPZf8gpS8Z/6X1sA==
Date: Fri, 18 Oct 2024 09:32:37 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [styhead] Pull request
Message-ID: <g7ah4f2ons7hxzoodtwjqjh4fs46ykrzpzjn5sz5hse56zbwxe@supeznxupvax>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 07:32:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5531

The following changes since commit 65618b0588053d2c4325d995482957b660f5e104:

  release-notes-5.1: update release note for styhead (2024-10-11 17:44:39 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to e1ac30dfffddab6e82c708486f8a31f9ec4b1d58:

  ref-manual: structure.rst: document missing tmp/ dirs (2024-10-17 12:04:06 +0200)

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

