Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.6155.1623402940130019842
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 02:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F3AzQHbT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id f2so5235029wri.11
        for <docs@lists.yoctoproject.org>; Fri, 11 Jun 2021 02:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sqmGVQfWK6rofww0J8AS6Ef58Qe2+TWpnaoG0nSAqqE=;
        b=F3AzQHbTi6673/4xRNLQCM5+0o03lAUTjALmlpxmAQ5NGYNkl0bOdKkfk5dPU5lz3m
         SUDXEp+UYHM1270gN7zYx7uP8GKGSI2clpuOIxQA6CzuoPQtP0gEgNRvHx5TKDZoOWJ3
         pz7kIWyVsvSYPGaHsW55HD9YqlSWYFH/eF9VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sqmGVQfWK6rofww0J8AS6Ef58Qe2+TWpnaoG0nSAqqE=;
        b=oxFhA/LZ896jm5HCrrhIDQ0KqCcaAIEUidEcQDTqqIwZOPW+knBo//nH0NYvY7+AEr
         H4oRVSwIvtQt61oaEtdHFnkqWHpIsCrh2i547POIlFKfwIVLj6frWl9OTI8Rx96OItmM
         Tutp0QTHntGxnBR5ct7wcXUSKng9I3PKTTTBrReh1d8ZOSO4CB+P/czYvVOyDZCnJR3b
         CqSXh+x7v24I9lBx7Gs6I3lZPq+Owwv9Cpv7IumsCvWjd3pGZXbmvd3N16PCKQ0SXzsF
         ZNkC9uHdvoakFo9du+ZrV2UwsmZDjSbuAohF8cczMvDyiPR2oUCmqOobmlsca90cV5K1
         18Xg==
X-Gm-Message-State: AOAM5300/0fePYSx19lCjsnWiIO+uE7AoL4t94+fmSX7UPTiLDYW5xtw
	/ttAbCaO1Fy1icqtVUa6jfY3ag==
X-Google-Smtp-Source: ABdhPJxbRj2niSUgKdIO+U96cbOYYqxY/WgSq8jkuZb43xYw0G5+nr2pA4IlnMhTvta5JWs7ca1BUg==
X-Received: by 2002:a05:6000:8b:: with SMTP id m11mr2900107wrx.22.1623402938249;
        Fri, 11 Jun 2021 02:15:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d8f2:39cb:864f:fe5b? ([2001:8b0:aba:5f3c:d8f2:39cb:864f:fe5b])
        by smtp.gmail.com with ESMTPSA id e16sm6435542wrw.49.2021.06.11.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 02:15:37 -0700 (PDT)
Message-ID: <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Nicolas Dechesne
	 <nicolas.dechesne@linaro.org>, "Tummalapalli, Vineela"
	 <vineela.tummalapalli@intel.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 11 Jun 2021 10:15:36 +0100
In-Reply-To: <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
References: <1675A932C413C877.8243@lists.yoctoproject.org>
	 <16872EDF3FBC0621.15202@lists.yoctoproject.org>
	 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
	 <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
	 <168736F45421387B.20336@lists.yoctoproject.org>
	 <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-06-11 at 09:48 +0200, Michael Opdenacker wrote:
> Hello,
> 
> On 6/10/21 2:03 PM, Michael Opdenacker wrote:
> > Hi Nicolas,
> > 
> > On 6/10/21 12:04 PM, Nicolas Dechesne wrote:
> > > Can you please push to master-next , so that everyone can see what it
> > > looks like without having to rebuild
> > > (e.g. http://docs.yoctoproject.org/next/
> > > <http://docs.yoctoproject.org/next/> will be updated after you push)? 
> > > 
> > > e.g. i am cc'ding Vineela (release manager) , so that she gets a
> > > chance to review.
> > 
> > Done. I couldn't find this URL any more, so I wasn't sure that the
> > functionality existed.
> > 
> > Thanks in advance for the reviews,
> 
> 
> With these changes visible on http://docs.yoctoproject.org/next/, the
> location of the release notes is changing. How much would this break
> other resources, such as links on our website? I remember Paul's warning
> 5 days before Hardknott was released, but I hope we are now far enough
> from the next release.
> 
> Another question is whether "Release notes" is the right title for these
> migration guides, at least in the left menu. Shouldn't we just call them
> "Release migration guides" as they truly are, knowing that the true
> release notes are on
> https://www.yoctoproject.org/software-overview/downloads/?

Yes, they're migration guides, the release notes are something different.

Cheers,

Richard

