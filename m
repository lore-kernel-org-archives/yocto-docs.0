Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.8197.1616168305966562709
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 08:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RZT8vyvK;
 spf=pass (domain: linaro.org, ip: 209.85.218.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f50.google.com with SMTP id b7so10437709ejv.1
        for <docs@lists.yoctoproject.org>; Fri, 19 Mar 2021 08:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/ZepdWRWZkca0OtQufkYYyAjlq/eYrm9Lj3/3LIj4k=;
        b=RZT8vyvKBlkSVbAtRA7bDER7VMSea/kNtpvcSTQgwn9XFCwoM55rt5bxHR24srmObO
         0s5LgjwBmKbRapNuLogsmz2hCGoJ8kiHhXk+1rGRKgdggHFymvqV7mYXi4LydGjNEMR0
         1Yn+X1fx64/U2UWntQpFMjZoLHkEqI5eV9RDt65vrYI3tRnxfNbR91oPojg/OFfJ6Nry
         14a6EgZxg/xH+A2p8NxcLUQGn+eOpv6gH0xtfpkgw7UTDmfPshIKpewUy5irkud0DLAX
         79WbcBv8sHnBXZoh+SE8HWj8I1L/M+UXi9mvwLBtmWMWvJuqi0hBUHp52t5JwEzk/nHg
         okqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/ZepdWRWZkca0OtQufkYYyAjlq/eYrm9Lj3/3LIj4k=;
        b=m+KpRgcu98CD1MWDOXbULr8cljFJldiS1vL9lmp1twE2hcwCeNrkEK08ROhPde38Vg
         ltzRqOYOKCVeOpSVLoCGNPiYwd8/y8aHQ5dAVJHfGu28zHFZiXoKCr454pa2nobzxpco
         mhquP/WipN96GQ5PUAYMPmXbPkOi9e86/zZ4KozBX5PKOkteIqe5sJzLB5Jya18WVuj+
         XELvZgUGb/QDoVrduPWCggEdSymln7qqQXLUO9ZYoBjpSPYTdjIXlfJhJrXa9s/BFpnD
         otnyBV+dUac1KY/wjwROuMmwZCDECBg2XdGVRPuZ4OqW3kYPw72wVyBTQaICnlVTmIHw
         3F4g==
X-Gm-Message-State: AOAM531wiHLkICP1xQPEZT7pfzus3tOnHaodjm+yQlXAqKpKE7MarxSq
	hhBiiz3p/XPMQUSRJI8xr2oJH5dB8N4XcBogJWFB9Q==
X-Google-Smtp-Source: ABdhPJxwFpVGVdqhR0oBELj6tqBpm1MAE3digtQGRWRi2+t92kJd+ZOybe3fsJT07GC6gFjiNwc8xCjSwtqEsQUtTkQ=
X-Received: by 2002:a17:906:71d3:: with SMTP id i19mr5115510ejk.347.1616168304341;
 Fri, 19 Mar 2021 08:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <9c893145-b926-10ca-35f0-ce4348110d49@bootlin.com> <3d828cd45f59e3a7cf2f8966fd3cefd2bb24bb89.camel@linuxfoundation.org>
In-Reply-To: <3d828cd45f59e3a7cf2f8966fd3cefd2bb24bb89.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 19 Mar 2021 16:38:13 +0100
Message-ID: <CAP71Wjyp=jERgyCfajb-nziCbD=HchJ0hbRte_VaBZwmBTtzPA@mail.gmail.com>
Subject: Re: [docs] Inconsistent use of "cd ~/poky" and "cd poky" in the manuals
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021 at 4:34 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-03-19 at 16:32 +0100, Michael Opdenacker wrote:
> > On the other hand, my second idea was to stop assuming that poky was
> > cloned from the home directory, and propose a patch that replaces
> > "~/poky/" by "poky/" everywhere, assuming that people using the Yocto
> > Project know how to use their brains anyway and understand where they're
> > storing their data ;-)
> >
> > What would be your preference? Has this already been discussed?
>
> I've never spotted that :)
>
> I'd think changing to poky/ would be more consistent, we don't require
> it to be in ~ but its just an opinion...

Regardless of the solution, consistency is definitely needed!

So let me propose a 3rd way :) We could assume that poky is install in
$POKY and use that all over the place. If anyone wants to copy/paste
snippet from the doc, they would just need to define the POKY env var.
If that's not desire, then I would prefer using cd poky, as per
Richard's suggestion.

>
> Cheers,
>
> Richard
>
>
> 
>
