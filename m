Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.19173.1627908215641042524
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 05:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pu611XSf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id h14so21298461wrx.10
        for <docs@lists.yoctoproject.org>; Mon, 02 Aug 2021 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IyjoLDmhxi4hOFzcfS3UkLpZIVzc8sEfLJPWjr6+hio=;
        b=Pu611XSfjpFizIwBL/pg8JSqUgcBCO2/+AvoaHioNjxPp2XxzrIeM6MSneGIPlzztC
         KUe1uj4gfyjqjtFb9n7FoQuMI2lhr+S6TCysUB0vH8Yb6Vv6kmWNdbsQ66YjdxTqycY/
         Ls05RqE5oN8lzV2ltUljw7XU3aSAppiMVQq5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IyjoLDmhxi4hOFzcfS3UkLpZIVzc8sEfLJPWjr6+hio=;
        b=Ik3ifCHa3q2OZ9q92UHqZc9bFD7mIcmZK8MLlkSgb0VXrw36L4AsoHpZrqwQ8P99GV
         abRcPyq06EUJ0VC+QWrroRuS622qsqvLUTkCrlzsnMmHUpqp0UP2QTFIAIFjB7xgMv3d
         clxBuxATGS4y64wgVqVvld7ov3KaXLkmH0tNmY7krtnGdChVDs6oZmvE75YbQFKqd6zO
         3dsl1G3fkdzOpt/3UiCQ0MLd1sZFMzuTddSaLwUXhG52j8A0B+XMEVDKADAqLZHDYD+A
         uKACxiThbEsnsvhmGmU8+8Q5ve7zVEFwwfHsSAsSV9H2DQ9NJ9n4dRCVuWjU4lppedkQ
         IRjg==
X-Gm-Message-State: AOAM532ub+18XJ8NSG6AyCY9zyAlS9ZmfZchNqFZyjtoAY0ezccEcp05
	KPdYLlX2GCGrK6acNSmGavvlRQ==
X-Google-Smtp-Source: ABdhPJxdQWfKha5o40AsF0Txx8YKOwm0WUUncbsCMJLb1SbkGw3ZzqCdHlDf4qlDEQfSWgiftEGojQ==
X-Received: by 2002:a5d:4a85:: with SMTP id o5mr17319233wrq.67.1627908214033;
        Mon, 02 Aug 2021 05:43:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9aac:cd42:2ef7:1a7c? ([2001:8b0:aba:5f3c:9aac:cd42:2ef7:1a7c])
        by smtp.gmail.com with ESMTPSA id j19sm9664141wmi.3.2021.08.02.05.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 05:43:33 -0700 (PDT)
Message-ID: <6d8cf5bae1c7ee038342d837b0537d30accec9a2.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] profile-manual: document how to build perf manpages on target
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Michael
 Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Mon, 02 Aug 2021 13:43:30 +0100
In-Reply-To: <20210802093816.vndv4fa25mbypjca@fedora>
References: <20210730160617.185319-1-michael.opdenacker@bootlin.com>
	 <20210802093816.vndv4fa25mbypjca@fedora>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-08-02 at 11:38 +0200, Quentin Schulz wrote:
> Hi Michael,
> 
> On Fri, Jul 30, 2021 at 06:06:17PM +0200, Michael Opdenacker wrote:
> > Thanks to closing yocto bug #3388, there is now a simple way
> > to build the perf manpages for use on the target
> > 
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >  documentation/profile-manual/usage.rst | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
> > index 825290c3f8..ae4efa7f4c 100644
> > --- a/documentation/profile-manual/usage.rst
> > +++ b/documentation/profile-manual/usage.rst
> > @@ -1157,13 +1157,14 @@ section can be found here:
> >  Normally, you should be able to invoke the man pages via perf itself
> >  e.g. 'perf help' or 'perf help record'.
> >  
> > 
> > 
> > 
> > -However, by default Yocto doesn't install man pages, but perf invokes
> > -the man pages for most help functionality. This is a bug and is being
> > -addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for
> > -basic 'help' functionality </show_bug.cgi?id=3388>`.
> > +To have the perf manpages installed on your target, modify your
> 
> s/perf/``perf``/ ?
> 
> > +configuration as follows::
> > +
> > +   IMAGE_INSTALL:append = " perf perf-doc"
> 
> Should perf-doc not be the only package added to IMAGE_INSTALL? I assume
> one wants perf-doc only if they need perf so they would already have it
> in their image?
> 
> s/perf // is what I suggest here.

Personally, I think it is better to be specific. I did end up just installing
the doc package when I first attempted to test this and if I can do that... :/.

Cheers,

Richard

