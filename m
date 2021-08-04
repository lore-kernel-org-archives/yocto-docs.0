Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.7194.1628073742930600572
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 03:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g9z0A0AG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id k4so915789wms.3
        for <docs@lists.yoctoproject.org>; Wed, 04 Aug 2021 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JwJdaXuOl1WI7EICkSczuJyIPs+4cOwohe5vSStsyu8=;
        b=g9z0A0AGK3FlpJK91VgVbc1SfAV/KPBaGzhWPQ+qGTdfGBO+OjbSb3YJHmLgxm2Tqi
         sW7TdEjkM/8SLdHRXtkGRQ1olcpq7ExXjCQLXPIx47Ohzo2ytgDw/uUeWForXuwPrjkW
         kLXTOdS7BLwswNUyq6ViOuSBP81sIKBw0Bfj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JwJdaXuOl1WI7EICkSczuJyIPs+4cOwohe5vSStsyu8=;
        b=Co2YilrbP9id2i3zmBMp2H6rWpBpp3wyD0QdNW8kArxZGeOU6D4tdUgB25gKGXpaVS
         noil2L/ey9UQM+nscypQmyj88ZirEBt2hQ30D2tQnwb65cjEMb7wPvp3BRGihoBYHGTo
         qXNEGClWwHwE5Q4zS1IoytRvo/jat+OsMKnKn6Z5eWIgaX3GaQFuGL8iTm6nep1uAaqV
         LO0kNZzA9wGe3ZHBbmhM4l4IgH+GzFHLo+KjFV19PDKnAVPOu8RlN8ca02qpR3tARXO7
         QsDcd2spEUJDuA7hq4sUwt4jK9PGY6maCQnj7W1/iiR2ZiAN/g2qcyDoJGJ365lrJNHB
         CWnQ==
X-Gm-Message-State: AOAM533X8VXVSPcJNcWpBae4ciEZDnL3WhAU0WsaJ9UYBQ6Yon4NXFIP
	gZtlRZ8rkf72WC7BzPQQiHWRSA==
X-Google-Smtp-Source: ABdhPJzVrnuI0jprxD7/DAPV/TlSjwoExyM2SYEJ2t3h4ZZExZIKd8NLo4ZibOgOyvxmM3oSorwzDQ==
X-Received: by 2002:a05:600c:3547:: with SMTP id i7mr9034174wmq.184.1628073741331;
        Wed, 04 Aug 2021 03:42:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id u2sm1808235wmc.42.2021.08.04.03.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 03:42:20 -0700 (PDT)
Message-ID: <5808e653df7af1813d2dccbb0eebc2f6aea888d8.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 2/2] migration-3.4: Add extra notes to override sytnax changes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Date: Wed, 04 Aug 2021 11:42:20 +0100
In-Reply-To: <20210804102916.2k4qgvnyxz326fme@fedora>
References: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
	 <20210804094714.3500323-2-richard.purdie@linuxfoundation.org>
	 <20210804102916.2k4qgvnyxz326fme@fedora>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 12:29 +0200, Quentin Schulz wrote:
> Hi Richard,
> 
> On Wed, Aug 04, 2021 at 10:47:14AM +0100, Richard Purdie wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  documentation/migration-guides/migration-3.4.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
> > index 6fa1ab20c..d42ee8851 100644
> > --- a/documentation/migration-guides/migration-3.4.rst
> > +++ b/documentation/migration-guides/migration-3.4.rst
> > @@ -56,6 +56,12 @@ context being specific tasks in that case. Tune overrides are another special
> >  case where some code does use them as overrides but some does not. We plan to try
> >  and make the tune code use overrides more consistently in the future.
> >  
> > 
> > +There are some variables which do not use override syntax which include the
> > +suffix to variables in layer.conf files such as BBFILE_PATTERN, :term:`SRCREV`_xxx
> 
> s/BBFILE_PATTERN/:term:`BBFILE_PATTERN`/
> 
> Styling might be better with :term:`SRCREV```_xxx`` (if that works,
> might need a "\ " before or something to separate the tick quotes?)?
> Maybe worth a try.
> 
> It's the first time I see this SRCREV_xxx variable. It does not seem to
> be documented except in bitbake/lib/bb/fetch2/git.py. I think we should
> document this.
> 
> I'm failing to see exactly what the usecase depicted in the
> "documentation" in git.py is for, but I imagine a plausible scenario
> could be the following?
> 
> SRC_URI = " \
> 	   git://some-git-repo;name=foo \
> 	   git://some-other-git-repo;name=bar \
> 	   "
> 
> SRCREV_foo = "abcdef1234567890"
> SRCREV_bar = "1234567890abcdef"

That is how it is used, yes. Also SRCREV_FORMAT needs to be set in general
with this.

> > +where xxx is a name from :term:`SRC_URI` and PREFERRED_VERSION_xxx. In particular,
> 
> s/xxx/``xxx``/ ?
> 
> s/PREFERRED_VERSION_xxx/:term:`PREFERRED_VERSION`_xxx/ (if style
> suggestion above is chosen, to be applied to this too).
> 
> > +layer.conf suffixes may be the same as a :term:`DISTRO` override causing some
> 
> s/layer.conf/``layer.conf``/
> 
> > +confusion. We do plan to try and improve consistency as these issues are identified.
> > +
> 
> Is there going to be backwards compatibility issues when supporting e.g.
> PREFERRED_VERSION_xxx to PREFERRED_VERSION:xxx?

We're explicitly not changing that right now.  For specific instances like this we 
can likely warn on old usage and convert dynamically for a bit so they are "easier"
to fix later.

> We can't really afford to break compatibility every time we "fix" those,
> is there any plan for this already?
> 
> I also think we should keep in mind to update this section every time we
> encounter one of those "inconsistencies"?

Yes, I suspect we'll have more updates to this section as people convert layers and
we find the corner cases. I want to document the ones we know about whilst we know 
about them and remember!

Cheers,

Richard



