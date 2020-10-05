Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web11.29907.1601885648813273269
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 01:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QgqIxtmI;
 spf=pass (domain: linaro.org, ip: 209.85.219.193, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f193.google.com with SMTP id v60so6042156ybi.10
        for <docs@lists.yoctoproject.org>; Mon, 05 Oct 2020 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TrBaUVg1hyfr/EzzLQgYyGFcuuCJtcKcyiq6NpF8mCc=;
        b=QgqIxtmIKKACv30qiqXQ4Hr+sfwLshlcKRnrCp5JN4AHBnRR/Q7Ph6pL2JXRV+QfOC
         PqEW28pKtTZq1yPEZmHPZ1QT1cEU5YQ5DVfy+SiObb7QiZ3EeQjpSQTSUvBr7HT0ho7g
         OSkjbtUoW0JmFY1tJ7MCB+RJdJ/CSzfmWQjA0wIXjj6oRmLlKe/0iFynSxmg19R5+YHn
         7pCzgyIsDk9UWs0V98NOPnKhWvRsMLhwY6fl1sakIPU8JjkCovrdJuX0cU/l4Bd0rD9Z
         izsyZWNtC6Zbhotp9idAqIc+wIvDVI68NlFp2KK0y73l1tlAWf/KlLNquLBv8nc2NWH3
         j0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TrBaUVg1hyfr/EzzLQgYyGFcuuCJtcKcyiq6NpF8mCc=;
        b=boj3Nxdfm80KnRcJi3KqrWdoAKsRnkeqHqNCvUkctbX8aCq7GdzQAByBUvMw/Q3+Gw
         QDLTGUy20Kft2vTfE/qZuebLnCgPYFTd5TlmijS9eCUQ2jYfT9NvxPCzUyg2kZRk53Rv
         1sWyXokgVjZm8vVo2tPNZ8W0aUe+u4hPsVuQh7NJx/kVRv86ApzT9cOcU6dLZcAK5q0g
         rH+9StMCiU2lWcuDgeU7T6JpKcnKmjFuU7Kf+630FinnjlYn63uW606Jw8KuT/6I/zPI
         hsayDeEaC4gxjMwQky9HyluzUywFP5aQv6yZeEnryLqbCCX9RS76N9u2HSClFpbysjsY
         sQdA==
X-Gm-Message-State: AOAM532jevxFdyov2SlUItvYY7GIC5DKDJBw+vdwa68IWg83NYYg1/ro
	kK8fFHCuENj6zOJ+deFa7Lv85hWrpuQzKce3iO50WQ==
X-Google-Smtp-Source: ABdhPJwkNzJ3tEcSNWEauIKifvRn2rzdefG975wxB789hZHYEK38Xh869EgXijHpsaP3q2KdS5UtYdXovlZV4FJwois=
X-Received: by 2002:a25:a521:: with SMTP id h30mr7912613ybi.201.1601885647860;
 Mon, 05 Oct 2020 01:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201004085728.8015-1-foss@0leil.net> <20201004085728.8015-8-foss@0leil.net>
 <CAP71WjwU71MHWO7XbRsNpCV69ifdMVKjfktbr2-xFWX0Oow_BQ@mail.gmail.com> <20201005081055.5zuqh4d7gmibaso5@qschulz>
In-Reply-To: <20201005081055.5zuqh4d7gmibaso5@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 5 Oct 2020 10:13:57 +0200
Message-ID: <CAP71WjxOAEd5XcbEOhVJeWD7ASSozCb-jbL60oxECkQE1mWYCA@mail.gmail.com>
Subject: Re: [docs] [PATCH 8/8] docs: ref-manual: ref-structure: replace oe-init-build-env by &OE_INIT_FILE;
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 5, 2020 at 10:10 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Nicolas,
>
> On Mon, Oct 05, 2020 at 10:01:15AM +0200, Nicolas Dechesne wrote:
> > On Sun, Oct 4, 2020 at 10:58 AM Quentin Schulz <foss@0leil.net> wrote:
> > >
> > > Signed-off-by: Quentin Schulz <foss@0leil.net>
> > > ---
> > >  documentation/ref-manual/ref-structure.rst | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
> > > index 32c2dbf23..a5b43259e 100644
> > > --- a/documentation/ref-manual/ref-structure.rst
> > > +++ b/documentation/ref-manual/ref-structure.rst
> > > @@ -139,7 +139,7 @@ back to the Yocto Project, such as ``create-pull-request`` and
> > >
> > >  .. _structure-core-script:
> > >
> > > -``oe-init-build-env``
> > > +``&OE_INIT_FILE;``
> > >  ---------------------
> >
> > this change is interesting. What happens to links with :ref: here? can
>
> I've replaced a bunch of broken refs to this section in other files. The ref to
> use is actually :ref:`structure-core-script`.
>
> > we now use &OE_INIT_FILE; in :ref: links? we have several instances
> > like this:
> > :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``
> >
>
> Those should be converted to use :ref:`structure-core-script` instead.
> In the manuals I've reviewed, documentation/ref-manual/ref-terms.rst is
> the only one with such a change to make.
>
> > I remember that I converted all instances of &OE_INIT_FILE; initially,
> > then I figured out how to have variables subst with poky.yaml.. so we
> > probably have plenty of places where we should use OE_INIT_FILE
> > again..
> >
>
> BTW, what's the logic behind replacing oe-init-build-env with
> &OE_INIT_FILE; ? There's probably a sed to make tree wide to replace
> those :)

Just to be consistent.. if we have a variable for it, we should use
it.. though I am not convinced we needed a variable in the first
place.. i am not sure we plan to change that script name often ;) so
we should have OE_INIT_FILE and use it everywhere, or remove it, no?

>
> Quentin
