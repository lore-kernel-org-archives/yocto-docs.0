Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web11.21876.1605690580091142851
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 01:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jEssgNzK;
 spf=pass (domain: konsulko.com, ip: 209.85.167.196, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f196.google.com with SMTP id c80so1460430oib.2
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 01:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAQoXH+pZbMwpvsIB1V0y8sXQX2+52OeQ3q69dVbPn4=;
        b=jEssgNzK6TA4vTRCPP5bA5nNyy1+GTYvBVR+NV5nUQPXhCHnZoz0OwzEzcCvvzs2wK
         mWQgohHSFKcsmxbF7bSr0ICZffcUCu3NU9BkZs3E5bKYrdjJaxZB4nH+9AG5ma+Tt6ES
         RkjfNfY3lAsO1b3mNjlH1xfC0kBJY3IPOIIQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAQoXH+pZbMwpvsIB1V0y8sXQX2+52OeQ3q69dVbPn4=;
        b=sG9mIE/Zb62V8fWXzdnrPZzGu4Dw5XWuOsBhdOb9/kdJGVA4w0JxsTfFo19URMkbtN
         UTtEKrnbRiiAABCDL6p09OdGCow+ZwQEBykQYy7tFT5lVPEBkD/qT2AgtNQfZTNDUDu3
         Gp+obdWw4ynApsArO1X67r4YVtnhWNzYyIEVeb4NmD1ijU/K/A7jlvzl0MICHiu4KTuQ
         13Jj7M5PAq5yFRhIyKa1iIXWAWBP0BI3qpkfTKT8reZMVgWnA24eIKBSzhVDC+5E4Brq
         g/rRStKnDVQ8Klnk0ol3xgqDPZo1i1cWzL5qxe/mhPkaUMN338bjYLGBmPfJsKn1dcDq
         GGBA==
X-Gm-Message-State: AOAM532WdxsQAtZYc9Edj4BDQR/0fVmC9ViDPiTSyhbXOeoZp86fFdB/
	ztYckgWqWDRGC/O6uUdqf1KUEOLPV94XCbYDs6v3rQ==
X-Google-Smtp-Source: ABdhPJyYqsEZalZiY8fCYZlaa02MEzY7QlPlV0ZQIKjsnYV5Zs3//dBo2hof2Q39clZvmZ1X2tXiqGvtkXr1e5aZmqI=
X-Received: by 2002:aca:5505:: with SMTP id j5mr1942359oib.6.1605690579039;
 Wed, 18 Nov 2020 01:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20201111160800.5669-1-pbarker@konsulko.com> <20201111162839.yzc7danu6yr4x3sb@qschulz>
 <CAP71WjyAheuJXjwVtBna0dQvRAvCdR_aCd_+61RS688a-aEcjw@mail.gmail.com> <20201111172902.c2bmxupih7mlqjgi@qschulz>
In-Reply-To: <20201111172902.c2bmxupih7mlqjgi@qschulz>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 18 Nov 2020 09:09:28 +0000
Message-ID: <CAM9ZRVtqzXkRqXdnJr1iB-KxcuEibvv80eqXvtDenLAMBqT2iw@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/8] dev-manual-common-tasks: Fix refs to testing branches
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2020 at 17:29, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> On Wed, Nov 11, 2020 at 06:25:45PM +0100, Nicolas Dechesne wrote:
> > On Wed, Nov 11, 2020 at 5:28 PM Quentin Schulz
> > <quentin.schulz@streamunlimited.com> wrote:
> > >
> > > Hi Paul,
> > >
> > > On Wed, Nov 11, 2020 at 04:07:53PM +0000, Paul Barker wrote:
> > > > After discussions on IRC with Ross we concluded that the `ross/mut`
> > > > branch shouldn't really be listed in the docs as it's more of a personal
> > > > test branch. Instead we should list the -next branches for
> > > > openembedded-core and poky.
> > > >
> > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > ---
> > > >  .../dev-manual/dev-manual-common-tasks.rst    | 35 ++++++++++++-------
> > > >  1 file changed, 23 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > index 27aacde60..698b27377 100644
> > > > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > > @@ -10665,18 +10665,29 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
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
> > > > +   `openembedded-core <https://git.openembedded.org/openembedded-core/>`__
> > >
> > > Side note: should we add a :oe_git: directive as we already have :yocto_git:?

I'll see if I can add this directive and change the link.

> > >
> > > > +   repository on git.openembedded.org and contains proposed changes to the
> > > > +   core metadata.
> > > > +
> > > > +-  *poky "master-next" branch:* This branch is part of the
> > > > +   `poky <https://git.yoctoproject.org/cgit/cgit.cgi/poky/>`__
> > >
> > > :yocto_git:`poky </cgit/cgit.cgi/poky/>`

I'll change this.

> > >
> > > > +   repository on git.yoctoproject.org and combines proposed changes to
> > >
> > > Maybe s/git.yoctoproject.org/&YOCTO_GIT_URL;/ ? Not convinced though, no
> > > hard feeling if this is not taken into account.
> >
> > or :yocto_git:`/` like we do in other places? It would render as
> > https://git.yoctoproject.org/ , not git.yoctoproject.org, but I think
> > it's better, no?
> >
>
> +1 for the obvious, completely missed it.
>
> Though, now, not sure we need to state that it's from
> git.yoctoproject.org while actually giving a direct link to the poky
> repo a few words before?

Actually, yes, it's a little redundant. I'll simplify this text.

-- 
Paul Barker
Konsulko Group
