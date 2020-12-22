Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9702.1608631238541144051
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 02:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XR+Ns12q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id r4so1582978wmh.5
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 02:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4YlYtdpEMnmIFWXQgDn/pfGncmMu41NkTk0sB8XcMJw=;
        b=XR+Ns12qub8lkWd4LokuoI8NSIBpIKTV+uah+yrPt/JapzioEpnI9KgaH2+T+zPzNm
         Rya13YLX5jyHWk+UYzpPSb1CBlAfFLvM70S/qWx8MYBixDHFan2Jy6BXksdtfu1a3rAA
         RQMunMsvVC1uBbjyjjTylJxHEKl67s8BZDs/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4YlYtdpEMnmIFWXQgDn/pfGncmMu41NkTk0sB8XcMJw=;
        b=G0KRmF5lf8GoD2AgU1+6EgmtyKamOZXVasO8rKDRRR7thjDZ/RcZiwDwQu4GpGZej0
         4XVH44VCeHHk801dd19vtCZZW3x8s/7t/mjeWgKc35XGKtvwu0mQngi9g6y9J3n+8zS9
         HnegWguisTnpKKlu+FgW1Z/Wi7iflSsNfz0v1TGmVAV63AhhL2q70/Q85tY72GjK7bz6
         IulvU4N8yL889Yz8u3rSAsQsJaLJRCjEW8Rh/0irttQNaRgyOtGhhvRlXtfA0wHUfpPn
         pw6h4pAF36d7e3YG7lkjJ3R4EDIURCQefL1deBXY6Om0OybBQ51AJB+WC8cQwCbeSoTV
         0rVA==
X-Gm-Message-State: AOAM5337l9bg7gQAcWAmZF+vQh+2BLpz49pf5ai4DnjrxlJJHTDke3Tq
	zJDWs57YkD6cNktcL8TUDohhbG6/j4ABhQ==
X-Google-Smtp-Source: ABdhPJybRSWOFYUam3blQaGif7Ta520MO+ecBfKNB1BgtYRjnRW4wxqj4Ibln7X/2NylqBqCbJNQHQ==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr21221441wmj.40.1608631237200;
        Tue, 22 Dec 2020 02:00:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:67de:77c9:ee2:94bb])
        by smtp.gmail.com with ESMTPSA id a65sm26064061wmc.35.2020.12.22.02.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 02:00:36 -0800 (PST)
Message-ID: <bfffdf9b9c3a3e4a6695ea4fd8d6eb9ffa7c5e98.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 0/5] fitimage-related changes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Paul Eggleton
	 <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Date: Tue, 22 Dec 2020 10:00:36 +0000
In-Reply-To: <20201222094106.rq7hie6oiiudpry4@qschulz>
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
	 <20201222094106.rq7hie6oiiudpry4@qschulz>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-12-22 at 10:41 +0100, Quentin Schulz wrote:
> Hi Paul,
> 
> On Mon, Dec 21, 2020 at 05:05:59PM -0800, Paul Eggleton wrote:
> > Doc changes corresponding to patches for kernel-fitimage class that
> > were
> > recently merged to master, as well as some related tweaks.
> > 
> > 
> > The following changes since commit
> > b268b1b190861cb203fa642e57794acb402280a7:
> > 
> >   releases: conf: add link to 3.2.1, update to include 3.2.1 (2020-
> > 12-15 10:59:41 -0800)
> > 
> > are available in the git repository at:
> > 
> >   git://git.yoctoproject.org/poky-contrib paule/fitimage-docs
> >   
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/fitimage-docs
> > 
> > Paul Eggleton (5):
> >   classes: minor corrections to kernel-fitimage section
> >   variables: clarify KERNEL_ALT_IMAGETYPE reference
> >   variables: explicitly state that UBOOT_MKIMAGE_DTCOPTS is
> > optional
> >   variables: Add documentation for new kernel-fitimage vars
> 
> Except for the small :\n:: issue in this one ^:

I tweaked that as I queued the patches on master-next...

Cheers,

Richard

