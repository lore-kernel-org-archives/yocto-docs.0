Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534B0CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 10:18:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36570.1792059507581763579
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 03:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YTzegSzZ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=uSPCQ5XxyfUK4m0PAKzRGg3A+x3ZQGH/4RENd+GuSog=; b=Y
	TzegSzZN4zTUS4v6IpILkALQrdQ4KgEx8Cqf9UVAEnRUijVrthJhO3ONQasAO1tRhs9aylkZzSFHQ
	X1wX9CTui1mKVNGYd3z8IZtQ3PdtTVg3lmbYHoYmBL3+B9qnLpDmA2JC1oeoBF+vxGUA8ZgT3D7nB
	HGjGRZeDUiZdWJb56yFTLIHd2ZwCSe7N3ZIXEnpneLmYgcaH5VZFXq0mOF1mwL0CN8F03XFTop8zr
	TsqZ1ahZ1/Xc9rtp5O0o+xKZNYS7/2f4Iq08RVFAc/SyAsTNIe7SxYedqJtgMljfFF4gY6m4Zg6ir
	icpbEgFrn8xanx976dzNJuKckSS07onpQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:57506 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xHIXY-000000010dj-1xHl;
	Thu, 15 Oct 2026 06:18:26 -0400
Date: Thu, 15 Oct 2026 06:15:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add a terms entry for Wic
In-Reply-To: <DM5BMT79952L.281463MGN52YL@bootlin.com>
Message-ID: <e475bacc-acbe-c498-e110-cd1d3384d57e@crashcourse.ca>
References: <37230285-e554-fadb-1b33-b5748362f710@crashcourse.ca> <DM5BMT79952L.281463MGN52YL@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 10:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10675

On Thu, 15 Oct 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Thu Oct 1, 2026 at 12:51 PM CEST, Robert P. J. Day wrote:
> >
> > Add a short entry for Wic to the reference manual in order to later
> > refer to it from other places in the docs.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> Looks good, thanks! Could you follow-up with a patch that replaces wic
> occurrences in the docs by this term?

  will do.

rday

