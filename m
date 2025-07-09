Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC95C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:53:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.4963.1752087207960709638
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 11:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=liUABADk;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Mz9YEItIt92tP9oB8N6y7LFj7seM3PPuSmazkvaHUcc=; b=liUABADkG1iHhAv38sbIUEw5xD
	CAtlCReK7Z12fnL4eShojL+AsYxfxxBIjJDft4IeY0CudcrNRZNSvfP3YyzMNQjwMXjFwqx3Ph1fx
	jilXVratTtgq3iptVj/XJIhp+bJZ7irFWeJ79mXeNdiDYK4MpvYQ3yuDRv9ahElWOEjjzKYi9yOsu
	KNO/o/ExMqU+lV9YprYXaGMtFyV4vibPruAtS6eQxdTPAeWqaJOWbRl/sjH/kjucJmGgFQl+59avm
	w+EkfNMxltQbUqusOLAUbrihm42vPNjpY2TipaGeqn0Nqxbjq3xRXfqZ7QgI3xO9EhjQzPjTh8zQE
	LwmIB5TA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46348 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZZv1-0000000Bea6-2rGg;
	Wed, 09 Jul 2025 14:53:26 -0400
Date: Wed, 9 Jul 2025 14:53:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] now i'm confused about OVERRIDES
In-Reply-To: <85161775-f95d-4de8-8241-414c4281e48f@gmail.com>
Message-ID: <f73a4832-674e-5f16-1c8d-f86102bcde55@crashcourse.ca>
References: <164f071c-7019-7d77-c49a-f0ba3e87c502@crashcourse.ca> <85161775-f95d-4de8-8241-414c4281e48f@gmail.com>
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
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 18:53:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7306

On Wed, 9 Jul 2025, Khem Raj wrote:

>
>
> On 7/9/25 5:42 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    i'm reading the BB manual here:
> >
> > https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#examples
> >
> > and, first, i think OVERRIDES are complex enough to need an entire
> > section all to themselves, to be explained in detail with actual
> > examples ripped from the OE code base. but here's the confusion.
> >
> >    i distinctly recall a while back that i asked about the (possibly
> > misleading) differences between these two statements:
> >
> >    A:foo:append
> >    A:append:foo
> >
> > and i was sure that the consensus was that the "proper" syntax was:
> >
> >    A:append:foo
> >
> > that is, it was extremely unlikely that the developer really meant to
> > use:
> >
> >    A:foo:append
> >
> > even though, in most cases, those statements would have the same
> > ultimate effect, they could potentially behave differently.
> >
> >    so the "proper" form seems to be the preferred form, except for this
> > pile of assignments to RDEPENDS in the meta-raspberrypi layer:
> >
> > https://git.yoctoproject.org/meta-raspberrypi/tree/recipes-kernel/linux/linux-raspberrypi_6.12.bb
> >
> > is that syntax deliberate in the sense that it *had* to be done that
> > way?
>
> this is seemingly a bug there.

  a bug in what way? syntactically, those lines seem to be valid, but
my understanding is that you really need some sort of rationale to
justify having written those lines that way, so differently from the
normal way of writing them.

  can you elaborate?

rday

