Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B58C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 08:25:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.52341.1734337499427375184
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Dec 2024 00:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GVrZfE7a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD7501BF209;
	Mon, 16 Dec 2024 08:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734337497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JcMJAWgzp4ZQE1xTJoWOjc2Gn9OcilR0U21Cb8NQ7ig=;
	b=GVrZfE7aCdD20wijHa0MpBNttKA7+XZT/o72iT4Fi5IdIpuIfZUpteCHLxW5fY10ZDhMkH
	n6bjfsuj3EpOz+m34LEnc3zVH9PvG48tCEaDR69wHmrSM5UdWJtTEomxX4RHytReyB2IYe
	ZbWljHfWLkFws1FfYn7iU8TEEgPEXlhcjY3olY02SN+VQm23T15GmmPX573o/NkCsyg60n
	CkI8i40TAwTuyjaNPNKJ9kWkvHi6cF+4ebnw90s5Iva0RjgeKWYckAPT8vcFQxLHf3YvPN
	yLwHtA8CXMu8lb68dQpWBi+jUkbWkO3mMiijj+7RmGW1TL8HAEXTFv+bcF+CFQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 09:24:56 +0100
Message-Id: <D6CZBYPNISB2.5I75L7OOH1F0@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Dec 2024 08:25:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5929

The following changes since commit 5835cb574881d57785f099c768467177d077e867=
:

  migration-guides: add release notes for 4.0.23 (2024-11-29 09:03:05 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 02c090718ac602f7d4760dd28dadbf0631668d49:

  system-requirements.rst: add dependencies for pdf builds (2024-12-16 08:5=
7:48 +0100)

----------------------------------------------------------------
Antonin Godard (6):
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
 documentation/poky.yaml.in                         | 264 +++++++++++++++++=
--
 documentation/ref-manual/system-requirements.rst   |  76 +++++-
 5 files changed, 596 insertions(+), 36 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.1.1.rst

