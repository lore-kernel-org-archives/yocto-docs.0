Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2524BC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:03:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.1951.1753383778374922445
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 12:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=MG2w3TuS;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qEAytFV8XE8AokTrokHyhM/d0DXT5Umrbw1uQFV5gc8=; b=MG2w3TuSSpiUQBCjCcK+CMEgGj
	15zH4SaxX2HhocYMwjjJ4CdPovomkHXEX+Tzll9ZK0pfALgsoHi+ZOq0ZkfWHWTU0hB2Ck53FKmVh
	0pMqoNG4e4XGzwVK36uRTsnvmzbDva1YTwyR9a0VMgyqaHV1E7H40AupkbRMJ1yHw49vSxFjBy9dn
	Qqz94hKJhIm6KaW9aCaKp+POxvE2qF6t6HIm7ZU7ykH4J73p2G2t5oPQw8EcBTNingZfimcXEXWoR
	lubMaL22vZK0a3oQxCQUIlR4UHXZmZw7GiBePQqLZcMPsRNNADrPYXkWvYJttb5SipvCbxzwKnJ9f
	w/k3/PsQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:44454 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uf1DR-0000000Er6N-39zr;
	Thu, 24 Jul 2025 15:02:57 -0400
Date: Thu, 24 Jul 2025 15:02:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] want to clarify a few things about OVERRIDES
In-Reply-To: <b1d587c7-8b54-4e49-84a2-0ae23378bb2c@cherry.de>
Message-ID: <ccf6bd85-9c7a-0ed4-87f3-fc227e01bb24@crashcourse.ca>
References: <d6138660-ae8e-f8df-f8d0-994f1011564d@crashcourse.ca> <b1d587c7-8b54-4e49-84a2-0ae23378bb2c@cherry.de>
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
 <docs@lists.yoctoproject.org>; Thu, 24 Jul 2025 19:03:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7378


(sometimes, i think it's just easier to stay slightly confused about
some stuff and accept that i don't completely understand it. :-)

On Thu, 24 Jul 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 7/24/25 5:20 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    i think the explanation of overrides in the docs could use some
> > tweaking so a few questions and nitpicks.
> >
> >    using "qemuarm64" as my example, i can see the OVERRIDES that are
> > set via "bitbake -e perf" for the perf recipe (broken over two lines
>
> bitbake-getvar -r perf OVERRIDES
>
> for the cool kidz on the block ;)

  i know, i was just being old school.

> > OVERRIDES="linux:aarch64:pn-perf:layer-core:qemuall:aarch64:
> >    qemuarm64:poky:class-target:toolchain-gcc:libc-glibc:forcevariable"
> >
> > so far, so good.
> >
> >    my first observation is that, when an override is combined with
> > "append:", that "append" bit shouldn't be described as just another
> > "override". IMHO, it's an *operator*, as in, it's just a variation of
>
> Agreed. It does have a completely different meaning than an override
> and this is something I've struggled to explain in my presentation
> (I use the term "post-it" to explain the postponing of that
> operator).

  quite. philosophically, i think that the way i would describe it is
-- those weird corner cases aside -- the proper way to write stuff
like this is the expression, *followed* by all of the conditional
overrides to be applied, so:

 FOO:qemuall = ...
 BAR:append:qemuarm64 = ...

embedding the "append:" operator in the *middle* of overrides (or
adding it to the end) is just begging for misunderstanding or
misinterpretation.

> > "+=", which one would never describe as an "override", so when you see
> > something like this:
> >
> >    SRC_URI:append:qemuarm = ...
> >
> > to me, that's SRC_URI, then the append operator, followed by an
> > override -- it's just the way i like to interpret it.
> >
> >    next, when you have *multiple* overrides, like here:
> >
> >    CFLAGS:append:powerpc:libc-musl = ...
> >
> > i assume that *all* of the overrides must be satisfied (in this case,
> > powerpc and the MUSL C library have to be selected).  but when you
>
> Correct.
>
> > have multiple overrides, it only makes sense if those overrides are
> > orthogonal to each other, which makes this snippet from bitbake.conf
>
> This made me test some other scenario.
>
> What do you think is the output of:
>
> FOO = "bar"
> FOO:append:arm = "baz"
> FOO:append:arm:qemuarm = "bat"
>
> ?
>
> I would have thought maybe barbat and not barbazbat like it actually.

  fascinating ... i would have predicted "barbazbat", since the first
statement assigns, and the next two append. those are entirely
independent statements, so "barbazbat" seems the obvious answer.

> I'm trying to find a usecase for non-orthogonal combinations but
> failing at the moment, so maybe you're right :)

  i think the only components of OVERRIDES that are potentially
non-orthogonal are TRANSLATED_TARGET_ARCH and MACHINE_OVERRIDES. i
can't say what *should* happen in cases like that; i guess just take
the matching override of highest (right-most) precedence.

> > potentially confusing:
> >
> > # Overrides are processed left to right, so the ones that are named later
> > take precedence.
> > # You generally want them to go from least to most specific. This means
> > that:
> > # A variable '<foo>:arm' overrides a variable '<foo>' when ${TARGET_ARCH} is
> > arm.
> > # A variable '<foo>:qemuarm' overrides '<foo>' and overrides '<foo>:arm'
> > when ${MACHINE} is 'qemuarm'.
> > # If you use combination ie '<foo>:qemuarm:arm', then '<foo>:qemuarm:arm'
> > will override
> > # '<foo>:qemuarm' and then '<foo>' will be overriden with that value from
> > '<foo>:qemuarm'.
> >
> >    that expression "<foo>:qemuarm:arm" makes no sense to me since
> > qemuarm is clearly(?) a subset of arm, so why would you ever combine
> > those two overrides in the same expression? i think anyone trying to
> > understand overrides reading that comment is going to be confused.
> >
>
> That's fair, we could simply replace arm or qemuarm with class-target instead
> for example.

  yeah, that's what i was thinking ... that comment really doesn't
clarify anything and just makes it more confusing.

 i will ponder on how to properly and comprehensively explain
overrides with some real-life examples.

rday

