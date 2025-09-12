Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C081CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:54:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.18881.1757688889564834109
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 07:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fZbso2Wu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 20C92C8EC5A;
	Fri, 12 Sep 2025 14:54:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 215D660638;
	Fri, 12 Sep 2025 14:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2345E102F29FA;
	Fri, 12 Sep 2025 16:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757688887; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=80LTfIVny1RuPcd4+HvsFggzgS6SXH+k5nnrW7v3XXU=;
	b=fZbso2WuVPZkUfbN4E43ONrEjWLtIcFNdQwp8FrWo3DdiqI+ZCsj6XXX9XOPzzZR6XPrLH
	1crRMgavSmkiLfUDwvHouTTmlEd5V4Gbzn37USASclZyaGPGWQxNZU32IH5/8j5TDb/Oty
	3xTkk8TQUCPwX4StSGvIwMzdtcyEaeJjWdCzQ+op71Tf1xcvho9IeI42quDtYWel4ou9xv
	pM0yv60jLUwRbmY39mNdA8AuwJSMXe67KfhY+bPhtVc9noQPxPZWh+3jmRoj7EEth8pE92
	AljuYlpEqpznt8677syPQQMFQtUAW1D9tlG78+Co0k71OlTpDncbDO2+/NUN3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 16:54:46 +0200
Message-Id: <DCQWPJ3XPPXG.157553XNIXJER@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:54:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7507

The following changes since commit 1576091585f8ffdcadd8b8eee525614ab16b6fa0=
:

  ref-manual/classes.rst: document the testexport class (2025-08-08 14:24:1=
9 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 71a3933c609ce73ff07e5be48d9e7b03f22ef8d7:

  ref-manual/variables.rst: expand IMAGE_OVERHEAD_FACTOR glossary entry (20=
25-09-12 16:39:42 +0200)

----------------------------------------------------------------
Antonin Godard (1):
      dev-manual/security-subjects.rst: update mailing lists

Jan Vermaete (1):
      sdk: The main in the C example should return an int

Joao Marcos Costa (1):
      ref-manual/variables.rst: expand IMAGE_OVERHEAD_FACTOR glossary entry

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.29

 documentation/dev-manual/security-subjects.rst     |  23 +--
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.29.rst      | 178 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |   6 +
 documentation/sdk-manual/working-projects.rst      |   3 +-
 5 files changed, 201 insertions(+), 10 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.29.rst

