Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.32968.1628831913462881387
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 22:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=QGrhDtlu;
 spf=pass (domain: qtec.com, ip: 209.85.208.178, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f178.google.com with SMTP id n7so14125005ljq.0
        for <docs@lists.yoctoproject.org>; Thu, 12 Aug 2021 22:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hSQoD0ItCzUMI9Tm6JvKkxQ7/+4YJP9axubvOIL1HeU=;
        b=QGrhDtluiOqGaQNH2RZxMHMvh+MyineXIl2dBQ1eBPVv0Q709Iy5xbE3lNIsvUyDRT
         GFoMgaV4exKXtJXtpAyl8O39eJDe8SWd16naTeH4BJkfJBorW7y0tAMp2Sv996s9ooVm
         h000N+RqLm11fyQaKpjV0hNFfUUtX4qT9uu+u+EvFC9/G9OuZE4KUq7NU8FQYhwFeGLk
         YgQlKNrO33LFpDHdGJpFNPuAljiHqTYJrpNaeOGeMpfIEM/HMkG/JN6Y3e47jL9N4MzO
         ufcMyZjuRYx6sknU8LFG+xMGZbAYU4qnj3UBPOFGC3G+kFxWawGWUF4AXZlloLDqQrXx
         1Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hSQoD0ItCzUMI9Tm6JvKkxQ7/+4YJP9axubvOIL1HeU=;
        b=GvHtUnmzA4MkLmKaOnVCwSL3kFNWCmtRDNhzO0AUvIIilN0MgSwE9iITYwWA0CIttL
         lMD3WIOHnIG/cOKdvlrE9LIF83fsK2PdbHJkMHlJxwDWR4DvqLEbpXGbJdQy0VwZ4cI3
         s0IP8YyaXSo8U5yzvO7+eyV6hEqkvPJjETaenFwsTg5zoRfo0QN0G+SLFABhNlReHyXp
         q8G2KSEFuD+3Uf7QR+z5JIJQ71Ir1bz2J95EIlY5j1dnxn9YJ7qhM7WBYTm5flMIFikE
         Gp/D5XfyZD+5r/4lxZqkeWtIx+/hyl2GYETjqmKVIy1DN1UKydIXWm+ItnJG5cn8S9H4
         OIww==
X-Gm-Message-State: AOAM533ZdgGAdn8/PQLzAHOY+S8Cq1NXuytagupDAesQkUz7gkKRssTU
	YSNZ0MtmTBk/qeN1GjDXeszZTbxhwhlnMcKi8veSTKF8gPZFl8GD
X-Google-Smtp-Source: ABdhPJzldRY/6calvvTc7xFxXFLN8T6kJRa9g9xBDRcVI4M5IvHpsKBQwaQvQ1559DTLqayM+lVK5/Itd0LPlIZ6quQ=
X-Received: by 2002:a2e:9e46:: with SMTP id g6mr529183ljk.326.1628831910423;
 Thu, 12 Aug 2021 22:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210812190309.347619-1-daniel@qtec.com>
In-Reply-To: <20210812190309.347619-1-daniel@qtec.com>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Fri, 13 Aug 2021 07:18:19 +0200
Message-ID: <CAH1Ww+SS0iaAMChNzEGKrGJf9h=fmv-HAnSPAgk8oPG-FyOj4A@mail.gmail.com>
Subject: Re: [PATCH] releases: fix typo
To: docs@lists.yoctoproject.org
Cc: Daniel Gomez <dagmcr@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Adding Signed-off-by.

On Thu, 12 Aug 2021 at 21:04, Daniel Gomez <daniel@qtec.com> wrote:
>
> Fix dunfell typo for releases 3.1.9 and 3.1.10.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>  documentation/releases.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/releases.rst b/documentation/releases.rst
> index 04fbddea3..3f9646407 100644
> --- a/documentation/releases.rst
> +++ b/documentation/releases.rst
> @@ -35,8 +35,8 @@ Release Series 3.1 (dunfell)
>  - :yocto_docs:`3.1.6 Documentation </3.1.6>`
>  - :yocto_docs:`3.1.7 Documentation </3.1.7>`
>  - :yocto_docs:`3.1.8 Documentation </3.1.8>`
> -- :yocto_docs:`3.1.8 Documentation </3.1.9>`
> -- :yocto_docs:`3.1.8 Documentation </3.1.10>`
> +- :yocto_docs:`3.1.9 Documentation </3.1.9>`
> +- :yocto_docs:`3.1.10 Documentation </3.1.10>`
>
>  ==========================
>   Outdated Release Manuals
> --
> 2.30.2
>
