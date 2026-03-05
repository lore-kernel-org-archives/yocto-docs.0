Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECE7F3D33E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:13:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49576.1772730819641928960
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wv3suWoj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EB92D4E42578;
	Thu,  5 Mar 2026 17:13:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C36245FF89;
	Thu,  5 Mar 2026 17:13:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32719103698B4;
	Thu,  5 Mar 2026 18:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772730817; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wt4grfNRlA56obId8WAiSH0gmWARP5NiBj8V2iPMcU4=;
	b=wv3suWojgdSDlgnsMwH/9rb0/kUxlM8YPNKWXGoNv3zbupy++0b7CiMvKwJ/8hGxBZSy9z
	IfP4tGrAzem6kZqB7nw/rNm0vQeg6cWZZqCLrcsaNMvKl0TK2mcqAosWCEvAnoVnRA+L/3
	nmZDvhSnzA17XiXFSwhkSXJ/Sq6XEwQ0clxkYdUzFmTCBx+kToo+GQQLBk8rZ8ZVHkiLiZ
	/sYuG8Ps+n8l8BPbp87OxAcAbrVcU+3gzk975MOVuUw3PzI+vcqf3T0m/HENRPz7g/3xz4
	yI3ORuF2BMkVHe+BYyELE2u9H2bCP6xdjFDvuZkJpdPOVucR0fRgkZjma/c3DQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 18:13:36 +0100
Message-Id: <DGV0MMM8K0D3.H1ALUGZ8VXKJ@bootlin.com>
Subject: [whinlatter] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:13:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9076

The following changes since commit f34c14ce30d74f2c1fc4d7150d1175a6f911a1a3=
:

  qemu.rst: parsing of the code-block was not done (2026-02-27 09:16:39 +01=
00)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to 82bd1a71e6e6a707d0009725969976cf2256af36:

  overview-manual/concepts: list other possible class directories (2026-03-=
05 13:56:17 +0100)

----------------------------------------------------------------
Kristiyan Chakarov (1):
      overview-manual: escape wildcard in inline markup

Quentin Schulz (1):
      overview-manual/concepts: list other possible class directories

 documentation/overview-manual/concepts.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

