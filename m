Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B111ACCD18F
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 16:36:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.49177.1760373365809826958
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 09:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=abVWrL1y;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 150FB1A1342
	for <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 16:36:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBCCD606F9;
	Mon, 13 Oct 2025 16:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8793F102F2272;
	Mon, 13 Oct 2025 18:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760373363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hw0XoAwUiqAop0MEftJpKk+KQ6G+lMWrMgxuqPmDzMQ=;
	b=abVWrL1yDxN47Tbaugz6y7pPQl/83XoOEvluODG9P4KdM9dd9oAfsJZiLq+bjQuvhjPWza
	gqb0l5mFmlmieR7PavzGhSl/wu2MsEBri0QoJHwoZ6iQaiQgsmTD8eV2EvRr4/GUi0xgto
	R7y3bIw1nyynb6q/HfSsitfAgyXKscQa5+BZHw1oZNJ1ODEaOOjgwAZ95Ngj9hEW+kUeym
	OH5sIRdYQT9AoJJEgmnh5vE1CLQ2pW+xfVpnomZAW9dandz+NkK4/XrAymCw3IjRm5vI7E
	kEExr6cwvI1AOuHpq+OXm/yYYfVTvzuiDKxhcqQC9Dzs38zBSzaRAWTIAWwmAg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 18:36:02 +0200
Message-Id: <DDHC9YABOE71.1XI9SF9SH8ZP0@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 16:36:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7696

The following changes since commit 6f086fd3d9dbbb0c80f6c3e89b8df4fed422e79a=
:

  ref-manual/variables.rst: fix the description of STAGING_DIR (2025-10-03 =
11:49:14 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 6cd7492bf83232744390f34e496367e94b63e701:

  vulnerabilities: update nvdcve file name (2025-10-13 09:13:32 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.30

Peter Marko (1):
      vulnerabilities: update nvdcve file name

 documentation/dev-manual/vulnerabilities.rst       |   2 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.30.rst      | 170 +++++++++++++++++=
++++
 3 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.30.rst

