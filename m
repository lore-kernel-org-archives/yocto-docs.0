Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB017F3D33A
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:13:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49489.1772730818826111836
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=C2+HOB4l;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E2BD01A2CD3
	for <docs@lists.yoctoproject.org>; Thu,  5 Mar 2026 17:13:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B99145FF89;
	Thu,  5 Mar 2026 17:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AC6E1036990A;
	Thu,  5 Mar 2026 18:13:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772730816; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=owMkW8sfcEvM+rfu6Z5iiJE9oENhkEJkBWbbwdy5r+M=;
	b=C2+HOB4lklQjjL8lOfGXB+hqM2BvFWxL7T29OM394mnv8z69/CbGfGMp9rFWgNUJYv8A39
	YOG2/2hKXzK+zUvutVqVaoNjxpRm7ph1BQmQ21egyuLaI+l6ci2SXo6iwWFqmgHdhzksqc
	pO63Y8Qk8MhNTGIj70/Ge3UrBTeS7AR0hyPZJB6ZtQtK5ALWx31v8o3fsWHRa3+C4/nUij
	ddx/OOgQlgfxOxp0s+MJ5COGm22Q0yq2m7c/L/3h8eek/Eqckw3fnkXvQkfWARtSCXETYR
	hcOjBFwcvY5M4+8+co7KlAnKiFOuY3zuhnR8WQaeRDYf63TrCZ+eqkNUD6876Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 18:13:35 +0100
Message-Id: <DGV0MM63YVT4.32QQ9WZME6HQ6@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9074

The following changes since commit e7cbf979deb9739ee4b968672d4b03ae65b24424=
:

  dev-manual: delete references to "tar" package format (2026-02-25 13:13:2=
7 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 2141bc2b04ef4210e008752a97ed82979d817dae:

  overview-manual/concepts: list other possible class directories (2026-03-=
05 18:10:34 +0100)

----------------------------------------------------------------
Antonin Godard (1):
      ref-manual/system-requirements.rst: update end-of-life distros

Kristiyan Chakarov (1):
      overview-manual: escape wildcard in inline markup

Quentin Schulz (1):
      overview-manual/concepts: list other possible class directories

 documentation/overview-manual/concepts.rst       | 5 +++--
 documentation/ref-manual/system-requirements.rst | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

