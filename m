Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6948EC433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 18:50:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.400.1636570235041279233
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 10:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IN3zarnK;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.44,
 mailfrom: steve@sakoman.com)
Received: by mail-wr1-f44.google.com with SMTP id r8so5663522wra.7
        for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 10:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GvIgSy9Z4n6x/iiZQBCByPmEO3u5mL9iboODGV5/WPU=;
        b=IN3zarnKK8Z0PekEv3yUBg5Uh7CRJ7WhgLoGS8D1YiH9LgkqP2u63oo9ngjDdiV9xt
         TEw72TkPRl6gRoDX3NjiTcOXkbDxfmY1HOOYluzbRFEvEKjqrLU3no3jSECj2Y+As9ow
         XX+7Gg4D+SLCUnLZ6VvUODQTsIW5TIQNPbjZ7OA7IVbWwJM6TQRLv3/NFYYSxGxOuJQd
         /8ajdmbSXAW/vulVsetVCTDabtb1TDsKfEsOg2aw4wP9upI/NEbC/74aqkUuCJkJ7VOO
         8AXiUlXrMtjcceGJG/F/d3czrQSfsD1lX66/hbYEq6vmgpPHDQm8N7YgsL77DviBXDfv
         ByOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GvIgSy9Z4n6x/iiZQBCByPmEO3u5mL9iboODGV5/WPU=;
        b=prxCdIn87EtEwPGA+g9qotDZIQBN97AvzBvJKRMzeKqZs4I9fxOd8ncjb4rcH8nvtj
         bRZFF2yNCriiItFsIhb3UV9QHks7uH6OlYrAd6xwUqdBVdb/w8akCW7v1IoNVrZhH3pe
         7OVQrhCfP+795Id4lWlTG4rLP5C5bXjwMcQfDux12hfPnYPusxi9e1TAkhXO0EmA6KBu
         dV/7vnRaX6Ta7yeH/l/fE6aHv98BKvAq036GHNBdZFuyhfZR47h/6r8ZTAwxvHVsjY9a
         KWDjWzN2GskhsF+Gv8a981wRfvaqbMEE7HWX8+tEkhLQXzDwtCw2m5rDEWVIDa71KA9f
         MLAA==
X-Gm-Message-State: AOAM530bchdrHj3pTooaiXyL4JKmMUJkmyrcOZRn0ZpjVlt9A47FrM7h
	qb0udldlSHQE64cYqC//zbhq5qsm0kuGujkB5Byftw==
X-Google-Smtp-Source: 
 ABdhPJzOYlmX2CF4l3amRFXH/xwLIpCc+H7CjXDokH/X2hjR1N2v5wG0k+w0UvMye+6bZHLqLzVgbq5SPSanOke1LtM=
X-Received: by 2002:adf:f551:: with SMTP id j17mr1478053wrp.392.1636570233522;
 Wed, 10 Nov 2021 10:50:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636564016.git.steve@sakoman.com>
 <1e32fbf2a24dfbbffb0450db97bac76ac7440da4.1636564016.git.steve@sakoman.com>
 <70b01de2-15cc-225e-9d47-95ddfc363ba0@bootlin.com>
 <2ef59077f06541a8f71d8b644a4e997fadc088aa.camel@linuxfoundation.org>
 <CAOSpxdZ1Jt9epr9Z9JkBT+FdpdyjrMmfRZ5S7UAgGQb=a+p9wA@mail.gmail.com>
 <1fad7cb1-bb18-b633-7bfb-9a0f7c16ca4d@bootlin.com>
In-Reply-To: <1fad7cb1-bb18-b633-7bfb-9a0f7c16ca4d@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 10 Nov 2021 08:50:22 -1000
Message-ID: 
 <CAOSpxdYQE9eqcwAFUnoNWx6RgWL3V1PBUDJ5xFM7iHMoxrymEg@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][dunfell 1/3] ref-system-requirements.rst: Add
 Debian 11 to list of supported distros
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 18:50:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2124

On Wed, Nov 10, 2021 at 8:42 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
>
> On 11/10/21 6:53 PM, Steve Sakoman wrote:
> > On Wed, Nov 10, 2021 at 7:47 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Wed, 2021-11-10 at 18:44 +0100, Michael Opdenacker wrote:
> >>> Hi Steve,
> >>>
> >>> On 11/10/21 6:08 PM, Steve Sakoman wrote:
> >>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >>>> ---
> >>>>  documentation/ref-manual/ref-system-requirements.rst | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> >>>> index d238dc454..4c4a7cf0a 100644
> >>>> --- a/documentation/ref-manual/ref-system-requirements.rst
> >>>> +++ b/documentation/ref-manual/ref-system-requirements.rst
> >>>> @@ -65,6 +65,8 @@ distributions:
> >>>>
> >>>>  -  Debian GNU/Linux 10.x (Buster)
> >>>>
> >>>> +-  Debian GNU/Linux 11.x (Bullseye)
> >>>
> >>> Great!
> >>> Could we apply these to "master"  too?
> >> We should only be applying things to older branches which are resolved in master
> >> one way or another too. And yes, the autobuilder has debian11 workers so this
> >> should go to master as well.
> > My bad, I assumed that master already had this change since the debian
> > 11 workers have been around for a while :-(
>
>
> No problem. This helps me to understand the process.
> Does it apply to Fedora 34 too? Is it enough to see a few successful
> runs on https://autobuilder.yoctoproject.org/typhoon/#/builders/86 to
> assume that Fedora 34 is supported?

Fedora 34 workers have been around for some time now too, so it should
be fine for master.

For dunfell I first make sure that oe-selftest and reproducible
succeed on the new worker, then wait for several weeks of normal
builds with the new worker enabled (by using my contrib/sakoman
autobuilder helper branch)

If all goes well I submit the patch for autobuilder2 to enable those
workers for the dunfell autobuilder helper branch, and finally when
that is in I submit the patches to meta-yocto and yocto-docs to add
the distros.

Steve

>
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

