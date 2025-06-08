Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C5AC5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 12:36:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.36320.1749386171010095623
 for <docs@lists.yoctoproject.org>;
 Sun, 08 Jun 2025 05:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QLsSkZRp;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZXACssTE+lx4drpd7YHF6KOgSIIyrMAhLgMRArrDY1o=; b=QLsSkZRpiFv31xuEgV3nFSRCxu
	hroOLJE+ggyMLfMlC+2mHPSLwoyA/kCRK3Y57hF2oCCmpHeIz9D19nliFTPBxbQWSEyV+32PXZpWh
	lG3Dz8Igt7eBPz1quQ9l90tf3cnjCj1+gcgZdoH/ndCsOQ1ln1UNS6ewyrtliRlvorQtSHsMZWp3Q
	BpIFsHxVGAgPoBT0+YYfoJcp8nqtpagLsarfn62YbPrOtREf97xI3OIo/vOSdmvMYDLmSn1Nr2aUt
	HERKl/3Kfg4yNaq9lbR4OH5sOXGr70/UZUsOis36FPBDyrbnxom4OooYP39aq/WBgivKVLwkz0ukZ
	u7lg0z2A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49368 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uOFFw-0000000441P-00Oi;
	Sun, 08 Jun 2025 08:36:09 -0400
Date: Sun, 8 Jun 2025 08:35:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] BB manual needs to refer to additional "classes-recipe"
 and "classes-global" dirs?
In-Reply-To: <1b626abd-3ce1-48cc-b9e5-7ba03aec0762@cherry.de>
Message-ID: <e8c5fbbf-2f02-e166-8d1f-6ad659b0cc20@crashcourse.ca>
References: <c822a737-732c-1b74-5c2d-5ce8b80b8512@crashcourse.ca> <1b626abd-3ce1-48cc-b9e5-7ba03aec0762@cherry.de>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 08 Jun 2025 12:36:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7033

On Tue, 3 Jun 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/3/25 1:08 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > I note at least a couple places in the BB manual that refer to
> > searching for class files only in the "classes" subdirectory, but no
> > mention about the "classes-global" and "classes-recipe" directories --
> > should those also be mentioned in the BB manual?
> >
>
> I'm not too surprised, the BitBake documentation is typically not
> receiving the same level of interest compared to YP :) (also I'm not
> entirely sure people are aware it exists as I would imagine most
> people are familiar with docs.yoctoproject.org but not
> docs.yoctoproject.org/bitbake for example?
>
> That seems like a reasonable change to make in any case, so patches
> welcome :)

  going through all my outstanding docs questions, and this issue is
problematic in that, technically, the BB manual should stand alone and
not refer "upwards" to build systems like OE-Core, however, bitbake
itself, here, in BB function list_recipes():

https://github.com/openembedded/bitbake/blob/master/lib/bblayers/query.py#L124

clearly hard-codes references to extra class directories
classes-global and classes-recipe, which don't exist in bitbake
itself, so this is obviously(?) a case where bitbake *does* refer
upwards to oe-core.

  is this worth even clarifying in the BB manual? i suspect that the
simplest way to explain it is that, while BB defines only
classes/base.bbclass, its own layers code simply *supports* the
existence of those two additional class subdirectories, and leave it
at that.

  thoughts?

rday

