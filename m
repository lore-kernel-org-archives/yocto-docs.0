Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F991D6B6DF
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 12:47:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.11640.1730378829174737629
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 05:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kTTikqE+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD39EE0004;
	Thu, 31 Oct 2024 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730378827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HVuVhbJKDUvO1FVwMQH05SpN/scBdzhwyysv0fvoNdc=;
	b=kTTikqE+WQq9iSV4HqXvLmCbaO97WAwUSTVVrnhy3xbX+JItNdvtIVtrspuZbRfvODsu0W
	0weCuPd+KKo54ZBa/sxOHithgH5joNeg7Gr+IKXuhh99jyRYhbHlDtCYseQzTVGo/7GDwa
	UyqMOzdIHcyQjihmemLcdQ0CnTBrTAWqmZSmxTvRhCmg84daxuY4p8VKH0NtFFeN75Hqkv
	HCHCu0GwNPJrdcMRJMilKlr/USAw0SsqyJuVXG2wjzA2Qh9ymk5jLunCaPk/KTaB7PDalK
	vPil5z5KzMDs61Q1gb2IEbIVcz8in4+hLvQbNxQ37DG8Za51PTyLL7ulvHb+2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 13:47:06 +0100
Message-Id: <D5A03MU2K2CH.CG1JOAGJQA9R@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 12:47:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5628

The following changes since commit 9563855ccd92e21fb6f8320c96a3a83e115c947e=
:

  migration-guide: add release notes for 4.0.22 (2024-10-25 09:52:03 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 7b40c7b73a360a1ec383c4c9f00c3e126208320b:

  release-notes-4.0: update BB_HASHSERVE_UPSTREAM for new infrastructure (2=
024-10-31 13:44:39 +0100)

----------------------------------------------------------------
Antonin Godard (5):
      docs: update current releases
      ref-manual: release-process: update releases.svg with month after "Cu=
rrent"
      ref-manual: release-process: add a reference to the doc's release
      ref-manual: devtool-reference: refresh example outputs
      ref-manual: devtool-reference: document missing commands

Steve Sakoman (1):
      release-notes-4.0: update BB_HASHSERVE_UPSTREAM for new infrastructur=
e

 .../migration-guides/release-notes-4.0.rst         |  2 +-
 documentation/poky.yaml.in                         | 12 ++--
 documentation/ref-manual/devtool-reference.rst     | 72 ++++++++++++++++++=
----
 documentation/ref-manual/release-process.rst       |  2 +
 documentation/ref-manual/svg/releases.svg          | 18 +++---
 documentation/set_versions.py                      |  8 ++-
 6 files changed, 84 insertions(+), 30 deletions(-))

