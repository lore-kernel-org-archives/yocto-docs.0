Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B296D0C5E6
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 08:38:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.7518.1729845477061828928
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 01:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VfEMAz41;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5ABF240004;
	Fri, 25 Oct 2024 08:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729845475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QSaNwtwtahssu5ZUWFgYv7oVLjphHPS9joUIgTlp3Sk=;
	b=VfEMAz41Px1G+IBx9V8tQkeUN3f0GPHCxmbY9gyv/g5vV2JjIt9JY/xbGUmBO6/OdvS4LK
	U/reViCtkuLOQSXcuLBd7BAcrU6BlL4CFkQE2vKzUzYgyqRHdusJg277yYZjoPW/zsi6y+
	umPL245doT9IJ2Vc6fjhL6G/wU/VEP3VK56pzZ2ARSn6IjSAeLuHOTl8BCciBQvaxLwxOf
	xxO1QhCRqxujVEIgi2CUCrAwsOKWUpHtHRqYHApdy0N48+b0ovqApQhzBl1zdMCsdCHZW6
	QYxo1KlUwOIjGicDTsu+fr+06vnsdwMgltOKT39vIocA43gMtgdH2+tXfQ7trA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 10:37:54 +0200
Message-Id: <D54R1KCR9TTV.2GGK4NSFJENLB@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 08:38:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5588

The following changes since commit 259fce03ffab9fb588676c1e150d999d54cf6d85=
:

  ref-manual: structure.rst: document missing tmp/ dirs (2024-10-17 12:02:4=
0 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to f08f4c664ffd49d23c7318d88604d1c940f0298a:

  migration-guide: add release notes for 4.0.22 (2024-10-25 09:53:10 +0200)

----------------------------------------------------------------
Antonin Godard (3):
      overview-manual: concepts: add details on package splitting
      ref-manual: release-process: update releases.svg
      ref-manual: release-process: refresh the current LTS releases

Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.22

 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.22.rst      | 196 +++++
 documentation/overview-manual/concepts.rst         |  61 +-
 documentation/ref-manual/release-process.rst       |  15 +-
 documentation/ref-manual/svg/releases.svg          | 907 ++++++++---------=
----
 5 files changed, 608 insertions(+), 572 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.22.rst=
)

