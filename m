Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E30FC87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 16:09:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.23204.1753459751152758615
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 09:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZO/xYPMe;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sFN6fbHRsYTyAc4f56xcxAX/YN3f1GMXiNXfkhYSbz0=; b=ZO/xYPMe5czWl+IieU7jpPCb28
	bqGzWQzd4Vh1psIMo4/2FMwyV/0be5ID45tfgFN1PJ/a0cqmU7ZKKNBKeDfPcnqWNWkBWiQ6i3k2X
	EFx5nP4aWI+wpiO41Z6MQ8y8eflW5lyRd6Zzvg3l1JNBC3nqO8Z0B/GlvECURnqLdArj17GWKrizQ
	BsAUaXZlRQlK08q2frP0siGMYiueZzMJEuO17I243sqxqCymBGk6WU4UuDeP3hHGV+Pp88GEeuDsP
	6Y/pQtk9hjw73ynJPwaRIOvsK2ayGiQ5Ude3N5nfvyJIQgZ/hzWFkGyHFY1vJi9312W3YjqwwJmaf
	cTwjtvhA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:50868 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ufKyn-00000001kJt-3V8a;
	Fri, 25 Jul 2025 12:09:08 -0400
Date: Fri, 25 Jul 2025 12:09:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] what means PACKAGECONFIG[...] = ",,,"?
In-Reply-To: <8c608b36-f81d-4dfa-b5b3-b75a33f86f19@cherry.de>
Message-ID: <339219b9-4409-e1c2-72ef-30a3aebda49d@crashcourse.ca>
References: <f29a37a8-e752-d173-283b-f0730b8f84b1@crashcourse.ca> <8c608b36-f81d-4dfa-b5b3-b75a33f86f19@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 25 Jul 2025 16:09:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7388

On Fri, 25 Jul 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 7/25/25 2:59 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    i was thinking of improving the documentation for PACKAGECONFIG with
> > a couple better examples, and i noticed this in the OE layer:
> >
> >    recipes-support/icu/icu_77-1.bb:PACKAGECONFIG[make-icudata] = ",,,"
> >
> > i'm not sure what to make of a value assignment of ",,,". so there are
> > null values for the enable option, disable option, build *and* runtime
> > dependencies? what does that mean?
> >
>
> It's a way to impact other parts of the recipe which aren't build
> flags, or build/runtime dependencies. This is typically the case for
> files that should only be installed whenever a config is selected.
>
> For icu, it's entirely bypassing the do_make_icudata (for the target
> recipe) task whenever the option is set. Easier to ask users to set
> PACKAGECONFIG:remove = "make-icudata" than doing
> do_make_icudata:class-target() {:} in a bbappend for example.

  i'm going to have to read that another time or two to really
understand it.

rday

