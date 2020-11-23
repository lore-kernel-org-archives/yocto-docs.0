Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
 by mx.groups.io with SMTP id smtpd.web09.39343.1606153630280952264
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 09:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mPgYgIkB;
 spf=pass (domain: konsulko.com, ip: 209.85.161.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f66.google.com with SMTP id y3so4144268ooq.2
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 09:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R6OnFVamgwPFt+JAPDKNFynMduIszT6yGfzjh0KNi/s=;
        b=mPgYgIkBvxX1tJgTfS124xODkIMWDuVgVRJ564bNEv0Drn1Kx/NZjzilxTHSfTJD8p
         tLd75KxX/z36PSCbz5i1nwgskSyPLabIE0f5X44v7VDEVSIcQ9/uNIdyTfatgnMrKHKl
         xbzJPjJvD3MkDwpUr+MsWwPvIzipw3vSADO1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R6OnFVamgwPFt+JAPDKNFynMduIszT6yGfzjh0KNi/s=;
        b=pEwWVgvqPamdmwulwhS68uvaEBueDyk4Ww60H1gjxm4FsfgXW4b2gKOXcH2gUzWGB6
         RCsFu/KFEWc5E3t201A4OAeL+MLrRCHh+SLXjdujdRgoVBW+QFETsYym/CIJ4Uc2PAz7
         4PmdANulM6OVNyxvaKSWq8KH2brkbDyuCf01Uz8qkBoF7vMqFgqOmwdUHtXqrDVzY4db
         lRCpq+aNXCpFM1j4IBsDe0aEhYJ57xRktW/EvkMZEcuIhUC2tL05s8wJt6V649NteDF2
         YDoxV1/srSCF0lpLRFf1/UOE878HcQ/XOZ5MfWCkVHnvJj+NMkmcYO4qUZEoWhMFAMUC
         xsmg==
X-Gm-Message-State: AOAM532V1zZM0TtJpSM0EarXX8MkpTdusyfpKZUMQOWnk57fUindTH/V
	XtI4DcUHvb5g0XvWFaBXu1dF2ycrv9rO+l+jxFZEdg==
X-Google-Smtp-Source: ABdhPJxVEoHtaadxUEWa++m1ZjEe7b7eXQY7jYHHY4aj8hLS7Zl5yOAc7vlOcFxm1WoZ8ApsUNGRX5spHvwZNun95Jg=
X-Received: by 2002:a4a:a444:: with SMTP id w4mr353581ool.5.1606153629578;
 Mon, 23 Nov 2020 09:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20201118100705.3656-1-pbarker@konsulko.com> <20201118100705.3656-2-pbarker@konsulko.com>
 <CAP71Wjw449WP=VZncMDF5c+GtYYMbAssWMLtYK6E-=3+J8qzaA@mail.gmail.com>
 <CAM9ZRVs8C0uoZOSVEqZ7Es1Az+mbSp-7JfFpKjp7smhcGJaVYg@mail.gmail.com>
 <CAP71WjyJjZGDZZ1_S3iAWrA7ht0snV9XjFU1a2F7Q-uoEdniQA@mail.gmail.com>
 <CAM9ZRVs+-Z4Peu3UTMLcgkcgOF0Ufa072QV8bpU6zixmApZLpw@mail.gmail.com> <CAP71Wjyf+VCiMtnuNFvUi4P1r5mM9FaGh6K__ugsFE5dkVf_Aw@mail.gmail.com>
In-Reply-To: <CAP71Wjyf+VCiMtnuNFvUi4P1r5mM9FaGh6K__ugsFE5dkVf_Aw@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 23 Nov 2020 17:46:58 +0000
Message-ID: <CAM9ZRVszTpZ=k_heNdaFLaWmbp4Cbte=6M5int+jBcqGUKzd0g@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/9] dev-manual-common-tasks: Fix refs to testing branches
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2020 at 16:58, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Mon, Nov 23, 2020 at 5:08 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Mon, 23 Nov 2020 at 16:00, Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > On Mon, Nov 23, 2020 at 4:40 PM Paul Barker <pbarker@konsulko.com> wrote:
> > > >
> > > > On Wed, 18 Nov 2020 at 11:23, Nicolas Dechesne
> > > > <nicolas.dechesne@linaro.org> wrote:
> > > > >
> > > > > On Wed, Nov 18, 2020 at 11:07 AM Paul Barker <pbarker@konsulko.com> wrote:
> > > > > >
> > > > > > After discussions on IRC with Ross we concluded that the `ross/mut`
> > > > > > branch shouldn't really be listed in the docs as it's more of a personal
> > > > > > test branch. Instead we should list the -next branches for
> > > > > > openembedded-core and poky.
> > > > > >
> > > > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > > > ---
> > > > > >  .../dev-manual/dev-manual-common-tasks.rst    | 33 ++++++++++++-------
> > > > > >  1 file changed, 21 insertions(+), 12 deletions(-)
> > > > > >
> > > > > > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > > > index 27aacde60..6f526c203 100644
> > > > > > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > > > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > > > @@ -10665,18 +10665,27 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
> > > > > >  section in the Yocto Project Overview and Concepts Manual for additional
> > > > > >  concepts on working in the Yocto Project development environment.
> > > > > >
> > > > > > -Two commonly used testing repositories exist for OpenEmbedded-Core:
> > > > > > -
> > > > > > --  *"ross/mut" branch:* The "mut" (master-under-test) tree exists in the
> > > > > > -   ``poky-contrib`` repository in the
> > > > > > -   :yocto_git:`Yocto Project source repositories <>`.
> > > > > > -
> > > > > > --  *"master-next" branch:* This branch is part of the main "poky"
> > > > > > -   repository in the Yocto Project source repositories.
> > > > > > -
> > > > > > -Maintainers use these branches to test submissions prior to merging
> > > > > > -patches. Thus, you can get an idea of the status of a patch based on
> > > > > > -whether the patch has been merged into one of these branches.
> > > > > > +Maintainers commonly use ``-next`` branches to test submissions prior to
> > > > > > +merging patches. Thus, you can get an idea of the status of a patch based on
> > > > > > +whether the patch has been merged into one of these branches. The commonly
> > > > > > +used testing branches for OpenEmbedded-Core are as follows:
> > > > > > +
> > > > > > +-  *openembedded-core "master-next" branch:* This branch is part of the
> > > > > > +   :oe_git:`openembedded-core </openembedded-core/>` repository contains
> > > > > > +   proposed changes to the core metadata.
> > > > > > +
> > > > > > +-  *poky "master-next" branch:* This branch is part of the
> > > > > > +   :yocto_git:`poky </cgit/cgit.cgi/poky/>` repository and combines proposed
> > > > > > +   changes to bitbake, the core metadata and the poky distro.
> > > > > > +
> > > > > > +Similarly, stable branches maintained by the project may have corresponding
> > > > > > +``-next`` branches which collect proposed changes. For example,
> > > > > > +``dunfell-next`` and ``gatesgarth-next`` branches in both the
> > > > > > +"openembdedded-core" and "poky" repositories.
> > > > >
> > > > > Perhaps using DISTRO_NAME_NO_CAP and DISTRO_NAME_NO_CAP_MINUS_ONE
> > > > > here, so that the documentation stays 'current' over the years?
> > > > > I think it's a good idea to keep 'dunfell-next' though (since it's
> > > > > LTS), so perhaps we can add DISTRO_NAME_NO_CAP_LTS variable which
> > > > > points to latest LTS, and use it and DISTRO_NAME_NO_CAP here.
> > > >
> > > > I'm making the changes today and I realised this may lead to confusion
> > > > for the next LTS release. How about we define
> > > > DISTRO_NAME_NO_CAP_PREV_LTS and then we can say that it will never be
> > > > equal to DISTRO_NAME_NO_CAP?
> > >
> > > I think we need:
> > >
> > > DISTRO_NAME_NO_CAP : the current release
> > > DISTRO_NAME_NO_CAP_MINUS_ONE : the previous release
> > > DISTRO_NAME_NO_CAP_LTS : the current LTS release (and yes, it might be
> > > DISTRO_NAME_NO_CAP right after an LTS)
> > >
> > > Then we should be able to address pretty much anything we need, no?
> >
> > My only concern here is using DISTRO_NAME_NO_CAP and
> > DISTRO_NAME_NO_CAP_LTS in the same sentence as two examples, it'd be
> > confusing in the future when they may both be the same.
> >
> > Maybe the solution is to just reference one other -next branch as an
> > example here instead of 2.
>
> I agree we should not use both in the same sentence. To me both have
> different uses. In fact we never needed the LTS, because there was
> never an LTS before.. but I suspect we will add more and more snippet
> or sentences which will want to refer to the LTS, so adding it and
> using it appropriately makes sense.
>
> we can keep the 2 regluar one (release and prev release) for now, the
> MINUS_ONE is used a very few places.. but i think it makes sense to
> offer the possibility to refer to the previous release.

Ok cool. I'll send v3 using DISTRO_NAME_NO_CAP and
DISTRO_NAME_NO_CAP_MINUS_ONE here. We can introduce
DISTRO_NAME_NO_CAP_LTS in a separate follow-up patch.

Thanks,

-- 
Paul Barker
Konsulko Group
