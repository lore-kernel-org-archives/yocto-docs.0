Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E17C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 17:19:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.4786.1637255988825095181
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 09:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1pxOyJRE;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.46,
 mailfrom: steve@sakoman.com)
Received: by mail-wr1-f46.google.com with SMTP id a9so12971931wrr.8
        for <docs@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 09:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WxZ+v1uvCg1iA8rcFkPvLTec//cLezZgZ/INB4OOzoE=;
        b=1pxOyJRE3ZlViSFWqjeKT4kNKQBBw9HB8IBYks2/QyJ9WicCFVOyEJ4+4zGp+ahixq
         sinTmSASIrMresLmQIQU9C168c4gR7ZmbxVpnyxHzUZZFKKuRlhrIvQrspQHpgunW2F6
         Q/OW/dPaLBidSIFvAsdPfY0vnfB1zcjdc+RKTSPoyE88WH15nRdkrWkAjMdNMyHLWAyr
         89LpngzdLG1dWYDvhBn7UHmL9s22SnpiHuQgz4kwKUR/WL3MwSPAHjEXuvI+je3PLzJh
         Xm7rRZVcrebBI4Ab2ojXCAMKf17xQfs8FoD66xB6MLaQpX7236yIJ2nLnOl2ZrnY7G9b
         wE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WxZ+v1uvCg1iA8rcFkPvLTec//cLezZgZ/INB4OOzoE=;
        b=vcbfVa0zRWT3y60sW18HUuJqKK1XpUcRAHkzV3hpcL7qeCNEl6+njZNAXxCo2CoDTX
         vjMLocvRzlG9f0TtSndx3kULg2/jW12aO4Nk9LsLO8Yv9PN5AuqbjINr2Vj1L4VZeqIe
         /3yQqTzj4WVscDsc1cVJnDK71+Tva/+vlHWlCUxoJquxsfHhOdq7hXeBbNmwHWwBaAxx
         d5/XdOBi8dq4DhRuFbtO4tgL5QRM13rYOBwaKkRMABkkgZUsj7IdybQp7GRlO0leGjo0
         Hgzt2Nqk6KLy4LmO48sGfd3XprlgaNPENODk6PIycy5ALNVUzn8pGjw7qzeoJUkUvxGm
         kSFg==
X-Gm-Message-State: AOAM53019/Ih55sTPNoK/0CKxbGp+nRxBxPDdRNadV/30ULXAQwUMMG2
	p6NT4IDt1C8nRACczP+0xdUlV4EIc+nr1r3mRaPcjQ==
X-Google-Smtp-Source: 
 ABdhPJwPe5i/AkaK+mmxYjRc7NCJcwD97uo1gMbOHf3Kvtl1radDCgrVv0eatT2iBamCUHgJhpxVzSAYu7FYpfgj15A=
X-Received: by 2002:adf:fb09:: with SMTP id c9mr31489397wrr.223.1637255987045;
 Thu, 18 Nov 2021 09:19:47 -0800 (PST)
MIME-Version: 1.0
References: <68f334d7-a94d-e8ad-71e7-5b398e5188ee@bootlin.com>
 <37d05c4b3a148f8bda5718a71a12e031e981b01d.camel@linuxfoundation.org>
 <16B8B1C4AECC9EC4.8779@lists.yoctoproject.org>
 <c6345ae2-faab-0d00-3151-ae2e48d5a60e@bootlin.com>
In-Reply-To: <c6345ae2-faab-0d00-3151-ae2e48d5a60e@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 18 Nov 2021 07:19:36 -1000
Message-ID: 
 <CAOSpxdb-wMaK6_aL+ez8hWZb=Z=dxh9yoTew4mcyCmCsK0G1WA@mail.gmail.com>
Subject: Re: [docs] [Automated-testing] Stop testing on Ubuntu 16.04
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	automated-testing@lists.yoctoproject.org,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Nov 2021 17:19:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2163

On Thu, Nov 18, 2021 at 6:52 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> On 11/18/21 5:45 PM, Michael Opdenacker wrote:
> > On 11/18/21 12:56 PM, Richard Purdie wrote:
> >  We can drop it
> > from the docs list I guess as we'd not recommend it any more.
> >
> > You guessed my next question. I'll post updates to the docs. :-)
> > This way, when it's removed from the tester list, we'll have nothing to
> > do on the documentation side.
>
>
> Hey, what about Dunfell? I'm not sure about it. Ubuntu 16.04 was still
> supported when Dunfell was released. Would it make sense to say that we
> don't support Ubuntu 16.04, at least in the Dunfell updates?

We still have an Ubuntu 16.04 worker (ubuntu1604-ty-1), so this is
tested regularly.

So I think we should keep 16.04 for now and revisit when that worker goes away.

Steve

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2162): https://lists.yoctoproject.org/g/docs/message/2162
> Mute This Topic: https://lists.yoctoproject.org/mt/87147646/3620601
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

