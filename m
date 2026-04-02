Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655E3D39438
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:39:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17315.1775140739180174201
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 07:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gldasYxu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AB9091A3104
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 14:38:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D20F603C1;
	Thu,  2 Apr 2026 14:38:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2FB310450279;
	Thu,  2 Apr 2026 16:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775140736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=pGcb2pbI2FShj6f5rP/ETRavL91Q6OIat79Wty5aHIg=;
	b=gldasYxuRTeCBaNnUJrH4CbZvIOGBLSiV+z0Aqdsc39RbtXv4ScCoYWIE/K1KSEFFuvztf
	ocsnzWTgO6crGfvLS954ovRH1+hmSUm7X+lSEgzatfwwFP0bKbJd3GKWjWLidQRkohz/xd
	xFQNkU67UHg3a4g4TyAEsg10olq48DsfYVvtpQcHRERvB633duOP86DvJ5SVEUcDlRaKUO
	Wf2a2fPFsAWgIwQCQWTlZdpRi+PqIOGSHgwclwKQJ/G3/l83IYrR4Y2Aar1Zar8WDetTWa
	6xAqMKLH4+0scfQSVJCPgWYyN2DnYNCKs+G5pPF01GoVOebn3VGvfpJcSE+CFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 16:38:54 +0200
Message-Id: <DHIQVFK93Q49.3FLI896AJ5616@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 14:39:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9169

The following changes since commit aa7226705451e6c1ef964d49963bbed29b267c27=
:

  ref-manual/system-requirements.rst: add CentOS Stream 9 to supported dist=
ros (2026-03-26 15:02:34 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 345b2f248c5353d47248bba8dd7aaa1084945324:

  migration-guide: add release notes for 4.0.33 4.0.34 (2026-04-02 15:22:08=
 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.33 4.0.34

Yanis BINARD (1):
      contributor-guide/submit-changes.rst: Added missing word

 documentation/contributor-guide/submit-changes.rst |   2 +-
 documentation/migration-guides/release-4.0.rst     |   2 +
 .../migration-guides/release-notes-4.0.33.rst      | 182 +++++++++++++++++=
+++
 .../migration-guides/release-notes-4.0.34.rst      | 191 +++++++++++++++++=
++++
 4 files changed, 376 insertions(+), 1 deletion(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.33.rst
 create mode 100644 documentation/migration-guides/release-notes-4.0.34.rst

