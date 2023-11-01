Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E230FC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:27:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.75.1698859635453475891
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 10:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36DEC2F4;
	Wed,  1 Nov 2023 10:27:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C56E13F738;
	Wed,  1 Nov 2023 10:27:13 -0700 (PDT)
From: ross.burton@arm.com
To: docs@lists.yoctoproject.org,
	michael.opdenacker@bootlin.com
Cc: nd@arm.com
Subject: [PATCH 00/14] Release notes changes
Date: Wed,  1 Nov 2023 17:26:52 +0000
Message-Id: <20231101172706.81576-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Nov 2023 17:27:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4546

From: Ross Burton <ross.burton@arm.com>

Hi Michael,

Here's a series of patches to add more to the release notes.  I'm 99% sur=
e
you'll want to reword or add more formatting to most of them, and you pro=
bably
have more local changes, so I sent them as independent changes which will=
 be
easier to rebase.

Feel free to rewrite/squash/edit as needed!

Cheers,
Ross

Ross Burton (14):
  add debian 12
  edgerouter removed
  QEMU_USE_SLIRP removed
  remove non-notable change
  mention llvm17
  mention cdn
  add kernel notes
  obsolete SERIAL_CONSOLES_CHECK
  sdpx is poky, not global default
  testing notes
  utility notes
  bitbake notes
  packaging changes
  git recipes reword

 .../migration-guides/migration-4.3.rst        | 17 +++---
 .../migration-guides/release-notes-4.3.rst    | 59 ++++++++++++++++---
 2 files changed, 60 insertions(+), 16 deletions(-)

--=20
2.34.1


