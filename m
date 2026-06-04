Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A270CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 10:12:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8001.1780567930592720613
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 03:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NMKEi7E9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6182F4E40589;
	Thu,  4 Jun 2026 10:12:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F60F5FEF7;
	Thu,  4 Jun 2026 10:12:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F6B3106A1703;
	Thu,  4 Jun 2026 12:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780567927; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HNDBDvRw4U91nRbTwsWkS+Y9lWuaBFgRKkfPIeTLAQo=;
	b=NMKEi7E9QMo3B2d9hi9drmaG+j9cRbdgZvsmxRuoHcgiIEfdjaUM1eHQHiiwKADV4GZAxg
	kr5FMLdl0pVrCqMyxUbTkaRGRouOPgMgDZgSyK6RCkWNxbriequpzXHm5dLHWrX22IS+gm
	V9M1nLtedtL6S8EsSPbbahNDr1k1dV/75ZC/kEvxY5LMgofajwptNu98EltoFRH1DWg6EK
	tLsJC1bIPgHutE4plYgmQUbh4P4yvTW5tFZGbyr4YngBiwghgvzRsPJ0ku+LKlysw0mn4W
	nToSxV/ybmPDuqa9VCU941sDMnXCziW45E+n4WXlNugs7kGFJ0TO6qG7hX8w+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 12:12:06 +0200
Message-Id: <DJ06NH3JJUZI.2VWMTDWUU1F4Q@bootlin.com>
Subject: Re: [docs] Overview Manual graphic still uses old "BLACKLIST"
 terminology
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <5d34a080-f180-aca6-45b4-98b399f4e69c@crashcourse.ca>
In-Reply-To: <5d34a080-f180-aca6-45b4-98b399f4e69c@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 10:12:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9579

On Thu Jun 4, 2026 at 11:34 AM CEST, Robert P. J. Day wrote:
>
> here:
>
> https://docs.yoctoproject.org/overview-manual/concepts.html#application-d=
evelopment-sdk
>
> on the LHS, you can see the old "WHITELIST/BLACKLIST" variable names,
> since replaced by (i believe) ESDK_LOCALCONF_{REMOVE,ALLOW}".

Good catch. I'll try to convert this to SVG and update that, thanks.

Antonin

