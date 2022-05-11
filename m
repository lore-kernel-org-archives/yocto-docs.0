Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D87C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:28:08 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web09.839.1652282878799164355
 for <docs@lists.yoctoproject.org>;
 Wed, 11 May 2022 08:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HcUBCPuy;
 spf=pass (domain: gmail.com, ip: 209.85.219.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id v59so4642632ybi.12
        for <docs@lists.yoctoproject.org>;
 Wed, 11 May 2022 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZvBLi2Ga2SIethlvj5CHAbnuP7kCtDRCgK+1vpK75D4=;
        b=HcUBCPuyTvEjDgXX5f75tem3YzoWYI1VRS0y7n3UC1Puxkm403jW+n2Ty3LsENCF2i
         CeBxXGVjZFuZjkc1s89OVxpBeXkmexTWhnPjDkWWuZ/WxTWkPwqby5I5U1YYPx+vObn3
         OCArRvuof5ZoOGPDDbZy1tVSbMBVPcrlEtnTQtx4FHxQ+/2ACi/ZvtXM0i+OIVedtR/Y
         f6Kxvjo82epcPMX5YCO1vJBJ6H6CyiLQoLcHFqbtx8l+v8LZ4zy6t8kACN60OkwEb+pM
         XLzilokxS8dt1+2hXJf32mXIZVx1hGsSNEBsn7RVFrk4zzZsobqCFJO4MkRF0//dlTqB
         MfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZvBLi2Ga2SIethlvj5CHAbnuP7kCtDRCgK+1vpK75D4=;
        b=kkSyYhhN4IYLe1ry9EPG+nylsjbsaF3yIfmvlzsfLpAAtcQexpM9LrmJLuuNKWtdYS
         6x66AWwrv9Y3LVUonpEka6MgZoStVcegeTMYiAj4mTyhxOgJuaa+oqJXTad6nwChqYNi
         +9u/jrSv9H1qsxDeceRFesfdbHH5oB5CjRa6kMrEiGzWlb+5UqMUAXS9G4WcJ6owtXH9
         AuHv4SvhpPSh/AQ5XRVgI7usTNf6nMbIGvIjA20pBGk36i7GT1Wb5QMHNbgtKg2ss1eh
         CCAmGwzhFlzrN6tlsGzZkwj+Wl0jkB1OYf+hiSu6hIfalFVyTF9C6vtqe/VrzmTlD85C
         rgaw==
X-Gm-Message-State: AOAM531nwGKN7L+Ptk56Gs6UhzwjGl73TYoYmvolBxE8hWYVQ1sykoR0
	redFIM0M8PeqMBAV5KqVf+GvmAvQLVN5EMAI1ec=
X-Google-Smtp-Source: 
 ABdhPJzkWcvtDmnBGPIwGywMUY4Rqe+uGz1ohAJQjkK6rQuOr27BLlqy3xFajf7W4qJ7X8LsJqBHQMlml51Uzv7YOlQ=
X-Received: by 2002:a25:34ca:0:b0:645:716c:8cd1 with SMTP id
 b193-20020a2534ca000000b00645716c8cd1mr24673341yba.83.1652282877803; Wed, 11
 May 2022 08:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <e9ed828b-e775-66e9-5d28-b1e7499adc6e@crashcourse.ca>
 <731ed051-1887-c9a3-f09e-1003113d2e89@theobroma-systems.com>
 <e14d577f-fe71-d71e-6eaf-2e87214a593f@crashcourse.ca>
 <36a536ea-b77e-6e9e-e9c4-00a3790fb32d@theobroma-systems.com>
 <e1d5fe50-d15f-b54f-929a-dd7eda8ff4f4@crashcourse.ca>
In-Reply-To: <e1d5fe50-d15f-b54f-929a-dd7eda8ff4f4@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 May 2022 08:27:31 -0700
Message-ID: 
 <CAMKF1sp10xB2Do5H_8oqT3xwBiqYpLCyvsjLTY+Fzibo5BzzPA@mail.gmail.com>
Subject: Re: [docs] is there an actual "Getting Started" guide?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 May 2022 15:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2933

On Wed, May 11, 2022 at 4:11 AM Robert P. J. Day <rpjday@crashcourse.ca> wr=
ote:
>
> On Wed, 11 May 2022, Quentin Schulz wrote:
>
> >
> >
> > On 5/11/22 12:41, Robert P. J. Day wrote:
> > > On Wed, 11 May 2022, Quentin Schulz wrote:
> > >
> > >> Hi Robert,
> > >>
> > >> On 5/11/22 12:28, Robert P. J. Day wrote:
> > >>>
> > >>>     was building a fresh ubuntu 22.04 build machine for OE/YP, star=
ting
> > >>> with minimal install to see how much more i would have to add, and
> > >>> got (via sanity.bbclass) a missing module message based on:
> > >>>
> > >>> status.addresult('Your Python 3 is not a full install. Please insta=
ll
> > >>> the module %s (see the Getting Started guide for further
> > >>> information).\n' % e.name)
> > >>>
> > >>>     note the reference to the "Getting Started guide", which does n=
ot
> > >>> seem to exist (anymore?). where *would* one go to resolve an error =
of
> > >>> the form "missing distutils.sysconfig" absent a Getting Started gui=
de?
> > >>>
> > >>
> > >> I think this is what you're after?
> > >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctopro=
ject.org_ref-2Dmanual_system-2Drequirements.html&d=3DDwIBAg&c=3D_sEr5x9kUWh=
uk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172=
IIy1t&m=3DyPuNzagIy_whkBE_pem1x9YQx7w5lvQlVIoLNlaMimJyeWKCJdIPq9TjDyYGWrjs&=
s=3D24h3qNQNp2mMdaiqx5o7n3youEbYKRITx0hwOnd9Mdo&e=3D
> > >>
> > >> If so, please send a patch to update the error code to point to this
> > >> piece of documentation :)
> > >
> > >    i *suspected* it was something like that, just wanted to make sure
> > > there was no "getting started" guide i'd managed to miss all this
> > > time.  will send patch to OE list.
> > >
> >
> > I think it *might* actually be
> > https://docs.yoctoproject.org/dev-manual/start.html.
> >
> > c.f.
> > https://git.yoctoproject.org/yocto-docs/commit/?id=3D028f8f7a1b93a023a9=
9ffadb01b0da699b4081c2
> >
> > Either way, it needs to be fixed :)
>
>   actually, backing up a bit, i think there's a slightly larger
> problem. consider again the snippet from sanity.bbclass:
>
>   # Check the python install is complete. Examples that are often removed=
 in
>   # minimal installations: glib-2.0-natives requries xml.parsers.expat an=
d icu
>   # requires distutils.sysconfig.
>     try:
>         import xml.parsers.expat
>         import distutils.sysconfig
>     except ImportError as e:
>         status.addresult('Your Python 3 is not a full install. Please
>         install the module %s (see the Getting Started guide for
>         further information).\n' % e.name)
>
> seems to me that, regardless of where that snippet sends the reader,
> how to resolve that issue should be explained there, no?
>
>   so one gets "hey, you need to install the module
> distutils.sysconfig'. great. how? if the reader is not a python
> expert, they may not realize the solution on ubuntu 22.04 is:
>
>   $ sudo apt install python3-distutils
>
> how are they supposed to know that? should whatever page they're sent
> to address this? is it simply a matter of adding that package to the
> list of required packages for the various distros?

We have a list of prerequisites and each one is there for a reason,
ideally we should
cite the reason for it to be there but we have not. We could document
it as well although
folks may not be interested in the innards of the problem as you say,
they may be looking for
a solution. So suggesting them to install all prerequisites is a good
first step and list this
under there.

>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2932): https://lists.yoctoproject.org/g/docs/message/=
2932
> Mute This Topic: https://lists.yoctoproject.org/mt/91032448/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

