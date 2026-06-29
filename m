Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F773C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32905.1782720331551475350
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ML6aLNHV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0BFC4E40B5C
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7E0B5FF96;
	Mon, 29 Jun 2026 08:05:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05AD3106F157F;
	Mon, 29 Jun 2026 10:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720328; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MIa9mQ/NPhcy71g7IIPKmNW8/Nug109p0vobPk6xydE=;
	b=ML6aLNHVKQ1i0wDTdSr3AoCp6/P2eU5h85gkGBttKVfbDK7GxRq4n9d1RRGGi80SQUA/Nm
	oYo9r8ZUxFsTzeS+/nxv7gkKxQZOx1Eu1KZEo7cT7ZvicKQDEtm6gYhCsn558SkjqXM2Z/
	xIdCgW/5pWWs9xAhEtwP7piiz/ucRGK6HTKzIHH8ahhsKjESywFy8ZISoJ27qgfkqtsxFo
	Dnu+kJpe+rU0xamezJ6PZvIqtEh4z9Iu+1lSdjqd5LOXKM81CBzQA62yzNaBhJwJ+DpbYz
	l125HErFWAup6Rz1uNPtgfQwNkxgO6pwr0fQAyl6/Czeqk7vSqh60+GO2Pr0cg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3] test-manual: add more detail to the ptest section
Date: Mon, 29 Jun 2026 10:03:31 +0200
Message-ID: <178272012543.45179.3948398710185947814.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aeeae320-420b-da54-3e24-3fcebf48cad5@crashcourse.ca>
References: <aeeae320-420b-da54-3e24-3fcebf48cad5@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9961

Applied, thanks!

[1/1] test-manual: add more detail to the ptest section
      commit: 32a3fa53d27b3a4ce307d3ab895981e3f892edf2

