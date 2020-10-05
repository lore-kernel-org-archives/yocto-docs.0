Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web10.30046.1601884886712152599
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 01:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZIv3CD/7;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id j76so6041583ybg.3
        for <docs@lists.yoctoproject.org>; Mon, 05 Oct 2020 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HJCkOplMMdjDrQAcK10F8RZZzyw2AiwxfXBwdNLD8jc=;
        b=ZIv3CD/7LkZDvry61HcAvQ5x5NCVhDEkU/MCHDiLjqloIhmPgBp3UC4hbUiDrSO99V
         zP0zAlZIoREcfKMMko3LeKexhVva0tffLb1L4hp+Fo8hSxPhqRM6Hg7niGsBrCej9ZUP
         W34Ws3vlq8UnedocCXaHRdb+zh3XHFdEwSyo2akhxcUKbrh5QNz0zMnAJdtStFCVxXnt
         FQq9Xx0b7cOrHEichbyyQ0OLcURZluwWbkmhovoDwt9eLHylL388vnRjjQQ2t+63yEbx
         vFwigRgF+xe7xacYTbJ5UnsK07X7D+bLY2uk+GPDsVSoBLvlQUQmy5hVBct/NXhcZ8Nt
         MfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJCkOplMMdjDrQAcK10F8RZZzyw2AiwxfXBwdNLD8jc=;
        b=d2AheVNMdIySrG48JGbtwMk/eSz8MK+YZlg9vXUdde+KeDW0qB/Y5pL0uOJMzdAGDl
         OnduFaZQB5W/952p6Fq66LsMcvB8D7wMph5gQVGx87BGpfM3JKZCBQuueEcdgSRLxktD
         rxrPqDKF/T+Y21bDzrSzHnHbsOiR6GF9r8JnGDDe9G/2sCPe6FlI9C0AlrM7Rge6C/Sh
         Sr6DgGtio3yE8egzVd14UW9xKFKWgAFl3TSMyJPyCKbF1MsITsrS9WkqBHOh991rR7L+
         RjQ22W1FNWH+iLThfuKY0SNgTQQWkJ2HLsisqsXH5Sg7Djs2DsB2a9+JMmveowSh7P0p
         KINw==
X-Gm-Message-State: AOAM533BpBEvDEXMnH6GeE88fwHvKjLMLo2/SwEY1mQyfKHt1s9DnDyh
	4vovCf+t4ewB+yqhYzwS0vQxZAJamqgpdvRLnwUHwg==
X-Google-Smtp-Source: ABdhPJwJ16YSWINDWTRPChXwwlWv8c5WDGfQQ8MYbfAuWSsMdEMzlEsTbyYcLKzX5Fu9ryFniRxczeq4sWR8YFU85yg=
X-Received: by 2002:a25:bd41:: with SMTP id p1mr18466238ybm.475.1601884885811;
 Mon, 05 Oct 2020 01:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201004085728.8015-1-foss@0leil.net> <20201004085728.8015-8-foss@0leil.net>
In-Reply-To: <20201004085728.8015-8-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 5 Oct 2020 10:01:15 +0200
Message-ID: <CAP71WjwU71MHWO7XbRsNpCV69ifdMVKjfktbr2-xFWX0Oow_BQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 8/8] docs: ref-manual: ref-structure: replace oe-init-build-env by &OE_INIT_FILE;
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 4, 2020 at 10:58 AM Quentin Schulz <foss@0leil.net> wrote:
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/ref-manual/ref-structure.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
> index 32c2dbf23..a5b43259e 100644
> --- a/documentation/ref-manual/ref-structure.rst
> +++ b/documentation/ref-manual/ref-structure.rst
> @@ -139,7 +139,7 @@ back to the Yocto Project, such as ``create-pull-request`` and
>
>  .. _structure-core-script:
>
> -``oe-init-build-env``
> +``&OE_INIT_FILE;``
>  ---------------------

this change is interesting. What happens to links with :ref: here? can
we now use &OE_INIT_FILE; in :ref: links? we have several instances
like this:
:ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``

I remember that I converted all instances of &OE_INIT_FILE; initially,
then I figured out how to have variables subst with poky.yaml.. so we
probably have plenty of places where we should use OE_INIT_FILE
again..

>
>  This script sets up the OpenEmbedded build environment. Running this
> @@ -156,7 +156,7 @@ simple suggestions as to what to do next, including a list of some
>  possible targets to build. Here is an example:
>  ::
>
> -   $ source oe-init-build-env
> +   $ source &OE_INIT_FILE;
>
>     ### Shell environment set up for builds. ###
>
> @@ -170,7 +170,7 @@ possible targets to build. Here is an example:
>
>     You can also run generated qemu images with a command like 'runqemu qemux86-64'
>
> -The default output of the ``oe-init-build-env`` script is from the
> +The default output of the ``&OE_INIT_FILE;`` script is from the
>  ``conf-notes.txt`` file, which is found in the ``meta-poky`` directory
>  within the :term:`Source Directory`. If you design a
>  custom distribution, you can include your own version of this
> --
> 2.26.2
>
>
> 
>
