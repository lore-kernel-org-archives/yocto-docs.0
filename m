Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web12.17983.1604250863768339060
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Nov 2020 09:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gBFmm/w/;
 spf=pass (domain: linaro.org, ip: 209.85.219.172, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f172.google.com with SMTP id s89so9671500ybi.12
        for <docs@lists.yoctoproject.org>; Sun, 01 Nov 2020 09:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=286vxkDMsJ+ab5+UScpwfmyRs39LNx+8YpcLbLs8kAQ=;
        b=gBFmm/w/pWC5NWwYrPkM881bU+0DQoKlr0O8a0Vsb628Xj6wr9DHcl3YWfNoP8xFMn
         Lb6g4AKBvzujI8o0slZfYhxQd4S9Pl/e+q9HG6Oveg5E7rU/2UkcRqO6h/HMiHKtffeO
         vfQd9Gb8d9fxDBHV/4ozfGKJivD7Ys4rmK0hwQ0+39ANa0sOnT4gJcnBtWi3hSUvzRQR
         QU/CrdDLYvCwppp+CPHI8PtjCCER1PUQNpgV8NJfAWiLNFLMLPEQr0aJvkw+F4SshAfR
         G+FIP+4TIz3hwpQ9d99QLr216UV5ULaYg976fV7/S2xWNRqo8jUa4h024WCHx+GHGMrw
         /bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=286vxkDMsJ+ab5+UScpwfmyRs39LNx+8YpcLbLs8kAQ=;
        b=UfD/X98qKetjsB7utsxeo4feIW6CJXlF4jM2OjNZHX9PFUXDRmYAch5U7GXYqhkMV/
         zOG5b/P1E445QWlggrzGYTibDnPLrEbSUVZKzagPgu1xkd2ClONR/xNrfw/cR+bv6Zyi
         TE+68khWzqLDP6GuqKLfl5foD6MkKCeYZy/+GbO1zvhscxQ3R2VIuhBzMR8MlTfvdnEF
         D/LxJiMRw1HOak2zVKnCCBr1lqNfnIVC7oG8RjlcBs1v9IMw3BYbv1+AubpIJ2pd+KiJ
         48MEjwQh/y4O8x29lmCHM09uepk3PEDr4KY9JNTCLD3ap+dWVRaU02/l9y9d7cuspifm
         hyBA==
X-Gm-Message-State: AOAM530WNsLdMhnhwVC0ePq0vFblcfMG8883JF6I0HfE4Im9ie/PHD2Z
	Gs6grAp/PpCr8zSd5J5dKfC0e9UfwgO08dI4rrpd9Q==
X-Google-Smtp-Source: ABdhPJxFuKIc+j6+FkG/6S0sUsWrjM/OX3EZU/sPFmD3gW6mRQ9DxgF6HifsAYtjkkKiI3e/S5sxaNGHLWNCUKD48Xk=
X-Received: by 2002:a25:2284:: with SMTP id i126mr15642352ybi.454.1604250862806;
 Sun, 01 Nov 2020 09:14:22 -0800 (PST)
MIME-Version: 1.0
References: <e7265c66-faa4-e0c0-b661-7ac89a1e3581@crashcourse.ca>
In-Reply-To: <e7265c66-faa4-e0c0-b661-7ac89a1e3581@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Sun, 1 Nov 2020 18:14:10 +0100
Message-ID: <CAP71WjzXchCULzg_9GqZiYrt1oFtkV7cscCie4dZ5t3st81b=Q@mail.gmail.com>
Subject: Re: [docs] [RFC] what about adding a ToC to top-level individual pages?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hey Robert,

On Sun, Nov 1, 2020 at 4:36 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   above and beyond the hyperlinks in the left margin when viewing the
> docs, it's easy to add a single-level ToC to each page, which is
> available to the reader even if the left margin hyperlinks are
> collapsed and non-visible. here's a patch that applies that to the dev
> manual as an example, so you can see what i mean (the patch also adds
> some whitespace at the top for aesthetics):

I suppose you want to mimic the 'table of contents' we had on each
section in the previous manuals. I have tried that as well.. but
couldn't find a good way.
I don't really like the '.. contents' directive, since it is not aware
of the numbering, so we end up with something which is not 'good
looking'.
Also, we have the TOC on the left bar anyways, so perhaps we just need
to get used to it.

>
>
>   thoughts?
>
> rday
> ---
>
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 27aacde60..1e0fe225a 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -4,6 +4,13 @@
>  Common Tasks
>  ************
>
> +|
> +
> +.. contents::
> +   :depth: 1
> +   :local:
> +   :backlinks: none
> +
>  This chapter describes fundamental procedures such as creating layers,
>  adding new software packages, extending or customizing images, porting
>  work to new hardware (adding a new machine), and so forth. You will find
> diff --git a/documentation/dev-manual/dev-manual-intro.rst b/documentation/dev-manual/dev-manual-intro.rst
> index 05136f735..7078991ec 100644
> --- a/documentation/dev-manual/dev-manual-intro.rst
> +++ b/documentation/dev-manual/dev-manual-intro.rst
> @@ -4,6 +4,13 @@
>  The Yocto Project Development Tasks Manual
>  ******************************************
>
> +|
> +
> +.. contents::
> +   :depth: 1
> +   :local:
> +   :backlinks: none
> +
>  .. _dev-welcome:
>
>  Welcome
> diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/dev-manual-qemu.rst
> index c91e8b538..e5da176bd 100644
> --- a/documentation/dev-manual/dev-manual-qemu.rst
> +++ b/documentation/dev-manual/dev-manual-qemu.rst
> @@ -4,6 +4,13 @@
>  Using the Quick EMUlator (QEMU)
>  *******************************
>
> +|
> +
> +.. contents::
> +   :depth: 1
> +   :local:
> +   :backlinks: none
> +
>  The Yocto Project uses an implementation of the Quick EMUlator (QEMU)
>  Open Source project as part of the Yocto Project development "tool set".
>  This chapter provides both procedures that show you how to use the Quick
> diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
> index a85b86fbf..958e95745 100644
> --- a/documentation/dev-manual/dev-manual-start.rst
> +++ b/documentation/dev-manual/dev-manual-start.rst
> @@ -4,6 +4,13 @@
>  Setting Up to Use the Yocto Project
>  ***********************************
>
> +|
> +
> +.. contents::
> +   :depth: 1
> +   :local:
> +   :backlinks: none
> +
>  This chapter provides guidance on how to prepare to use the Yocto
>  Project. You can learn about creating a team environment to develop
>  using the Yocto Project, how to set up a :ref:`build
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> 
>
