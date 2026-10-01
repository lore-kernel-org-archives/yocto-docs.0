Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB7BCA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 13:09:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10887.1790860178618202543
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 06:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=J8qUTIN/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 518914E40EF7
	for <docs@lists.yoctoproject.org>; Thu,  1 Oct 2026 13:09:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26B8D60341;
	Thu,  1 Oct 2026 13:09:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE9D410328105;
	Thu,  1 Oct 2026 15:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790860171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HwpnGPIVQfPA/wY/RSZVGgU53ZghfGjmFpFGbg12lls=;
	b=J8qUTIN/5l8HrMoZoXps5oomaArltmtJKeH+lnkVGX+Iy9AUnFOZGsdmXtWAUoenVLyd8U
	U5hGOYb6uloJN1wzgdlZwoY7+VyBmNyVJORZ+FrOMKjy7gZ7dGDWm/tpQHVJJXSN1TyIp7
	lqq9yljLfjPnyk3XYo3g5zN2W6USIuu5MByT2MCwHpmG4U6bz1+NGKxJvR+dcE2TZjAy1a
	4ouJn6PpTiXvi1yWg52HARvNM5kgRzs+nohL4AWndNnHh7caF9SXCGMsD7uJvyQD5r3fm1
	hdM9P1Wugija+Mgv8BNMLzZ50ofWz1oto7KEyqlYci1WFbKQV4SYQX0DR5BQ2g==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	antonin.godard@bootlin.com,
	paul@pbarker.dev,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 0/4] Add latest updates to release-notes-6.1.rst
Date: Thu,  1 Oct 2026 15:09:00 +0200
Message-ID: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 13:09:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10648

Hello,

I prepared a few patches to catch up with the most recent changes in oe-c=
ore
since last week. I essentially updated the following lists: CVE fixes,
contributors, and recipe upgrades.

Best regards,

Jo=C3=A3o Marcos Costa (4):
  migration-guides/release-notes-6.1.rst: add recipe upgrades
  migration-guides/release-notes-6.1.rst: add CVE fixes
  migration-guides/release-notes-6.1.rst: update contributors
  migration-guides/release-notes-6.1.rst: add latest changes

 .../migration-guides/release-notes-6.1.rst    | 150 ++++++++++++------
 1 file changed, 98 insertions(+), 52 deletions(-)

--=20
2.55.0


