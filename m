Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web09.13061.1603114013906974778
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 06:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YPCmU/XV;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id o70so8894950ybc.1
        for <docs@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ulzg9VWIHKIsM6l5OLa9CqBWuRl9ITCWEC7BCZOOfl4=;
        b=YPCmU/XVbyZJ3RG1tT3FqFvob71Lz4rXpqq7QU6PCf7hWyT+l8hPVVaNy+mWBRAn5E
         C236B9VFMVisCQltYeTyA3BVROkQy1vjVLjWWsEHgrplxY7kPvrAg9/7koEbSGw0//5f
         SADRS60fVtbYs3pZ5L/98u1nEqmrkhq1h340e4n61hVpBq7xwDldk8V2G62tGQt1x588
         g8X4xkYCUiyJW4Vajj8CSABQkRAy0lQRLBnhZGWf2qSEw5S28iWiv9R1/3MhcHgrJAEr
         yJsnIkjhavWaPVtp+xpxp+5sJRtZX8gkyTXG9PxuV/a9F5EUWO+tdCAe/QRB6gYWUhiP
         7hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ulzg9VWIHKIsM6l5OLa9CqBWuRl9ITCWEC7BCZOOfl4=;
        b=nVigdr4Atf7fQt3dKsQHR0L7EyfgQxbfaXwcLVu3Y3cDs/tjsONTchmudx2jPqhPQS
         g2HeaNJkG7QREJjKehVeKtYORRkSS5WmAcl05Zila+mcL6j3cMDJ5K5zMYhr5rL1EU5G
         C2ul9TKAboYDw/LflHbeEjk/CE3Lau5ys4tBFKY0wNRAmQJB2NF9hD7M8C67FH52SwVy
         8zAi/5bQyQj+todUXys50rti2bCge5Z2wwdH9dhLvfnnrObhAgWWqWUt9/pwjlvjdOaw
         v+7EVBFYRMfadl8RPonUMCoNHi5ZMke5a1Lj0ftsT8ZU/joQh5tgtPhcy35Fy9gpBrcn
         8bGw==
X-Gm-Message-State: AOAM5308/wi3RQHWCNrnNtHL3mqrW7QXy+VqN67aQYRRPkCbJrpubFY5
	5QioT/TZs8WuUJY+Zl3hrs3DY9kTn+ob0zAj2wIckg==
X-Google-Smtp-Source: ABdhPJyWoBBrlNWxYCfF0P79BpTCs9Yu7p5gsb4d2nr1XHuKm3I54r15fVlpz5GOc511FjPHj4Q8swUkNjNP4rrn9Zs=
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr6117147ybc.273.1603114013007;
 Mon, 19 Oct 2020 06:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201018175712.23800-1-foss@0leil.net> <CAP71Wjx8MJNy0-jN4+P39TTK0C5zyd8BQomTbX2jOiO4jGzx0Q@mail.gmail.com>
 <20201019132105.ugmzxn53gzwpmfhe@qschulz>
In-Reply-To: <20201019132105.ugmzxn53gzwpmfhe@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 19 Oct 2020 15:26:41 +0200
Message-ID: <CAP71WjxTGiXwbL0X_=QVbfaPivX+JsoYSNbFMzz8PUHJM_Ff2g@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/3] docs: dev-manual: fix typos, highlights, indentation and links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2020 at 3:21 PM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Nicolas,
>
> On Mon, Oct 19, 2020 at 03:17:22PM +0200, Nicolas Dechesne wrote:
> > On Sun, Oct 18, 2020 at 7:58 PM Quentin Schulz <foss@0leil.net> wrote:
> [...]
> > > @@ -482,7 +480,7 @@ have to manually merge changes as they occur.
> > >
> > >  When you create an append file, you must use the same root name as the
> > >  corresponding recipe file. For example, the append file
> > > -``someapp_DISTRO.bbappend`` must apply to ``someapp_DISTRO.bb``. This
> > > +``someapp_3.1.bbappend`` must apply to ``someapp_3.1.bb``. This
> >
> > Should we have &DISTRO; instead?
> >
>
> I don't think so? Is there a reason for wanting someapp's PV to be of the
> value of the current release number of poky?

Ah, right. I was doing a 'naive' review and spotted that you replaced
DISTRO with 3.1, and spotted that as an issue. However you really
wanted to fix it! I think you're right, we shouldn't have had &DISTRO;
in the first place...

so with that,
Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

>
> [...]
>
> Thanks,
> Quentin
