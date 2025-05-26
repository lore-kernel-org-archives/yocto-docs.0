Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1697CC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:50:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.24235.1748245796974950655
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 00:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RoXlMhkQ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X1bbOiDAuL/6rAWsxZ8197DURBebcm70tSewCJE6R4g=; b=RoXlMhkQDtCLbyyvyTOtfuNIHK
	uAJHzYY20U3ieyloPJkstXUjWB/LaR0OLKfFZeUadrFhI3upbEMcHExspcrEnCmHtXKY8KzL/MFRW
	jFdUqc2a2KiIkPHO6rntZ26U/wPWdcWs1Sin9l8Mccl0zGVL2ey8llci3ySTLHK/qh93ysFW8sBJf
	vy2qNH1UvdTw+iqGJ0mbx4/ax4tSRioVjhnRaYL3yXbjJtvCp9hFQPS2msWTbQchoWSG4o/GXWLn9
	ourEcweZhuwG3exOz1OD6Q2mD1+fn/5eD5hfi0yz7wMRKENdixsRdAP98VoPyZt8pX84hLXkJXrSY
	/R9FcHNA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:57106 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uJSan-00000009NSp-2cQb;
	Mon, 26 May 2025 03:49:55 -0400
Date: Mon, 26 May 2025 03:49:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Pedantic comments on "Yocto Project Quick Build"
In-Reply-To: <DA5X90V9P63G.5D6PCLTT6Y3Z@bootlin.com>
Message-ID: <8e1a92e4-4408-da36-7475-892e842b9b19@crashcourse.ca>
References: <64b9bec1-0aa4-9e4b-06ed-445eda4d60a7@crashcourse.ca> <DA5X90V9P63G.5D6PCLTT6Y3Z@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 07:50:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6911

On Mon, 26 May 2025, Antonin Godard via lists.yoctoproject.org wrote:

> On Sun May 25, 2025 at 4:59 PM CEST, Robert P. J. Day wrote:
> >
> > I was going to submit a patch but I wasn't sure about one or two of
> > the changes so I'll just publish my comments and someone can decide
> > what is worth tweaking and how.
> >
> > All of this is in the secton:
> >
> > https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#compatible-linux-distribution
> >
> > 1) Bullet list has both a first- and second-level bullet point on the
> > same line, because the source file defines an empty top-level list
> > item (first item in the sublist)
>
> We could do with a small sentence like: "The following software version
> requirements:".
>
> > 2) Is Git 1.8.3.1 still supported? Man, that's ancient.
>
> Yes, that's the oldest version supported, see:
> https://git.openembedded.org/openembedded-core/tree/meta/classes-global/sanity.bbclass#n560
>
> > 3) "If your build host does not meet any of these three listed version
> > requirements ..."  There's five version requirements there, not three.
>
> I agree, we can remove "three".
>
> >   That's it for now.
> >
> > rday
>
> Can you send a patch?
>
> Antonin

  I will get to it.

rday

