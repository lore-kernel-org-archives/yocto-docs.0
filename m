Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB65E77191
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 14:03:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13010.1735308176405755945
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Dec 2024 06:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hZoaFpT4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB521FF804;
	Fri, 27 Dec 2024 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735308174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jZncXvqNCvyQ8DYHcAraEuUeSodbAo47INrneYiqz5I=;
	b=hZoaFpT4QA3AGzhg56yxMEtmNyAs8PmxbFynZ3T51759WeXLtVPjMFh3VsJ4Z/8WSrmT+Z
	zJPIKQr9R6uHvmTZ/d2nxlVwpIsWsey7H3pLVVyfBwflhwe0F3F5Scs22V4rEJtTUxU6OD
	g4GRLiYIAZcvAyhX6RpW8Eo7Qgz1WvlUIS4Z06UYCZ5p/e+VjsN8hhea8JD6lNAj+w6t12
	Pevw/zCwHzE6HN4tizqz4UicE/63FsKqRj4YAOxEyj0sIKF1XJTADDo80sDo3ssScZvHOp
	XOFQcZ1XRBNDZKeQO70Zepkmdx3zcYpSmeCMHSnJtnXHRmUUdMR2j58V1WL6Hw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Dec 2024 15:02:53 +0100
Message-Id: <D6MJEPKVX58E.2LYKX1G32BH6V@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Dec 2024 14:03:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6048

The following changes since commit 28850c974a3896895bc921c094071523218d6d07=
:

  set_versions.py: use backward-compatible python argument in run (2024-12-=
19 10:08:16 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to a51a94f0b228d570d915dff36a49132e90e93cf1:

  migration-guides: update the release notes for 5.2 (2024-12-27 14:43:06 +=
0100)

----------------------------------------------------------------
Antonin Godard (14):
      ref-manual/variables: document the KERNEL_CONSOLE variable
      ref-manual/classes: drop the migrate_localcount class
      ref-manual/variables: document the FIRMWARE_COMPRESSION variable
      ref-manual/variables: add missing entries to SDK_ARCHIVE_TYPE
      ref-manual/variables: document the WIC_SECTOR_SIZE variable
      ref-manual/variable: remove obsolete SETUPTOOLS_INSTALL_ARGS
      ref-manual/classes: document the cython class
      Remove debug-tweaks references
      Drop support for BB_DANGLINGAPPENDS_WARNONLY
      ref-manual/variables: document the CHECKLAYER_REQUIRED_TESTS variable
      ref-manual/classes: document the yocto-check-layer class
      ref-manual/variables: document the CARGO_INSTALL_LIBRARIES variable
      ref-manual/variables: document the PREFERRED_RPROVIDER variable
      migration-guides: update the release notes for 5.2

Trevor Gamblin (1):
      reproducible-builds.rst: show how to build a single package

 documentation/dev-manual/build-quality.rst         |   2 +-
 documentation/dev-manual/customizing-images.rst    |   3 +-
 documentation/dev-manual/layers.rst                |  22 +-
 documentation/dev-manual/securing-images.rst       |  12 +-
 documentation/migration-guides/migration-5.2.rst   |  56 ++++
 .../migration-guides/release-notes-5.2.rst         | 345 +++++++++++++++++=
+++-
 documentation/profile-manual/intro.rst             |   4 +-
 documentation/profile-manual/usage.rst             |   2 +-
 documentation/ref-manual/classes.rst               |  37 ++-
 documentation/ref-manual/features.rst              |  19 +-
 documentation/ref-manual/variables.rst             | 113 +++++--
 documentation/sdk-manual/extensible.rst            |   5 +-
 documentation/test-manual/reproducible-builds.rst  |  22 +-
 13 files changed, 567 insertions(+), 75 deletions(-)

