Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.2176.1605175099184100830
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 01:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=akYWq5k1;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id i186so4750895ybc.11
        for <docs@lists.yoctoproject.org>; Thu, 12 Nov 2020 01:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jqfkw0ZFp6VfssXvU2tsBCbmr/zBgP2ZxOk0f/CbjqI=;
        b=akYWq5k1zDNuItM+FoQcHS0B5HPdLGrCnNBChLMB8cVWxN18WzbFd0fLUuHrh997gP
         3bhASW4hW62YxFVXv0ztzm1FpW0/C3EzmauXAGWohZIAoa+KXgto+dNqHRt1RlUy9TqB
         NqjfnemMx7ZyWlWTL9cAVEOIzsbaMUD4eUacjd+XU3KNTaWwmCavhp1xVS0YilKSSskL
         XGdlVFuOR39kLl+HWH+J2VD2+VdxXYM2Fi1CEYR4dwqR6daPRW7IhbsgO2rDMzwfqZJV
         IDfIkSBxTg+fzQCSXmUy+scWaQmUYJ2BW/gWuOj/1KEP+KObXjC2Kut8hMsEYqCR+F3g
         6kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jqfkw0ZFp6VfssXvU2tsBCbmr/zBgP2ZxOk0f/CbjqI=;
        b=VtOgE9X6kpkt8/ATZ5QTdSc6dgtFCbogw/O1XiXjz47CWhtqUV+HMasqM7jLGe9SbX
         p92D7rfFeJMg1aTVKxsWJIDCf3MDbhoY83zK/5zmtbRMHCChVLUVEYnTF4uR2I5dwy+4
         SmzbyoWP2gvT2LAmwwpY3MmirbnQZVR9TzJgKCLc/9hqJsmFH3+ppG+WX340hsR/hzaD
         ODAJEmwVwh9ZuFWjvKOWS4s+LVuaHyzlOpAFiKC89F+Ks1bxFl1g3a1v4OyJM++jdeLK
         fijZcuhvVL7iIJW7QxIyjDa2sC65VL2urPP99Vgg29vvk+EvlW/fbwXSx+VAMJPjqvO2
         eQ3g==
X-Gm-Message-State: AOAM530k6/C8IabpIdtwmsSQ/n0H+c0lovWAmRgMsGIhDz8nvsWkw4lD
	Qc67uZ3i0exqlZ3b9bBHaRM3lWXMQlCdBIJ4O55MsQ==
X-Google-Smtp-Source: ABdhPJyEA7MliJRaZ65lUXB9SXN1uWrUo0cWZepqSITxdm4DbX12nBcEoE2Ut8ciYqQ80+Ac+aOCi+pZT+cweR+YOVM=
X-Received: by 2002:a25:287:: with SMTP id 129mr21141458ybc.454.1605175098343;
 Thu, 12 Nov 2020 01:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20201110212917.25172-1-JPEWhacker@gmail.com> <27534.1605130210340595078@lists.yoctoproject.org>
 <f4daa05e-8aa6-c817-fe51-910c0f9d0a69@gmail.com> <CAP71WjydMC_00a6YMWo77Pv39C7hwMYoVJt_sOOTsF5U1rxc6g@mail.gmail.com>
 <20201112094159.zhmmc6vyjwx6k2ri@qschulz>
In-Reply-To: <20201112094159.zhmmc6vyjwx6k2ri@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 12 Nov 2020 10:58:07 +0100
Message-ID: <CAP71WjzFr52S4CveTYW=35q+YeW_a0-WCq=ct6ACdfDERpiB1A@mail.gmail.com>
Subject: Re: [docs] [PATCH] documentation: Add Pipenv support
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>, shantanoo.desai@gmail.com, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 10:42 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> On Thu, Nov 12, 2020 at 08:29:34AM +0100, Nicolas Dechesne wrote:
> > hey Shan,
> >
> > can you please avoid top posting and using html for emails to the
> > list? this makes it harder for us to follow.
> >
> > On Wed, Nov 11, 2020 at 11:05 PM Joshua Watt <JPEWhacker@gmail.com> wrote:
> > >
> > >
> > > On 11/11/20 3:30 PM, shantanoo.desai@gmail.com wrote:
> > >
> > > Hi Joshua,
> > >
> > > I would suggest adding sphinx-serve as a dev-package to serve the docs during local development/tests.
> > >
> > > I'd be fine with that. We can see if anyone else objects, or we can also merge as is and add that as a separate patch.
> >
> > I never used it, but why not. I just tried it, and it worked. But it's
> > definitely another patch on its own.
> >
>
> What's the benefit over using `python3 -m http.server` or `python -m
> SimpleHTTPServer`? (since those are part of the python standard library
> AFAICT, no need to install new packages).

hmm. right, I thought it might do more.. like updating/building in the
background.. but looking at:
https://github.com/tlatsas/sphinx-serve/blob/master/sphinx_serve/sphinx_serve.py

it really doesn't do anything, only construct the --directory..

I don't think we should carry the extra dependency then.

>
> Thanks,
> Quentin
