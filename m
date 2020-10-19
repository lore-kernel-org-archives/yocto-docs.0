Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web10.13189.1603114500379857517
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 06:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WyoiriHl;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id a12so8872645ybg.9
        for <docs@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8WdZI4DSiSkEGVud1h7I5tHme9sIA7P67eaBNu/mKys=;
        b=WyoiriHlA8W71PhG1iEXwVTqG0hbnt02fM8b3WF7ZqouEmIo22VaVMMr8o/8QEmAxL
         4gBxRtA7TRIbQR++rvonTfdd+T0WDgFaAunXk8M0WyFddZ3DrTYEwe+nv4RC/04lYlRT
         Pdu7WsT5eimyEC5G5srKdg8nHskWuDFjDa6ihs3+CvBb8eC0SU8qEZzAAInHX+INm9GG
         ai2VShsYqxJ6wKgMiO+SbItDGdVZ1+fpU24vYOqcI9jTIJfFHN5VYxt9bsBlUMPDw67Y
         TPy4Lfj0juNFGOvBOSWlq9EJteVgh0cH6B3bYQzO9+C2FT25wYILAGaYczpFLqDWFjf1
         cxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8WdZI4DSiSkEGVud1h7I5tHme9sIA7P67eaBNu/mKys=;
        b=UOIvdn8DQi1KQ7hXKqDddDxYG7XqQRMrg/HEagNSWyrBS8Cax43snwtMHHSRBaRHhh
         e0B7Kbfot9S4gJhOchLxj48h6pME3HpMBoy2lSgiaT4Edx9Lay7qTmjC4J4a9OwXJPrA
         RyYuKrw+T5+xLm/u4eiQa2m5ylAAC176cArr+A1NwleBdb9CFkHcXPv9xLrIb1olV8a4
         bSFtqCUjmC4DjO5QzRZDqA08EwT8qIzTC4EK+8Y320gO0AoumfYHkLrCV9YCZDdsa50V
         iK/FCRVOGZwJBApfR44Lh2anQSNZdKnetuAEndy9TL8zVbXihibBk7f33Md/idG/KNu3
         RzLQ==
X-Gm-Message-State: AOAM530TjJdwtAlqd2vVwWWqO8XIIU2WmGdLHla4MeyFz1JLK9p1t8W1
	dRsAf4L5Ik8Bx2upv4DGHqgpOvoqygDknBrHITC7yQ==
X-Google-Smtp-Source: ABdhPJzaKoaIeGnnx0XwrpDHQhE6xK2c5kwBrdjTy0jzHuFVRsyjiwUxey5Ajo2gkOd9tuyr9+ESSTR14mScehiqlUc=
X-Received: by 2002:a25:8752:: with SMTP id e18mr21202185ybn.133.1603114499352;
 Mon, 19 Oct 2020 06:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201018175712.23800-1-foss@0leil.net> <20201018175712.23800-2-foss@0leil.net>
In-Reply-To: <20201018175712.23800-2-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 19 Oct 2020 15:34:48 +0200
Message-ID: <CAP71WjxKOFDdpkx2KcX2Y4Dd2ELuDiASFyO-twZDY1feLnW-8g@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/3] docs: dev-manual-common-tasks: remove paragraph about race when missing DEPENDS
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 18, 2020 at 7:58 PM Quentin Schulz <foss@0leil.net> wrote:
>
> Missing DEPENDS were an issue before rocko (2.4) because of a shared global
> sysroot. Since then, every recipe has its own sysroot, it is not possible
> to build successfully a recipe without all DEPENDS. Therefore, races in
> tasks possibly triggered by missing DEPENDS are a thing of the past.
>
> This paragraph is misleading and can be safely removed.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  .../dev-manual/dev-manual-common-tasks.rst    | 23 ++++++-------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
>
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 0df5e1e4c..75ef5c98c 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -1612,25 +1612,16 @@ Within a recipe, you specify build-time dependencies using the
>  :term:`DEPENDS` variable. Although
>  nuances exist, items specified in ``DEPENDS`` should be names of other
>  recipes. It is important that you specify all build-time dependencies
> -explicitly. If you do not, due to the parallel nature of BitBake's
> -execution, you can end up with a race condition where the dependency is
> -present for one task of a recipe (e.g.
> -:ref:`ref-tasks-configure`) and
> -then gone when the next task runs (e.g.
> -:ref:`ref-tasks-compile`).
> +explicitly.

Nice improvement!

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

>
>  Another consideration is that configure scripts might automatically
>  check for optional dependencies and enable corresponding functionality
> -if those dependencies are found. This behavior means that to ensure
> -deterministic results and thus avoid more race conditions, you need to
> -either explicitly specify these dependencies as well, or tell the
> -configure script explicitly to disable the functionality. If you wish to
> -make a recipe that is more generally useful (e.g. publish the recipe in
> -a layer for others to use), instead of hard-disabling the functionality,
> -you can use the
> -:term:`PACKAGECONFIG` variable
> -to allow functionality and the corresponding dependencies to be enabled
> -and disabled easily by other users of the recipe.
> +if those dependencies are found. If you wish to make a recipe that is
> +more generally useful (e.g. publish the recipe in a layer for others to
> +use), instead of hard-disabling the functionality, you can use the
> +:term:`PACKAGECONFIG` variable to allow functionality and the
> +corresponding dependencies to be enabled and disabled easily by other
> +users of the recipe.
>
>  Similar to build-time dependencies, you specify runtime dependencies
>  through a variable -
> --
> 2.26.2
>
>
> 
>
