Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421A0C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:20:06 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8774.1790079602610848886
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 05:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2JLRC10X;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D5285C21A92
	for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:20:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EBEF60580;
	Tue, 22 Sep 2026 12:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5486210329112;
	Tue, 22 Sep 2026 14:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790079595; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PHO5JyMjjOZuGsYRt3dVh8kSpemU3x4kMvc0kRt6B2M=;
	b=2JLRC10XTFEETIjrDSWvP+mQq2dScwFoMq4ckPYNxTGJDvT4AuSVTlvYpwNF8fDrIdnnc0
	0T4Crkiqf1xuUbolz6d8guKtqRb4nTe8faMZS96SPMrhkosbnCUmtD0h60UISp1CFvgdwf
	pZ8jVXoUY0HnaaSLuf706hP3LeaOGfgjBR+R8tR5wcv7O0Dj0RhpATdIKJ+vacP+Y5OjGo
	LOST2UvyrLuF1xEi0L454hxv7PrhWPyIIauKqMb0961UPe2XtIq+okiYoeB2KfVzxyuwt3
	JU6OYYvmW+YzkJcG8aoblmmt3VBHzh0gLrIcEoqAuD2YELX0it8zWEJr3dlhEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 14:19:54 +0200
Message-Id: <DLLU9978XXGA.2BJ84IUFJG04S@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 09/10] ref-manual: drop "partition" as a wic
 kickstart command
References: <20260922020339.481929-1-twoerner@gmail.com>
 <20260922020339.481929-10-twoerner@gmail.com>
In-Reply-To: <20260922020339.481929-10-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:20:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10580

On Tue Sep 22, 2026 at 4:03 AM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
> The kickstart reference documents "partition" as a synonym for "part".
> wic does not accept it: its parser registers only part, bootloader and
> include, so a .wks line beginning "partition" fails with an
> invalid-choice error.
[...]

Applied to master-next, thanks!

Antonin

