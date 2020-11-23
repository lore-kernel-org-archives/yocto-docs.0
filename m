Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web10.36843.1606147244550450221
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 08:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AO0yz6Rd;
 spf=pass (domain: linaro.org, ip: 209.85.219.193, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f193.google.com with SMTP id s8so16343196yba.13
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 08:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vp0g8IJnERePgfddMuvGgBmZfQR15vfrymQxsyyB8tE=;
        b=AO0yz6RdUWU3KbIU4d765xtF3XppDwwV3UeOocbPH7u3eytXjyofYLsJ/aPpvRpvfU
         vxeo/xwnX4NXFYuAY5DfR/CiGxzMm6+aWHOjjUsClZpMlmXQf7P2lBkW36FDZR6PqETv
         itoTy70aneQW3yTQwxSapugNgj9lUTnpttshG4ANJFPGt3hw6KPzthMJh9ynQjMTdqNf
         LfOTtkJd+PKqx+kCURKMW1edeIsboWT6MQrNkCFBp2w+tq/uRk2eE8eJpB8hSGwXoIw4
         VBhVlcRTw6nfPGtIL0Hoq3qq8tPwDnHvmlC8bKbwzGpt8mZPn0SsHLqgOoUj/ZCh8WwO
         ukIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vp0g8IJnERePgfddMuvGgBmZfQR15vfrymQxsyyB8tE=;
        b=MKL7Q2MQWnjW8TibtzWNUm4OfW1rMLZCrdIi7CEnYiEJTZxzvtywQzKKjqSM87Y8/A
         pafrpOjEQ3th0h8L3+A6QiC6fIAyjSXTBVdh69YDhz16k6a4hApsec7W2t5g7M1rghm1
         QVLu4yPaxgWfQJcSbAlZvQCtERolwSqQxl/cyFhacokSYwGXmhHi9qOxhp2vKrnWJnaG
         t3x3lrKUOyWkc/qdhJl7b6MtQ0pncOjiTOb3jUIjOnTbHQtVC40/GDIOLoPzAEubiff1
         Xj7eY0v05Lo3IcDaWZyih1CjBNF69y+JYRHO7xcAmSh7N3+e3ccqIhEoZ/9xdM/fXN80
         JCdQ==
X-Gm-Message-State: AOAM5338jet3z4OAmt3g05z435W8NLpNkvWquHh5K9p/mY8ZDMO3HaHV
	FrVyqSkXqOWZUcB1bKe4iOcA5dwnYORXufmnhWmGeA==
X-Google-Smtp-Source: ABdhPJyUhwx/PL8Mwl54ngo88NvyG8JNcy5oeYtZlLzob98uJKg3RGmrsZln7vJxwKhIDQZutLCv32Ac02S6uQS/v9c=
X-Received: by 2002:a25:bcc6:: with SMTP id l6mr36297ybm.475.1606147243467;
 Mon, 23 Nov 2020 08:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20201118100705.3656-1-pbarker@konsulko.com> <20201118100705.3656-2-pbarker@konsulko.com>
 <CAP71Wjw449WP=VZncMDF5c+GtYYMbAssWMLtYK6E-=3+J8qzaA@mail.gmail.com> <CAM9ZRVs8C0uoZOSVEqZ7Es1Az+mbSp-7JfFpKjp7smhcGJaVYg@mail.gmail.com>
In-Reply-To: <CAM9ZRVs8C0uoZOSVEqZ7Es1Az+mbSp-7JfFpKjp7smhcGJaVYg@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 23 Nov 2020 17:00:32 +0100
Message-ID: <CAP71WjyJjZGDZZ1_S3iAWrA7ht0snV9XjFU1a2F7Q-uoEdniQA@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/9] dev-manual-common-tasks: Fix refs to testing branches
To: Paul Barker <pbarker@konsulko.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 4:40 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Wed, 18 Nov 2020 at 11:23, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > On Wed, Nov 18, 2020 at 11:07 AM Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > After discussions on IRC with Ross we concluded that the `ross/mut`
> > > branch shouldn't really be listed in the docs as it's more of a personal
> > > test branch. Instead we should list the -next branches for
> > > openembedded-core and poky.
> > >
> > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > ---
> > >  .../dev-manual/dev-manual-common-tasks.rst    | 33 ++++++++++++-------
> > >  1 file changed, 21 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > index 27aacde60..6f526c203 100644
> > > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > @@ -10665,18 +10665,27 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
> > >  section in the Yocto Project Overview and Concepts Manual for additional
> > >  concepts on working in the Yocto Project development environment.
> > >
> > > -Two commonly used testing repositories exist for OpenEmbedded-Core:
> > > -
> > > --  *"ross/mut" branch:* The "mut" (master-under-test) tree exists in the
> > > -   ``poky-contrib`` repository in the
> > > -   :yocto_git:`Yocto Project source repositories <>`.
> > > -
> > > --  *"master-next" branch:* This branch is part of the main "poky"
> > > -   repository in the Yocto Project source repositories.
> > > -
> > > -Maintainers use these branches to test submissions prior to merging
> > > -patches. Thus, you can get an idea of the status of a patch based on
> > > -whether the patch has been merged into one of these branches.
> > > +Maintainers commonly use ``-next`` branches to test submissions prior to
> > > +merging patches. Thus, you can get an idea of the status of a patch based on
> > > +whether the patch has been merged into one of these branches. The commonly
> > > +used testing branches for OpenEmbedded-Core are as follows:
> > > +
> > > +-  *openembedded-core "master-next" branch:* This branch is part of the
> > > +   :oe_git:`openembedded-core </openembedded-core/>` repository contains
> > > +   proposed changes to the core metadata.
> > > +
> > > +-  *poky "master-next" branch:* This branch is part of the
> > > +   :yocto_git:`poky </cgit/cgit.cgi/poky/>` repository and combines proposed
> > > +   changes to bitbake, the core metadata and the poky distro.
> > > +
> > > +Similarly, stable branches maintained by the project may have corresponding
> > > +``-next`` branches which collect proposed changes. For example,
> > > +``dunfell-next`` and ``gatesgarth-next`` branches in both the
> > > +"openembdedded-core" and "poky" repositories.
> >
> > Perhaps using DISTRO_NAME_NO_CAP and DISTRO_NAME_NO_CAP_MINUS_ONE
> > here, so that the documentation stays 'current' over the years?
> > I think it's a good idea to keep 'dunfell-next' though (since it's
> > LTS), so perhaps we can add DISTRO_NAME_NO_CAP_LTS variable which
> > points to latest LTS, and use it and DISTRO_NAME_NO_CAP here.
>
> I'm making the changes today and I realised this may lead to confusion
> for the next LTS release. How about we define
> DISTRO_NAME_NO_CAP_PREV_LTS and then we can say that it will never be
> equal to DISTRO_NAME_NO_CAP?

I think we need:

DISTRO_NAME_NO_CAP : the current release
DISTRO_NAME_NO_CAP_MINUS_ONE : the previous release
DISTRO_NAME_NO_CAP_LTS : the current LTS release (and yes, it might be
DISTRO_NAME_NO_CAP right after an LTS)

Then we should be able to address pretty much anything we need, no?
Perhaps we can add DISTRO_NAME_NO_CAP_LTS_PREV eventually..


>
> --
> Paul Barker
> Konsulko Group
