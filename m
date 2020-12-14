Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web10.32766.1607944195853524969
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 03:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PLz778FJ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id j12so15343577ota.7
        for <docs@lists.yoctoproject.org>; Mon, 14 Dec 2020 03:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9zBbjeqOrjsR5zZDwDOL8/2XryywYId3kL3Yio3K4EQ=;
        b=PLz778FJCnb8t9urSXmlT9Qp9w5Lkl9TExYgwd3wiB2INbcI+T5HtJJx6bgAa2OlOs
         vruI+8hnjy/k/Z8NKjhI3hIC5J/QKd0wXJMRxBM3P24VRWmgVQy4lO5p1rWObco/SJ35
         9jl5TBvYcev70s+OXEOnFToe34hBbp++q8m3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9zBbjeqOrjsR5zZDwDOL8/2XryywYId3kL3Yio3K4EQ=;
        b=fiQ31FA4vrcdf6tYMSsJpGCSj0HjHhx87KtpQm0lC70zupzR9RbhfxZlw+ackvoKL5
         eJns3uWwg+xtjCDIhVmstQ2NblC+EPhbaRTbgNlYCJHBnm+lOimlt2qaSL/sHA+x9yim
         9FQsR6xVgXCZ8NOeQJJngKCkqLMoK8kNgE4YPPJr+Uw472zp3D48AqfGGTaLkTIpNgcj
         NwZiBOe2iJlpnLjKfmdby3jQA4MC/lDdByLL3GSoUg7bld2I2YNmwNwjkbqV8Z/uJCIH
         1bcGRivG1N/EC2rN1i20S3jbqNyTnO7bjpG0w9el7GZZ2T2FCKAr+w/AtlcDYc8yLHuM
         Dpcw==
X-Gm-Message-State: AOAM532vQzVTQtto+2xIBhFGL+ZrBy4MuFU+aUZ/jaP+bExpoBf98+Se
	4Dj52B9VrRS7DWFVxD5X3HpbPDeDY+rWTlTeF8DpYQ==
X-Google-Smtp-Source: ABdhPJxlqK0V9nW+3RSNHr62aEPP3lPgKosZawqbWSc2zoR+JTUUAVYAtoRhC3NnPR9q8aCNBhUUJn+Htp1eQ1ifCgg=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr19133098otm.305.1607944195072;
 Mon, 14 Dec 2020 03:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20201212203707.7428-1-pbarker@konsulko.com> <20201212203707.7428-3-pbarker@konsulko.com>
 <20201214093557.rtilbhenivneos2s@qschulz>
In-Reply-To: <20201214093557.rtilbhenivneos2s@qschulz>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 14 Dec 2020 11:09:44 +0000
Message-ID: <CAM9ZRVunBWdk26368kWYMEUkPZGpNHV3V3HAq-iYhLRkdqFxZw@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/4] documentation: Simplify remaining yocto_home links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Dec 2020 at 09:36, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Paul,
>
> On Sat, Dec 12, 2020 at 08:37:06PM +0000, Paul Barker wrote:
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  documentation/conf.py                      |  2 +-
> >  documentation/dev-manual/common-tasks.rst  |  4 ++--
> >  documentation/overview-manual/concepts.rst | 15 ++++++---------
> >  documentation/profile-manual/usage.rst     |  5 ++---
> >  4 files changed, 11 insertions(+), 15 deletions(-)
> >
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index 57b9b6fd6..3b198cd06 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -68,7 +68,7 @@ rst_prolog = """
> >
> >  # external links and substitutions
> >  extlinks = {
> > -    'yocto_home': ('https://yoctoproject.org%s', None),
> > +    'yocto_home': ('https://www.yoctoproject.org%s', None),
> >      'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
> >      'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
> >      'yocto_lists': ('https://lists.yoctoproject.org%s', None),
> > diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> > index 79acb8671..30761c3c6 100644
> > --- a/documentation/dev-manual/common-tasks.rst
> > +++ b/documentation/dev-manual/common-tasks.rst
> > @@ -321,7 +321,7 @@ Logo for your layer and application. The process consists of two parts:
> >     successful compatibility registration.
> >
> >  2. Completion of an application acceptance form, which you can find at
> > -   https://www.yoctoproject.org/webform/yocto-project-compatible-registration.
> > +   :yocto_home:`/webform/yocto-project-compatible-registration`.
> >
> >  To be granted permission to use the logo, you need to satisfy the
> >  following:
> > @@ -345,7 +345,7 @@ application, you can use the Yocto Project Compatibility Logo with your
> >  layer and the application that uses your layer.
> >
> >  To access the form, use this link:
> > -https://www.yoctoproject.org/webform/yocto-project-compatible-registration.
> > +:yocto_home:`/webform/yocto-project-compatible-registration`.
> >  Follow the instructions on the form to complete your application.
> >
> >  The application consists of the following sections:
> > diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> > index b51f2a6d1..01c0d5de5 100644
> > --- a/documentation/overview-manual/concepts.rst
> > +++ b/documentation/overview-manual/concepts.rst
> > @@ -141,11 +141,10 @@ hardware-specific configurations allows you to share other metadata by
> >  using a different layer where that metadata might be common across
> >  several pieces of hardware.
> >
> > -Many layers exist that work in the Yocto Project development
> > -environment. The `Yocto Project Curated Layer
> > -Index <https://www.yoctoproject.org/software-overview/layers/>`__
> > -and :oe_layerindex:`OpenEmbedded Layer Index <>`
> > -both contain layers from which you can use or leverage.
> > +Many layers exist that work in the Yocto Project development environment. The
> > +:yocto_home:`Yocto Project Curated Layer Index </software-overview/layers/>`
> > +and :oe_layerindex:`OpenEmbedded Layer Index <>` both contain layers from
> > +which you can use or leverage.
> >
> >  By convention, layers in the Yocto Project follow a specific form.
> >  Conforming to a known structure allows BitBake to make assumptions
> > @@ -2093,10 +2092,8 @@ The capability to run tasks in a fake root environment is known as
> >  the BitBake keyword/variable flag that requests a fake root environment
> >  for a task.
> >
> > -In the :term:`OpenEmbedded Build System`,
> > -the program that
> > -implements fakeroot is known as
> > -`Pseudo <https://www.yoctoproject.org/software-item/pseudo/>`__. Pseudo
> > +In the :term:`OpenEmbedded Build System`, the program that implements
> > +fakeroot is known as :yocto_home:`Pseudo </software-item/pseudo/>`. Pseudo
> >  overrides system calls by using the environment variable ``LD_PRELOAD``,
> >  which results in the illusion of running as root. To keep track of
> >  "fake" file ownership and permissions resulting from operations that
> > diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
> > index 418f4e993..0da408443 100644
> > --- a/documentation/profile-manual/usage.rst
> > +++ b/documentation/profile-manual/usage.rst
> > @@ -1159,9 +1159,8 @@ e.g. 'perf help' or 'perf help record'.
> >
> >  However, by default Yocto doesn't install man pages, but perf invokes
> >  the man pages for most help functionality. This is a bug and is being
> > -addressed by a Yocto bug: `Bug 3388 - perf: enable man pages for basic
> > -'help'
> > -functionality <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3388>`__.
> > +addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for
> > +basic 'help' functionality </show_bug.cgi?id=3388>`.
> >
>
> Can you send a separate patch for this one file's diff please? It's nothing
> to do with :yocto_home:.

Will do.

>
> Also, have you checked that the :yocto_home: URL change didn't break any
> URL? (Execute `make linkcheck` IIRC, it takes some time).

Yes, I tested the changes with `make linkcheck`.

Cheers,

-- 
Paul Barker
Konsulko Group
