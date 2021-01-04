Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.14244.1609771282734792998
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 06:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qO9SRtA5;
 spf=pass (domain: linaro.org, ip: 209.85.208.48, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f48.google.com with SMTP id cw27so27577144edb.5
        for <docs@lists.yoctoproject.org>; Mon, 04 Jan 2021 06:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XLPngp86oFnj+aJ6xyn9PzAjNyT57CJeE3rX+Z99iUI=;
        b=qO9SRtA5ci5+V6RpTtUrS/NV5N1RGfrb5nKDtrauLtEAfJLFQ8E5qftWA9B0lEBS0y
         2EcwwBt0Ns6Iue4c5pAVqvgZOpFi3Jd1jSBUgm1UHDfbo7rz3gKljfs3g4rBgS9uG7nE
         3QaRVbqV/jgr3cqSd7TvdwFXY6JPd5wexLY6pEZZBTREL/DHrF060x+Ew13NCQVQ/lqP
         4IQe6t+yv0loGmEcdF0E3MvMiaoMOHSszPrYGrMUah/yxMJVx43tEwczj/R7lW4B9VBo
         vgLzKC95waxSSFyO7zZ9d1DJghENOUeLXkiOdhdlrfwVflmpdUDWVsZUghX7KoWoUtwA
         1Tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XLPngp86oFnj+aJ6xyn9PzAjNyT57CJeE3rX+Z99iUI=;
        b=qZEGYbtrCX1TbKj+Cb/PHgDoQWPDX0U7pt8DeyBEpFkKvxN2ESn146nOHqQMkzreZm
         pBEE67VL3U5qAv6KV3mLugORzp5+i6UlLH8mUSo1A8iO45WFjbhAprpUa5RyXkrkpj6K
         xwq2xCZzhbGH00VcahnzTMk4SPCu6ZS4IVtI9kqZ6g68KUgevVUCzyyXk/l90sbDcKoN
         bLXjGmpWDU6w7dVxwrKDGwztAwJgttXnDyat8gKHEh9ZfYn2Zp08LNb5wFDoYBKbS20V
         8TWsk5nebSExjdi3pbdHdghbaUdlBSsJ7+fGSfSi7LFs4zQ/NibVV5qEqQfdPAfkS8Ma
         bwnA==
X-Gm-Message-State: AOAM532jcbFomxj0xaTGxxja/AHPC+VUlvCPYRBwceGtpuZKbAD0FtU3
	q/rUwbDmfv0sM4AtONnuq/slal3TXj+BFzhwXg3igA==
X-Google-Smtp-Source: ABdhPJxVR7F5GhxJCdNeGD2PWXqrO0QKnXLxg3vHtQhm0/XaKW+PTkXUj0zIpfIfsl2TN6dtdiR75wMOadm3vgsg2z4=
X-Received: by 2002:a50:fb1a:: with SMTP id d26mr71021918edq.101.1609771281192;
 Mon, 04 Jan 2021 06:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20210104112204.23071-1-nicolas.dechesne@linaro.org> <20210104114408.scgtnjcbpmqdqri4@qschulz>
In-Reply-To: <20210104114408.scgtnjcbpmqdqri4@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 4 Jan 2021 15:41:10 +0100
Message-ID: <CAP71WjwShj5mBCEGCBuHd-YyAPWwOm9YYtHOsvhxHV7_iR+QaA@mail.gmail.com>
Subject: Re: [docs] [dunfell][PATCH] sphinx: update link to bitbake docs
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 4, 2021 at 12:44 PM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Nicolas,
>
> On Mon, Jan 04, 2021 at 12:22:04PM +0100, Nicolas Dechesne wrote:
> > The Sphinx based Bitbake documentation for dunfell release is published to
> > https://docs.yoctoproject.org/bitbake/1.46/.
> >
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> >  documentation/conf.py   | 2 +-
> >  documentation/index.rst | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index 33d0ddcfd..b6d8073ee 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -82,7 +82,7 @@ extlinks = {
> >
> >  # Intersphinx config to use cross reference with Bitbake user manual
> >  intersphinx_mapping = {
> > -    'bitbake': ('https://docs.yoctoproject.org/bitbake/', None)
> > +    'bitbake': ('https://docs.yoctoproject.org/bitbake/1.46', None)
> >  }
> >
> >  # -- Options for HTML output -------------------------------------------------
> > diff --git a/documentation/index.rst b/documentation/index.rst
> > index 937692ce0..71ed4e76f 100644
> > --- a/documentation/index.rst
> > +++ b/documentation/index.rst
> > @@ -33,7 +33,7 @@ Welcome to the Yocto Project Documentation
> >     Profile and Tracing Manual <profile-manual/profile-manual>
> >     Application Development and the Extensible SDK (eSDK) <sdk-manual/sdk-manual>
> >     Toaster Manual <toaster-manual/toaster-manual>
> > -   Bitbake User Manual <https://docs.yoctoproject.org/bitbake>
> > +   Bitbake User Manual <https://docs.yoctoproject.org/bitbake/1.46>
>
> Would it make sense to have an entry for that in poky.yaml? That way we
> don't forget to fix it when tagging the new Yocto releases? (ideally if
> there's a "master" equivalent for where 1.46 is in the URL, we might put
> it there (or just plain '' if we can't).
>
> E.g. YOCTO_BITBAKE_VERSION : "1.46"?

We could do something.. not sure what though, since for 'master' we
publish to /bitbake/, as you noticed.. Note that it's also broken in
gatesgarth branch.
The more I look at how we've integrated bitbake and yocto-docs, the
less I like it.. We try to pretend they are separate docs projects,
but they aren't really.. And it makes several things quite awkward..

>
> BTW, the version dropdown menu on bitbake documentation is broken, it
> points to Yocto docs.

That is one of the weird things we have..

>
> Quentin
