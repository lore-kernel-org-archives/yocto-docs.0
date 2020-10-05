Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web12.31079.1601889647733264025
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 02:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TItpuYJw;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id v60so6162374ybi.10
        for <docs@lists.yoctoproject.org>; Mon, 05 Oct 2020 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B/iGpDx2KF/ja7hnkKAwYer97XXvs0FYnC6+uYdugqQ=;
        b=TItpuYJws77YpNQvAKb5W2afJKaUjm639SGY51dRtJQFrEGG6rVffdpgZe6kAxb103
         XuIajZlOJUjLBcVAgTYyNRbAPQ9VkTyB+ooe4ly8IaBDoVz8H+uTPl20nAiNU8HDmhbd
         oW434BoPHm6AVdm1pJzqFKTYiG4UCMwydOSgrJDbNIYTYJo2rTKFFXWzGF4RHlsxqCRF
         76Uw21caHKOlZQyQNVhgm12L6DIc1B65caKibvwi48U6Qe9BBTKIlaK0V1NWHLZmFbFP
         3hJ0gvuj6qjJngjcZFqUyBCr7glCESU6HWYJzZ/hG1qGxYKILYismXeCcdLUpLpX3rWL
         XG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B/iGpDx2KF/ja7hnkKAwYer97XXvs0FYnC6+uYdugqQ=;
        b=N2nCk1yF/mxE13CPQFGmaOASMNZXQ7yb7Z9PH6SghGoly3r+6CKhtg+d/5tQuu3kbL
         FFZk6op0HUhU8acH7dirIbtMoHHItkEx2RDSmXbkOVAPKbtQG0Vrg/D/4/stAYPwFUBI
         /hVHxAB/CvpuJgedH+E+PqzPl5AGoRzKlfMfppaV3LrkVHnRcsbsk4XFQasTYvTnV9Zt
         jQtRkVnJiG7rm8I48OzDs5Q2+m5U03NKu+BUGKCnmTVGj44HiGkBjZ1YvI30UY0KAqTX
         9Qm5zdwjLJLv8jygFdAJYiD43VwlAvQdkakWr+AK/svQm8bt+h77PHy/k1ck2hO/xnV0
         At/Q==
X-Gm-Message-State: AOAM531YpPaRx4KDlc8msXrLzzgcZNJvxWxkFSEnnsxnMoLkbkv3H7yv
	uZ4UOc/vj+3n10RVV4twgoUNaDwyMr90BRUzwdEENQ==
X-Google-Smtp-Source: ABdhPJyV41zr/mk9h0za43aPgRqYHmnqg5enArSnxmRA+e6WDYAhLefJgap4gf69aOBVUr6RSxA99xCLJ/ZX8hVROAA=
X-Received: by 2002:a5b:5d1:: with SMTP id w17mr18578778ybp.371.1601889646823;
 Mon, 05 Oct 2020 02:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201004085728.8015-1-foss@0leil.net> <20201004085728.8015-8-foss@0leil.net>
 <CAP71WjwU71MHWO7XbRsNpCV69ifdMVKjfktbr2-xFWX0Oow_BQ@mail.gmail.com>
 <20201005081055.5zuqh4d7gmibaso5@qschulz> <CAP71WjxOAEd5XcbEOhVJeWD7ASSozCb-jbL60oxECkQE1mWYCA@mail.gmail.com>
 <20201005081542.r4rvjnyg3ospwp2p@qschulz>
In-Reply-To: <20201005081542.r4rvjnyg3ospwp2p@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 5 Oct 2020 11:20:36 +0200
Message-ID: <CAP71WjyWGpLmXhO+Cvg554FxD=c_8=XWaJqd+jXxDM_fJtwB0A@mail.gmail.com>
Subject: Re: [docs] [PATCH 8/8] docs: ref-manual: ref-structure: replace oe-init-build-env by &OE_INIT_FILE;
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 5, 2020 at 10:15 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> On Mon, Oct 05, 2020 at 10:13:57AM +0200, Nicolas Dechesne wrote:
> > On Mon, Oct 5, 2020 at 10:10 AM Quentin Schulz
> > <quentin.schulz@streamunlimited.com> wrote:
> > >
> > > Hi Nicolas,
> > >
> > > On Mon, Oct 05, 2020 at 10:01:15AM +0200, Nicolas Dechesne wrote:
> > > > On Sun, Oct 4, 2020 at 10:58 AM Quentin Schulz <foss@0leil.net> wrote:
> > > > >
> > > > > Signed-off-by: Quentin Schulz <foss@0leil.net>
> > > > > ---
> > > > >  documentation/ref-manual/ref-structure.rst | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
> > > > > index 32c2dbf23..a5b43259e 100644
> > > > > --- a/documentation/ref-manual/ref-structure.rst
> > > > > +++ b/documentation/ref-manual/ref-structure.rst
> > > > > @@ -139,7 +139,7 @@ back to the Yocto Project, such as ``create-pull-request`` and
> > > > >
> > > > >  .. _structure-core-script:
> > > > >
> > > > > -``oe-init-build-env``
> > > > > +``&OE_INIT_FILE;``
> > > > >  ---------------------
> > > >
> > > > this change is interesting. What happens to links with :ref: here? can
> > >
> > > I've replaced a bunch of broken refs to this section in other files. The ref to
> > > use is actually :ref:`structure-core-script`.
> > >
> > > > we now use &OE_INIT_FILE; in :ref: links? we have several instances
> > > > like this:
> > > > :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``
> > > >
> > >
> > > Those should be converted to use :ref:`structure-core-script` instead.
> > > In the manuals I've reviewed, documentation/ref-manual/ref-terms.rst is
> > > the only one with such a change to make.
> > >
> > > > I remember that I converted all instances of &OE_INIT_FILE; initially,
> > > > then I figured out how to have variables subst with poky.yaml.. so we
> > > > probably have plenty of places where we should use OE_INIT_FILE
> > > > again..
> > > >
> > >
> > > BTW, what's the logic behind replacing oe-init-build-env with
> > > &OE_INIT_FILE; ? There's probably a sed to make tree wide to replace
> > > those :)
> >
> > Just to be consistent.. if we have a variable for it, we should use
> > it.. though I am not convinced we needed a variable in the first
> > place.. i am not sure we plan to change that script name often ;) so
> > we should have OE_INIT_FILE and use it everywhere, or remove it, no?
> >
>
> Indeed. Soooo? Do we remove it or nah :)?

heh.. I haven't been able to decide so far, but now that you insist
;-) I think we should remove OE_INIT_FILE everywhere.. and just keep
things simple..

>
> Quentin
