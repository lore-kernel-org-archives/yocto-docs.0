Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0621FEEC282
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:14:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5451.1771881236176512154
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 13:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=AaW30qrM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=laI+MckKoPxJPTYSlxYGX2ihYPIYVtLLf6op7unrTGI=; b=AaW30qrM/I7CTRLkXmTO/6jFJZ
	2aJPc2GYXDvtz5ASjdOHp+1bIwAnvluG4qxyq7ujaY7HrryczU6dZtiEKDSTmcmWQgXm+41ENGOGn
	s02uAbGFDYZITgAtEeMETTHgw/wz8SZ+9II9LBsjgA8aawXeUYXqsEhRj/pTreGZyVqjXzrhv0Tdg
	htsYDl0TmVSTVJqh5ZoiK8jsnFR+yAO8h8fzO3OTWeVEao4pnEVPIJUIgYBpAeqH6+MJmQaxQruPM
	6lK5RSsgpCgyqZW90cEI60ej3ADJPSuy+CxoF3mu3ym1fA0lAHAP+rGMG3dchkjk7DD5iH+vANNt9
	MPdahYyw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53220 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vudFa-00000000roS-0MAZ;
	Mon, 23 Feb 2026 16:13:54 -0500
Date: Mon, 23 Feb 2026 16:16:10 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alex Kiernan <alex.kiernan@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] difference between RRECOMMENDS and RSUGGESTS?
In-Reply-To: <CAO5Uq5SBWEtnW1svMNDokxUCwG7ft7dcyP87XYHtHTcVqKJLYw@mail.gmail.com>
Message-ID: <22c37f16-7352-9f81-22fa-030a265c3b2e@crashcourse.ca>
References: <5196619c-a6b5-a5a6-42fd-eb78308e8ffc@crashcourse.ca> <CAO5Uq5SBWEtnW1svMNDokxUCwG7ft7dcyP87XYHtHTcVqKJLYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1743186600-1771881373=:2892791"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 21:14:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8959

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1743186600-1771881373=:2892791
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 Feb 2026, Alex Kiernan wrote:

> I'd guess (and I can't pretend to have checked extensively) that it's
> the same as Debian's:
>
> * Recommends: <package list>Lists packages that would be found
> together with this one in all but unusual installations. The package
> maintenance software will warn the user if they install a package
> without those listed in its Recommends field.
> * Suggests: <package list>Lists packages that are related to this one
> and can perhaps enhance its usefulness, but without which installing
> this package is perfectly reasonable.
>
> The default is NO_RECOMMENDATIONS="" so you get RRECOMMENDS, but not
> RSUGGESTS. If you have NO_RECOMMENDATIONS="1" I suspect they're
> basically identical.
>
> On Sun, Feb 22, 2026 at 9:44 PM Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >
> >
> >   the explanation for RSUGGESTS:
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-RSUGGESTS
> >
> > does not seem to explain how it differs from RRECOMMENDS:
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-RRECOMMENDS

  what's missing is how to take advantage of a recipe's RSUGGESTS
setting. unlike with RRECOMMENDS (which is installed by default, and
you have variables to identify what you *don't* want), how does one
use a recipe's RSUGGESTS variable? would i do something like:

  IMAGE_INSTALL:append = "${RSUGGESTS:fubar}"

to get fubar's RUGGESTS? or am i missing something? that should be
explained in the variable reference.

rday
--8323329-1743186600-1771881373=:2892791--

