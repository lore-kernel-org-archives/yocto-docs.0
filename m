Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FA3C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:55:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.7470.1748944538828190678
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 02:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Dp7GPVGJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=esMi1tH5k1R+HxxYOkkiICHVqBOXLGphovsHyoQWudw=; b=Dp7GPVGJeqZWG1EOmdfSMwMg2J
	BYmSIurxZnyxgadEsTYapyPITArD6sdgJaOWwZ6dE4PE1k6prVBBQqkZOqu+b/1sK74G+biBlVc7H
	G8dlGxa3gWOUBvnScYhTtYu4RylR/OV3mPMcFz3KAxogR4VlDM+6LeuUR0w6tajaBPGuZFJ6/yDGC
	9pdG394IYhWFUdlS8VyAiuuKg84jP3XmzupUetakJUB4xF2c8l5QMxrDmKjpSBJ5sKJWmrpi/AvJI
	bAZfv6apxV7ddjkk0s9LGcAa7kpS14vJO1Jz4DG1whqrHPdJ1ePlBSBId+ITo4Wj4bX1N0yG076Yk
	E+ofHw+g==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:45020 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uMOMa-00000002njx-0vzP;
	Tue, 03 Jun 2025 05:55:29 -0400
Date: Tue, 3 Jun 2025 05:55:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] YP ref manual variable glossary: should entries link to
 themselves?
In-Reply-To: <3b7f80ec-9a9c-4eee-94bb-bec3a16041e7@cherry.de>
Message-ID: <8d75dd11-f16b-8b8a-925f-4a0aeb612fd9@crashcourse.ca>
References: <4a204afe-d1d7-eb97-8c57-6eee390e8afa@crashcourse.ca> <3b7f80ec-9a9c-4eee-94bb-bec3a16041e7@cherry.de>
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
 <docs@lists.yoctoproject.org>; Tue, 03 Jun 2025 09:55:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6986

On Tue, 3 Jun 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/3/25 10:05 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    wildly nitpicky here but in the YP variable glossary:
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#
> >
> > it seems weird when a glossary entry has a link to itself. example:
> > ALTERNATIVE_LINK_NAME:
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-ALTERNATIVE_LINK_NAME
> >
> > whose description contains a self-referential link. doesn't hurt, of
> > course, but it kind of fakes someone out if they see a link and think,
> > "hey, i'll follow that link to get more explanation," and they end up
> > right where they are.
> >
>
> It's odd but I personally like it this way. For two reasons:
>
> - consistency, every BitBake variable that still exists today should have a
> reference. This makes reviewing easier: "is this a BitBake variable that is
> documented? then use a link for each occurrence of it" and "mmm this isn't a
> link, does the variable exist? Is it documented yet? if not, then we should
> document it"
>
> - renames of variables are "enforced" by Sphinx as non-existing terms are
> (should at least, haven't checked in a while) failing the build. So if you do
> a partial rename, it'll complain about it and we'll know early enough to catch
> it :)
>
> The description for each entry in the glossary aren't typically that long so I
> hope the reader doesn't forget the variable name they are reading the
> description for :)

  you are entirely correct and i did warn you i was being wildly
nitpicky.

rday

