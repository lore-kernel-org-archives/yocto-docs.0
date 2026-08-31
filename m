Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8F2C61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 10:26:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26537.1788172001188993373
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 03:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2tHOl0pF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F6F61A18F2;
	Mon, 31 Aug 2026 10:26:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1411460231;
	Mon, 31 Aug 2026 10:26:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBEC511C78B34;
	Mon, 31 Aug 2026 12:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788171994; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zAiE25VKcLCGCGuL4pDqeYcLDaHAQ2Qh/0VEKJqaPWI=;
	b=2tHOl0pF2QoXNlVOEc7AuobsYrxQlGwsSwwfXFEdDzUGjTUZdQWlVTquL2S0mOFa7C5nmx
	xM4Fh0xnQu63B6iS9eZWNHbOaVtPUHZKxogGS7yzGdUP1l7ySMbzpeej0ehWbMDGYa5V3O
	uAicbXIaaVc+yYjihXkXfYrdbLrNLWrCF8rH1yyAHuhCrAM9nYS8V2F/MiMBc0LTVAQb+A
	Lh71E++LRM7zgZc+kSWQ6H7/uAqRxcpPKSnRbA1VyrxKVwrFLsDpNbNbbwj4WvnSBqwTMQ
	oCI3la8StoTRPJEYKRc65aQrLbLIa3rbHJ2owJv2YNaHLKtcfi5DVntmHK+H+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 12:26:33 +0200
Message-Id: <DL322H0N4CF5.IO2KG3IOZPKD@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <jose.quaresma@oss.qualcomm.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ccache
 in distros
References: <20260831095856.2298-1-jose.quaresma@oss.qualcomm.com>
In-Reply-To: <20260831095856.2298-1-jose.quaresma@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 10:26:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10419

Hi,

On Mon Aug 31, 2026 at 11:58 AM CEST, Jose Quaresma via lists.yoctoproject.=
org wrote:
> Looking at the Yocto docs, ccache is missing on Debian/Ubuntu
> and OpenSUSE but is in all the others.
>
> The ccache can improve significantly the builds speeds when we can't
> take advantage of the bitbake sstate cache, in such scenario we need
> o compile the code. The cache storage needs to be available from the
> previous builds so we need to store these ccache artifacts temporary
> on our permanent storage.
>
> The ccache is required to build "-native" packages in oe-core
> because it requires HOSTTOOLS +=3D "ccache".

Thanks for the patch. Actually, it makes me wonder if we should rather do t=
he
opposite and remove this for all distros, as this doesn't sound like a host
"requirement" to me.

Antonin

