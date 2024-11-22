Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDA7E65D32
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 07:56:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.19251.1732262176235683237
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 23:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MP2a1c8M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 361C51BF20C;
	Fri, 22 Nov 2024 07:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732262174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5pgxzBiz3DL+yyY8LUqqTpX510DKWIRJFBsNyvsTYXk=;
	b=MP2a1c8MF1WLQ6fCx0iEOszzL4xjZJ87tvQ71lv7UcSnsxv1/deQ2sQMFw/xsBc9jltoTD
	zb3c1GTvhMjRHHZW3Mv46GKvDNOwsflBezcMFt7QLrRCi5fhZSyEIB9I9cxwJhlqfLVzPa
	/yLbYsL3LCSIVHFnUW+kDM3Zzc/sVGGg2TKeLoZak9vRLZcUA1AlS+YChiretXUjJpi9/E
	n3ujCsajw+vF9HyEh7woR3J6mHtuIL8NtogZeHkAFBLy0WdkMOdoS5pc2t+HvkxBNDQoA/
	PVtydyjZPdmK53Gczq9cRCU/OBG7EG27/1kPwnjYYRBP+1M5pheWXeNFRjKPlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Nov 2024 08:56:13 +0100
Message-Id: <D5SJOWABUU40.1KFOCU7Q8EE48@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Nov 2024 07:56:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5791

Hi Richard,

The following changes since commit 7d5eb0cee5b2b7096969819d7d7ce569a3c92f27=
:

  dev-manual: bblock: use warning block instead of attention (2024-11-15 09=
:22:57 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 6dcc70c4fa780d8531c58bd7886d6f8b602c10af:

  migration-guides: document ZSTD_COMPRESSION_LEVEL change (2024-11-22 08:4=
1:49 +0100)

----------------------------------------------------------------
Alexander Kanavin (3):
      ref-manual: merge two separate descriptions of RECIPE_UPGRADE_EXTRA_T=
ASKS
      ref-manual: document ZSTD_COMPRESSION_LEVEL
      migration-guides: document ZSTD_COMPRESSION_LEVEL change

Antonin Godard (1):
      standards.md: add a section on admonitions

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.4

 documentation/migration-guides/migration-5.2.rst   |   3 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.4.rst       | 212 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |  16 +-
 documentation/standards.md                         |  15 ++
 5 files changed, 241 insertions(+), 6 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.4.rst

