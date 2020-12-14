Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web09.33079.1607943237495221065
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 02:53:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lmF6BAkw;
 spf=pass (domain: konsulko.com, ip: 209.85.167.193, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f193.google.com with SMTP id d27so18751551oic.0
        for <docs@lists.yoctoproject.org>; Mon, 14 Dec 2020 02:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2V0Cf2MvaAnBec1hd4ktjORNPwYolb0kQ4scBELIig=;
        b=lmF6BAkwZasuvftsntBdsvy9aQNTSJHsKFCfyra3ICUdpNdVOcPEmL9GzkAfY5wntP
         4y9O/Jq+UuheHhw6vlz26MU0SIKO7UvwEcuYdwbJlITOWdbvkEdhrpK3qFw//+p5GhlF
         KFQqUZpTy6x9QPXcqsEUcJ1TDKQrrGzSyziQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2V0Cf2MvaAnBec1hd4ktjORNPwYolb0kQ4scBELIig=;
        b=U9Mpi/hx7jQtDEJWG6dWWPP4UlM/CxAmuUhFe+ZBYTslxlG9uvCS7S78gE57HrGx/g
         ckM4S7hHWRDUaeiSyvMqSBM9e/pWKpqUAluFilXYePW67bvsSeRMa+Uye633fX8uY49w
         BdlGTziTmBT7rsmwMu8cWeekMgJ8mXSTVK+sNavUeTLiX1JJalZVPoyC67HQ06CS3JXp
         1594In5tJ1lUoD3oFsbOQA3mAMdr0MBBMZ+s75wIkaGVwp1vc03JKLFomZLxfYwObw/3
         jAdzwzvadCEb9Knf5YyKSy/ExB/N/ZNEHjXRlShh+9Ec8dcOLh+cI+FHN2oLf7+N/6cZ
         MRLA==
X-Gm-Message-State: AOAM531Z4TfVUX/ZmoIIH4Kw8dWKEcKBkM7C3TMw/1+/Gfs7bSDyYCM8
	0ClyqTkHIDbd9X6rYlWTnua3v68uCLtyNpVzzFNoKQ==
X-Google-Smtp-Source: ABdhPJxITt/efLBkq95i80mcb9oIyWuYzxw9J5aGNzauqKnvtajKm4g4rk1b0/f5dRz8ytVDnFzLp7XZtmKew04DShM=
X-Received: by 2002:aca:bf0b:: with SMTP id p11mr12810490oif.6.1607943236852;
 Mon, 14 Dec 2020 02:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20201212203707.7428-1-pbarker@konsulko.com> <20201212203707.7428-4-pbarker@konsulko.com>
 <20201214094519.qqfadyj2rf5xmr4k@qschulz>
In-Reply-To: <20201214094519.qqfadyj2rf5xmr4k@qschulz>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 14 Dec 2020 10:53:46 +0000
Message-ID: <CAM9ZRVv5UOYDAJJWuW7Pdwpb1n2FNMiO9BtPTro+-HYDjaBjhw@mail.gmail.com>
Subject: Re: [docs] [PATCH 4/4] documentation: Use https links where possible
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Dec 2020 at 09:45, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Paul,
>
> On Sat, Dec 12, 2020 at 08:37:07PM +0000, Paul Barker wrote:
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  documentation/README                          |  8 ++--
> >  documentation/boilerplate.rst                 |  2 +-
> >  documentation/brief-yoctoprojectqs/index.rst  |  2 +-
> >  documentation/dev-manual/common-tasks.rst     |  2 +-
> >  .../development-environment.rst               | 22 +++++-----
> >  documentation/overview-manual/yp-intro.rst    |  4 +-
> >  documentation/profile-manual/usage.rst        | 44 +++++++++----------
> >  documentation/ref-manual/classes.rst          |  4 +-
> >  documentation/ref-manual/faq.rst              |  6 +--
> >  documentation/ref-manual/images.rst           |  4 +-
> >  documentation/ref-manual/kickstart.rst        |  4 +-
> >  documentation/ref-manual/migration-2.1.rst    |  2 +-
> >  documentation/ref-manual/migration-2.2.rst    |  2 +-
> >  documentation/ref-manual/migration-2.3.rst    |  2 +-
> >  documentation/ref-manual/migration-2.7.rst    |  2 +-
> >  documentation/ref-manual/qa-checks.rst        |  2 +-
> >  documentation/ref-manual/resources.rst        |  4 +-
> >  documentation/ref-manual/variables.rst        | 20 ++++-----
> >  documentation/sdk-manual/intro.rst            |  2 +-
> >  documentation/toaster-manual/reference.rst    |  4 +-
> >  20 files changed, 71 insertions(+), 71 deletions(-)
> >
> > diff --git a/documentation/README b/documentation/README
> > index b0a3cb1dc..be03bb119 100644
> > --- a/documentation/README
> > +++ b/documentation/README
> > @@ -2,7 +2,7 @@ documentation
> >  =============
> >
> >  This is the directory that contains the Yocto Project documentation.  The Yocto
> > -Project source repositories at http://git.yoctoproject.org/cgit.cgi have two
> > +Project source repositories at https://git.yoctoproject.org/cgit.cgi have two
> >  instances of the "documentation" directory.  You should understand each of
> >  these instances.
> >
> > @@ -47,12 +47,12 @@ Folders exist for individual manuals as follows:
> >  Each folder is self-contained regarding content and figures.
> >
> >  If you want to find HTML versions of the Yocto Project manuals on the web,
> > -go to http://www.yoctoproject.org and click on the "Documentation" tab.  From
> > +go to https://www.yoctoproject.org and click on the "Documentation" tab.  From
>
> :yocto_home:`<>`?

This can't be used in the README file as it's not an rst document. It
also needs to be understandable for someone viewing it in plain text.

>
> >  there you have access to archived documentation from previous releases, current
> >  documentation for the latest release, and "Docs in Progress" for the release
> >  currently being developed.
> >
> > -In general, the Yocto Project site (http://www.yoctoproject.org) is a great
> > +In general, the Yocto Project site (https://www.yoctoproject.org) is a great
>
> Ditto.

As above.

>
> >  reference for both information and downloads.
> >
> >  poky.yaml
> > @@ -228,7 +228,7 @@ content:
> >
> >  Variables can be nested, like it was the case for DocBook:
> >
> > -  YOCTO_HOME_URL : "http://www.yoctoproject.org"
> > +  YOCTO_HOME_URL : "https://www.yoctoproject.org"
>
> Ditto.

As above.

>
> [...]
> > diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> > index 4da55a83d..0ec7e2b96 100644
> > --- a/documentation/overview-manual/yp-intro.rst
> > +++ b/documentation/overview-manual/yp-intro.rst
> > @@ -368,7 +368,7 @@ activities using the Yocto Project:
> >
> >  -  *Patchwork:* `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`__
>
> This is a broken link (was wondering why you didn't switch it to https).
> Might want to contact ozlabs about that since they still point to this
> link on patchwork.ozlabs.org (footer).

That's outside the scope of this patch but yes that would be a good follow up.

>
> [...]
> > diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
> > index ac247dce4..558a0ad45 100644
> > --- a/documentation/ref-manual/migration-2.2.rst
> > +++ b/documentation/ref-manual/migration-2.2.rst
> > @@ -29,7 +29,7 @@ introduces the new :term:`SYSROOT_DIRS`,
> >  :term:`SYSROOT_DIRS_NATIVE`, and
> >  :term:`SYSROOT_DIRS_BLACKLIST`. See the
> >  `v2 patch series on the OE-Core Mailing
> > -List <http://lists.openembedded.org/pipermail/openembedded-core/2016-May/121365.html>`__
> > +List <https://lists.openembedded.org/pipermail/openembedded-core/2016-May/121365.html>`__
>
> :oe_lists:`/pipermail/openembedded-core/2016-May/121365.html`?

I'll fix this one and send a v2.

Thanks,

-- 
Paul Barker
Konsulko Group
