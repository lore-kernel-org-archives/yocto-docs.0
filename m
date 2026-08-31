Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68897C624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 15:55:19 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.312.1788191710026174476
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 08:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=emptx5XI;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9391e3b21fbso201544385a.2
        for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 08:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191709; x=1788796509; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ci6f7qAcJG1mHZvv/OERTtZe+6e6BF8EerEOzo6mxHw=;
        b=emptx5XIirdC91LatRHDoyu0OExToXWBxl3BfBuNSrfnak/QcPCsRqfDGiVN8Vt3fp
         rS+x+KmdeoJI+cq8tdUHHnDoaSCbfu/FuIZe+JO6yYWEL9oa0oa3/TsYzREVpzmXo2ce
         nhgQtYKrljgnIMsdR1sn9WYXqD4Y6Zoz18YSr6+GOxPqOLgqmJp6kTgJk3Ce2miTnEz6
         ewlneqlj2B5t/WuVzYzqnPw9opInoZTW9AiEcZxH+2Wiv1g/JBc8mff3vytdELFZlatg
         5MMdEo3x3QUpqph13hvMLL8XUqQPXIZ0uBz0F1YvCgBmx+vhgHWoc7bDyKukqpCvKrKd
         3wKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191709; x=1788796509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ci6f7qAcJG1mHZvv/OERTtZe+6e6BF8EerEOzo6mxHw=;
        b=QbDicIz9AJ7ccNB0hQTwh7Rts1fiCg5Go2wc4nIRFrtxysk/HizbvR5mPgEBGl0TMC
         SUSCeEmk4kTCEigsobgkDl0bGyMUvQBQ/K9rdrIdNZ9J2FpaIwtUN9DfihTBgi9CoG6I
         tCGQRLNza2eNLIEekS8LhLYo+ele3hpJ0aLVlKI2xQzBNBUDsfoNyr0M6ChV1abxDIqt
         +DPD588n6ULITxUDIH49ZyNs3YPLlENKv/oigdW6DJlz42CLQ17oCoMfHqhLUHyr6GK9
         o3wnlzshJCl2DpYj57+FcEkBgg6mn64Rw9sT0CQ2+7mIYj+aeI+vuYP170Vbbre9Jx8h
         sHJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4V4hnGj5YIXPA6n8+rmfFf4B0BwwoPLKE7XRgJybHUj/tUZmDK1Gxa2PYWpBisxWRwMLI@lists.yoctoproject.org
X-Gm-Message-State: AFuF++kFh98cZKU96zYC9SG2oicuwAaLPJHrlKjct4wcUt+BABo2cXN0
	klspaWIsh60sBc7pYtlUsm3+vLI9wP1LmB3UMu1HxJPu4arwb4XSmGkW
X-Gm-Gg: AR+sD10PdEky6MPBric+rs30P9Pxh9p0Elgkp0rdMqwRMVbQKSZhVdyacaCmG1oZQvq
	kW81TOWxqUYe2civ+h4WE5mjV+XGU2LOolLZDbzsOlq/Kn2gV0FoQOVwZA3qL9iQKck/kO4iDmw
	Rzvka39B27bAJ/GIbDQPV77J0umXcAx5LiWUoZTjfW9UBdoAzcqxp02YBL3aZu3RUE+Vw5JlUGn
	zT5VOELbHxz0TwQeLGUi5qA9YrPPfe2ngAX18UWHi4EP3Y1VD1aWElYTKHJMzxYVoDOwDFOrdEw
	BQRVYe0+al9NwzrYb5YdGCLKscH5Nd2gIKe4IbRgCfUushnUy67x3E9JgnhJXrkv/XhG7r43i8D
	3scJ7tITxDzQ6mAsBIxWd2Npvj9ENJrfWF4nRfbseQYvl5X8woHjv5m4CNLpDCI7PZGbjOHhOMH
	B703VdM8/D2T3M9ZGZqWgsArvodD0wpIlj/xl6spHll+rkYh05xa6lrFC1b88m+G8sJ8HDO1q+p
	pd3h1/z05wCnNPoroBNtqHQtbF1TqmKmPHnsPU5
X-Received: by 2002:a05:620a:8298:b0:936:9fd4:e2bf with SMTP id af79cd13be357-939138df3b6mr2089265485a.37.1788191708726;
        Mon, 31 Aug 2026 08:55:08 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391740bb62sm826018885a.43.2026.08.31.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:55:07 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:55:04 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
Message-ID: <apWj2I_HZ99AN3Uy@localhost.localdomain>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <ao7pU4NN4uuZDzS1@localhost.localdomain>
 <66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de>
 <ao9E-I2EAyMrtlIR@localhost.localdomain>
 <121fe43e-bdec-4f2b-9f54-e92dfa887e33@cherry.de>
 <DL309JI7KO5S.31U2Y9LIHSH9Q@bootlin.com>
 <apWMw3x1EIVv7ADz@localhost.localdomain>
 <DL38AV9O6NJE.MZON26TNFFQZ@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DL38AV9O6NJE.MZON26TNFFQZ@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 15:55:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10427

On Mon 2026-08-31 @ 05:19:37 PM, Antonin Godard wrote:
> On Mon Aug 31, 2026 at 4:16 PM CEST, Trevor Woerner wrote:
> > On Mon 2026-08-31 @ 11:01:44 AM, Antonin Godard wrote:
> >> Hi Quentin, Trevor,
> >> 
> >> After having thought about this a bit more, I think there are pros and cons to
> >> both approaches, but I'm leaning towards Quentin's approach. The other approach
> >> may feel "safe", and doesn't leave room to errors, but I'm afraid that 1. most
> >> contributors will forget about it and 2. it might make the process more painful
> >> for them.
> >> 
> >> So here what we should do:
> >> 
> >> - set `hightlight_language = "bitbake"` in conf.py.
> >> 
> >> - remove file-wide lexer enforcing (.. highlight:: directive at the top of the
> >>   file) (in a separate patch)
> >> 
> >> - use the appropriate lexer for each code-block that is _not_ bitbake code.
> >> 
> >> - fix any parsing error from the bitbake lexer (I did have some when trying it).
> >>   If this happens, use "none" and *add a identifiable comment* above it to
> >>   explain that there's an issue with the lexer. This way we can track them and
> >>   fix them when Pygments gets an update.
> >
> > The pygments releases occur on a rather slow timeline, I predict the next
> > release will probably be in Dec if not Jan 2027, if history is any
> > indicator.
> >
> > There's a problem (Quentin mentioned it in one of his replies): users
> > don't use the tarball that the AB uses (in general, I assume) and
> > versions are not pinned. So users are free to use whatever is on their
> > system but hopefully have created a venv. But even if they're using a
> > venv there's no guarantee that they're updating their tools regularly.
> 
> We can pin the version required to build the docs in
> documentation/tools/host_packages_scripts/pip3_docs.sh. This will become the
> minimum version of Pygments required to build the docs.
> 
> > So we're left with the following situation:
> > - the AB has to wait until the tarball is updated
> > - users might be using older versions of pygments
> >
> > And then on top of that you layer on the situation of trying to generate
> > docs for older releases not to mention backports.
> 
> The change in conf.py will not impact older releases, so they should be safe to
> build, even if Pygments is updated with the bitbake lexer: it simply won't be
> used, because highlight_language is still "default" on these.

If we set:

	highlight_language = "bitbake"

in conf.py right now, anyone who is not running pygments 2.21.0 will get
warnings which translate to build failures via the Makefile's -W
setting.

> Note: I think this change is big enough that I don't consider it candidate for
> backport on stable branches.
> 
> > However, I can add a shim so that everything works out of the box
> > today. The shim can be smart enough to examine the bitbake support
> > independently (at runtime) and only load itself when it is needed
> > (either an older version of pygments that has no support, or the 2.21.0
> > version that needs additional support). If/when pygments is updated
> > (after the next release and either because the user has updated their
> > tools or the tarball has been updated) the shim will not load itself.
> >
> > Carrying a bitbake language shim in the docs repository itself:
> > - the AB doesn't have to wait for an update, bitbake works today on all
> >   valid snippets
> > - backports can start working today too, since tooling doesn't have to
> >   be updated, the shim knows how to highlight bitbake independent of
> >   tools or versions
> > - we don't have to wait for the next release (5-6 months) for all
> >   the bitbake snippets to parse correctly
> >
> > The nice thing about the shim (the way I've designed it) is it is
> > dynamic. It will look for any bitbake support in the currently used
> > tools. After running a tiny bit of testing it will load itself only:
> > - if there is no bitbake support
> > - if the bitbake support is incomplete
> > Otherwise it won't load and won't interfere.
> >
> > Even once the next release of pygments occurs and full bitbake support
> > exists, it will still be a good idea to carry the shim so that older
> > docs, users with older tools, and the AB doesn't have to wait for a new
> > tarball to get full bitbake highlighting.
> >
> > Also, this way we don't have to skip the non-working snippets today
> > with a comments, all snippets will highlight today, no need to go back
> > and fix things up in 6 months if someone remembers, etc. Full bitbake
> > highlighting for everyone under any circumstance starting today and
> > available forever across all versions of docs and tools.
> 
> Considering what I've said above, do you really think that's necessary? To me it
> feels like increased complexity considering we'll only add this feature on
> master, and it should be straightforward from there to fix future stable
> releases with backport patches when Pygments gets updated.

What's the complexity? The shim is written, it's done, it works
regardless of which pygments version anyone (AB, users) are using and it
doesn't install if the conditions are met. No waiting, everyone gets all
bitbake highlighted today.

If anything not adding the shim *is* where the complexity lies. Once you
accept the default conf.py patch the AB must be using the new pygments,
and users will see build errors, and report them, until we point out
they have to update their tools.

> Antonin

