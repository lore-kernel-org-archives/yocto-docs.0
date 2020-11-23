Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web08.36934.1606146008482581901
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 07:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bdU0wp8s;
 spf=pass (domain: konsulko.com, ip: 209.85.210.65, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f65.google.com with SMTP id n12so12764943otk.0
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 07:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5GtG0Ld0jVEjjqq7mVwNqJf0Fndpf4cC0kXfZfUMoZc=;
        b=bdU0wp8sQvBrNnSyD930aly1zvkpzrqz0T2B6V+7XvHw0l+MJBTIrwRkiw42lGdONW
         cKWVt8ML4rgQDdnODqR1O2zqOrdZCKDJAn39l8gr1b7asUMR+mzCfG10VtSW68sEEsq6
         Gr9g6nLj4lstyTAHCnCBsBc7UXcv1R8Qqkimo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5GtG0Ld0jVEjjqq7mVwNqJf0Fndpf4cC0kXfZfUMoZc=;
        b=Vr92qmzELskQLqus65triEU/u84+cOzIgGAg2/jffWDfTANZMb9MRuM2Wh1knH0I9P
         +wJapmR58cDupi2kciilLLrZoaOM1E17IUcb26jzj7yulBkRW+iYRmm0vCDYnirWM3Cn
         2ptnOOyQrw0x9SoztlBfIW3qRkEjqBfDgdUGffOCfJBh+0RRuMEnIvhFQuUYcxwptKER
         FTUL7vskdDie6LuZfeLc6yyfjZPUHPDGtOuXIIQFRgtMkNXHktGFeJxlS3+CxqWyynMB
         WwEQ97arjMIvv0ndvgymukhSIvpUg6iLFIIAkbAQwqZsV5G7SQavLnuUCTrKjQsDWwXQ
         LAPg==
X-Gm-Message-State: AOAM531TQj3SFBLXVka5HgXUIUUZYANL1IhtadZR6aZ047rf0+YWNFfa
	3mGjqQMhQu33javFJ1ykXenbazjhfB0w5LknDqvdHw==
X-Google-Smtp-Source: ABdhPJyTgI8eqWLaYJR934yZgCVcw8FJOs9M196IxzeR0yZhy2QPaWF69Np5jIqlRhQq3jFz3QVYXzq9ZLtHV8JOb7I=
X-Received: by 2002:a05:6830:1b66:: with SMTP id d6mr24605175ote.258.1606146007752;
 Mon, 23 Nov 2020 07:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20201118100705.3656-1-pbarker@konsulko.com> <20201118100705.3656-2-pbarker@konsulko.com>
 <CAP71Wjw449WP=VZncMDF5c+GtYYMbAssWMLtYK6E-=3+J8qzaA@mail.gmail.com>
In-Reply-To: <CAP71Wjw449WP=VZncMDF5c+GtYYMbAssWMLtYK6E-=3+J8qzaA@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 23 Nov 2020 15:39:57 +0000
Message-ID: <CAM9ZRVs8C0uoZOSVEqZ7Es1Az+mbSp-7JfFpKjp7smhcGJaVYg@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/9] dev-manual-common-tasks: Fix refs to testing branches
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2020 at 11:23, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Wed, Nov 18, 2020 at 11:07 AM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > After discussions on IRC with Ross we concluded that the `ross/mut`
> > branch shouldn't really be listed in the docs as it's more of a personal
> > test branch. Instead we should list the -next branches for
> > openembedded-core and poky.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  .../dev-manual/dev-manual-common-tasks.rst    | 33 ++++++++++++-------
> >  1 file changed, 21 insertions(+), 12 deletions(-)
> >
> > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> > index 27aacde60..6f526c203 100644
> > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > @@ -10665,18 +10665,27 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
> >  section in the Yocto Project Overview and Concepts Manual for additional
> >  concepts on working in the Yocto Project development environment.
> >
> > -Two commonly used testing repositories exist for OpenEmbedded-Core:
> > -
> > --  *"ross/mut" branch:* The "mut" (master-under-test) tree exists in the
> > -   ``poky-contrib`` repository in the
> > -   :yocto_git:`Yocto Project source repositories <>`.
> > -
> > --  *"master-next" branch:* This branch is part of the main "poky"
> > -   repository in the Yocto Project source repositories.
> > -
> > -Maintainers use these branches to test submissions prior to merging
> > -patches. Thus, you can get an idea of the status of a patch based on
> > -whether the patch has been merged into one of these branches.
> > +Maintainers commonly use ``-next`` branches to test submissions prior to
> > +merging patches. Thus, you can get an idea of the status of a patch based on
> > +whether the patch has been merged into one of these branches. The commonly
> > +used testing branches for OpenEmbedded-Core are as follows:
> > +
> > +-  *openembedded-core "master-next" branch:* This branch is part of the
> > +   :oe_git:`openembedded-core </openembedded-core/>` repository contains
> > +   proposed changes to the core metadata.
> > +
> > +-  *poky "master-next" branch:* This branch is part of the
> > +   :yocto_git:`poky </cgit/cgit.cgi/poky/>` repository and combines proposed
> > +   changes to bitbake, the core metadata and the poky distro.
> > +
> > +Similarly, stable branches maintained by the project may have corresponding
> > +``-next`` branches which collect proposed changes. For example,
> > +``dunfell-next`` and ``gatesgarth-next`` branches in both the
> > +"openembdedded-core" and "poky" repositories.
>
> Perhaps using DISTRO_NAME_NO_CAP and DISTRO_NAME_NO_CAP_MINUS_ONE
> here, so that the documentation stays 'current' over the years?
> I think it's a good idea to keep 'dunfell-next' though (since it's
> LTS), so perhaps we can add DISTRO_NAME_NO_CAP_LTS variable which
> points to latest LTS, and use it and DISTRO_NAME_NO_CAP here.

I'm making the changes today and I realised this may lead to confusion
for the next LTS release. How about we define
DISTRO_NAME_NO_CAP_PREV_LTS and then we can say that it will never be
equal to DISTRO_NAME_NO_CAP?

-- 
Paul Barker
Konsulko Group
