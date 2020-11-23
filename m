Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web10.36943.1606147690762968484
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 08:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jJtLx+tg;
 spf=pass (domain: konsulko.com, ip: 209.85.210.65, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f65.google.com with SMTP id n11so16374386ota.2
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 08:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/8YJ4u7t+F2IlZ4Mgv8sFr9t1XA6PEj9Ckv4jCjYsFI=;
        b=jJtLx+tgCUCsamef0LzzuYvqZHkImmK33Da0AQN9je4JDjb2MuoGpUpQFveywew/uf
         O3o7wulwtvDARvpLzDmTaAkTcZlfvQEJYBT+csSLzahRctcMkvFP+roRwz5RNZCli3qj
         uPeorWDEq5pGm90CYBN4gDSnmdPK6z6ioFYJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/8YJ4u7t+F2IlZ4Mgv8sFr9t1XA6PEj9Ckv4jCjYsFI=;
        b=I8GwRRBtiNLNrO6Y6kQbgIeaRV/PLVS2CdrsmyadOfn1QvOfsCOt0XoneVydMVTx6t
         YRaTZN5nv0TKB8Fb7p042MkF27z4oW0ntkKrn5ipBLzF481j3S2n/VJGoUBudwrAQzWr
         aIhkiEBVf0Nf94lr29skzMJPmVUpnHOblIMl2AWBAQp40Ca0f/oIDn4mNrFYKksRA5a1
         v9wvwnP6gY6OBTis3/D5yCMGwExa9jmvebVanesr1lk4K/07HhppcEvmW8wJqlCBEKvQ
         ZSzfKDtyxILXDncBhuAaMwzWCrgGQFJAznTQiui+x5Qqc7X2DN8ozzr7ZZrH7anumF5+
         6h0Q==
X-Gm-Message-State: AOAM532rFlX6HJeaFD6QuIql4hCtvG0tTbOGXjVpKid2dv/AKvI0M6ri
	Am4ZiAbjnnZ8PuW0RQ04HnkYHGUDM9evOj6J8EdE7g==
X-Google-Smtp-Source: ABdhPJzTZf5VU4FrE+pk/hAhum9lRuBIKDV1n/SHszh32v09VaYawSw12f44SGuoxTlmjMXTnLhnVR6dsapwQUxN24o=
X-Received: by 2002:a05:6830:831:: with SMTP id t17mr17928ots.92.1606147690001;
 Mon, 23 Nov 2020 08:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20201118100705.3656-1-pbarker@konsulko.com> <20201118100705.3656-2-pbarker@konsulko.com>
 <CAP71Wjw449WP=VZncMDF5c+GtYYMbAssWMLtYK6E-=3+J8qzaA@mail.gmail.com>
 <CAM9ZRVs8C0uoZOSVEqZ7Es1Az+mbSp-7JfFpKjp7smhcGJaVYg@mail.gmail.com> <CAP71WjyJjZGDZZ1_S3iAWrA7ht0snV9XjFU1a2F7Q-uoEdniQA@mail.gmail.com>
In-Reply-To: <CAP71WjyJjZGDZZ1_S3iAWrA7ht0snV9XjFU1a2F7Q-uoEdniQA@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 23 Nov 2020 16:07:59 +0000
Message-ID: <CAM9ZRVs+-Z4Peu3UTMLcgkcgOF0Ufa072QV8bpU6zixmApZLpw@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/9] dev-manual-common-tasks: Fix refs to testing branches
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2020 at 16:00, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Mon, Nov 23, 2020 at 4:40 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Wed, 18 Nov 2020 at 11:23, Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > On Wed, Nov 18, 2020 at 11:07 AM Paul Barker <pbarker@konsulko.com> wrote:
> > > >
> > > > After discussions on IRC with Ross we concluded that the `ross/mut`
> > > > branch shouldn't really be listed in the docs as it's more of a personal
> > > > test branch. Instead we should list the -next branches for
> > > > openembedded-core and poky.
> > > >
> > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > ---
> > > >  .../dev-manual/dev-manual-common-tasks.rst    | 33 ++++++++++++-------
> > > >  1 file changed, 21 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > index 27aacde60..6f526c203 100644
> > > > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > @@ -10665,18 +10665,27 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
> > > >  section in the Yocto Project Overview and Concepts Manual for additional
> > > >  concepts on working in the Yocto Project development environment.
> > > >
> > > > -Two commonly used testing repositories exist for OpenEmbedded-Core:
> > > > -
> > > > --  *"ross/mut" branch:* The "mut" (master-under-test) tree exists in the
> > > > -   ``poky-contrib`` repository in the
> > > > -   :yocto_git:`Yocto Project source repositories <>`.
> > > > -
> > > > --  *"master-next" branch:* This branch is part of the main "poky"
> > > > -   repository in the Yocto Project source repositories.
> > > > -
> > > > -Maintainers use these branches to test submissions prior to merging
> > > > -patches. Thus, you can get an idea of the status of a patch based on
> > > > -whether the patch has been merged into one of these branches.
> > > > +Maintainers commonly use ``-next`` branches to test submissions prior to
> > > > +merging patches. Thus, you can get an idea of the status of a patch based on
> > > > +whether the patch has been merged into one of these branches. The commonly
> > > > +used testing branches for OpenEmbedded-Core are as follows:
> > > > +
> > > > +-  *openembedded-core "master-next" branch:* This branch is part of the
> > > > +   :oe_git:`openembedded-core </openembedded-core/>` repository contains
> > > > +   proposed changes to the core metadata.
> > > > +
> > > > +-  *poky "master-next" branch:* This branch is part of the
> > > > +   :yocto_git:`poky </cgit/cgit.cgi/poky/>` repository and combines proposed
> > > > +   changes to bitbake, the core metadata and the poky distro.
> > > > +
> > > > +Similarly, stable branches maintained by the project may have corresponding
> > > > +``-next`` branches which collect proposed changes. For example,
> > > > +``dunfell-next`` and ``gatesgarth-next`` branches in both the
> > > > +"openembdedded-core" and "poky" repositories.
> > >
> > > Perhaps using DISTRO_NAME_NO_CAP and DISTRO_NAME_NO_CAP_MINUS_ONE
> > > here, so that the documentation stays 'current' over the years?
> > > I think it's a good idea to keep 'dunfell-next' though (since it's
> > > LTS), so perhaps we can add DISTRO_NAME_NO_CAP_LTS variable which
> > > points to latest LTS, and use it and DISTRO_NAME_NO_CAP here.
> >
> > I'm making the changes today and I realised this may lead to confusion
> > for the next LTS release. How about we define
> > DISTRO_NAME_NO_CAP_PREV_LTS and then we can say that it will never be
> > equal to DISTRO_NAME_NO_CAP?
>
> I think we need:
>
> DISTRO_NAME_NO_CAP : the current release
> DISTRO_NAME_NO_CAP_MINUS_ONE : the previous release
> DISTRO_NAME_NO_CAP_LTS : the current LTS release (and yes, it might be
> DISTRO_NAME_NO_CAP right after an LTS)
>
> Then we should be able to address pretty much anything we need, no?

My only concern here is using DISTRO_NAME_NO_CAP and
DISTRO_NAME_NO_CAP_LTS in the same sentence as two examples, it'd be
confusing in the future when they may both be the same.

Maybe the solution is to just reference one other -next branch as an
example here instead of 2.

-- 
Paul Barker
Konsulko Group
