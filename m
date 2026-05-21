Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02F6CD5BB3
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31086.1779347250563140213
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ikr6Jl8B;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0A2D24E42D19
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE3F660495;
	Thu, 21 May 2026 07:07:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 186EF107EA6C7;
	Thu, 21 May 2026 09:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347248; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FcP400zrdOidfUgS+jq7bgYav2n/W+cMjODSc+93gA4=;
	b=ikr6Jl8Bh23aM91htt53iaPb3qQwaxPnr3wci6MuMcs0cNIAF1mZsaI47MZR2j9KnqdiNq
	2zmeKixNQGYp3s1Hca6pSqI6sUzfzQIhbWxezL3SvVow9e1jLPUj1lTspp2/SDSXNCEZ7A
	GjHV0xGodLFWwTqeNMp+QqX86jSRA5g6mmN8/0tb+4EdcKAlvO0MY9IDlq51Nx32zjswkM
	rSzpfaxVDkfejVmLLi77/Sj+HmCGQJ0TGoL+RkL6y68xBxOj+RVbp4CUoh52TBpoINr/Hw
	spYavvYseyNrvaBU5KKUbnjDUGHHzmXyov16V4HUYQfnCqGTzuhwnk9zNlPisg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] YP Quick Build: use "set up" as a verb
Date: Thu, 21 May 2026 09:06:33 +0200
Message-ID: <177934712482.33890.16667980452089028027.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <24bc012b-dc44-ca34-b3d0-b08200bf77d8@crashcourse.ca>
References: <24bc012b-dc44-ca34-b3d0-b08200bf77d8@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9513

Applied, thanks!

[1/1] YP Quick Build: use "set up" as a verb
      commit: e33ead9d20594a348ebce48cfdc4da0fd16f5777

