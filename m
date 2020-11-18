Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web10.25351.1605711139092834432
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 06:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HJo5D5Y3;
 spf=pass (domain: linaro.org, ip: 209.85.219.193, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f193.google.com with SMTP id k65so1919312ybk.5
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 06:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cCP1/7oKe0rwU+9d1M7UnOasmYsehOZNbw4fRXumocI=;
        b=HJo5D5Y3wLK8XRjKGlAXcDFMcUiHm5U4VFMrMpXN9zNBQIfALHcnanuz7LjjB+BMqL
         OzSNP8t4K7p8XIoDGkd53T1WUevBIBaeYLvDnRN2Xf1LYw4LnMDL+rzCh1alIL0rarq1
         yceq9gKbq2XuOvbfDlTWfXC4gMlJgc3zJMGTCWkI527nObn8jQam9Rycl80wBcFpLf0D
         HGKAQXmc8IvUpOfZJ3q664zyHq0e1R416gAPYkQjkdX87L0ivuAyFRYaKCjv4+Xgi8jb
         lLPqnufV287xymjMj/ev1HuhSru6fptPFx4mbB03oKk66pWKhG2iAk2sXoDxggzjeC6u
         9O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cCP1/7oKe0rwU+9d1M7UnOasmYsehOZNbw4fRXumocI=;
        b=s4UlHR7p8r3uVBgV06PLlDMByw85FocQby2y52PSS/IHZMrrq9b5RQ3gybAFrP1Zwg
         loyhr0qxz6MWvzMlhCJ4goy7KGn8dDsQa8H3IQTdd9/yQtAb6ot9LxMdcYfh44OHZwoU
         5EPxNYLgQ8WNtzO41UmaxIWbDjcUTntR39YVhmyJSJjz0HAIJ0sv/3WIvHXfZ75oXtgw
         3y1gDxWzGDmJ8S2Apkkkv+mKTeZZorYssc7MV6fw4PGOT3beJ3uAl/FKh8FdblfIKddE
         9yH6ZI1tZoduMt8CnFJIkke5LtzqIt8szLD+SKdeXhw/NxrLdGT1yk6M5pVtep2eMzub
         /MCg==
X-Gm-Message-State: AOAM531Y96eMYJIqArmIyZJpJLYCbzRw/IBFcf4XTvJRGQyHFXOAutN/
	DCwqHiUjbFEOXnMdOel1EfNyIOxe9pWXl16xAZWJZA==
X-Google-Smtp-Source: ABdhPJwrsvPSNmBlMevyunj9iZeWmvGEtK6+N08pT04FZW4srEW1h92ZGj2J7VLdnutEZhV8p8GpdXo/0IUu5p/F4lA=
X-Received: by 2002:a25:287:: with SMTP id 129mr6982562ybc.454.1605711138256;
 Wed, 18 Nov 2020 06:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20201118100705.3656-1-pbarker@konsulko.com> <CAP71Wjy0zX_vExgmWcV_6fA3RcOghRfBr1zvxt9dyphyrdFBOA@mail.gmail.com>
 <20201118143934.ovvg4sb7cte3zk46@qschulz>
In-Reply-To: <20201118143934.ovvg4sb7cte3zk46@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 18 Nov 2020 15:52:07 +0100
Message-ID: <CAP71WjwRQWw8P2H7+Ok5p=kPCYLBO4hYc=v+kfYjEWBN+zjYKA@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 1/9] conf.py: Add oe_git directive
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Barker <pbarker@konsulko.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 3:39 PM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi all,
>
> On Wed, Nov 18, 2020 at 12:42:21PM +0100, Nicolas Dechesne wrote:
> > On Wed, Nov 18, 2020 at 11:07 AM Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > This simplifies linking to git repositories on openembedded.org.
> > >
> > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> >
> > Thanks Paul!. I reviewed the whole series. made a suggestion about a
> > new variable for the LTS name. It can be done in a v3, or a later
> > series as well, i don't mind much.
>
> +1 for LTS variables in poky.yaml, though maybe we can just replace
> _MINUS_ONE variables with LTS ones? From the quick look I had in the
> docs, it seems to not be that big of a deal to migrate MINUS_ONE
> variables to LTS ones and still keep more or less the same intended
> behavior/explanation.
>
> Also, throwing this out right now, I really don't like:
> :yocto_git:`poky </cgit.cgi/poky>` lines.. Couldn't we just set
> :yocto_git: to https://git.yoctoproject.org/cgit.cgi%s instead? and then
> use it like that: :yocto_git:`/poky`?

Yes, I agreed. I even noted it down on my todo list. I remember
wanting that change when reviewing one of your earlier patch!

>
> Nothing to be changed in this patch series though, just thinking out
> loud.
>
> For the whole series:
> Reviewed-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
>
> Thanks!
> Quentin
