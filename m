Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF51AD41C1A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 10:23:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6358.1765448625481566728
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 02:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Rp/5i7iU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C44271A20E3;
	Thu, 11 Dec 2025 10:23:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B4B96068C;
	Thu, 11 Dec 2025 10:23:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC3CD103C8E01;
	Thu, 11 Dec 2025 11:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765448622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=M4tEgZNJSBKF5/f7EoOpd1ningR37JhJnGw78VdEyoM=;
	b=Rp/5i7iUXGwV5Sa7D6bbgzRC8EHAwMalJWDZOva6QG4P84Pqbmzd0FQYo5DHXnUpFs0FKv
	8/tNjIPoccUQ5HU/mbPD/2VSiBCwkysCCUPipqSUnJmMfXuksK+KC66TdVBqU6kA/ka4it
	NtgBQKZdfUNm2b3iWgrByuKyc8kWRu3WJaK2uNsVtCZ6snSs+SVjcpnEmxgueiNBbKO4+/
	ZFGQDNrgA9JZKrmFauPeMG7DpunMJWBYnRyOqblB1gul5aVWXMiQAn2TeDiD7JfUUK6ztK
	3VMrUAKYBETq6zF4Yy458NIn2PJpVCL78okxTSwqNSxN8J9ks6SWfJGihlI0+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 11:23:41 +0100
Message-Id: <DEVBB0B5IUBK.M8TE96H7MKML@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 10:23:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8248

The following changes since commit b0f5cc276639916df197435780b3e94accd4af41=
:

  migration-guides: add release notes for 4.0.31 (2025-11-14 18:10:02 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 80556704f8b60b5bf903da497909cfda7dd1b28b:

  Add a new "Security" section (2025-12-11 10:52:48 +0100)

----------------------------------------------------------------
Antonin Godard (8):
      dev-manual/temporary-source-code.rst: fix definition of WORKDIR
      overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
      overview-manual/yp-intro.rst: link to YP members and participants
      ref-manual/svg/releases.svg: mark styhead and walnascar EOL
      ref-manual/svg/releases.svg: mark whinlatter as current release
      contributor-guide/submit-changes.rst: remove mention of Upstream-Stat=
us
      Makefile: fix rsvg-convert --format capitalization
      Add a new "Security" section

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.14

 documentation/Makefile                             |   4 +-
 documentation/contributor-guide/submit-changes.rst |   8 +-
 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/security-subjects.rst     | 194 -----------------=
--
 documentation/dev-manual/temporary-source-code.rst |  14 +-
 documentation/index.rst                            |   7 +-
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.3.rst         |   2 +-
 .../migration-guides/release-notes-5.0.14.rst      | 211 +++++++++++++++++=
++++
 documentation/overview-manual/yp-intro.rst         |   9 +-
 documentation/ref-manual/svg/releases.svg          |  16 +-
 documentation/security-reference/index.rst         |  14 ++
 .../reporting-vulnerabilities.rst                  |  85 +++++++++
 documentation/security-reference/security-team.rst | 110 +++++++++++
 14 files changed, 450 insertions(+), 226 deletions(-)
 delete mode 100644 documentation/dev-manual/security-subjects.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.14.rst
 create mode 100644 documentation/security-reference/index.rst
 create mode 100644 documentation/security-reference/reporting-vulnerabilit=
ies.rst
 create mode 100644 documentation/security-reference/security-team.rst

