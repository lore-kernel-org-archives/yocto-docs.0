Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22683CD98C7
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 10:43:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126730.1781520198621582592
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 03:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=T7fj1MmQ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VQSSlbdmubV/ZdIW6nrcAgvPUadygaML8RvAENP7snQ=; b=T7fj1MmQzUCXr2gx6LX8ccejok
	pUHgfxkOb/KIBxLkaYn93Ja/rkW8VM/AoI5woGMCWlKvfjXZT2OPTvRqxnuAqhqHhrJjb1pNs9YyJ
	c0AqXc7wptKDpatrCY7J26XB1f0Z6g7x41dNk9lyoDvINcKAu/kMP0gmt0pIL2NxYzlZtUkaVW9Na
	zyKk2Qsbg6KPQ1Y0lKYbKGJP5iOi0BLnUQNcBylbEa+sghdzkb+4lTgIpr3josPnC3qsDbl5UgEhc
	CS9E1Rft9HOpb2iGxVf+aejQCHCAEgBqDDijuPTPh4R2PGPjbJYhJD7RwpDNgt8GBFLyPtKo1QhG9
	+DiH1TNg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:57044 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZ4mh-000000046DE-25YY;
	Mon, 15 Jun 2026 06:43:16 -0400
Date: Mon, 15 Jun 2026 06:43:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Paul Barker <paul@pbarker.dev>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] kernel-dev: add anonymous hyperlinks for "LTSI"
 acronym
In-Reply-To: <f3aa7c6bb63cd9916381b368b4673d0d1785a381.camel@pbarker.dev>
Message-ID: <9d0db90f-6b4c-6eae-6ae4-6c828878c428@crashcourse.ca>
References: <16a55764-9ceb-5638-53e0-59eff365a7fd@crashcourse.ca>  <69aa94d76c521ccab58336b5ca5b953253cbb6d2.camel@pbarker.dev>  <ac0c40fa-bfdf-40f6-9825-d9723a337524@crashcourse.ca> <f3aa7c6bb63cd9916381b368b4673d0d1785a381.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 10:43:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9722

On Mon, 15 Jun 2026, Paul Barker wrote:

> On Mon, 2026-06-15 at 06:13 -0400, Robert P. J. Day wrote:
> > On Mon, 15 Jun 2026, Paul Barker wrote:
> >
> > > On Mon, 2026-06-15 at 05:18 -0400, Robert P. J. Day wrote:
> > > > Link to Linux Foundation LTSI page from "LTSI" references.
> > >
> > > The last LTSI release was in 2018, it's ancient history at this point.
> > > Better to remove references to it from the docs.
> > >
> > > The closest current equivalent is the CIP Project [1].
> > >
> > > [1]: https://cip-project.org
> >
> >   OK, i don't know enough about that to intelligently adjust the docs,
> > so i'll let someone else decide on any updating there.
>
> Hi Robert,
>
> Simply finding and removing references to LTSI would be great.

  ok, easy enough, i wasn't sure if you were suggesting adding any
pointers to CIP Project. that can always be added later if
appropriate.

rday

