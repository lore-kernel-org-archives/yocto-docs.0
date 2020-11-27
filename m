Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web08.21261.1606495359618462662
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2020 08:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xeYJlL9X;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id t33so5054546ybd.0
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2020 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AkhkHh7cCTMW3qpIHvUcT6GpYVZlX8XJO/Paknu+Y7U=;
        b=xeYJlL9XUeYDX28t3rFIjzijIF01lY0SLhICb9MZeDYLGHU3cNia2567vYxfgb6oTO
         WVs7mmOM7dD1e6qqB0JNJIkc9l7Z82bD6viGXoasF/6L4LDBs2pDVJLpXqBl6Vb9Cxyl
         nNyX/0yrx4tSrtj6JXQj9Bm4o0rQrTfyR5L2kvQRORS2njcGyJ6TcQn07z1ftlfgEkki
         z1aYZ9XIUocp/SPcNHBrHYeR9RWq1lZB1EEE7bbvH5o0FJm6C2qaEP3JAv6dMKHI5P/1
         PStxDuxL7b/9mYGHQZACt7eRRBb0r3GU0+nrWACff3nphDkj7NFQotJGzKiQ1U8jbcBF
         jFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AkhkHh7cCTMW3qpIHvUcT6GpYVZlX8XJO/Paknu+Y7U=;
        b=tRaDiImU6wNtRW+ggxuGaown3Fo0cWNJD2MUrZBzzedOC+XlWJYTJ2UQUu+LnhBT+7
         DewMQygdauzWkKijldC4TkvZbNuNNt+DDpdAysZRUVSNHK0CO+mVZGndb3nwFvOuLNPy
         2aFSu4EqqfcwVlaWpmuvgVNKPBZIJc9kiMVNo8battJq2T7EgTAfBGgjYtcByem66cTG
         o45apJaaIubvZakaT5/w+Ys1lkli1VqWU2K88/jaY4G3l51XhxmVhQ+QNunhzb0/2a8Y
         eRgOZyCJtIYzgGOY1ulmfGgU1ha2laR2bcDkkK8uP9J57vNSOg0741RIdpuQZ4qsRERb
         ZFTA==
X-Gm-Message-State: AOAM530yMp6bETIspII+3qmN+rJcNYodLk5YsbHoF3hEb13AkZyx/mQy
	ZAO8c1TgqkxXLnTC+39L1wi6Pd+vk2Przuvksw8iMA==
X-Google-Smtp-Source: ABdhPJy7F+KmcS7IZnKTGaGFMXqBxSAHX2V0omqdDXzkGVy5MCyXgaRzGkSkvLKYnb87qbVty17rdSLv4cJXFajJ54o=
X-Received: by 2002:a25:1e43:: with SMTP id e64mr13459212ybe.273.1606495358691;
 Fri, 27 Nov 2020 08:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20201127151910.6397-1-pbarker@konsulko.com> <20201127151910.6397-2-pbarker@konsulko.com>
 <CAP71Wjz_oOjmQdJobA4bb41WqEMwvoGfVcwB4ACbaBDVxDmPNA@mail.gmail.com> <CAM9ZRVt1Y4Ew83hwRBZ2dgm+TeDXBOm0wMd2Rm5gq99QCnWUOg@mail.gmail.com>
In-Reply-To: <CAM9ZRVt1Y4Ew83hwRBZ2dgm+TeDXBOm0wMd2Rm5gq99QCnWUOg@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 27 Nov 2020 17:42:27 +0100
Message-ID: <CAP71WjzN5xBcFx3dWOFxhgNhYyUocJodB-VBzLsZDED90XMveQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/3] documentation: Simplify yocto_wiki links
To: Paul Barker <pbarker@konsulko.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 5:07 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Fri, 27 Nov 2020 at 15:32, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > hi Paul,
> >
> > On Fri, Nov 27, 2020 at 4:19 PM Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > The `yocto_wiki` external link directive is modified to include the
> > > `/wiki` element of the URL so that we can simplify the links in the
> > > text.
> >
> > thanks for sending these patches!
> >
> > >
> > > Note that there are still a couple of places where this directive
> > > cannot be used, such as in the table of contents in index.rst.
> > >
> > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > ---
> > >  .../brief-yoctoprojectqs/brief-yoctoprojectqs.rst  |  2 +-
> > >  documentation/bsp-guide/bsp.rst                    |  2 +-
> > >  documentation/conf.py                              |  2 +-
> > >  .../dev-manual/dev-manual-common-tasks.rst         | 14 +++++++-------
> > >  documentation/dev-manual/dev-manual-start.rst      |  2 +-
> > >  documentation/kernel-dev/kernel-dev-common.rst     |  4 ++--
> > >  documentation/ref-manual/faq.rst                   |  4 ++--
> > >  documentation/ref-manual/migration-3.2.rst         |  2 +-
> > >  documentation/ref-manual/ref-release-process.rst   |  4 ++--
> > >  .../ref-manual/ref-system-requirements.rst         |  2 +-
> > >  documentation/ref-manual/ref-variables.rst         |  4 ++--
> > >  documentation/ref-manual/resources.rst             |  9 +++++----
> > >  documentation/test-manual/test-manual-intro.rst    |  2 +-
> > >  .../test-manual/test-manual-test-process.rst       |  2 +-
> > >  .../test-manual-understand-autobuilder.rst         |  2 +-
> > >  15 files changed, 29 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> > > index f6d863f5b..8772812eb 100644
> > > --- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> > > +++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
> > > @@ -165,7 +165,7 @@ an entire Linux distribution, including the toolchain, from source.
> > >        infrastructure resources and get that information. A good starting
> > >        point could also be to check your web browser settings. Finally,
> > >        you can find more information on the
> > > -      ":yocto_wiki:`Working Behind a Network Proxy </wiki/Working_Behind_a_Network_Proxy>`"
> > > +      ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
> >
> > Is it possible to get rid of the 'leading' /, so that the links become:
> > :yocto_wiki:`My Awesome Page <My_Awesome_Page>`
> >
> > I remember looking into that initially, but I forgot what's possible..
>
> It's probably possible but I think it'd be confusing unless we make
> the change for every directive in extlinks in conf.py. Changing all
> the directives would be a huge amount of churn for what I think is
> limited benefit.

Fair enough. Especially because I think it rings a bell.. and I
believe I left them for a reason... but I don't remember now.. the
extlinks role is a bit fragile to be honest.. if I had figured out the
poky.yaml before extlinks, I think i would not have used extlinks..

>
> --
> Paul Barker
> Konsulko Group
