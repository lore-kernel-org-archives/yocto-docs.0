Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9899BC43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32884.1782720297418454922
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=S/66jFVD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA4724E40B51
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 901675FF96;
	Mon, 29 Jun 2026 08:04:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 640C0106F1574;
	Mon, 29 Jun 2026 10:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kwd4S1JxF+I8oWkOprz6p7tkkSgIzTwX48urZ572Gkk=;
	b=S/66jFVDr9reaUQIvoUM2hzSxHgJVA5jjQyqniJQO7+08OsihNxfDDiU2mm6hZP3Pq19OY
	18tqjy3bUuOei95v1x8nMIve9svD+ng6aRY+wizPZDD/e+jsWnXY4AZirazL7hWOPu4hhf
	z5ssNOyBMwwWTBd92TfuqmC7tqFpHsa8g1AexzBRzeNMhP7DNaZ8c9JFeFqKqg6GLHv9Hs
	H/IbhiXKwxwwSfIv4KdrLH71PWVwO2EDbRfLXHateqlz1rHfXy8mT6dF+w0kHTKbc+pxiw
	DYMckFpmSd0vEe6bNitppvXRmOWHqPXuUp2VAUbTbVqDLKg1k7uOK4RlpR9n8Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: fully define SOLIBS-related variables in bitbake.conf
Date: Mon, 29 Jun 2026 10:03:06 +0200
Message-ID: <178272012476.45179.3393633236103596458.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cb56b55a-6a0d-754e-a97c-a92c7780ab42@crashcourse.ca>
References: <cb56b55a-6a0d-754e-a97c-a92c7780ab42@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9936

Applied, thanks!

[1/1] dev-manual: fully define SOLIBS-related variables in bitbake.conf
      commit: 6098e0887161ffda87e62dd460702197269d5982

