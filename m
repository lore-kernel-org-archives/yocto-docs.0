Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EFACAC58F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:54:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.18880.1757688889404787710
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 07:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LMO4MNKa;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 79D4C4E40C6D;
	Fri, 12 Sep 2025 14:54:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50A3660638;
	Fri, 12 Sep 2025 14:54:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F6EA102F29E6;
	Fri, 12 Sep 2025 16:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757688886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GEu7hN8uzKQ1xygtDCGOCZ2cJSH5uF1lF5z4MBSOL/c=;
	b=LMO4MNKa4PN9m7FHunJImw0Dg6FvwutG/QKpQdjbKAbHA4C1bBhidq3YnFp5FkZbSwbRfA
	wijLx6dl+woXFROiU9faMK8f1YMb/g8vii2SCTQpCaXPoYZNsPGDAeTNh8SnqCwz3oujO4
	TW1gwBdM87Srn5O9gCqG6TbJgtJtY90fI2gXpsEkTih6iaaQZVLHHr35xv7zcEFzJ0w8U3
	tmA5Bw3JnsLrYnx5LXfWdu8ju+hKGEBN9+WZoqnVmFdms9T9/y1YzTDb+2TfCL22JNoi7T
	lQY3pTqas9eSPpclH8J0acsiRrIE44PxxTijxbe5UTubYtv2nviLnB0ritcQNw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 16:54:45 +0200
Message-Id: <DCQWPIRBUNU8.1V5XVSCPZPQ53@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:54:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7505

The following changes since commit e664a70adb5bc19041b3b5f553fb90dcddff99d0=
:

  ref-manual/classes.rst: document the testexport class (2025-08-08 14:27:0=
4 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 29330751c8a2b82b4bd80659d2a0a8bac51afca5:

  migration-guides: add release notes for 5.0.12 (2025-09-12 16:48:58 +0200=
)

----------------------------------------------------------------
Antonin Godard (1):
      dev-manual/security-subjects.rst: update mailing lists

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

 documentation/dev-manual/security-subjects.rst     |  23 +-
 documentation/dev-manual/vulnerabilities.rst       |   2 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-5.2.rst     |   1 +
 .../migration-guides/release-notes-4.0.29.rst      | 178 +++++++++++
 .../migration-guides/release-notes-5.0.12.rst      | 184 +++++++++++
 .../migration-guides/release-notes-5.2.3.rst       | 355 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |   6 +
 documentation/sdk-manual/working-projects.rst      |   3 +-
 10 files changed, 743 insertions(+), 11 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.29.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.12.rst
 create mode 100644 documentation/migration-guides/release-notes-5.2.3.rst

