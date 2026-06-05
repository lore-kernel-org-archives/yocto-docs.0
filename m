Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0C5CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:04:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8841.1780668243345914495
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 07:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yuZ6CYIv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 31E784E40889;
	Fri,  5 Jun 2026 14:04:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB0F95FF0B;
	Fri,  5 Jun 2026 14:04:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73388106A245D;
	Fri,  5 Jun 2026 16:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780668240; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ijX6E4ZL1vqXzBEDmpr8FDqslR9Bu3KLrk7gtFj4Kx0=;
	b=yuZ6CYIvAjSJ+iLrEIpPUd0vaZIYFZIzXrdz9JZPFkYMR3r5Pe/oa3iZRVVyco/TtqzADv
	m4DQUDOG0tEX/P6gsnGJ+n2ffg9G4Llc6z7YG4WPrMRDnn0KkYQKEG6fEY3AtdB6YGHXKJ
	fL23vLfYBqq+1fZmJjmbwVfYsYq6c7i8KGTu01PxffYk5ATqJqDeCjVQ3La4Y9dQ/YHQYp
	SZHWYvA7UkXhDvOW+oU1EbgVDWU5pU47EIJkQLHL9A2qkgIzSWGw/ko4mgCe7cJeEqAVEM
	Oic7OvgpFYOekUc16V398m+f5NBcP3IdGC68LWyoevbEbYfeyPXY1GT1ZvC98w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 16:03:58 +0200
Message-Id: <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>
Subject: Re: [docs] "Required Variables" aren't really "required"
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>
In-Reply-To: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 14:04:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9605

On Fri Jun 5, 2026 at 1:40 PM CEST, Robert P. J. Day wrote:
>
> here:
>
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#r=
equired-variables
>
> the section "Required Variables" goes on to say that four variables
> "should" be included in all recipes ("should" does not equal "must"),
> but a quick test build showed that none of those four variables seemed
> to be required for successful parsing -- only a missing "LICENSE"
> triggered a parse error during my testing.

What do you suggest as an alternative word for "Required"?

Antonin

