Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFBBCD5BB4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31339.1779347242348258891
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=QINSFUAK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C89F24E42CF7
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93C4260495;
	Thu, 21 May 2026 07:07:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AFF1107EA6C9;
	Thu, 21 May 2026 09:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347240; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iTAgiqheGDoPjf6+g2FyvdDK0JEY1e3faK8ZjNrEdR0=;
	b=QINSFUAKHwOaZJj49tW14UAGvuhWGZTt1K0ce1XBRaNB8FTKJ9Ex1pv7hshl4Q3jnx2m3k
	oPv3W/q/JUW6PT8tH33rqncx0fmJdo/SWltze6XLSTHyfilHVFasmFk+murtFOImLPgTyi
	N+hrZXVIZLNTyiIWGMtmMFkILzmhPl0B6kpERq/B/sDOVPtW/PHthsDsKSSih7n04WmhYN
	v445q3iThMnxdxI7Q6PM1whzxGLrqN9gWvzm1lZkOAmRoMUJnGHm3reypL+4OgGZYGnwVm
	aA7t79jp0068a8zh/KdzrRXWvSS8gPqGqaXo1xZ+mm2f9gEmI8Y9ZUSoBhy6YA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] index.rst: update "Software Overview" to "Technical Overview"
Date: Thu, 21 May 2026 09:06:23 +0200
Message-ID: <177934712444.33890.1737388934412018747.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3697cc94-270c-1950-f801-168877dcd4c6@crashcourse.ca>
References: <3697cc94-270c-1950-f801-168877dcd4c6@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9503

Applied, thanks!

[1/1] index.rst: update "Software Overview" to "Technical Overview"
      commit: 0143b586572e15cac438f0fa6f3c1e7446597020

