Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19376.1794316219694768124
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 05:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=TEo3Qqkz;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=hZZfXsDk8Hu9HZnN8ct5m4T/z6077qZdadEyrWaH2Qs=; b=T
	Eo3Qqkz8DGJlvM7e0nz8r1VvxrMWjsCo9fMrK1AyPaTopcqDV2Yc6MAg8e17ofCTlBsIi5WuCvM8N
	i1qQAGwt+U8M9zVcxMTR9xXLDwCg+U9yg8QsIXnE8WZThCVcGVFUuDKLsGmyGN7K+R/3x1WShBXtC
	bv6zeMsZu6r5Fr9qnNTzufohq2J2i3e+/AeI3z7X0/mu3T8xjwu4P6JmrLM5wjbFWtTJPFKSTBelb
	6au+5J17IsmPy3EnGAoz+yL+ExOWAIdGUdAh2LD2X3X6VdCgO5AtdOO6ELspLxX4m7P5dOixceyhw
	XQBFgPt5cyyVDM1l+MHxMX8OOO5CkWvFg==;
Received: from pool-174-114-108-188.cpe.net.cable.rogers.com ([174.114.108.188]:33596 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xQlc9-0000000DdDf-168z;
	Tue, 10 Nov 2026 08:10:18 -0500
Date: Tue, 10 Nov 2026 08:09:04 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] i don't see my Oct 1 patch to add Wic as a term
In-Reply-To: <DMRJOCCCGZT1.1FM0B0CTP4902@bootlin.com>
Message-ID: <e059bd28-c55d-2e0b-ad19-b2a13c1df4e6@crashcourse.ca>
References: <84f94b21-5909-704a-b3c6-52b474ff3ff7@crashcourse.ca> <DMRJOCCCGZT1.1FM0B0CTP4902@bootlin.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 10 Nov 2026 13:10:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10787

On Tue, 10 Nov 2026, Antonin Godard wrote:

> On Tue Nov 10, 2026 at 11:44 AM CET, Robert P. J. Day wrote:
> >
> >   several weeks ago, i submitted a patch to add the "Wic" term to the
> > ref manual list of terms, and it was signed off:
> >
> >   commit 05c97b48227f0e50d008d078b224aa537c06aada
> >   Author: Robert P. J. Day <rpjday@crashcourse.ca>
> >   Date:   Thu Oct 1 06:51:58 2026 -0400
> >
> >     ref-manual: add a terms entry for Wic
> >
> >     Add a short entry for Wic to the reference manual in order to later
> >     refer to it from other places in the docs.
> >
> >     Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >     Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> >
> > but i just checked and don't see it in the official docs (should be
> > right after "Upstream")
> >
> > https://docs.yoctoproject.org/ref-manual/terms.html#term-Upstream
> >
> >   i can see that commit in the master branch. am i missing something?
>
> This patch was not backported to Blacksail as I didn't think there was a strong
> need for a backport here.
>
> You can see the term on the dev version here:
> https://docs.yoctoproject.org/dev/ref-manual/terms.html#term-Wic
>
> This will display on the default page when Garburn releases.

  ah, got it, i've been out of touch for a few weeks, trying to get
back into it.  this brings me to my next question -- the whole point
of adding that Wic term entry was to allow references to "Wic" from
elsewhere; for example, here:

https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-IMAGE_BOOT_FILES

where you can see, in the first sentence, an obvious candidate for a
term link:

"A space-separated list of files installed into the boot partition
when preparing an image using the Wic tool ..."
                                  ^^^

but once you do that, is it standard practice to introduce the same
reference *everywhere* in that same section (where "Wic" occurs a
couple more times)? or is adding the reference only the first time
in a single section considered sufficient?

rday


