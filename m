Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F3CC624C6
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 14:16:41 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30639.1788185800688013477
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 07:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g/3sVNWy;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52f83889a93so37007161cf.2
        for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788185799; x=1788790599; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhjsvSO1ITJdCw1hTGbFVVPPJKb+PVFj4AFD7YFKOAY=;
        b=g/3sVNWyVQ4cND9yMdBZO0axsrCM14VWW5Shu4PSU7VPJwrwu9da4UuvNvxV3l8zyM
         RC20twXtnz1IJ6YSkkV/xjREK7/r9qaPtTAxKe0IB/jRDhrQQlRtmcaeD4t1NdelXHjR
         nPXa47JHbMukx+8KjqBQofuIA4cp1n8+pUzya4BTIdKo24tFXnVONL3d0jxetGym+iW1
         y0fgMyx5TXQh6+tSJGop8R1k+i2NZeDnP0c1x2XtabDBlzlVpRmJejsxS8mIQULF5VgM
         NvUrlc+zeqom5y2qktjH+NpT6djeuavyniVSj7lIYmH5GCNyA308Cwi/wkPP9rnB1D/a
         LQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185799; x=1788790599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhjsvSO1ITJdCw1hTGbFVVPPJKb+PVFj4AFD7YFKOAY=;
        b=EZswiSmlT+jvViYkFiFiKaUxsHntzFv2sUsjfggAKPinBFsx7Zr+09yZHO8LlVQfdv
         y1w3Ran4+S+EFs28YPRuppfP8XNZ4wGk7IBOCto0OHQ+7lSP9VgCNNjkUT8xQ1s0rjoX
         4/pbyi8MgsQSpRFyYKFu+RL9YF4qJoNofrfofTKZ4LgVCMljxZGUbsZm4qASeUVe67Om
         0K6JxLmOhgSECLdHGa8TC9bQcuFKDTzBwMqzE8AW0+qbx6EXeHitIsrNBE/+RTNGs0X2
         6VlLE8QiRYmmrKaSUasKqQiWzzDvQDXdPV9cTQZZHVDE5XbTJJMYbVPAw2msm+ZjpzBx
         7GWw==
X-Forwarded-Encrypted: i=1; AHgh+Rqw0GDvhsLVlCNZ5anqYvlrtrHc7pq/o2JwSiZf0wU3UmncU32jybXtezq6p8MwyLTual9L@lists.yoctoproject.org
X-Gm-Message-State: AFuF++leBqW3ReTDcTjmbim8q1qO/LdyvE4KrRqh+Xs/8aC1j2+ey/H8
	j0Ky8r9xRq0+DrQubhXQWzFol7+3rUCDYYYjR3PaUMVN8Q1kEniqp9HE
X-Gm-Gg: AR+sD11Oyu3JBiyI9WsK5j0HIMpXpwiTkQwpyiXdUPLVqRkPWIsuIxxiylsEo9dc/GG
	xtkfNCTKTl/rIjgkSLsmHcobvrYouVfj9XampLl6f3hwNZdIbnXki4FPC7h4R+s5hBgGm9M7rm/
	8yKKt1uYnWiSEEgwHiT72uYcMxAEOI07ZjRa5loEz32MtPcXYuqvwkkoRyxp1PeB0ozH+JOsKMA
	AM+uzyeYk4VSPoyEEGMUKZozKZWrfH3WzdT3ouXxjHjGob0bBk6ggYjmbzstmyQP3f0r/c8Z9yA
	Gt/EQO0aK2Kbc4G4arx0Kr0Ut7574fs9+pEaolfifWBVePr4SVJ/QBPIj0SauubxO4xZPjBSLP3
	4FJT3wuZe+RffAtESHOsehYMu9VTTuNx4Sh1gYrZL5poZ+UMEL3vLxj8Vvqp9TSs3cu6JlKpj9B
	x7q76HWy5lHgGhCNeLu8ry/asTC31BKY5qgdFD3m7DD4ADsBBlr12jTJ9m+Ny438XvBGrfKy9Yd
	FIfj/nhskiRdLJqVah9R4p0OiQw7g==
X-Received: by 2002:a05:622a:2443:b0:51c:1a46:9148 with SMTP id d75a77b69052e-52fb967f2a1mr371503551cf.34.1788185799398;
        Mon, 31 Aug 2026 07:16:39 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4515072sm84468386d6.36.2026.08.31.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:16:38 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:16:35 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
Message-ID: <apWMw3x1EIVv7ADz@localhost.localdomain>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <ao7pU4NN4uuZDzS1@localhost.localdomain>
 <66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de>
 <ao9E-I2EAyMrtlIR@localhost.localdomain>
 <121fe43e-bdec-4f2b-9f54-e92dfa887e33@cherry.de>
 <DL309JI7KO5S.31U2Y9LIHSH9Q@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DL309JI7KO5S.31U2Y9LIHSH9Q@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 14:16:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10425

On Mon 2026-08-31 @ 11:01:44 AM, Antonin Godard wrote:
> Hi Quentin, Trevor,
> 
> After having thought about this a bit more, I think there are pros and cons to
> both approaches, but I'm leaning towards Quentin's approach. The other approach
> may feel "safe", and doesn't leave room to errors, but I'm afraid that 1. most
> contributors will forget about it and 2. it might make the process more painful
> for them.
> 
> So here what we should do:
> 
> - set `hightlight_language = "bitbake"` in conf.py.
> 
> - remove file-wide lexer enforcing (.. highlight:: directive at the top of the
>   file) (in a separate patch)
> 
> - use the appropriate lexer for each code-block that is _not_ bitbake code.
> 
> - fix any parsing error from the bitbake lexer (I did have some when trying it).
>   If this happens, use "none" and *add a identifiable comment* above it to
>   explain that there's an issue with the lexer. This way we can track them and
>   fix them when Pygments gets an update.

The pygments releases occur on a rather slow timeline, I predict the next
release will probably be in Dec if not Jan 2027, if history is any
indicator.

There's a problem (Quentin mentioned it in one of his replies): users
don't use the tarball that the AB uses (in general, I assume) and
versions are not pinned. So users are free to use whatever is on their
system but hopefully have created a venv. But even if they're using a
venv there's no guarantee that they're updating their tools regularly.

So we're left with the following situation:
- the AB has to wait until the tarball is updated
- users might be using older versions of pygments

And then on top of that you layer on the situation of trying to generate
docs for older releases not to mention backports.

However, I can add a shim so that everything works out of the box
today. The shim can be smart enough to examine the bitbake support
independently (at runtime) and only load itself when it is needed
(either an older version of pygments that has no support, or the 2.21.0
version that needs additional support). If/when pygments is updated
(after the next release and either because the user has updated their
tools or the tarball has been updated) the shim will not load itself.

Carrying a bitbake language shim in the docs repository itself:
- the AB doesn't have to wait for an update, bitbake works today on all
  valid snippets
- backports can start working today too, since tooling doesn't have to
  be updated, the shim knows how to highlight bitbake independent of
  tools or versions
- we don't have to wait for the next release (5-6 months) for all
  the bitbake snippets to parse correctly

The nice thing about the shim (the way I've designed it) is it is
dynamic. It will look for any bitbake support in the currently used
tools. After running a tiny bit of testing it will load itself only:
- if there is no bitbake support
- if the bitbake support is incomplete
Otherwise it won't load and won't interfere.

Even once the next release of pygments occurs and full bitbake support
exists, it will still be a good idea to carry the shim so that older
docs, users with older tools, and the AB doesn't have to wait for a new
tarball to get full bitbake highlighting.

Also, this way we don't have to skip the non-working snippets today
with a comments, all snippets will highlight today, no need to go back
and fix things up in 6 months if someone remembers, etc. Full bitbake
highlighting for everyone under any circumstance starting today and
available forever across all versions of docs and tools.

> 
> - document this way of proceeding in standards.md.
> 
> If you think of anything else we should do here, please share your thoughts :)
> 
> Trevor, if you want to send another version of your series, please rebase on
> *master-next* as it contains cleanups to the conf.py file at the moment (+ some
> possible additional code-blocks).
> 
> Thanks both for sharing your thoughts on this!
> 
> Antonin

