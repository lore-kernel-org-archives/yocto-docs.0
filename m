Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9411DD0C5E9
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 08:37:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7517.1729845469296451273
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 01:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DI7ux9i6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49F4A1C000C;
	Fri, 25 Oct 2024 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729845467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/B3mIaWQqDDr7TSqpwl0uhdmHVrywwr+gAdesFK0EkA=;
	b=DI7ux9i6lkcZsdjs7pbxx2tdir7JVUSE6sPBGoeE/gYJ0zxGW/iiT9+qaDDk2IT9OoVHyd
	D/uhJyZyz4/di1Eh+7DD+Jh65TBYDCzTJL3Kqjt4Lh1722uNGRtCnyRutvDwVPziFUppI8
	y+4Ce0vxj3ZmrTr+CaLGccdnMord+SZEDr6J0jgwyan2wdONvynvzFzMxCuckutUD6YrM3
	MKl5fPnJ0ToU/V2Wqj4jd5BGhtvdeV1iukxDaRfrval53IM8lS8VSAshT1eqmkKjT4ZdUp
	U+Vzk5JYNS0cwyInyQ8E00pLf6Hs5vEtbHXRCb2TmrX0lRV4Ct9uoeR2LmsGkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 10:37:47 +0200
Message-Id: <D54R1GV1B1OJ.2KIETI7EB6SBN@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 08:37:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5587

The following changes since commit 5958b3c7546d71fdd1693c26747e0196c6aaf277=
:

  ref-manual: structure.rst: document missing tmp/ dirs (2024-10-17 12:00:1=
1 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 74369923b34b879275cd1d5af6d73e57be757078:

  migration-guide: add release notes for 4.0.22 (2024-10-25 09:53:10 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      overview-manual: concepts: add details on package splitting
      ref-manual: faq: add q&a on class appends
      ref-manual: release-process: update releases.svg
      ref-manual: release-process: refresh the current LTS releases

Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.22

 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.22.rst      | 196 +++++
 documentation/overview-manual/concepts.rst         |  61 +-
 documentation/ref-manual/faq.rst                   |  19 +
 documentation/ref-manual/release-process.rst       |  15 +-
 documentation/ref-manual/svg/releases.svg          | 907 ++++++++---------=
----
 6 files changed, 627 insertions(+), 572 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.22.rst=
)

