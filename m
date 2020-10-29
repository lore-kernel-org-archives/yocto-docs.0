Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web12.6033.1603963150598876039
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 02:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iNQ3KssQ;
 spf=pass (domain: linaro.org, ip: 209.85.219.170, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f170.google.com with SMTP id n142so1567618ybf.7
        for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2020 02:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SD8koSC6KV733/R8j0HM1BINa+dWaVEswvHQuknCyxE=;
        b=iNQ3KssQ3EUEgaPqKUo5vsA8JAIfDs2ZdTypeWQFRvlkE6mQmoHTM7CcJy1RdW+JLo
         5pqqdh3Bn/gLlNjiwQDz9E5srfXu8hlJ39WG4IwsJUBsRhJQAgS08rD8N3PdsfEhhDHk
         orTFcVfjF5oY/h14va3CdUlm8zksWsaRAatts7/VEsCi8uepJ6O88YSYoFZTm47VUjlr
         XnQCoh5Avi2nEFYEO68VgAjh/wZxrPsqPJPQQsYEUn1LM9hCqG2bRxiXjXYtWRhH0Wke
         QsQRXE3aQ5zCpf9K0Jtl3ep2zPJ7rIWJ4cbfpi46hn5/faBPdK4wvbF5AR/uiwJ9YUBs
         YOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SD8koSC6KV733/R8j0HM1BINa+dWaVEswvHQuknCyxE=;
        b=KC5/mFHuFbeL4QTPb9T2kE+KLL0EwpAqTJ+HyX+mCgX3i0krBdLHGmIGNuutqtByx5
         Camh9GPufsgkHB0pVYZj/Z2P+YrYpEh5eeJ+T4RXPH/vER8l846CfezlCha95doIxpN+
         FlH00xb8M3MccP2cl/yrkprOONl5zUP2jcBHKnTCEvxfqY06qDLCDXtb+dOmNOxr8EVl
         4vxpDjK4ASkF1tPBGemb/6yQb0Zquv45aUCIVK008kbKmYDeyM4WK8/GGAX+lUfHi7bu
         j2RbZredG57zgst7Xz30+fuZdoMgpKZJbm+lubonoEs7TsYS+0mqQjFzCRL1Uct30Xkm
         dXew==
X-Gm-Message-State: AOAM531nMlKWCRfLLlefDret5vhsOthUrzrnULwNf7lqAbnicTa9i/MW
	Tzu/n2Hmeuu0V1cUB0fFe7CfZ4tSoluNGIMKvrOpHA==
X-Google-Smtp-Source: ABdhPJyPrSUU31EsszN5uvcoJ6Kp/JbfZNY1ZHJHZFci6+ALDbUPNOHaN1VV7WYAKlCpEHOc4mSiRDaYB4yxJjs0ZGs=
X-Received: by 2002:a25:3813:: with SMTP id f19mr4703185yba.373.1603963149580;
 Thu, 29 Oct 2020 02:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <df8f2d4e-30c5-d267-dbae-a67aaf4bcc6@crashcourse.ca>
 <C5C2A97D-AC35-4DB6-B87B-BDD016352296@0leil.net> <8f84fc1d-714e-aea1-5afd-7e667c1979b@crashcourse.ca>
In-Reply-To: <8f84fc1d-714e-aea1-5afd-7e667c1979b@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 29 Oct 2020 10:18:58 +0100
Message-ID: <CAP71WjxjpKNusUURNydfrTg4G0G0BQUaEq9J4vTmDE2c4xA1bA@mail.gmail.com>
Subject: Re: [docs] adding more glossary links in the glossary
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Quentin Schulz <foss@0leil.net>, YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 10:12 AM Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
>
> On Thu, 29 Oct 2020, Quentin Schulz wrote:
>
> > Hi Robert,
> >
> > On October 29, 2020 9:13:31 AM GMT+01:00, "Robert P. J. Day" <rpjday@c=
rashcourse.ca> wrote:
> > >
> > >  finally have time to jump back into docs now that everyone else
> > >has done all the heavy lifting ... currently perusing glossary and
> > >noticed the following right near the top. in glossary entry for
> > >AUTOREV, there is the sentence:
> > >
> > >"If you use the previous statement to retrieve the latest version of
> > >software, you need to be sure PV contains ${SRCPV}."
> > >
> > >  that last bit, the "${SRCPV}" part, is set up as a glossary link vi=
a
> > >the .rst content:
> > >
> > >  `${``\ :term:`SRCPV`\ ``}``
> > >
> > >to get both a glossary link and the appropriate rendering. if that's
> > >the way to do it, then it seems there's more in the glossary that
> > >should be so rendered, as in just above that in AUTO_LIBNAME_PKGS, on=
e
> > >reads:
> > >
> > >  "The default value is =E2=80=9C${PACKAGES}=E2=80=9D, ..."
> > >
> > >which has the underlying .rst content as, well, exactly that so there
> > >is no glossary link.
> > >
> > >  is it safe to assume that, over time, things like that should
> > >eventually be linkified, as in:
> > >
> > >  `${``\ :term:`PACKAGES`\ ``}``

This specific syntax bothers me a lot.. one reason we moved to Sphinx
was to have 'simple' documentation source and this specific syntax is
horrifying.. if it's a pattern we use a lot, perhaps we should create
a custom role for that, like :term2: for example, so that
:term2:`PACKAGES` would add the ${} and the fixed-font rendering.

> > >
> > >is there any reason you *wouldn't* want to use a glossary link if one
> > >exists?
> > >
> >
> > I seem to recall that only the first occurrence of a "term" in a
> > page should be "linked" (with :term:``) as to not overload the page
> > with links for every occurrence of every variable in the glossary.
> > That was discussed on IRC or on the ML, probably in the mails
> > summing up what was to be done with Sphinx migration.

I don't remember discussing that specific thing. What would be the
rationale for limiting the glossary link to 1 per page? performance? I
think the link to glossary terms are useful, and would be more
inclined to have as many as possible.

I even thought about an extension to add links everywhere it's possible..

>
>   i can understand that in the sense of having a single link as a
> "first term", but i can also see how that doesn't properly apply to a
> glossary, as one normally does not read a glossary top down -- in
> fact, it's far more likely that one showed up there following a link
> to the specific term they were interested in. in that sense, a "page"
> would be more aptly represented by a single glossary entry. if you
> look at it that way, then the middle ground would be that the first
> term in any single glossary entry would be a link, and not the rest of
> them in that glossary entry.
>
>   sorry if this was already hashed out before, just an observation.
>
> rday
>
>=20
>
