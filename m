Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC78D6EBE7
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 08:08:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.111919.1732867678408947192
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 00:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IRwWKc0L;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 191C34000A;
	Fri, 29 Nov 2024 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732867676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qtUp9kKF1XN2uGooNqScPX8k8y0Pj43qOpRL+Xyw+gA=;
	b=IRwWKc0LGh4kiklxtT2rmVyiyQ3d17bMc0wT7JDnriBC1Wvnd6Wx4uQHM2l4DJLtWGSu/S
	M0kH37FvD0lyijRpP2o9O0pUD1f6Wvg3AZbWRDxO3DI7CD6xdzCqvdDrPnQPPUQzJpWZ5H
	WgvAydbIpOMRGY/L3oGe2/vv3i3tZ1tlVMg7LoqHd1kNmKiaNkNRTjrm6J5zNROZkWfhdt
	cOTVbjQB/JTjkHgRN5DJA9itW/QEx8UxkTZSVmjteGVpVTFfnWxsy2c7WZBECDtWJT55ev
	f1mtWNiiIYuNy4Uc7xUInHEnCojj2fej/cVbDNno1OoXfeCDzX1coqsoAyEzkg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 09:07:55 +0100
Message-Id: <D5YIBOEWLN6Q.2RLRXM123JRFP@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 08:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5844

The following changes since commit 6dcc70c4fa780d8531c58bd7886d6f8b602c10af=
:

  migration-guides: document ZSTD_COMPRESSION_LEVEL change (2024-11-22 08:4=
1:49 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 5835cb574881d57785f099c768467177d077e867:

  migration-guides: add release notes for 4.0.23 (2024-11-29 09:03:05 +0100=
)

----------------------------------------------------------------
Antonin Godard (1):
      ref-manual: classes: fix bin_package description

Lee Chee Yang (2):
      migration-guides: add release notes for 5.0.5
      migration-guides: add release notes for 4.0.23

Mikko Rapeli (1):
      classes.rst variables.rst: add documentation for uki.bbclass

 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.23.rst      | 209 +++++++++++++++++=
++
 .../migration-guides/release-notes-5.0.5.rst       | 227 +++++++++++++++++=
++++
 documentation/ref-manual/classes.rst               |  95 +++++++--
 documentation/ref-manual/variables.rst             |  42 ++++
 6 files changed, 558 insertions(+), 17 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.23.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.5.rst

