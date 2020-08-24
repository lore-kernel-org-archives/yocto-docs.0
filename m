Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.197611.1598283423113542382
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 08:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=U3TWkBWD;
 spf=pass (domain: linaro.org, ip: 209.85.219.178, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f178.google.com with SMTP id q16so5397735ybk.6
        for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2020 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8jXEmRKZVjOEsk2/5Df+y5Dq0BCHkg2xUVa7bLp7Roo=;
        b=U3TWkBWDDZpe6chTlESIxPW0/EUW0p2lpHkbQx7QbAFSs1cxzxz5M0lozp0bUv2gfs
         kDLARKYSb+VlYNAPmXw8e1DJaJbOYXLGPTtax6ncXgFHaRuCEuAZdH1cnoR2pkKKGMlP
         yGf9nD+xkHrlPsWOyMYlMcVQae+KYjCAGhlSwbNTMXbNtSsCeq/cF41ImK8R6ut+YvKd
         Z/f8PKvAglL3aPBNbmBX0gS4uVw1Ht4aq7JQtTXTgpITPR2KYRR979yyrRby2AqAfIcB
         WrK6vF1rwPXRfhl3rrtv65p61pgh6rlGEoF3bSNFCNZ9kDc5GL7UYT+H43loYpGSL/SD
         bErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8jXEmRKZVjOEsk2/5Df+y5Dq0BCHkg2xUVa7bLp7Roo=;
        b=FJO6BxBu59bCwLQW2T/0eJAWRLjnASIsHQwGHIlENhpVgW8ipseMzWPTVOsfVCXP8z
         80Lu/P52Sj11CwPrLBi4oRbWtkfvQDwBRO2wwNmWB6APbuE+QlIVvTfdsXyyNNg64jME
         NR+OOfZTb6ZViZvqQqT2vaBkwCxqsdw0Yw5VzKB6ekuoUij6SGl3QTN5zhXukNDh3ZxS
         6V6HxZKjihBPNsaHC6ssbw3DGtnU7jNgzRONjMjNGXuI1fAoLQRFvb6W9BsjVni0KzwF
         h0JM4RtHKXZhwULJro013rQ78zyv2B0LqT4+RoaSf7o5PXC1u3OaNG6tHEbGzGhQut0i
         cTOw==
X-Gm-Message-State: AOAM530CWorxUbg7E21whfxTE1K4W439hIPXMK/Raj+iVHFE9OTVTcVe
	FAWZ4OiPC6D2s2rmd2JdXcG+Ixs9b/DgGJLfGfVMtg==
X-Google-Smtp-Source: ABdhPJywFDO9gLAT0qFYNqTJ3avWa3XlE8UvOeYRZ+KKMlF2seHrNMqfwz2c6ZfYJIt6kjZP9DH40qLLxi1MMCFO2bQ=
X-Received: by 2002:a5b:904:: with SMTP id a4mr8426938ybq.397.1598283422075;
 Mon, 24 Aug 2020 08:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
 <6cb6f3a9-e4c0-960d-0069-09eecc344625@gmail.com>
In-Reply-To: <6cb6f3a9-e4c0-960d-0069-09eecc344625@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 24 Aug 2020 17:36:51 +0200
Message-ID: <CAP71WjxnVfjaoKRx4-tfko5gcZFG4ACSdW2znjZwHii9rxZT4w@mail.gmail.com>
Subject: Re: [docs] [sphinx] updates as of Aug 5th.
To: robert.berger.yocto.user@gmail.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

hi Robert,

thanks for your time!

On Tue, Aug 11, 2020 at 6:07 PM Robert Berger@yocto.user
<robert.berger.yocto.user@gmail.com> wrote:
>
> Hi,
>
> My comments are in-line
>
> On 06/08/2020 00:54, Nicolas Dechesne wrote:
> > hi there,
> >
> > I will be away from the Interweb the next two weeks. So I wanted to
> > share some updates about how the YP docs migration to Sphinx is doing.
> > [it is a fairly long email].
> >
> > To be honest, I wouldn't mind a little bit of help, and I will give
> > some hints about how you can help!
> >
> > We are still working on publishing the current Sphinx docs on
> > yoctoproject.org, in the meantime, it's here for YP and Bitbake
> > documentation.
> >
> > https://people.linaro.org/~nicolas.dechesne/yp-docs/html/index.html
> > https://people.linaro.org/~nicolas.dechesne/bitbake-docs/html/
> >
> > All changes are pushed to the 'sphinx' branch in yocto-docs and in
> > bitbake trees.
>
> As long as chapters/sub chapters and variables are have some kind of
> stable links this should work for me.

Chapters/sections links will be stable. There is one difference
between how it's done with docbook files since the links were "hand
crafted", with Sphinx, they are generated from the 'section' name, but
they won't change unless we change the section name. e.g.:

https://people.linaro.org/~nicolas.dechesne/yp-docs/html/overview-manual/overview-manual-concepts.html#shared-state

I am planning to rename the individual files to avoid the duplication
in the url (e.g. overview-manual/overview-manual-concepts.rst should
be overview-manual/concepts.rst).

>
> To give you some context:
>
> I my training I have many links from my slides to the good old doc.
> e.g.
>
> in my latex magic I have something like:
> {\tt \href{\MegaManualVarSearch LAYERSERIES\_COMPAT}{LAYERSERIES\_COMPAT
> (MM)}}
>
> which ends up into a link pointing to a downloaded version of the good
> old Mega manual:
>
> file:///xxx/mega-manual/mega-manual.html#var-LAYERSERIES_COMPAT
>
> It looks like I could do the same with your stuff:
>
> https://people.linaro.org/~nicolas.dechesne/yp-docs/html/ref-manual/ref-variables.html#term-LAYERSERIES_COMPAT

yes, that's correct.

>
> and I hope there will be a Mega Manual which contains them all ;)

Here again there is a nice feature with Sphinx. We can generate a
global 'index' table that is automatically generated with all 'terms'
from all the glossaries, see:
https://people.linaro.org/~nicolas.dechesne/yp-docs/html/genindex.html

e.g. there can be more than 1 glossary. Currently we have 2:
* the variable glossary from the reference manual:
https://people.linaro.org/~nicolas.dechesne/yp-docs/html/_sources/ref-manual/ref-variables.rst.txt
* the terms glossary:
https://people.linaro.org/~nicolas.dechesne/yp-docs/html/_sources/ref-manual/ref-terms.rst.txt

We can also add any term from any place within the whole documentation
set.  I like that a lot.

>
> Regards,
>
> Robert
>
> >
> > 
> >
>
