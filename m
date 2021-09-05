Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.10494.1630853617315521046
 for <docs@lists.yoctoproject.org>;
 Sun, 05 Sep 2021 07:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VhAzJ9Q3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id i6so5879701wrv.2
        for <docs@lists.yoctoproject.org>; Sun, 05 Sep 2021 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JJV9dH4S2qTZWOBgpV4pyJkrMrRTsQiWq5Jg1hvfaGU=;
        b=VhAzJ9Q3VORhcgDfwhwCYPHGxSwyxrYnZH1xwdM7TcuiAdVwk5wOy8jMioEX0O8LLS
         FLPpchg3p2kkTQ9YGlnfWxJn5Szb7Dk3WHw20sw/0Cx6QqkT+xg92h5GMedfUVDlcRYw
         Hj+y9IYi+nqfyq7H9h8PSSIc18G9tyYFOEvV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JJV9dH4S2qTZWOBgpV4pyJkrMrRTsQiWq5Jg1hvfaGU=;
        b=m0k6W6Xafoh0BTclfnoS/NJANkUuLEzNCJfaRe9S/pRD3FGR/X9+BFaz23lfFrY0J3
         SFHbcEouK3O/q5hmCu9l6lgZk1OXSKK6vHnWLyNS1Ae6OqlW14cBB6OXKz0xP4ZC5sis
         AyEqXWeuLuHHJA8Dfb/gPP/F9y21GNe1Rvh1XJGnFgO/CdAKzGCQDfMmb9FXMnIkw1/b
         QKLDGPt/npLs+BvzmnAxxun2BDygrdGkQqduy8xAq4pymbubldXCvJG/tuCHAefpJbUE
         CV5sjeSpBilxcqJMO9f6iCajNdjA4zrWlQiew9P8WOspvRqgqI0vmXGh+nMZ+1GKa/cg
         jABg==
X-Gm-Message-State: AOAM532lYiskWmv5162jDcH1tVrEMkP4xVcqvKBAGaQbBcw2gjEQmv9s
	Q/PBxf++i8ZLkl9UqVZkvCauUA==
X-Google-Smtp-Source: ABdhPJwE1m605IiaV8tA3uzKfp/xVmq+ghaIeuk2LWzA5XwKTAo72lv13BSQXAn0mHQc8RyTvn4gXw==
X-Received: by 2002:adf:e6d0:: with SMTP id y16mr8642103wrm.284.1630853615600;
        Sun, 05 Sep 2021 07:53:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:751a:c6e5:c3ac:53e5? ([2001:8b0:aba:5f3c:751a:c6e5:c3ac:53e5])
        by smtp.gmail.com with ESMTPSA id u13sm5022149wrg.68.2021.09.05.07.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 07:53:35 -0700 (PDT)
Message-ID: <13c49b946b39aa99bbc3f5a38c4ba1ba8422869a.camel@linuxfoundation.org>
Subject: Re: [docs] how to simply build a common toolchain for multiple developers?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Sun, 05 Sep 2021 15:53:33 +0100
In-Reply-To: <257d4643-e530-45dd-819d-1d92865f983@crashcourse.ca>
References: <257d4643-e530-45dd-819d-1d92865f983@crashcourse.ca>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-09-05 at 08:19 -0400, Robert P. J. Day wrote:
>   (sort of a "how to do this?" question, but also wondering if this is
> covered in the docs so i could have found it there.)
> 
>   over the last week, two separate colleagues asked how to build a
> generic aarch64 toolchain they could subsequently use for builds so
> that they don't have to reproduce all that work in brand new builds,
> and since it's been a while since i dug into that, i'll ask here and
> make sure it's properly written up afterwards. (i think alexander k.
> explained some of this before, so i'm about to dig out his earlier
> post.)
> 
>   the idea is to create (i'm assuming with "bitbake -c populate_sdk
> ...) the appropriate SDK, then install it and use it from then on when
> building other aarch64 images. the goal is a totally generic toolchain
> -- no customization; that is, create the simplest toolchain that has
> the widest application for developers who just want to build a new
> aarch64 image.
> 
>   while i'm getting ready to build and test this very thing, i'm
> going to assume that i could start with a fresh aarch64 build, and
> just:
> 
>   $ bitbake -c populate_sdk core-image-minimal
> 
> that is, no customization for either host or target -- just build the
> SDK .sh script, after which i can run it and install the SDK in a
> common location accessible to others, after which ... what?
> 
>   if someone wanted to do a fresh (from scratch) aarch64-based build,
> would they simply need to run the SDK's env setup script, then proceed
> normally to take advantage of all that earlier work? or is there more
> to it? it seems like a simple enough request, but i don't see it
> explained in the SDK manual.
> 
>   thoughts?

When you say "building an image", what are you building the image with? Are you
wanting OE to build the image with the external toolchain from the SDK? That is
a really bad idea.

Isn't sstate the answer to this question? Even say a set of locked down
signatures for the toolchain pieces?

Cheers,

Richard



