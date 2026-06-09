Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6DACD98C6
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73972.1780990128607733521
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=eNFcBbKC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2658D1A37F5
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF9945FFC1;
	Tue,  9 Jun 2026 07:28:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C78A8106A2ABA;
	Tue,  9 Jun 2026 09:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=meMMpUA5SpcGEh4flH+rjGEZ8sKax4ToPtG387AZgRI=;
	b=eNFcBbKCS6Bq28EyXyflgmE9JnvoAhmGBwakfKIBKjE3kjivkpCf/PhJvRqdB/igFJmWva
	v+SSzCZ7/cUNnE1iPLfGHVHbXlaLN16yZ58naebXSIcwSAWEE0ZodoEoVR9mdNLlHJtD69
	bI7tSvmX+OFpsMD9B2WnAzhLjWzarU1pQW2hClt7VuVeTFwLpaYAvE13TD927q6oj1Oz7H
	oZ3lytNrnnDLEfSTdsFuYLVyZUReGkBhbVIsiGx/eC3kM3FyBjeXohAFzVI3dnj4lf4JmL
	aQzTsZ7JrL/QnMqoz6j3RoJ+FD9BaqxN0TWuBZIuVGxgyhT+PGidk6froJ/o8A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: update deploy.bbclass snippet
Date: Tue,  9 Jun 2026 09:27:17 +0200
Message-ID: <178099000179.200930.568395107077539331.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <bb559e86-8f2b-03cf-cd87-4992e9f38a7a@crashcourse.ca>
References: <bb559e86-8f2b-03cf-cd87-4992e9f38a7a@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9652

Applied, thanks!

[1/1] overview-manual: update deploy.bbclass snippet
      commit: aec2a39ea648694bb5a30da216b721018e8bb670

