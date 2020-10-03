Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web10.3550.1601716843012214793
 for <docs@lists.yoctoproject.org>;
 Sat, 03 Oct 2020 02:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p444uHFO;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id k18so2986452ybh.1
        for <docs@lists.yoctoproject.org>; Sat, 03 Oct 2020 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vO17TUMPxvPLERHrPEPtxgVlvivKSvqSVzsBTvFxISE=;
        b=p444uHFOMewXw3H1Zp+B1KupeN1mN9yBF4gK8k0F/JckZKMPV34U6iP4rl6OF/d0dO
         xz894auXzLJM2KwkRgvkMUXk9TZAXLbgH0QNpBMmolPn9YjNJFGo0m0asl2mF/aez7dc
         pytM3LbfzoTiYfnuj9Vgoj5mS2If4goFGM/Drb4zTAtKSllZQ6nZldO0FVL7JJLp7XL4
         75j0IY+DtMm5x5Mq14dDua3LEHTl6hmNqdRDoluD72VOLfcYaMRPLA5jsWX6Lq/N7gRr
         OvuRzWlUCBDw5FU+dBjnaBFKG4r0J6H1GvwySeC0V7uoM5XqU807SpRNSIdESxBt42kh
         GhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vO17TUMPxvPLERHrPEPtxgVlvivKSvqSVzsBTvFxISE=;
        b=e6wwUYhdQuR32JhAHOJE37z54L+ByGyKC3lCHOjAL9yB9Pz7u7FTZzDz1jTJ3DSIOJ
         kFwLaK0WkJijBtqDbmJYtpvj0HWBla/j4US3tpe0yhKO0ygKzrDOXN8m+mHoSHfVAouA
         z1OKe26LC7Xe0GUldM4DV6IKzFGEJIPBrwilV+vEkK7kxvRwnsetuiBr8rmLZT5d1+9b
         wgoNp3DSV0NMDJ42fbpvfBkKsjIAPwADX1F8yFxVXtMeO7r+EuLVM78owP1xwavTv1mQ
         jdkzyLjKLl3oIWj8tglxRJqsasngEMb4a8rvSoDQbPWr7FDC3c2D0P9pJ1685diqfG/h
         WNZQ==
X-Gm-Message-State: AOAM532Zig7f25RdjECF6pjmfJtLzFFbpYD91IqDVuaTpow46ISKAklH
	0n8QPFNovuTd76YDPvB+FbBmzRtDP6n6PpdYbXqn0A==
X-Google-Smtp-Source: ABdhPJz6cfqEDRug7tY9DE6oIqx2w+u9ZI4RUJHVqm9TEG1+vhcZuLpRhF21M3rGe82FNRTUDqBGPYMBNCSU2U6AWp4=
X-Received: by 2002:a05:6902:50e:: with SMTP id x14mr7888881ybs.273.1601716842080;
 Sat, 03 Oct 2020 02:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201003082336.55703-1-foss@0leil.net>
In-Reply-To: <20201003082336.55703-1-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Sat, 3 Oct 2020 11:20:30 +0200
Message-ID: <CAP71WjwFH8uC6Atg6+noA848vwM6ax9RM258x9kfGGAub3x3hg@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/3] docs: ref-manual: ref-variables: fix one-letter pointer links in glossary
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 3, 2020 at 10:23 AM Quentin Schulz <foss@0leil.net> wrote:
>
> Since the move to sphinx, variables aren't linked with var- anchors but
> term-.
>
> Let's fix that so clicking on a letter will bring to the correct variable
> in the page.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/ref-manual/ref-variables.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index 2d6719df1..e238b1247 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -7,14 +7,14 @@ Variables Glossary
>  This chapter lists common variables used in the OpenEmbedded build
>  system and gives an overview of their function and contents.
>
> -`A <#var-ABIEXTENSION>`__ :term:`B` `C <#var-CACHE>`__
> -:term:`D` `E <#var-EFI_PROVIDER>`__ `F <#var-FEATURE_PACKAGES>`__
> -`G <#var-GCCPIE>`__ `H <#var-HOMEPAGE>`__ `I <#var-ICECC_DISABLED>`__
> -`K <#var-KARCH>`__ `L <#var-LABELS>`__ `M <#var-MACHINE>`__
> -`N <#var-NATIVELSBSTRING>`__ `O <#var-OBJCOPY>`__ :term:`P`
> -`R <#var-RANLIB>`__ :term:`S` :term:`T`
> -`U <#var-UBOOT_CONFIG>`__ `V <#var-VOLATILE_LOG_DIR>`__
> -`W <#var-WARN_QA>`__ `X <#var-XSERVER>`__
> +:term:`A <ABIEXTENSION>` :term:`B` :term:`C <CACHE>`
> +:term:`D` :term:`E <EFI_PROVIDER>` :term:`F <FEATURE_PACKAGES>`
> +:term:`G <GCCPIE>` :term:`H <HOMEPAGE>` :term:`I <ICECC_DISABLED>`
> +:term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
> +:term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
> +:term:`R <RANLIB>` :term:`S` :term:`T`
> +:term:`U <UBOOT_CONFIG>` :term:`V <VOLATILE_LOG_DIR>`
> +:term:`W <WARN_QA>` :term:`X <XSERVER>`

thanks. it's a good cleanup.. I am pretty sure I did it at some
point.. but i guess i never pushed it.
though i remember wondering whether we should just delete that
completely, since chances are that it won't be well maintained.. and
we have the global index anyways
https://docs.yoctoproject.org/genindex.html

alternatively, if it's really useful we could write a small extension
to generate it, that shouldn't be too hard.

>
>  .. glossary::
>
> --
> 2.26.2
>
>
> 
>
