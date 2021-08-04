Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.7034.1628072305125116020
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 03:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gVxDqOSQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id x17so869815wmc.5
        for <docs@lists.yoctoproject.org>; Wed, 04 Aug 2021 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=S9HdmD0Q+HujMd0ualeVXE+yG+jg4NH7rPoaR7f256Y=;
        b=gVxDqOSQE9TbhQeca06LgRODLI+ll9Uq4WSceC4PLWjv28pyNGJ+aA1qpDO133UQm2
         7dCDIkzroZMclwTtvPhuP7hTq4PitQ3u0lkmJ3DKxj3ZRtQqhGQCD3nivYjEO5db4YBU
         0ReG3gRLSr1spf0LRnjLeKV42OGDSzQRZEHNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S9HdmD0Q+HujMd0ualeVXE+yG+jg4NH7rPoaR7f256Y=;
        b=oJ15yB3AMgXnMqURbkoc5HUkv4/THjmWSRbyqdlj10qkoEFC9KeRB4J2LjfOhbJUYg
         /tv7rUNoFkiv0yYeCatX36D3Dil9KfRqWrDk6ED9FapCvCG/ZNuW2IjjIlSM1SePvgIZ
         vz+EeIkhmVXA/DfCRrcYP2o975fXctGVuTABI+MGYDr9UiRp9v3NmdzfzD/+ShAzQHRv
         BPDypWdTPuMzWhQg+fTt2qvKKBN94ZoxHZMFUqlm1tvSQGJcIoD424rvb8cDbZ4H6R2A
         VRozTK/Cwha+K0oQGtSnjG1i6kNRmyzX+l0k952yIcTe8uL/YReTQp1gW1VtZGKOQkst
         CA0A==
X-Gm-Message-State: AOAM532ZDqLhfQgnhnzHs8a8fpzVRmJCrJGeJr/RhfKx9i91/IdVmWKB
	QgfT8j3fsv8q8kbGnQ5UlUdBpA==
X-Google-Smtp-Source: ABdhPJwBuQi66ePhifqwB7IjQHwT0y93wRSoQmdUj7q0LlgvjVOcoZWHRrlPtvZo9BArtASHc068RQ==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr8827789wmc.102.1628072303728;
        Wed, 04 Aug 2021 03:18:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id x18sm1958345wrw.19.2021.08.04.03.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 03:18:23 -0700 (PDT)
Message-ID: <366ed6421a045d9fcb622ee7026adb9f053a2f29.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/2] test-manual: Add extra detail to YP Compatible section
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Michael
 Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Wed, 04 Aug 2021 11:18:22 +0100
In-Reply-To: <20210804101326.te67ewqcjk4k6yjp@fedora>
References: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
	 <d982b722-9fd8-035f-878e-62ce7da99e9c@bootlin.com>
	 <20210804101326.te67ewqcjk4k6yjp@fedora>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 12:13 +0200, Quentin Schulz wrote:
> Hi Richard,
> 
> On Wed, Aug 04, 2021 at 12:04:34PM +0200, Michael Opdenacker wrote:
> > Hi Richard,
> > 
> > Thanks for the documentation patch!
> > 
> > On 8/4/21 11:47 AM, Richard Purdie wrote:
> > > Add a note about documenting where a layer doesn't support 'core'
> > > functionality.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  documentation/test-manual/yocto-project-compatible.rst | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/documentation/test-manual/yocto-project-compatible.rst b/documentation/test-manual/yocto-project-compatible.rst
> > > index a7897469f..b83a0f12b 100644
> > > --- a/documentation/test-manual/yocto-project-compatible.rst
> > > +++ b/documentation/test-manual/yocto-project-compatible.rst
> > > @@ -115,6 +115,11 @@ Here are key best practices the program tries to encourage:
> > >     user changes a configuration setting to activate the layer, by selecting
> > >     a :term:`MACHINE`, a :term:`DISTRO` or a :term:`DISTRO_FEATURES` setting.
> > >  
> > > 
> > > +-  Layers should be documenting where they don’t support normal 'core'
> > > +   functionality such as where debug symbols are disabled or missing, where
> > > +   development headers and on-target library usage may not work or where
> > 
> 
> Do we currently have an example layer that is following this suggested
> best practice? Because I'm struggling to understand exactly what I'm
> expected to do if I were a layer maintainer.

I only know of one layer at present where SDKs were broken, -dbg info was dropped etc. 
and that was a genuine mistake. We (as in the TSC) wanted to make it clear that this 
was not intended behaviour in a YP Compat layer. So no, we don't have an example.

> Do you want the maintainer to keep a list of recipes/packages provided
> in their layer(s), in e.g. the README, that are missing debug symbols or
> "invalid" headers/libraries?

I don't think it needs to be a list, just a statement that the layer is not 
intended to have debug symbols present, or support building an SDK.

Cheers,

Richard


