Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955CCE9E31A
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 14:41:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20484.1770820858256606295
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 06:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gIFK0qcU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98C12C243B4
	for <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 14:41:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE218606B1;
	Wed, 11 Feb 2026 14:40:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37C4D11948F12;
	Wed, 11 Feb 2026 15:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770820855; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Ul/JWHitonknMb4+zGQyngDPhNDRo+sMFGEy0cgS1vg=;
	b=gIFK0qcUGyE7hqb+ZxYV4jS4TRR2Dqhd/xXPE37c1QzsFc7RvTL5DSVAvCpR9aThOzMF1T
	GyvODxk6gWnsIFQKkD5sbIAgttucRMkxqlQhNctKBwkmGpnnPzWA1CWzKPlDlOj3HgQlOe
	YvRmmLNyB44HHenma1rhGZyrUOmmshpr0SFft/+0MPZnzH0faktU3OlrW4i9qKQLJU8PFx
	SMWw99HImiAZbG/b0+HGBns12k8Vgnf2F7C9/Lqs1PkdDu5fBkoC73LjrfdcA0gikc9SLt
	VhQdhrEioGR2d8Ql5gReAopyvCEpXNE6f7Dw9lhNsqSALmkIm0d39awlxOEJSw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 15:40:54 +0100
Message-Id: <DGC7LQ56DZNT.2KJ4G3L9KK5MG@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 14:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8884

The following changes since commit 3ec23e9fb7ddc294bac6f68300591239c9cedf4b=
:

  what-i-wish-id-known.rst: remove obsolete poky repo references (2026-01-2=
9 16:17:23 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 98840d241c681c5bd4080db57b3bd9d9f0740b94:

  migration-guides/migration-5.3.rst: add note on *FLAGS behavior change (2=
026-02-11 14:59:54 +0100)

----------------------------------------------------------------
Adrian Freihofer (1):
      ref-manual/variables.rst: document new FIT image variables

Antonin Godard (5):
      dev-manual/packages.rst: pr server: fix and explain why r0.X incremen=
ts on SRCREV change
      dev-manual/packages.rst: rename r0.0 to r0 when PR server is not enab=
led
      dev-manual/packages.rst: fix example recipe version
      set_versions.py: check that we build from the git repository
      migration-guides/migration-5.3.rst: add note on *FLAGS behavior chang=
e

Lee Chee Yang (2):
      migration-guides: add release notes for 5.3.1
      migration-guides: add release notes for 4.0.32

Mohammad Rahimi (1):
      brief-yoctoprojectqs/index.rst: remove extra word from text

Patrick Vogelaar (1):
      document the OPENSSH_HOST_KEY_DIR and OPENSSH_HOST_KEY_DIR_READONLY_C=
ONFIG variable

Ryan Eatmon (1):
      ref-manual: Document updated UBOOT_CONFIG flow

 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/dev-manual/packages.rst              |  23 +-
 documentation/migration-guides/migration-5.3.rst   |  42 ++++
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.3.rst     |   1 +
 .../migration-guides/release-notes-4.0.32.rst      | 194 +++++++++++++++
 .../migration-guides/release-notes-5.3.1.rst       | 262 +++++++++++++++++=
++++
 .../migration-guides/release-notes-6.0.rst         |   8 +
 documentation/ref-manual/classes.rst               | 112 ++++++++-
 documentation/ref-manual/variables.rst             | 176 +++++++++++++-
 documentation/set_versions.py                      |   8 +
 11 files changed, 803 insertions(+), 26 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.32.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.1.rst

