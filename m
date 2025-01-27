Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EF1C02191
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 15:58:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.55062.1737993509593782643
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 07:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Iu36YfzC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 454E1E000A;
	Mon, 27 Jan 2025 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737993507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zHM/2mfDGmMz26y3kiazm0FkGzw//7HjTSdmIHkKujo=;
	b=Iu36YfzCbBG8YGPfybo/zN2h2kq652Z5lwceTptMImVpMmF0vBS1kp+L/DkcNaJbiAwEWy
	MG4b58sgVw3mqQe7/jvIqR6FbO0JtSSrEKy0HnK69tjyMawZtiG3oY25IK88UZ4EYh+P+W
	mYT5D3bEjz7XAUwyvPYtEaAC7Q98lhEurI9ao1AgYTvSr2+5qMzxa52l6a8AwDwfQCKsmy
	Qqj6tc5ZDZjwUEUn5RC7iyOq8Gz8oo5Tj4Ba1PEKSlnlE1zxGgpaLvNLliorZsh/Oj6bdd
	mj9IjSudtS2RTPRtBnTuhixWvA45EKPaHmMZCNu9XJxLorw1I2xEn/duijQVkA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 16:58:26 +0100
Message-Id: <D7CZA2PPWKE5.2RDB7TYCBG1X@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 15:58:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6197

The following changes since commit bb9e018adcc10c642f87d0b95432783b5eb8057b=
:

  test-manual/reproducible-builds: fix reproducible links (2025-01-20 09:33=
:41 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to e1aa69d00e20a5d3c948c430ed10eb01e7baa574:

  dev-manual/building: document the initramfs-framework recipe (2025-01-27 =
11:29:27 +0100)

----------------------------------------------------------------
Adrian Freihofer (1):
      sdk-manual: extensible.rst: devtool ide-sdk improve

Antonin Godard (2):
      test-manual/ptest: link to common framework ptest classes
      dev-manual/building: document the initramfs-framework recipe

 documentation/dev-manual/building.rst   |  84 ++++++++++++-
 documentation/sdk-manual/extensible.rst | 210 +++++++++++++++++++++++-----=
----
 documentation/test-manual/ptest.rst     |  14 +++
 3 files changed, 248 insertions(+), 60 deletions(-)

