Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.9875.1627566489522724319
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 06:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=My85Ant7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id b11so1696719wrx.6
        for <docs@lists.yoctoproject.org>; Thu, 29 Jul 2021 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NXq8+6wPp0ouOXIz4yQ5mMvtTH34DAkmr6Gz93TlHo0=;
        b=My85Ant7PvpQMpwfnmxttT+RHLP/g+9NyJRHOVVfpfZT5aQMykMCUJ3NVRJlh1I03t
         0f3upX5xSWNXeUEnuEtv6kTCl4H57h1YQFbFHs+HqFTSNSSxOmrsUR0mJARntmIHEs6p
         3ycJ37AeIuc7bWubHPSywh2Tw+uOg1DhdfQCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NXq8+6wPp0ouOXIz4yQ5mMvtTH34DAkmr6Gz93TlHo0=;
        b=qC40/3YD1s7/P5gD+mE2ysI0YvblOz/KJsZVKNXcWtJTt70bPhyNidr1+gUD1NUgJj
         jJFI9O90rjrWB+1vLigNPUTJoKAUp+0c8PF/3p1r9SFBW4ZMN5UnNL9sPEFlL4SgjrPm
         p/b06j2EVBb9jBufyhLGvZ0jWrwDtearAzao5taWRua7XmicrXTiO5QAtkr65KDYVQdk
         oB2NrDHsGi5CXSeD3n2H/dDRctXAz3E7tV9+pAiJd8gDiSbuYPsTyI/7coqnkPqKToWa
         RYRzPHSUzVRlx/THmVAUQiL2Etu9qZlozcfXt55Gj+A+qpece/ff1VA4tbUWTfXH028w
         MHXw==
X-Gm-Message-State: AOAM532z5HzeQRAHrzPV+49hoHJRkVCU2OqKCOUuGMCY3eU/Bo+bdZag
	N0vEWleiInYHPgV9ZlEaQ9LF8Q==
X-Google-Smtp-Source: ABdhPJy9stXTuvE+6dJqMzlRgPv7nxgXr6OM6LVLfJMznC4jUU71q5dqx0CMB3p9byhoxCjq8a6Fxw==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id r13mr5066124wru.311.1627566487975;
        Thu, 29 Jul 2021 06:48:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:89c8:a51f:1301:604b? ([2001:8b0:aba:5f3c:89c8:a51f:1301:604b])
        by smtp.gmail.com with ESMTPSA id v15sm10066441wmj.39.2021.07.29.06.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 06:48:07 -0700 (PDT)
Message-ID: <446455e7ae18c5381f20aecd95eed2bbe6eaf736.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual: remove unused example recipe source files
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
	 <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Date: Thu, 29 Jul 2021 14:48:04 +0100
In-Reply-To: <fc74674b-b3b5-1596-3cbe-a6e3af2e46c8@bootlin.com>
References: <16959EEB5BD85597.12821@lists.yoctoproject.org>
	 <e17cad88-9b81-68fe-66c3-9305aa494f17@bootlin.com>
	 <20210727112302.spzqyqnu3k2sskxi@fedora>
	 <4c34e5320bb80e9234ca68c1e110e0581853766e.camel@linuxfoundation.org>
	 <1695A60376DC3ECA.18160@lists.yoctoproject.org>
	 <fc74674b-b3b5-1596-3cbe-a6e3af2e46c8@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-28 at 15:56 +0200, Michael Opdenacker wrote:
> Richard, Quentin, Nicolas and others,
> 
> On 7/27/21 2:36 PM, Michael Opdenacker wrote:
> > Richard, Quentin,
> > 
> > Many thanks for your feedback.
> > 
> > On 7/27/21 1:38 PM, Richard Purdie wrote:
> > > On Tue, 2021-07-27 at 13:23 +0200, Quentin Schulz wrote:
> > > > I wouldn't remove them as I find example recipes to be very welcomed as
> > > > real life examples of what can/needs to be done. It shows also some
> > > > gotchas and what a minimal recipe should look like.
> > > > 
> > > > What I have to complain about those files currently is that they are not
> > > > built and they weren't working for a while, which is a bit of a shame
> > > > for example recipes :)
> > > > 
> > > > I don't think keeping them in the yocto-docs is something we want to
> > > > push for (at least I won't), but I feel like we should keep them
> > > > somewhere they are built so we maintain them along other recipes.
> > > > 
> > > > I can see that we have a recipe for an out-of-tree kernel drievr recipe
> > > > available in poky/meta-skeleton layer (called hello-mod). I guess this
> > > > is a place we could put the examples you want to remove from yocto-docs?
> > > If they were in meta-skeleton we could build/test them...
> > 
> > Thanks for the suggestion! I'll propose a patch doing this.
> 
> While I had no problem moving and testing the "hello-single",
> "hello-autotools"  (GNU hello actually) and "libxpm" recipe examples,
> I'm struggling with the "mtd-utils" one.
> 
> Neither the example recipe (version 1.0.0:
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb)
> nor the one which source code is directly in the documentation (version
> 1.5.1+:
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n2307)
> compile any more.
> 
> Given that we have an upstream mtd-utils recipe that works, what's the
> point of trying to fix a broken example? This seems like a waste of
> effort to me...
> 
> So, may I drop that old mtd-utils example?

I'd say yes, that one isn't adding value.

Cheers,

Richard

