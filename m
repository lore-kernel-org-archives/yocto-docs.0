Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CA0C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:59 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.50725.1699266591672822927
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id BC17828454;
	Mon,  6 Nov 2023 05:29:50 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id DD78928774;
	Mon,  6 Nov 2023 05:29:49 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 00/12] 4.3 release documentation
Date: Mon,  6 Nov 2023 23:29:30 +1300
Message-Id: <cover.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4586

This is not 100% complete, but I wanted to send what I have now so that
we make progress and folks can review the changes so far.

Cheers
Paul


The following changes since commit 8fb31b507c37d2c11e9dc98559bd7d145e1dce=
04:

  bsp-guide: bsp.rst: update beaglebone example (2023-11-03 15:35:05 +010=
0)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib paule/4.3-release
  https://git.yoctoproject.org/poky-contrib/log/?h=3Dpaule/4.3-release

Paul Eggleton (12):
  Remove references to apm in MACHINE_FEATURES
  ref-manual: update SDK_NAME variable documentation
  ref-manual: remove semicolons from *PROCESS_COMMAND variables
  release-notes-4.3: fix some typos
  release-notes-4.3: tweaks to existing text
  release-notes-4.3: add CVEs, recipe upgrades, license changes,
    contributors
  release-notes-4.3: remove the Distribution section
  release-notes-4.3: move new classes to Rust section
  release-notes-4.3: feature additions
  migration-4.3: remove some unnecessary items
  migration-4.3: adjustments to existing text
  migration-4.3: additional migration items

 documentation/dev-manual/new-machine.rst      |   2 +-
 .../migration-guides/migration-4.3.rst        | 118 ++-
 .../migration-guides/release-notes-4.3.rst    | 704 +++++++++++++++++-
 documentation/ref-manual/features.rst         |   2 -
 documentation/ref-manual/variables.rst        |  51 +-
 5 files changed, 801 insertions(+), 76 deletions(-)

--=20
2.34.1


