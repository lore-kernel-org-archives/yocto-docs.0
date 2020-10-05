Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web10.30160.1601885461817549814
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 01:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ipgb9Y8E;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id x20so6038855ybs.8
        for <docs@lists.yoctoproject.org>; Mon, 05 Oct 2020 01:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hdMLMXtSNr+08Tb9fKRGrh4SoYfa+VDLw7Z/3ZiFy2Q=;
        b=ipgb9Y8Ei/8jBicLAjPZzZBMM8d86mkwcNxUUbNOU7/hDFJu/LqVtu4R5LAXSTN7lz
         8INisQrwIECwCHEgEIRnGdrujb12g9j347yeoJ/Kv40M8FpzKY5+x6yzW9NSRZ5RDF/K
         zB1TEDtvSSj4GeDvor6Nr8O0kqH/uk2ghAf5ijVGlXV4ZuG6WMCtb8JNBqrvN6IxzeTa
         avA3x2x/y7SkS84QXCEOb3PFtZMVMolbINPBkT0ddw2ISPlyq1z/HHyYID3D8z0HZNrP
         PmII/tAfxPUdx6DpoiOVTyLGzh17m/vCX9BDMF/OmrHsiP2um/BAdxjm4KmqOAVaStcB
         YUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hdMLMXtSNr+08Tb9fKRGrh4SoYfa+VDLw7Z/3ZiFy2Q=;
        b=tCZVHSo9M2iRQfzbYiWE8sunMHnMQGcewMY5I3VmtpDxzkpG8RSK1ZaQkuCNwWDZ2+
         RoRrfJ3hmSSwnxHW8GEs/oiWzF1NaCwt8k5tWzJIbsz+LWy1MGMFECpLcjOTNmr2mkHE
         K9Ym3buiuMqlSOsPL41dhGX0fnq3BPxGD5DeYfq0WnhijeJs0wBn0FxypoklRpXDCyEQ
         W8l/Sy+//VdHyjvG/hBq377k67NcmBJ7VHZ6KHoVy0CCjbH/EqtF/4o5192l3NcdQc1l
         jABDEp43bH8ymwP6Y6fcDR4TSySw8c8Sk6lEcLRk21QESfwC49k/6ZGv9n1s9Utm2j/s
         H4pQ==
X-Gm-Message-State: AOAM531qehxRzog7yCXQO0VpOz8dC54SqCa9Xby/qVa/4Z0lyA6YbVDq
	qkZ9GTjRfiUXTUAoNfKjjZqz6lsYRMEq54/wFZf1/Q==
X-Google-Smtp-Source: ABdhPJyFfCUIk0higzzVwArXVFOHuxg40LouXyNQFR4rMn5+dC3oE4F4nl5/FC7hUhkhCGTFSYmPTMvg/wbf8Fr+utQ=
X-Received: by 2002:a25:e009:: with SMTP id x9mr17447229ybg.373.1601885460921;
 Mon, 05 Oct 2020 01:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201004085728.8015-1-foss@0leil.net> <20201004085728.8015-3-foss@0leil.net>
 <CAP71WjwcYvRUE5WzWK6MADr7XxnLS9v4=h9TCCK58WcZf0MRiw@mail.gmail.com> <20201005080405.6xhlbk3j5gxe3yqi@qschulz>
In-Reply-To: <20201005080405.6xhlbk3j5gxe3yqi@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 5 Oct 2020 10:10:49 +0200
Message-ID: <CAP71WjxykFW3msmVEX=ASrnUL5a4uD3gz+gjn-GH5owQi4jjHg@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/8] docs: ref-manual: indentation, links and highlights fixes
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 5, 2020 at 10:04 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Nicolas,
>
> On Mon, Oct 05, 2020 at 09:54:13AM +0200, Nicolas Dechesne wrote:
> > > diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
> > > index f16aaaa97..2f0da48ab 100644
> > > --- a/documentation/ref-manual/migration-2.6.rst
> > > +++ b/documentation/ref-manual/migration-2.6.rst
> > > @@ -110,7 +110,7 @@ upon the older ``*proto`` recipes need to be changed to depend on the
> > >  newer ``xorgproto`` recipe instead.
> > >
> > >  For names of recipes removed because of this repository change, see the
> > > -`Removed Recipes <#migration-2.6-removed-recipes>`__ section.
> > > +`Removed Recipes <#removed-recipes>`__ section.
> >
> > are you sure about this one? perhaps better to use a :ref:?
>
> 90% sure, I can test again tonight at home. I think this kind of URL
> works fine when using the exact name of the section iif the section is
> in the same html page. Not against having :ref: instead if that's what
> you want, can probably change all <#.*> to their proper :ref: so that
> Sphinx gives us a warning when the ref does not exit.

you'right. it works. The anchor is created by sphinx because we have
autosection extension enabled. so this patch can be merged as-is.
whether we want to convert uses of local anchors with :ref: is another
question.. but can be dealt with separately. The fact that we get
warnings when we rename a section is definitely a good reason to do
it.

eventually, i want to remove all the custom labels that were created
by pandoc, since we no longer use them..

>
> Quentin
