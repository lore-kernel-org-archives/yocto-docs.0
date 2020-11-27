Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web11.20954.1606493378766318378
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2020 08:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BzL3L5hw;
 spf=pass (domain: konsulko.com, ip: 209.85.167.195, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f195.google.com with SMTP id v202so6335862oia.9
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2020 08:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8/tPq7brskzynYb53BG6ZUlTabO0Pno7AgcGEEzp3M=;
        b=BzL3L5hw6sDmVSYowPO8mMop8noL3Ssrpj0xLOjYnOmtJy4XB4zlEYbxQfORveuncO
         VgFVoO106wA7JAChth6A0YKkomAW64qZA3WEuLw1w4l3E+XirqnAiGlIPlA4l3q7CyJH
         iIfwP09KzrQXERvRrVZzZr86f8USrQRP2FAs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8/tPq7brskzynYb53BG6ZUlTabO0Pno7AgcGEEzp3M=;
        b=cMAWwMV6KEHiyKOaEQIOH3nJ3YoQLjB6UfIrKOwZt237BGhGXQi2nxbVqBRMz+HBD2
         FCAt2Zy8vKvRRykCHPTa2yJblP5hZg64PXS5PmyfYhNV+7S+rD8otOfXih6S6FF1jQ9U
         kyLFxwR9+juBtKWehwmQAgzqa002S856FtlOZnX+bu8O7ReLksyCDnnpg3e+c1zOFDin
         moX/hhIhHqAm+C0Vte6DsLB0UsWx0AaICYIoP9xeNZnJ6bocHjcG5iucqQC56bdLOVFA
         3ZhfvFrrRn8ZaEdMLcd/jay4+/COzhaYUkK66+HYxZ6HJkoIBK+fYQO7cNg0XlhgVPrD
         vI2A==
X-Gm-Message-State: AOAM532hVqyYhNWsMvUoOAQIf8YnazEFbHZFxMe6fJtXHgnH7SvTRA2r
	c4yijxTwLOLYZYX+/TePg6/xnX8fkM9lx8tDnHPF+w==
X-Google-Smtp-Source: ABdhPJwb1gEj++ibTQkjsujdM6iH8oUkzZrOlcAXR9CZwW0UAlhH9Do9zTzAknej5Ycot0jleTTdCJRJTYNEoQQfUr0=
X-Received: by 2002:aca:ebce:: with SMTP id j197mr5870361oih.6.1606493378157;
 Fri, 27 Nov 2020 08:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20201127151910.6397-1-pbarker@konsulko.com> <20201127151910.6397-2-pbarker@konsulko.com>
 <CAP71WjwPCqZEFZNb5T1G5hXH=9yp5P0n=gC1U6A4tofYq2P1Aw@mail.gmail.com>
In-Reply-To: <CAP71WjwPCqZEFZNb5T1G5hXH=9yp5P0n=gC1U6A4tofYq2P1Aw@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 27 Nov 2020 16:09:27 +0000
Message-ID: <CAM9ZRVsA01Q5AKGYsvAZAX3SKwuqNqYrrXqPmfD-ttEO_cJvkQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/3] documentation: Simplify yocto_wiki links
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Nov 2020 at 15:43, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Fri, Nov 27, 2020 at 4:19 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > The `yocto_wiki` external link directive is modified to include the
> > `/wiki` element of the URL so that we can simplify the links in the
> > text.
> >
> > Note that there are still a couple of places where this directive
> > cannot be used, such as in the table of contents in index.rst.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  .../brief-yoctoprojectqs/brief-yoctoprojectqs.rst  |  2 +-
> >  documentation/bsp-guide/bsp.rst                    |  2 +-
> >  documentation/conf.py                              |  2 +-
> >  .../dev-manual/dev-manual-common-tasks.rst         | 14 +++++++-------
> >  documentation/dev-manual/dev-manual-start.rst      |  2 +-
>
> You missed one instance in dev-manual-start.rst:
>
>       For a "map" of Yocto Project releases to version numbers, see
> the
>       :yocto_wiki:`Releases </wiki/Releases>` wiki page.
>
> I found it with make linkcheck

There's always one that gets away!

Also, TIL about `make linkcheck`. I'll add that to the readme as a
recommendation before sending patches if you've added/modified links.

-- 
Paul Barker
Konsulko Group
