Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0837D41C1B
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 10:23:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6357.1765448625207427759
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 02:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cQ0V8rP/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12500C19347;
	Thu, 11 Dec 2025 10:23:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12EE26068C;
	Thu, 11 Dec 2025 10:23:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7E46103C8D53;
	Thu, 11 Dec 2025 11:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765448622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GeHh+v6y1OjyPM0yf7zg5Y+TDjKslRfzAI3XHnOqkfM=;
	b=cQ0V8rP/zkCci8AIXPpesaev/elItRffjFdwXcQ48Gd1pEA+ppYzs+/FSpzmyb5MuTAj2x
	s5G+QEnKUAMmLQrhGr1asp4dXnIPAl7FmCBfSPSiTrsmKIAu31Wdaa8jx6eFgLGdkKjyy4
	vbtNxVpRlhFcs6fUpx+nFQnE/Y7ZtuHRoKcFQTjWqSkRaFSnC0MqrkZmq5RtM2BQ4YW8NZ
	XVLp2Iv1utTyxp2GLOvd6dL+03FeUmT3Oiswun1hyRQ0vtZxrqWqh7f/lVmpxTDDi15EQF
	AAzlr/RjGfnC9zHjCFWh8BsEUO2s9CCtp91ZDFbXpX5gCKJ1KkptdSMQPCgGUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 11:23:41 +0100
Message-Id: <DEVBB07A2USY.1ZCTGX54FF791@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 10:23:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8249

The following changes since commit 4b9df539fa06fb19ed8b51ef2d46e5c56779de81=
:

  migration-guides: add release notes for 4.0.31 (2025-11-14 18:10:02 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 3fd0f37d708d88534dd6dbb51dc264911c349352:

  Add a new "Security" section (2025-12-11 10:53:31 +0100)

----------------------------------------------------------------
Antonin Godard (5):
      overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
      overview-manual/yp-intro.rst: link to YP members and participants
      ref-manual/svg/releases.svg: mark styhead and walnascar EOL
      ref-manual/svg/releases.svg: mark whinlatter as current release
      Add a new "Security" section

 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/security-subjects.rst     | 194 -----------------=
----
 documentation/index.rst                            |   7 +-
 documentation/overview-manual/yp-intro.rst         |   9 +-
 documentation/ref-manual/svg/releases.svg          |  16 +-
 documentation/security-reference/index.rst         |  14 ++
 .../reporting-vulnerabilities.rst                  |  85 +++++++++
 documentation/security-reference/security-team.rst | 110 ++++++++++++
 8 files changed, 227 insertions(+), 209 deletions(-)
 delete mode 100644 documentation/dev-manual/security-subjects.rst
 create mode 100644 documentation/security-reference/index.rst
 create mode 100644 documentation/security-reference/reporting-vulnerabilit=
ies.rst
 create mode 100644 documentation/security-reference/security-team.rst

