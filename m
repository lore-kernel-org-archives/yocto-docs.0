Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.3458.1593159315842125225
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 01:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aj5oPeuG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id z13so8579238wrw.5
        for <docs@lists.yoctoproject.org>; Fri, 26 Jun 2020 01:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lNAEL6C5SR64qsYaihgez2JWKgSiPoF9W4/DLsT/yWA=;
        b=aj5oPeuGRY4A8aNKOl5ham906+raAjG9KTSfqdTWDMvO7wX0LRiuX6I4JEp+/kTuhR
         Nwfj1NDhLY/lIkifCvtH9X/sjUSfjMuQKNTnYj9cxUR4lTF3i1u3ib7jVkbQgECioyx4
         9xqDm+T/q/k6R1pshYxfSvocu4Qlk75BKtHD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lNAEL6C5SR64qsYaihgez2JWKgSiPoF9W4/DLsT/yWA=;
        b=aQ9GgtwbTbKQGltS+vbsCcskcLc9H/q6kUwylsGKd8Rhp3Zj4N3Z5XnT1QMsggzuHf
         Ie2ushlnOSMnf9Ey5DiE8M1yqgoPjimD8cjc4Dn+6h4sEi+ltlBiVoxUs6Xma+d0qTKr
         cpBpbImOCLExn6y3LYcYw1/Qj8jteF3wm2HPqkGafSvQQpf4ruxH+R0L92p5gBtdcaiZ
         TnLuNuzdSbi/fONiilGLlrrjXzX0JnX5wltExNXJGnuc1TNaWCueW9gbjBKv+ogbC3oD
         qotnx5Aoa69LCXKahvidtNqkB+zsYjZb4Xp+dqATTJGxJOy8SddXnLT4s+tyL7ksha8x
         +P/A==
X-Gm-Message-State: AOAM5309zDYTFPwlLNQoZrK57DtL/MW4biDBlAL5NLDL0Lnu1ZVN1jnQ
	OSu5qW6y7wTASY3W52Fa4m4JEw==
X-Google-Smtp-Source: ABdhPJz2B4vbRLSC/51cewZHrU1teR1sMd0rFx69I/URgdXPlcBdbS+EFusBFV6Y7PfFKq3sEc20Pw==
X-Received: by 2002:a5d:4e48:: with SMTP id r8mr2321010wrt.309.1593159314105;
        Fri, 26 Jun 2020 01:15:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d13sm24363249wrq.89.2020.06.26.01.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:15:13 -0700 (PDT)
Message-ID: <bb5629fcf23c41c831b8308ed2c55c1dbe87680c.camel@linuxfoundation.org>
Subject: Re: [docs] Modern style documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, akuster808
	 <akuster808@gmail.com>
Cc: marius.kriegerowski@protonmail.com, "docs@lists.yoctoproject.org"
	 <docs@lists.yoctoproject.org>
Date: Fri, 26 Jun 2020 09:15:10 +0100
In-Reply-To: <CAP71Wjz8QeY9NkpR1Mmee4qpMWF-j-iJ_s+BqVH0DXd8O20WSQ@mail.gmail.com>
References: 
	<brBieKgFlfS0C1xLUD5I5LQ0ZKxNBkhcCwKfuzqZTPTQv9slA-1bH2sneuut6k6lMlCO1n_03w5D65oBcbwU2u9Q3ZdmvT-vUWqrLI2jN5c=@protonmail.com>
	 <a1ce3e159c94a1826ff718670c8e3bb2195c155c.camel@linuxfoundation.org>
	 <CAP71Wjz3=ugDGyfDirANko1KSXC-3qkfYGsuMAkuQ4QhTamzWA@mail.gmail.com>
	 <fd811933-cb7e-d4fc-5363-4679f9e236fc@gmail.com>
	 <CAP71Wjz8QeY9NkpR1Mmee4qpMWF-j-iJ_s+BqVH0DXd8O20WSQ@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-26 at 10:12 +0200, Nicolas Dechesne wrote:
> 
> 
> On Thu, Jun 25, 2020 at 7:37 PM akuster808 <akuster808@gmail.com>
> wrote:
> > Hello,
> > 
> > 
> > On 6/24/20 7:27 AM, Nicolas Dechesne wrote:
> > > On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > Hi,
> > > > 
> > > > On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski via
> > > > lists.yoctoproject.org wrote:
> > > > > Dear Community,
> > > > > I would like to motivate a re-structuring of the
> > > > > documentation. The
> > > > > single page documenting mega manual is great as it carries
> > > > > all the
> > > > > information. But at the same time it is hard to navigate,
> > > > > overwhelming for early stage users and hard to pick up where
> > > > > started
> > > > > earlier on.
> > > > > Are there plans that break this single page documentation?
> > > > > 
> > > > > To be more constructive: I find it very convenient and I
> > > > > highly
> > > > > recommend a permanently shown navigation bar, highlighting
> > > > > where the
> > > > > current content is located. This allows to find information
> > > > > again,
> > > > > even if a user only has a vague idea where a piece of
> > > > > information was
> > > > > found last time, simply thanks to the iinherent structural
> > > > > pattern,
> > > > > not only the text describing the chapters. Let's take
> > > > > advantage of
> > > > > the humans being better at remembering shapes and patterns
> > > > > rather
> > > > > than text and content.
> > > > > 
> > > > > If this undertaking is already on it's way I'd be happy to
> > > > > join.
> >  Sorry I missed the meeting. I had a conflict with an internal
> > meeting.
> > 
> > One thing I would like to add to the things to look into is the
> > ability to:
> > 
> > 1) Build documentation via a recipe 
> > 
> > 2) Include documention  in an SDK
> > 
> > 
> > #1 is more for Build automation checkout etc and is needed for #2
> > 
> > I realize this may be a meta-poky thing only.
> > 
> 
> Can you elaborate on what you are asking here? A recipe would need to
> 'fetch' the document sources with a fixed SRCREV. Or do you want to
> build the 'current' set of files from the documentation folder?  
> 
> > Are there any other meeting scheduled?
> > 
> 
> Not at this point of time. I believe the next step was
> discussion/agreement from the TSC. and once that is done, we will
> start pushing a sphinx branch and hack on it.

The TSC has discussed/agreed with direction so we can start with the
branch...

Cheers,

Richard

