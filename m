Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web10.20925.1606493238319998350
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2020 08:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UVfj50K2;
 spf=pass (domain: konsulko.com, ip: 209.85.210.68, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f68.google.com with SMTP id f12so5078732oto.10
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2020 08:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lxRXBo+kyrPTFYBNiJjZYNHo9yd8FNWv5AdAmWSL4Ho=;
        b=UVfj50K2FJmKl3Pgb3ArsPE6IF6SOJdd23BIDBZQ0y99H8FZMHBMLotCd3jEVdsnzI
         ulMhc9Tvwg51l5r4uUC0z2gkx38yQSmwuIbUKIvJ/5ioNskmFOCIVeX4gLWba5VXYVLK
         h8RB1Vh+3WQe/fwKkcTc2xJ+dMzauzICoWNCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lxRXBo+kyrPTFYBNiJjZYNHo9yd8FNWv5AdAmWSL4Ho=;
        b=AuoC2oH4Zn9OGNjVl2rDS+GrlVBMKBE20CVORjtRg/chMEC1eYuKuaq7yMMUmSJBDI
         A/2Q3n7EdLJDKQXUMiux3wx64FMh5KWyqp/2nQLfeAtv34FQS2IUMPgWlPj4EZ05cOvD
         ZM3pINsFRKdEk88EwabCJaDV0Cy13U/p1CCK6qc/kwGJ0YNlBrA7PvQh6OIMYU/CAIkm
         u04PE+p4reZOIGLDE79GiFa0OCZ6n/BzOQkVX8b/1EHz4hN1b/+KMAPFDbc56CmyiGKG
         bifhptr+eltI2hYnOHTTmUvSEGkGGBFDiwYaPJtbZV1xUiRvItY49aaJe38x9FDGcj3Z
         Q3IA==
X-Gm-Message-State: AOAM531SVW9rF92MNlAJ2tQU9FANpu9QgCN3ZQBWKfIgFVVB8A6MmzCk
	4WRe8MSgM+AE9ifqRjRgn5QnMghdml2bf8qjlg2m5w==
X-Google-Smtp-Source: ABdhPJxpbwssW5sJ57qHbUqPvPUS2eMhQeKjj+8dHEE3HJ7DhrZ6Rychaj4U74WxHmfaAWXGSjIaJM09shsjLXmrBw4=
X-Received: by 2002:a05:6830:831:: with SMTP id t17mr6899084ots.92.1606493237310;
 Fri, 27 Nov 2020 08:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20201127151910.6397-1-pbarker@konsulko.com> <20201127151910.6397-2-pbarker@konsulko.com>
 <CAP71Wjz_oOjmQdJobA4bb41WqEMwvoGfVcwB4ACbaBDVxDmPNA@mail.gmail.com>
In-Reply-To: <CAP71Wjz_oOjmQdJobA4bb41WqEMwvoGfVcwB4ACbaBDVxDmPNA@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 27 Nov 2020 16:07:06 +0000
Message-ID: <CAM9ZRVt1Y4Ew83hwRBZ2dgm+TeDXBOm0wMd2Rm5gq99QCnWUOg@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/3] documentation: Simplify yocto_wiki links
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Nov 2020 at 15:32, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hi Paul,
>
> On Fri, Nov 27, 2020 at 4:19 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > The `yocto_wiki` external link directive is modified to include the
> > `/wiki` element of the URL so that we can simplify the links in the
> > text.
>
> thanks for sending these patches!
>
> >
> > Note that there are still a couple of places where this directive
> > cannot be used, such as in the table of contents in index.rst.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  .../brief-yoctoprojectqs/brief-yoctoprojectqs.rst  |  2 +-
> >  documentation/bsp-guide/bsp.rst                    |  2 +-
> >  documentation/conf.py                              |  2 +-
> >  .../dev-manual/dev-manual-common-tasks.rst         | 14 +++++++-------
> >  documentation/dev-manual/dev-manual-start.rst      |  2 +-
> >  documentation/kernel-dev/kernel-dev-common.rst     |  4 ++--
> >  documentation/ref-manual/faq.rst                   |  4 ++--
> >  documentation/ref-manual/migration-3.2.rst         |  2 +-
> >  documentation/ref-manual/ref-release-process.rst   |  4 ++--
> >  .../ref-manual/ref-system-requirements.rst         |  2 +-
> >  documentation/ref-manual/ref-variables.rst         |  4 ++--
> >  documentation/ref-manual/resources.rst             |  9 +++++----
> >  documentation/test-manual/test-manual-intro.rst    |  2 +-
> >  .../test-manual/test-manual-test-process.rst       |  2 +-
> >  .../test-manual-understand-autobuilder.rst         |  2 +-
> >  15 files changed, 29 insertions(+), 28 deletions(-)
> >
> > diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> > index f6d863f5b..8772812eb 100644
> > --- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> > +++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> > @@ -165,7 +165,7 @@ an entire Linux distribution, including the toolchain, from source.
> >        infrastructure resources and get that information. A good starting
> >        point could also be to check your web browser settings. Finally,
> >        you can find more information on the
> > -      ":yocto_wiki:`Working Behind a Network Proxy </wiki/Working_Behind_a_Network_Proxy>`"
> > +      ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
>
> Is it possible to get rid of the 'leading' /, so that the links become:
> :yocto_wiki:`My Awesome Page <My_Awesome_Page>`
>
> I remember looking into that initially, but I forgot what's possible..

It's probably possible but I think it'd be confusing unless we make
the change for every directive in extlinks in conf.py. Changing all
the directives would be a huge amount of churn for what I think is
limited benefit.

-- 
Paul Barker
Konsulko Group
