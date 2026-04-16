Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28EEF8A16F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 12:41:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13032.1776343308522630690
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 05:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ttUeQJ88;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 490FB4E42A28;
	Thu, 16 Apr 2026 12:41:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0858A60495;
	Thu, 16 Apr 2026 12:41:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C2E41046082B;
	Thu, 16 Apr 2026 14:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776343305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tmY8VfOGyH5AEZQy3y0+O8K7McwOq3sN8qz2yXiKJns=;
	b=ttUeQJ88Ab/axFIxpwO1aB0DqLoU33kL5mgDi58XDYRy1ECDUNVvo54GmxCXL50qWsr+sp
	XAo6PzHHq89azIsKM32aRzTNCMYLmS2NgasjplMtB865Rlu1iv+N+3y5v1t6NPlZEcE8cM
	5t1gQrougq1n5n+xrFOuHQvBlrGbvJQ9V4LgmN9QXtNhNXjF1LepJOZLYl3r5GaOpfRL3q
	SpM3JKYefB3MvG/GPX1bwdsX6g453yigNlzYkNHPAKd2FZbkeF2jfu5jYmYaUJYZtZv6ab
	ZC1gVF0E2G8sIguSKPqr4gGroC4+fvlOeOYkCq+TYqxN7qveFBzgwrotDmkkrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 14:41:43 +0200
Message-Id: <DHUL5C39WKWY.4KSM2HD4MW91@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 12:41:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9258

The following changes since commit 345b2f248c5353d47248bba8dd7aaa1084945324=
:

  migration-guide: add release notes for 4.0.33 4.0.34 (2026-04-02 15:22:08=
 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 48d15a62ed7c004fd6e1dced03923bac529c435e:

  ref-manual/variables.rst: correct a reference to STAGING_DIR* (2026-04-16=
 14:34:21 +0200)

----------------------------------------------------------------
Adam Blank (6):
      ref-manual/variables.rst: update STAGING_DIR's description
      ref-manual/variables.rst: update COMPONENTS_DIR's description
      ref-manual/variables.rst: update PKGDATA_DIR's description
      ref-manual/variables.rst: update RECIPE_SYSROOT* descriptions
      ref-manual/variables.rst: update STAGING_DIR* descriptions
      ref-manual/variables.rst: correct a reference to STAGING_DIR*

 documentation/ref-manual/variables.rst | 78 ++++++++++++++++--------------=
----
 1 file changed, 37 insertions(+), 41 deletions(-)

