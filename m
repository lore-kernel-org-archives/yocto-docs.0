Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4F6CD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 15:29:12 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19525.1779463749733889853
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 08:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=W5q98RtL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kxY1uiHFtUjQPqZs6eO8OFSRwpxlTXjRadOlTXqerb8=; b=W5q98RtLFE/VoftKY1JzNUr5i5
	swsa8lONcn6H73GXJQuWwZNHbdmjpWuzxM3GnIz0hDrP2yQ9mCdxfWRaXBN/5d6TeNsT8pz7HasGu
	3JgIBPtzzhFliFqY/mzfr5on+WylRzVWzVcAt7kHfdhpPq8JZ88f7BBGBmFEtwxLDafdXxF04go+5
	bjA1y16HQIjWG/v1WXrcqJyg4NBpE7HA05JRj0PRAT1TSsH0ekfJGW6a7MzOpWxE9GMWTD5j2Hh1G
	DBsoZLb9z6MAhVDj+ujR7OBBQmV7y9T+s0shtkc4jnMvOms2mxlR4DdqdZiMuLK/SrnTSFhH0vhv2
	Bzx0ULtQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54510 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQRoA-00000005i3F-12Ug;
	Fri, 22 May 2026 11:29:07 -0400
Date: Fri, 22 May 2026 11:32:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "PACKAGE_EXCLUDE" still claims it is not supported by
 DEB packaging
In-Reply-To: <DIPA9GYROE7D.19Q8B1ITSU2U4@bootlin.com>
Message-ID: <1ffded01-749c-1b1a-4b30-dd0a4940b357@crashcourse.ca>
References: <e764d11e-104c-42f6-6ce4-3cba46b59bcb@crashcourse.ca> <DIPA9GYROE7D.19Q8B1ITSU2U4@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 15:29:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9525

On Fri, 22 May 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Tue May 19, 2026 at 6:09 PM CEST, Robert P. J. Day wrote:
> >
> > here:
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE
> >
> > one reads:
> >
> > "This variable is supported only when using the IPK and RPM packaging
> > backends. DEB is not supported."
> >
> > i just tried it with DEB packaging and it seems to work fine, and i
> > don't see anywhere in the OE-Core Git log where this support was
> > added.
> >
> >   can someone clarify this?
>
> Actually, you did already, with
> 0d05dedd62a6d4c726f120a23654ede1f0b23d8e. This claim was removed
> from BAD_RECOMMENDATIONS but not here. Could you send a patch? And
> see if there are other places where this is stated?

  my fault that, when i submitted that earlier patch, i didn't check
more thoroughly for other similar claims. but since i'm playing with
claude right now, i asked claude to do the work and asked it to search
the entire yocto-docs checkout for such claims, and it found only that
one, so i'll submit another patch for that.

  i'm definitely appreciating the value of claude.

rday

