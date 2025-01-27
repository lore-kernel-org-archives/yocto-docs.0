Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3643DC02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 15:58:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.55064.1737993511103658045
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 07:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WlBB88AE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C9EE1C0007;
	Mon, 27 Jan 2025 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737993509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9xtRGd7pYdZbGwjdULGEXr6JSHho2oBuxrUXKB6/x0E=;
	b=WlBB88AEXu/errEjg5eP9pNgnAfb10DjwQvBzP+rEphfkOnaCaC8oyFl+0aLyhD0JYA8nk
	jp+NSbVHhrmsw7/KKNIZ8fPCMfhigKawhwvBxj2bNaYo/bazioLCkhdXdVGGOAKi2I8YCP
	RL8B38rO922pp+shGxZIaf+jqUaS4dn64wI6nyOKWt5awRQ/qtaC2phrk4sXdKX6bngJno
	NeJTlhWbXYx5K+07RvA80fAFrbXRLn6WHrVEEiHFosgrQXmvOIV1JEkoz+f2TRxVDqt2k+
	ZTGff1XSEVib5hjsHFCR8K68+KFZ67s7EjQzTYzkr0RAA0XF15V/R+5zxFtCBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 16:58:28 +0100
Message-Id: <D7CZA3L7UFNT.30O2FE56JM3U9@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 15:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6198

The following changes since commit d574e625b2bb1b07a2e51cbf2e1f0a28ee596c7b=
:

  test-manual/reproducible-builds: fix reproducible links (2025-01-20 09:34=
:08 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to b1a7dd6d34a291e2250e7169f4f9d93e61700a63:

  dev-manual/building: document the initramfs-framework recipe (2025-01-27 =
11:49:59 +0100)

----------------------------------------------------------------
Antonin Godard (1):
      dev-manual/building: document the initramfs-framework recipe

 documentation/dev-manual/building.rst | 84 +++++++++++++++++++++++++++++++=
+++-
 1 file changed, 83 insertions(+), 1 deletion(-)

