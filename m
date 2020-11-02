Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web09.28193.1604306443580488027
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 00:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CPqkLbzp;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id b138so11072132yba.5
        for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2020 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tXvoj48BuigYdap+UT0qLQ+vypgT4+lXRK+yhJhxOIE=;
        b=CPqkLbzpCDaX5ZP5gbJd+GF//VJqPOb4vcqR+9Lkr+qpZtzuV3o7+I5Z2SrZoaYY8A
         rIcWEA47kv2LKCumHDp9AkU6vcFMF8RMAQGI9lbyI4tCg9VnR3SGfRxcBOAedVX4iGXF
         MDvfs4i5RhKH5iRbbdLlfpvLBiQATA91N5Uu0uOXRfUgZrb77tIqxAjPgFPHbwu0h0Kw
         Pyok/sVS4b0vvSNZvbvevYNwvNtD7BvgbvUNOG/WdwvCG9lWhM1kX0zLf54RYQftrnhC
         0WvB9FO2udJ0l8ZVSB4sWHK50yUhPfjv4kG7oW+IXe0hgvKevIFwPdwoR1TWkJ1P7Uo4
         wm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tXvoj48BuigYdap+UT0qLQ+vypgT4+lXRK+yhJhxOIE=;
        b=anMap2vz65P9Wsauyr/r3NgbBaAz9G0c9HfElTorbhQ3tDT5LOb5IJe/lSlbF6Z864
         8ntfwPPvd2ZsS8ucT8gFir/rcvDLQ5lZvTaj0YsHqnGfIOsyBa32Hvll6rZBgvftcDto
         WlBbx2ZpEQ2ujg4JQApl12q/9MOnPPBreW9GbsCIDFQ07NhGwB5TB3A+uNtSkTKXr/ig
         Ly0cdQpMi8juDTAWze5c4wTIT8h6KHVW34Acz73zpvARKdSulV5FWok/LjiZ3K5j7sd5
         68hifWtUh6AXA8xjveCcGJQpEWiKVJ8ntwrxIwXltaxN/TwIqrSOylbIc4Rwn7aalQNJ
         3e3g==
X-Gm-Message-State: AOAM533I7X+XNLXyubsnkOaQq3pgVF7v0yuBFeXGO7dMu8jAdNonjRNq
	FZXYJXp4LgSwvyQjWOStuAz2sw0jv59IUuokO9i5tQ==
X-Google-Smtp-Source: ABdhPJyl5w8cDVyePGZjP/Af2F1bQHYKiV9AY66sae6z+vuu5i1KhAONqyVzos7LYS54oKCDE24/if0QPRsGGpwcweE=
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr20400064ybc.273.1604306442667;
 Mon, 02 Nov 2020 00:40:42 -0800 (PST)
MIME-Version: 1.0
References: <d6cadebf-150f-079a-8a47-bf18220a5bfa@gmail.com>
In-Reply-To: <d6cadebf-150f-079a-8a47-bf18220a5bfa@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 2 Nov 2020 09:40:31 +0100
Message-ID: <CAP71WjzHN3Vxpp+NJ_YWdoRmmdvTTAsYxUyToHkLUkqUN1SrPA@mail.gmail.com>
Subject: Re: [docs] [RFC] Add recipe-yocto-docs
To: akuster <akuster808@gmail.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hey Armin,

On Sun, Nov 1, 2020 at 7:40 PM akuster <akuster808@gmail.com> wrote:
>
> Hello,
>
> I just finished creating the ability to build the yocto-doc via a recipe
> ( Thanks to everyone who helped with the sphinx migration)
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/yocto_docs_recipe

This is cool ;)

>
> There are several structural decision to me made.
>
> Several of the dependency packages that currently reside in  other
> layers so those might need to moved in core.
>
> The easy decision is where the yocto-doc recipe should live. I suspect
> in meta-yocto.
>
> The ones I am not sure are the ones needed to support sphinx. Do we want
> these only as Native? Do we want this sphinx in core?

If we go this route, I think we need all dependencies in Core.

>
> This may be a gateway to allow including the docs in an SDK image. Add
> layer based docs. Create an Docs installer, bitbake-docs, etc.

I was wondering about bitbake-docs.. and where we should have such a recipe..

>
> The recipes most likely need a bit of cleaning up. I did test a native
> version of the index.html and that worked fine.

We could use this recipe to test docs as part of AB testing. Though I
am not sure if yocto-docs master-next is included in poky master-next.

That said for building the docs website (docs.yp.org), we would
probably not use this bitbake recipe, since we have several branches
to build to create the whole website.

>
>
> - armin
>
>
>
>
> 
>
