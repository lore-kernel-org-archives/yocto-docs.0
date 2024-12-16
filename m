Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380F7E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 08:25:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.52342.1734337499605582180
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Dec 2024 00:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pnMLKeYY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA9D960005;
	Mon, 16 Dec 2024 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734337497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uw8pmjWihXlFUZ+JPQZKTz+v5ZJwyh7rQfMW7sU2M2M=;
	b=pnMLKeYYAq9dGaLVR/0GwBfiH0QjUBHXrMGVBuiVPyPZV3WtEoEb5MCxAChXfNxp3DEBhN
	e4sYgFg81+eTI7wiPQEj4HO+ngjGQmalwPlq9Q4rCJm44t6p2D4mr43f0k3/Vp7jddcBFm
	2w5bATChyjuqGoMz1P8KZ5nyW/9wshAmhKf92SF2pcJDmsw6deqcV2TQKDnpz9CcfZ3sBP
	Aas5gAywcA+YW+eQMmP+GN2BkXamgAV7A38UCXQdGK24miBoNQOV6hwhR/jHNP9zFJ4EbG
	8V+wX/vVWasYeu8qY+tebpmaEh14BDoUgHI6iMtBXAnKmMAjQwXhU79a+1Uvbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 09:24:57 +0100
Message-Id: <D6CZBYYHB5E7.3LUERFUWBM8QN@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [styhead] Pull request
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Dec 2024 08:25:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5930

The following changes since commit 59c219067c6e47968d07d1f34ff0530f2411fd11=
:

  migration-guides: add release notes for 4.0.23 (2024-11-29 09:03:30 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 01048d7de570a9d896c5aab294008396e2d78607:

  system-requirements.rst: add dependencies for pdf builds (2024-12-16 09:0=
3:51 +0100)

----------------------------------------------------------------
Antonin Godard (7):
      docs: update current releases
      Gather dependencies in poky.yaml.in
      poky.yaml.in: add missing locales dependency
      poky.yaml.in: replace inkscape dependency by librsvg2-bin
      system-requirements: add fedora 39 to supported distros
      system-requirements: update list of supported distros
      system-requirements.rst: add dependencies for pdf builds

Gu=C3=A9na=C3=ABl Muller (1):
      ref-manual: use standardized method accross both ubuntu and debian fo=
r locale install

Lee Chee Yang (1):
      migration-guides: add release notes for 5.1.1

 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/migration-guides/release-5.1.rst     |   1 +
 .../migration-guides/release-notes-5.1.1.rst       | 289 +++++++++++++++++=
++++
 documentation/poky.yaml.in                         | 276 +++++++++++++++++=
---
 documentation/ref-manual/system-requirements.rst   |  76 +++++-
 documentation/set_versions.py                      |   8 +-
 6 files changed, 607 insertions(+), 45 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.1.1.rst

