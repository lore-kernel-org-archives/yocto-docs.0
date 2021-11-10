Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065ADC433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 17:53:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.1760.1636566796910561665
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BZeR4arE;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.41,
 mailfrom: steve@sakoman.com)
Received: by mail-wr1-f41.google.com with SMTP id s13so5468279wrb.3
        for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+stEhdI7K/Z1iaNanULMMR7AVzzkAo03sosbSFJM0LY=;
        b=BZeR4arELI+xNmghBQu+jak/4t2FDf3JwAHqo/iygKoTSrjHT0k7+m5127xm4tJvhT
         /d04xOCJO1OIHjB2qrnT3r6eLesQY2OMFkLhpWEvwkKMLsXLqLdaSf6dTf553tn5mKGN
         RyiDdno/iVCTTa/2e2YlFb9tdKB3eoxan4P2QU+xGAoT/TWFCswC2oNIKbE4Ig11EeqC
         YOuxP/JgcDDAcENKtEWgj2CHdGF38IYhZ7xfv3LVlYGkRzmX2OsKyajWq/dHAKC62tZM
         ziji1/VxRo228M+gyspCZnONUXXlYoGmeJJKzYQCbF2c+j46z2h2NGfUpgm59HQxDO3W
         SjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+stEhdI7K/Z1iaNanULMMR7AVzzkAo03sosbSFJM0LY=;
        b=q8adSmWBTOJxLs0hsVeYarx8NF5rtqs/Z8xOB9rNQ3c3lp1qEPfqdJXg6FdhA3KTeF
         MqlZ7+SJip0WRq54tQY05HGFMNDnSt6aC2pw1rLjck+2QCr/ZdYxcsRpNZKh1uPfzSjb
         7WI1VmARIVWyBRQu8Op9Hmqki5tayei0WXeWqDjH8EeeWe9qlLnr/3Kr7exmmXFQ1ATr
         GgLqttd2O41meIAluPIPPONsNnZEYBLhFD0pzHoUDmpkhEpq4m0MKEdB+ZUDqeqosiAK
         DxyS/GVPDUipyEvVVlF9t7IRI/SCF3vmjnl+SMDF1tQ+y+mb5eT9/t1atgBFBfraasb5
         Lddw==
X-Gm-Message-State: AOAM53146ci4ROT62yfL225AgE7Yr46ZXasNLfz2KGXrhqYuEK1h8v5J
	WGpeZu4o+LPA4dLJBiXTXAOnvyNMoAyukI/Q4/zydQ==
X-Google-Smtp-Source: 
 ABdhPJzOn4JlWBPpvQ/GVQ50Nubi6JSzDpwh0Ukwzml0wTjq1PmJn0LwZ0kQpWSIpSwuf7st+h8LAzS+YNMdSAiAxqw=
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr1049424wrz.286.1636566795130;
 Wed, 10 Nov 2021 09:53:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636564016.git.steve@sakoman.com>
 <1e32fbf2a24dfbbffb0450db97bac76ac7440da4.1636564016.git.steve@sakoman.com>
 <70b01de2-15cc-225e-9d47-95ddfc363ba0@bootlin.com>
 <2ef59077f06541a8f71d8b644a4e997fadc088aa.camel@linuxfoundation.org>
In-Reply-To: 
 <2ef59077f06541a8f71d8b644a4e997fadc088aa.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 10 Nov 2021 07:53:04 -1000
Message-ID: 
 <CAOSpxdZ1Jt9epr9Z9JkBT+FdpdyjrMmfRZ5S7UAgGQb=a+p9wA@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][dunfell 1/3] ref-system-requirements.rst: Add
 Debian 11 to list of supported distros
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 17:53:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2121

On Wed, Nov 10, 2021 at 7:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-11-10 at 18:44 +0100, Michael Opdenacker wrote:
> > Hi Steve,
> >
> > On 11/10/21 6:08 PM, Steve Sakoman wrote:
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  documentation/ref-manual/ref-system-requirements.rst | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> > > index d238dc454..4c4a7cf0a 100644
> > > --- a/documentation/ref-manual/ref-system-requirements.rst
> > > +++ b/documentation/ref-manual/ref-system-requirements.rst
> > > @@ -65,6 +65,8 @@ distributions:
> > >
> > >  -  Debian GNU/Linux 10.x (Buster)
> > >
> > > +-  Debian GNU/Linux 11.x (Bullseye)
> >
> >
> > Great!
> > Could we apply these to "master"  too?
>
> We should only be applying things to older branches which are resolved in master
> one way or another too. And yes, the autobuilder has debian11 workers so this
> should go to master as well.

My bad, I assumed that master already had this change since the debian
11 workers have been around for a while :-(

Steve

