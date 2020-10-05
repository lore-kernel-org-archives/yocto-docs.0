Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web11.31049.1601891126861685261
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 02:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=l1KIBLXL;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id h6so6205659ybi.11
        for <docs@lists.yoctoproject.org>; Mon, 05 Oct 2020 02:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a1+tAJf5S6Rsw4WTOB+CAtMmbIXhqOd/kbADSj9DVS0=;
        b=l1KIBLXLNeZklwrJ2ky8sBE9u2vyhbE44O6Zc2QJFfwbjpp9j+XGPOwSZTUh1um75S
         A5n/nnzjV+6R7UuFSkpsSWS0Bu/HdUg+59rjz3f8bJm3ymmlHcPiaYOd7kDynIs+RwT7
         y0G5e6RItQGliUTPPiJtuvHeOzfMbPnbECiWsQqdCl2d25KOR8j2Ybi8JCG8ts4fK2Jr
         HzZXuY/xV0pWP3vwF9HYukoR+OXcydA1S/LO9wRMKMWP0ixyreYvMdy2skk3YCwJjXjq
         0DDs8ikXTU4kWCYa9ZCE6NlHzYxPykLnOPmbVNHwWIJeqUsOEml7kko5jltG8V+EfmfG
         pDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a1+tAJf5S6Rsw4WTOB+CAtMmbIXhqOd/kbADSj9DVS0=;
        b=ftugeWv6IAQQbuA3gaTtCSB3BGuhBHL8co0eAud0BFJEolFrstuPrdeBT6QNdsFlmq
         bXZiYEtXiLISOa2KNDHIQjkJSAjxIiTCJFhh7bsTo41JdAzeycUOFJrargGeyX8hq01W
         12gGVocLKyyxU/lumBTZgvl28yuw7jbVymCG+r7uTrU3sdbXD0qUUOJGLa/x9YnCm8m3
         uo9XjJyYjkyTtTTCGktZz7ZLiTrM33Cstlv/Xn0OjciWpDqeoR6N6uVvpfgIQ96fNJ7D
         K20BXqV7PXy47IZ/dj3C18/2IleXzia4XWNSBqJTgvDuoax+hjsfhota2egRTcPeOkCh
         3uGQ==
X-Gm-Message-State: AOAM531o7dBM8vHsLVX6EdH8LRVnezi6/7VOYrAFWeUEHQm1904EudOn
	DC9LwJuwyvmlm0xX/xv2kL2kwfEJI2dwVw3nweBv5Q==
X-Google-Smtp-Source: ABdhPJxd+wX/6zT9Hkr/E8NWi6/3vFoglsRPmkxVNUQhkclr0lOKTJAyV9SkKx6Sm8w0aQpv8nj0fiX6TXgUcrpq874=
X-Received: by 2002:a25:bfcf:: with SMTP id q15mr17247109ybm.133.1601891125856;
 Mon, 05 Oct 2020 02:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201004085728.8015-1-foss@0leil.net> <20201004085728.8015-8-foss@0leil.net>
 <CAP71WjwU71MHWO7XbRsNpCV69ifdMVKjfktbr2-xFWX0Oow_BQ@mail.gmail.com>
 <20201005081055.5zuqh4d7gmibaso5@qschulz> <CAP71WjxOAEd5XcbEOhVJeWD7ASSozCb-jbL60oxECkQE1mWYCA@mail.gmail.com>
 <20201005081542.r4rvjnyg3ospwp2p@qschulz> <CAP71WjyWGpLmXhO+Cvg554FxD=c_8=XWaJqd+jXxDM_fJtwB0A@mail.gmail.com>
 <20201005094019.muft3mo4fgpbfptt@qschulz>
In-Reply-To: <20201005094019.muft3mo4fgpbfptt@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 5 Oct 2020 11:45:15 +0200
Message-ID: <CAP71WjwHjUa48fZM+WjpSwy_ezQza5Q7OpZ-siOuyx2vmAkyUA@mail.gmail.com>
Subject: Re: [docs] [PATCH 8/8] docs: ref-manual: ref-structure: replace oe-init-build-env by &OE_INIT_FILE;
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 5, 2020 at 11:40 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> On Mon, Oct 05, 2020 at 11:20:36AM +0200, Nicolas Dechesne wrote:
> > > > Just to be consistent.. if we have a variable for it, we should use
> > > > it.. though I am not convinced we needed a variable in the first
> > > > place.. i am not sure we plan to change that script name often ;) so
> > > > we should have OE_INIT_FILE and use it everywhere, or remove it, no?
> > > >
> > >
> > > Indeed. Soooo? Do we remove it or nah :)?
> >
> > heh.. I haven't been able to decide so far, but now that you insist
> > ;-) I think we should remove OE_INIT_FILE everywhere.. and just keep
> > things simple..
> >
>
> Didn't know I had this power in my hands :D
>
> OK, so what about this patch, do you still take it and I do a sed
> s/&OE_INIT_FILE;/oe-init-build-env/ tree wide and send a patch for that?
>
> Or do you want the sed patch before this one so we don't touch
> any of the OE_INIT_FILE stuff in this patch?

Now, that we have made a decision.. it should be *instead of* this patch.

>
> Another suggestion?
>
> Quentin
