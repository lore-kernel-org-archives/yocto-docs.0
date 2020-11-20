Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.24485.1605874387477446767
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 04:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mA784wO3;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id 79so8475358otc.7
        for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2020 04:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bYNy9lfsRA3ZpHyrFaKYSe37N76S7O0NkiDnIiRHv7Q=;
        b=mA784wO3S3bBZCRU7F05EZtZFLj3CKqmDMo7QpUddtfEyO+sAPpYKzvkaiKBrYy9Vk
         LWpGCEPY9Hs3mL0WDcYjKsyh9WFbvZ7YJbO/pmotj7DpRmTTdPfslKVPfOmcAY0B7W0w
         A1yD6zrgjvSt/j3NN2b1PttwwzZ0tbUnrGkTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bYNy9lfsRA3ZpHyrFaKYSe37N76S7O0NkiDnIiRHv7Q=;
        b=aVE/xAE/dhiNtqjqDXphJBfF1CA159tOj+hgi1b4pfibpo8n3ySPqCJseY34L/KnhH
         1rcjpEolE9ZTK1hpsiQf9M7GzkG4LAKw7AIUX8zFOh36zQYHgOBOvrROVBkbE9rpj4a8
         FnHQFH3wejWHPGog20Cyx/w+MvzMwkSMofHSPTf24Dbei6F+R1CiNaGhTitijgRzJ/51
         j9kG2VLiF5oUhD6l4ABXdx1qgPN8u3QMKlqIzjfKwuetfKoyHexJsUbk55Us+NevF8AX
         smk5i6MH854jRzb1j5vvOS9t4WhmcBNJ0p0t53JMgcx1fOCbh4TjuhG2NEO/DZh47Cq4
         Iupg==
X-Gm-Message-State: AOAM532U8yS1lnQ0o9C7WHEuBlj6ZMtR1GP2Ihx+rZerZPAuZTEGrMA8
	T3il+ybvQs268tha3z9x0Tp+TiwuHFKAdb/FUKbT3w==
X-Google-Smtp-Source: ABdhPJx3pme60C5UEgrBFIh5lpBu7VpKbP/IIBP0AziN04oBtOxY5L9bAdeld3OfMx1zHl4T3hYMOWmU9Hd2tKT3Ia0=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr12296140otc.305.1605874386768;
 Fri, 20 Nov 2020 04:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20201118100705.3656-1-pbarker@konsulko.com> <20201118100705.3656-2-pbarker@konsulko.com>
 <CAP71Wjw449WP=VZncMDF5c+GtYYMbAssWMLtYK6E-=3+J8qzaA@mail.gmail.com>
In-Reply-To: <CAP71Wjw449WP=VZncMDF5c+GtYYMbAssWMLtYK6E-=3+J8qzaA@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 20 Nov 2020 12:12:56 +0000
Message-ID: <CAM9ZRVswvBwxh+-yf8vYNnypfjsQC+RncoyHvw+Nvh7Wu671vw@mail.gmail.com>
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

I spotted a missed word here, it should be "and contains".

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

I agree it's worth changing these, I'll send a v3.

-- 
Paul Barker
Konsulko Group
