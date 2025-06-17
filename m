Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F262C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 15:31:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.22222.1750174308471310738
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 08:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RqfRTBjA;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OK/vJTsJg11t3UiS6LHNhy04ies/wcHDGFPIbBLE0zk=; b=RqfRTBjA7VPJn7Gr0zgTWb80t/
	KnsUMTcWEjE/GfDLn03zuGNBgsTrAY0FLNQvK1dHZUM39w+9VK9/g/cILVhbTaTUF99jaa1OLTZ/5
	nKGwJC7vAklOkuCGK/35ruQqQqF10p4b8nSzXhQFONlunqC/e6nNM1h3/1CZUkuYJNk4vcyrBsUhM
	y0fYxMIAL6BWkskvM/X4RsUARTJwUw2RmfSbfMpmHlDKjsmEx56iCwRzBtDAzGrqY2isVNNblgI0v
	omceB6kSmb1J0OHKK28xl0Fyi/OWuDAFgz/tSMTTKgjKX8lM2HEd77oWO4CByCBZ31KU3adve30EH
	m6WjwOUA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:43022 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRYHq-00000000QIS-2Bcp;
	Tue, 17 Jun 2025 11:31:47 -0400
Date: Tue, 17 Jun 2025 11:31:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: antonin.godard@bootlin.com, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] bsp-guide: shorten contents of meta-raspberrypi
 layer
In-Reply-To: <8836af50-f14c-46ca-b2b4-4f75b41cac5b@cherry.de>
Message-ID: <a6c1d0d1-37e1-18ca-e654-138e77b1dc86@crashcourse.ca>
References: <77b2c035-7eec-2c34-e433-55d0e713234c@crashcourse.ca> <DAOSRZNTWZPG.39BPC2BOM11M2@bootlin.com> <8836af50-f14c-46ca-b2b4-4f75b41cac5b@cherry.de>
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
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 15:31:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7086

On Tue, 17 Jun 2025, Quentin Schulz wrote:

> Hi all,
>
> On 6/17/25 2:12 PM, Antonin Godard via lists.yoctoproject.org wrote:
> > Hi,
> >
> > On Tue Jun 17, 2025 at 11:52 AM CEST, Robert P. J. Day wrote:
> > >
> > > It seems overly verbose to list the entire contents of the
> > > meta-raspberrypi layer, so this replaces all of that output with a
> > > shortened version displaying only the more top-level directories,
> > > which still gives the reader a good idea of the overall structure of a
> > > BSP layer.
> > >
> > > If the reader wants more detail, they're free to check out the layer
> > > itself.
> > >
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > >
> > > ---
> > >
> > > diff --git a/documentation/bsp-guide/bsp.rst
> > > b/documentation/bsp-guide/bsp.rst
> > > index 35972f172..97c9c1bf2 100644
> > > --- a/documentation/bsp-guide/bsp.rst
> > > +++ b/documentation/bsp-guide/bsp.rst
> > > @@ -288,163 +288,82 @@ individual BSPs could differ. ::
> > >      meta-bsp_root_name/recipes-graphics/*
> > >      meta-bsp_root_name/recipes-kernel/linux/linux-yocto_kernel_rev.bbappend
> > >
> > > -Below is an example of the Raspberry Pi BSP layer that is available from
> > > -the :yocto_git:`Source Repositories <>`:
> > > +Below is the abbreviated content of the higher levels of the
> > > +``meta-raspberrypi`` BSP layer that is available from the
> > > +:yocto_git:`Source Repositories <>`:
> > >
> > >   .. code-block:: none
> > >
     ... BIG  snip ...

> > Code blocks need to be indented with three spaces (here two).
> >
> > I think it would be good to keep at least one directory showing the
> > structure
> > for a recipe (the bb file, a patch, etc), like python-rtimu in the previous
> > code
> > block for example.
> >
>
> Not sure it actually helps. I can understand it's unnecessarily verbose, but
> does the information still makes sense with only a 2-level deep `tree` output?
>
> Another way could be to only print files and not directories, a few lines
> would be gone for sure.
>
> Something like
>
> find -type f
>
> maybe?
>
> Also, we probably don't need the root files, nor the docs/ directory?
>
> We can replace filepaths where multiple files ends with the same extension
> (e.g. .patch) with one entry with a glob path for example (like *.patch).

  i didn't mean for this to be such an issue, it just seemed like
there was an awful lot of content for ... well, what exactly is all
that content supposed to *explaining*? that is, what is its purpose in
the context of a BSP guide? clarifyng that might be useful.

rday

