Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91557CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:54:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.19021.1757688889952482562
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 07:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LVOHLX7K;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 716C3C6B3A1;
	Fri, 12 Sep 2025 14:54:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67A19606D6;
	Fri, 12 Sep 2025 14:54:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF3D5102F2924;
	Fri, 12 Sep 2025 16:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757688886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=WC+qwYzCo5plgxcnNVsa48842J34VEbg9oMc0OunNdI=;
	b=LVOHLX7KM0t055Sj8bUTxXN0F+6ZgxbUGM83LtSZQ/SPxQjvnntyVvYGAsfzV86etTqKEH
	BtJo0uOn9r4app5thCGeerXdkgmMRRCmcy3eIUzRmMubJo5CjM9X/bb5Ahw8GGrE2Fzyt6
	ehhXgcIRHqzqReOgf4UgNZojkWxOMpLL9BC9exE9sH+/nUHklmU3h7+7hgUsdncs2047he
	s9vLZW5Bqz3RF4xI4HfU2yfz1reYUREVPDMz1/4J/npDXWIL1Yav/2zxhEabQFcssExSoE
	FDOhDmEX1db0z/shs0bG9cyd1ecU2L3FTB4DJ+6DHnIdnsv7QU/26QgRySQWzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 16:54:45 +0200
Message-Id: <DCQWPII6FWNQ.UX7V7Z1H03N2@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:54:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7506

The following changes since commit dbc6137cd13f982a7fd4d1b2df79dccb177db0fc=
:

  poky.yaml.in: increase required disk space to 140G (2025-08-08 16:34:19 +=
0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to e77139b5c616e6e5ad436eb91416fd804389425f:

  migration-guides: add release notes for 5.0.12 (2025-09-12 16:48:32 +0200=
)

----------------------------------------------------------------
Antonin Godard (3):
      migration-guides/release-notes-5.3.rst: add x86 qemu micro-arch level=
 bump
      dev-manual/security-subjects.rst: update mailing lists
      migration-guides/migration-5.3.rst: add note on systemd pni-names cha=
nge

Gyorgy Sarvari (1):
      migration-5.3.rst: update removed recipes list

Jan Vermaete (1):
      sdk: The main in the C example should return an int

Joao Marcos Costa (1):
      ref-manual/variables.rst: expand IMAGE_OVERHEAD_FACTOR glossary entry

Lee Chee Yang (3):
      migration-guides: add release notes for 4.0.29
      migration-guides: add release notes for 5.2.3
      migration-guides: add release notes for 5.0.12

Peter Marko (1):
      vulnerabilities: update nvdcve file name

Pierre-Loup GOSSE (3):
      ref-manual/kickstart.rst: add extra-partition-space
      migration-guides/migration-5.3.rst: wic option extra-space renaming
      migration-guides/release-notes-5.3.rst: new wic option extra-partitio=
n-space

 documentation/dev-manual/security-subjects.rst     |  23 +-
 documentation/dev-manual/vulnerabilities.rst       |   2 +-
 documentation/migration-guides/migration-5.3.rst   |  23 ++
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-5.2.rst     |   1 +
 .../migration-guides/release-notes-4.0.29.rst      | 178 +++++++++++
 .../migration-guides/release-notes-5.0.12.rst      | 184 +++++++++++
 .../migration-guides/release-notes-5.2.3.rst       | 355 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.3.rst         |  22 ++
 documentation/ref-manual/kickstart.rst             |  12 +-
 documentation/ref-manual/variables.rst             |   6 +
 documentation/sdk-manual/working-projects.rst      |   3 +-
 13 files changed, 799 insertions(+), 12 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.29.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.12.rst
 create mode 100644 documentation/migration-guides/release-notes-5.2.3.rst

