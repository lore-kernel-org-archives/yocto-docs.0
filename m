Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AE9C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 13:25:49 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12463.1787750745755219191
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 06:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GS/883DA;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90cc107c451so6766946d6.0
        for <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 06:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750745; x=1788355545; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YaSgD8FmxMKe6A2UJo2Qod0CFQtopBQVj+tTs2B0/aw=;
        b=GS/883DAUQEeVfn3/7wDb+tu0gFb+nRYxXlCfgomzYM0gb1U2BdG3MrlPRmUclBley
         T0+iMpqviJMdWPcFGJodxu5ko2II4YknRNOXBmMKMj4nSqEiU5ZKS33uR23pLYgJxNqj
         bz5EJhpNwAj0KgyZrsniFk1kC4YsZrPJ8Kss6D6Rzc9iXm/7W7DWzqU4vdzYykZ0NyXm
         /lkqp0dcAJw4GsOGLo/TDzCLg+setkcTX9CcH/g3GNwkaiftTi6XHU8WWmPSB5t0fYUF
         dwgrmlZyHzJCfnj83IBi9blN8EdYOOWZ3CzcQyKhyp1NstLoiVER1DupEQH6n40mPjYV
         EjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750745; x=1788355545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YaSgD8FmxMKe6A2UJo2Qod0CFQtopBQVj+tTs2B0/aw=;
        b=gdgqQSLiiwmaOO3tkXKYrM7Dz7+7rEqeJnlJiAXVvsYuNJN3nsIOnR8sEmn5EE2hXc
         bQviwF7XKd6D4U10ScQ9Cqsa335oCiR8fRuhgDoZhPPtaI3ThUogfyzza6M7mmoCqKNQ
         GvghkJhPcU0TIcN5ySsgK11y/beJVC9u3Om+J0mrXGguXQknutewkdh7E2DrjR6qTFJe
         sFM2fn3+FzWLm0APVKlzLpkInQBOJDvEFCmVlmAmTs85fOcjvLRqrs01HLMTLCGfZnev
         sJYpkPH3+P8bNCiLzoDNJFMKdQmWKt2jq2afjVFlCd9j+wDbhwN4uD+JOuBRpKCwwJrC
         wX+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr3XNyLlFl4zmyqD852hc4tULwmF5gTWEdChIAbFC5Et59rGJPV3/kXhojiGQFXSRwsdXIm@lists.yoctoproject.org
X-Gm-Message-State: AFuF++nxiAjLhLaN1uiEKFVY/A2UoCsCcPa1CCQzbmZi/aSNSXk8/GNo
	XbhpJ4tl4Rm+P4aErxdr816k0tqgyNj82nKNTCv5pb5WGkhYNyzrDInz
X-Gm-Gg: AR+sD13BhA/YZbbLKBo5/D/Q+7HslSRe5rGvRfDQjlZbo4iyJmR3ecBWtcFr4xXM5TA
	GcN4qg1A6HUM42obhTCaR/oqoSeyOqJwD1Zvc49WcrQMBOZ0FgsObL+nhdPqB+4gsRiB5MaEmU5
	3GzqYgsjsDK2hTLDPpjZkq0RjS/C46wTvXL8cdycAc+8geUnUGTHSLpVNbTzjYm42d1RHfeZpHP
	hNOYF60mh+vEXPX1N07H1+YfMAX5KtNqxfV+Xo/0jK0B7Rn83QK4nLig7/Br71wgpgJLxsorzUs
	KzdNd7FDeJf133fD6fcFHifKuiWY2N2HUGekSCPzBBH0NC50vI21/bVgvqhFHTz2/m0jepIxhWe
	9lBM9Y6hW0I3Q+pZnD0fO2UqUrZmgAkjhjD8GQfWZRJVOfSvMKOt3fg03b5zn3KhsiHtcqzKtYg
	UidIeg1zRW/OeKgRDnbqrd2143ICPAtrvaClUC9lv+YtweN73hPXM7GFR6A6wuoJbhTYEdIzIqw
	fBKHlMtnzPTF9s38e8hNYFg4XbHNbEYgL+oHCupIg==
X-Received: by 2002:a05:6214:2487:b0:8ec:4ead:cda6 with SMTP id 6a1803df08f44-90cc7a58866mr61046776d6.30.1787750744357;
        Wed, 26 Aug 2026 06:25:44 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc650a197sm25787046d6.23.2026.08.26.06.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:25:42 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:25:39 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: quentin.schulz@cherry.de, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
Message-ID: <ao7pU4NN4uuZDzS1@localhost.localdomain>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 13:25:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10365

On Wed 2026-08-26 @ 03:09:23 PM, Antonin Godard wrote:
> Hi,
> 
> On Wed Aug 26, 2026 at 2:10 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
> > Hi Trevor,
> >
> > On 8/26/26 3:34 AM, Trevor Woerner via lists.yoctoproject.org wrote:
> >> Pygments 2.21.0 added a BitBake lexer, so BitBake snippets can now say
> >> what they are instead of rendering as plain literal blocks. This tags
> >> the ones in yocto-docs.
> >> 
> >> One patch per manual, which is also roughly one reviewable unit per
> >> patch. No prose changes, no reflowing, no reindenting - every hunk turns
> >> a literal-block introducer into a code-block directive and nothing else.
> >> 
> >> Which blocks were converted was decided by reading, not by pattern
> >
> > "by reading" following a paragraph definitely not written by you and 
> > with all commits being AI-Generated is quite the stretch ;)

When I asked AI to add explicit code-blocks with explicit language tags
I emphasized it should read the entire block before deciding. At work I
am the head of a massive project to convert some of our documentation
from wiki to reST and was caught a couple times by this.

Bitbake syntax has a tendency to sometimes look like bash, and sometimes
look like python, so I wanted to make sure AI was being careful about
the languages it was guessing.

In fact I pushed back on some of the choices when it selected python
instead of bitbake, but then it pushed back on me and said: "yes it's a
bitbake example, but this code snippet is entirely python" and in some
rare cases it was actually correct.

So this "by reading" statement was probably AI's way of saying: "i was
careful about the choices i made", rather than implying that "Trevor
read each one and decided".

> >
> > [...]
> >
> >> Depends on
> >> ----------
> >> 
> >> "docs: state the language of nine literal blocks explicitly", sent
> >
> > Link to the ML please to make maintainers and reviewers job easier.
> >
> > [...]
> >
> > I think this is going the wrong direction. We should actually make 
> > explicit the language of every :: that is NOT to be understood as 
> > BitBake code and then make the default highlight language be BitBake. 
> 
> But then this might get forgotten? How about having the default highlighted as
> "none", and make _everything_ use explicit code-blocks?
> 
> Sure, this is more efforts and review time, but also this is how other markup
> languages work - like markdown, where by default (when using ```...```) no
> syntax highlighting is done.
> 
> This is maybe a more conservative approach but at least it doesn't leave room
> for code blocks mistakenly highlighted with the bitbake lexer.

Yes, I agree too.  Personally I'm not fond of "hidden defaults".

By default a non-specified block will cause pygments to guess. So if I'm
looking at a lot of reST and seeing no tags, I'm going to assume the
authors have left pygments to guess. I would have to go looking in other
places to see if there's a default in place for non-specified code-block
tags, which I'm probably not going to think of doing, which will
sometimes probably cause more confusion before it becomes clear.

Maybe it's just me, but I prefer to see every example block using an
explicit code-block tag and specifying a language. That way the author's
intentions are unambiguous, and we have an expected output.

That's what I've enforced for our reST at work, and I've also
differentiated between "bash" (for actual shell programs) versus
"console" (for interactive work at a shell prompt, a shell most likely
to be bash).

