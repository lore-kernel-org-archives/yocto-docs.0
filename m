Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D781C02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 15:58:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.55060.1737993507467902843
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 07:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TwwReLeZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44C4860006;
	Mon, 27 Jan 2025 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737993505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zSvSVQmcJRqhSdXkAiW/C4N0Y8SnrOBGqzWUlO4dPtk=;
	b=TwwReLeZZFtejQa1TbrstrQDVZoe+8oFfOcbrOE7t6GNepPVs4C8tY5tB5u1aqrnH8KAUA
	StErmceiahE/iinLKUKMxDBCDh1h0qTH70MYQhpPqrZxccUgCz1QacaTZpsd4wwLKLu032
	MQABEs94GG7drM7nhEvJmQmKsCG3FEh67b7hioy6wayt/3wD+1i315fNab5clEBkwmHsOp
	ND85k7E9ICalzUFH0S1yO8+3LdH4Sr0HgKKTQEw/tQAdgjz8dNyHQTc3/B6OAoNGnwlklM
	5ubCv5e1YAN2VCxrGtS+PsrYVfuribHnwfXJhulO0cUbCynevHv3GpAH3cl6IQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 16:58:24 +0100
Message-Id: <D7CZA1QEZE5K.3UMUW8DBNAOUY@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 15:58:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6196

The following changes since commit 7513b4485c08cf5e9b0c0299599e944ce1139313=
:

  test-manual/reproducible-builds: fix reproducible links (2025-01-20 09:33=
:34 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 2df1f56e4863354f05a352d4f61cc797d85100db:

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

