Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web08.4353.1607032228776261573
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gLAY9+b/;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id x2so3434192ybt.11
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O5bWi54wWeOnfKkn7DyxL6GM4cYb5RfGChRSZv7FMRk=;
        b=gLAY9+b/7Y/ddwQVDC/7uCStRwWQlYWa94E7Q4INF9cfKWzxtFq/nJT26WPR3oBnZv
         J8Z2mXZyopXTcNq+z8ca6mKfLaQk45rb7jPYKZGdQQkp5Y4/pLiD9tXqWCqL3iZfG+nx
         bTh17Z4O6PhpVUbBPZTix0FJTfRnxuZkX2u10yOB6xW+pzlTWaE/GJT1dR//Gpud8jWf
         g1XNubaOErh7dEcuiPs62WSRwXK85KEaGkNpkmct/a6W+b/smcrnug7JDRXmvOjAxS62
         hLREAKb1LrNq1Iqj4VWY8h/BbAuW0bS1O+z2VvRGhPyFcXgcWJbfVDG5GVsKJKcYKW6i
         7t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O5bWi54wWeOnfKkn7DyxL6GM4cYb5RfGChRSZv7FMRk=;
        b=ScYY0fYXf9KdX+WDSkFJbmbp5AveY4cFRok7aP9k4xm6m+llWmsPsgFBA0gwI1dIT/
         D21Z1FhBDhYXew2Z6E807tZlNVD5y7BYCiJL7IVkFo9rxwyjEtcXCuibCTXcYnaHG11q
         /a7DvqFDnKbt8eMEHCd595aE03om5Y4d+A7n6Ex9zajkj1jrl0kV2FPXgA8UXbcQZKmF
         EDTyajqv3RBOY70sl2+YvDNxHLrwMOQz00M+wkkM3nCgUHn33hxbyz7zQOX64I5Hzq5/
         GfsR/F6yLCdjI53cTkhiRFacjm3k7+UPYIjPvBvgvgyJEXGzai1pdMaRGMp26mHqGUAl
         rE5w==
X-Gm-Message-State: AOAM533ux/FeP05ZPiNEJBz7H4HejRvl+FPb0+GgBKi4a+jEKiLdlY63
	3TLP81rvOxBYQQEAcuwSeitjSmkC+g2YCoCqJ8sudA==
X-Google-Smtp-Source: ABdhPJwYBZT5Xa6wB4I7n528UyX+E1db4GPCB+6lnu6gQJ1cmsGDq09QBQzO0ovh0cJBv8p8mHBcrH5KKtVyMHtOaww=
X-Received: by 2002:a25:b804:: with SMTP id v4mr1793842ybj.371.1607032227752;
 Thu, 03 Dec 2020 13:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20201202220453.33336-1-mhalstead@linuxfoundation.org>
 <a9242731-e044-c649-ac05-4b18ee33f011@gmail.com> <d0b92a768d8e231407eb9bd78c0c43baa161f8d8.camel@linuxfoundation.org>
In-Reply-To: <d0b92a768d8e231407eb9bd78c0c43baa161f8d8.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 3 Dec 2020 22:50:17 +0100
Message-ID: <CAP71WjzVb9TGccABQ20_5N706Zv2h6nXk30AV4ae3GQetk1BYQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] releases: conf: add link to 3.1.4, update to include 3.1.4
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: akuster808 <akuster808@gmail.com>, Michael Halstead <mhalstead@linuxfoundation.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>, Richard Purdie <rpurdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 10:43 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-12-03 at 13:40 -0800, akuster808 wrote:
> > IMHO, I believe the branch maintainer should take up this task.
> >
> > Should update process page if not already noted.
>
> I'm a little torn on this since the final step is part of the
> "publication" of the release and the CI system does live deployment...

I thought a bit more about that today.. I have 2 ideas..

1. we could decide that we don't backport new releases into
releases.rst from stable releases. That should make the maintenance
much more reasonable. e.g. in
http://docs.yoctoproject.org/gatesgarth/releases.html
we will never show 3.3, 3.4, ...

or

2. we could 'hide' the releases.rst page in all stable branches. we
could check the version in conf.py and skip releases.rst , unless we
are on 'master' (e.g. on http://docs.yoctoproject.org/releases.html).
Users can always go back and forth using the drop down menu.

>
> Cheers,
>
> Richard
>
