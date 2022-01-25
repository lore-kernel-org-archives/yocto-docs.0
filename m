Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F04AC433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 22:18:56 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network
 (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web10.4430.1643149133579207311
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jan 2022 14:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=zf+o5sfX;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id c3ecef4e-7e2c-11ec-b0e2-f8db88ea9a09;
	Wed, 26 Jan 2022 06:18:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Fo6GBUi4WxbHRDZ8WvK6PqWb9ZqZZU6IlGxcBOJcBOA=; b=zf+o5sfXVR9ZQJMgeHETfut8a9
	MSMDbt1+m/4n36EOTS/1wiHeXzt4qI3gRNE6tlEzO0ccuV2Hr4+JlQ0J8rDpDqX2DiSujUCIVy3zd
	lQ0ldHsAZE+s/SJF98oLDx6szVduQQPFDADrW8Ia5mV4mWzhprvdvwhAEy3TwUrZJZZ8G21HZIeg6
	nSNutJWIqkvAHUrweb+lbEXL+HC8vy/otKtY80XsL8IRiWtOgukSjbBLMkOUsGxcnCNI7IMsl2+wi
	+Jh+MlV9gsbgPxXoXSeg+Jm+C6RZTACDfKMP6KvvxFtW4uxgRgoy3UN+gROTSwHaYZOZB2yNWgohr
	2+S0QznQ==;
Received: from [151.210.143.188] (port=13404 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1nCU9H-00GpBq-2Q; Wed, 26 Jan 2022 11:18:47 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: add 3.4 and 3.4.1 release notes after
 migration information
Date: Wed, 26 Jan 2022 11:18:46 +1300
Message-ID: <1806445.tdWV9SEqCh@linc>
In-Reply-To: <e47b6364-408f-eafc-2eb3-0610c060d516@bootlin.com>
References: <16CBC19CDCE903A8.406@lists.yoctoproject.org>
 <e47b6364-408f-eafc-2eb3-0610c060d516@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id:
 paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jan 2022 22:18:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2444

Hi Michael

On Thursday, 20 January 2022 08:19:38 NZDT Michael Opdenacker wrote:
> On 1/19/22 8:09 PM, Michael Opdenacker wrote:
> > Only done for release 3.4 and 3.4.1 so far.
> > Release notes are kept under the migration-guides/ directory for
> > the moment, for easier reviewing.
> 
> See the resulting HTML on
> https://bootlin.com/~mike/pub/yocto-project/docs-2021-01-19/migration-guides
> /migration-3.4.html
> 
> I really need your feedback on the way the notes are laid out. This is a
> good time to review what we put in our release notes.

This is a great move. Formatting and links are definitely something I've
struggled without in the release notes and this solves that.
 
>   * Are the repository links really important? Could we simplify them?
>     Could we just have the Poky details and downloads?

I think we'd need more than that, but what is included and what isn't is
definitely debatable. I know we've asked in the past if the tarballs were
useful, I'd be really surprised if anyone needed them now.

>   * Do we really want to have lists of commits? Wouldn't a link to the
>     corresponding git tag be enough? 

This is what we do for minor releases. I think it might be useful to some, 
but you'd probably have to survey our users to really know whether they benefit 
from it. One easy alternative would be to just provide a cgit link e.g. for 
dunfell-23.0.13 :

  https://git.yoctoproject.org/poky/log/?qt=range&q=dunfell-23.0.12..dunfell-23.0.13

>     If so, we may need to add links to
>     them, but that's going to be very verbose in the source code.

If we do continue to do this ideally we would be auto-generating the content
(prior to check-in I mean), so at least it shouldn't be hard to manage.

>   * Are these really notes clear enough and are the main points
>     highlighted well enough?

So we could probably use formatting (e.g. bold) on some of the more key
points /sections of the release notes new feature list. Unfortunately our
project generally isn't that visual so there's not much chance of including
images in the list (unless we go to icons or similar).

One of my go-to examples for documentation that I think looks great is Django -
for their release notes they tend to break it up more into subsections e.g.
 https://docs.djangoproject.com/en/4.0/releases/4.0/
It would be nice to do that at least for major features so we can explain the
benefits of each one in a bit more detail. 

(Honestly though I don't think it's worth spending the effort prettying up
the release notes for older releases, it's more something we can think about
for upcoming ones.)

Cheers,
Paul





