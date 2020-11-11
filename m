Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web10.10142.1605115557479254165
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 09:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=naUjtxol;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id g15so2622622ybq.6
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 09:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L29SxhUfOoqzxjK8AXVdbCFxMSGi3DbLxx/nbQB0+pI=;
        b=naUjtxolnpk6nPcPL5b4sfwZ98n7Di4nTutPh7ukvXxfTDm6Im/ldcYOKv9NNz+eIR
         z2u+/GJ6DKzsgH6zqMdXSpwgwgff9hAckogrBeOYSm8Yavc6H1GKIPruJSxV0tu3oM93
         k7B/jSQYgyYyhWCgWx0e9ZC9ZuhvY31Cd2yAyJPkLYFfHUEzmfHSg2f11NNZ+T7Z6Q0J
         04dWoTlbhste+FPhRd9vdPNJwVVY4rSNbosKOx2UdnAVOFGl2FOp9jFKbq7QK3Yuw13w
         U7Nnv5hgE71Jr3hh+tjbHmdNrWeeNoccHfM9VjiYyDF0AomStKkauJiNvgVBXyK7jnfp
         aOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L29SxhUfOoqzxjK8AXVdbCFxMSGi3DbLxx/nbQB0+pI=;
        b=T49YoJzGrKco5DuTBEskkllw/dts9FPjwgBkTLh3gmm/P1RoOeSxI1ynxwbe6jM2Ir
         cw+fkvN/yiS8HFu5MX/PIHkq670ajzEDP/Am0nTMjhGkyyU9xTJzhu98wB8xqnhvuYmf
         if9Q0tzFGTGEzbqv0+vBN/bXRC+PWErfSx+qK0BZKq88pMGxhomM8WlH6HxrsXPY8HbR
         ASVrCIBwkNm4U+/tn1K1FlIV4UgO1mSm+VzlQxBr40nG3eMAi+2NnVWn+0ENsXkEMvTy
         L7zRdfBRrsNzcFMrD+xyBXuJFe7I+irAaBLHW/+TFHikF6KA3gIYixHyZz8foFjyufX2
         oVug==
X-Gm-Message-State: AOAM5330S0acJaBQNPLVqgB4YSlldb/GVaXi/hX2J36tkezHlE64dXE5
	CL7xAjear3xn+I9X5C5/hNOZwX+LMMJ82EMjxUyx0A==
X-Google-Smtp-Source: ABdhPJyxaCL/WgkI+9RvzPrky1wP3jr3jsKCt07XGdMAoB/qAX11f4eyNITzj6tSfyiKyKX1w8Wzzu/vDDzDnM4YmFU=
X-Received: by 2002:a25:287:: with SMTP id 129mr16725408ybc.454.1605115556503;
 Wed, 11 Nov 2020 09:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20201111160800.5669-1-pbarker@konsulko.com> <20201111162839.yzc7danu6yr4x3sb@qschulz>
In-Reply-To: <20201111162839.yzc7danu6yr4x3sb@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 11 Nov 2020 18:25:45 +0100
Message-ID: <CAP71WjyAheuJXjwVtBna0dQvRAvCdR_aCd_+61RS688a-aEcjw@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/8] dev-manual-common-tasks: Fix refs to testing branches
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Barker <pbarker@konsulko.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2020 at 5:28 PM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Paul,
>
> On Wed, Nov 11, 2020 at 04:07:53PM +0000, Paul Barker wrote:
> > After discussions on IRC with Ross we concluded that the `ross/mut`
> > branch shouldn't really be listed in the docs as it's more of a personal
> > test branch. Instead we should list the -next branches for
> > openembedded-core and poky.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  .../dev-manual/dev-manual-common-tasks.rst    | 35 ++++++++++++-------
> >  1 file changed, 23 insertions(+), 12 deletions(-)
> >
> > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> > index 27aacde60..698b27377 100644
> > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > @@ -10665,18 +10665,29 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
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
> > +   `openembedded-core <https://git.openembedded.org/openembedded-core/>`__
>
> Side note: should we add a :oe_git: directive as we already have :yocto_git:?
>
> > +   repository on git.openembedded.org and contains proposed changes to the
> > +   core metadata.
> > +
> > +-  *poky "master-next" branch:* This branch is part of the
> > +   `poky <https://git.yoctoproject.org/cgit/cgit.cgi/poky/>`__
>
> :yocto_git:`poky </cgit/cgit.cgi/poky/>`
>
> > +   repository on git.yoctoproject.org and combines proposed changes to
>
> Maybe s/git.yoctoproject.org/&YOCTO_GIT_URL;/ ? Not convinced though, no
> hard feeling if this is not taken into account.

or :yocto_git:`/` like we do in other places? It would render as
https://git.yoctoproject.org/ , not git.yoctoproject.org, but I think
it's better, no?

>
> Thanks,
> Quentin
>
> 
>
