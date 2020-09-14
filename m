Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.63104.1600097200770901300
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 08:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q2yjrgXT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id m6so147834wrn.0
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2020 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3GUV61uVSIerF+ELncG1fH+dpOS1FOac6PWcPJ8Q1wY=;
        b=Q2yjrgXTGnyILJ/u2T0zIrR8EPtw0hZsmnXcYZC9VfsgOIvHYx7ONFYg821eRCx8ex
         EI0wit/HV/urHp8UGw+cUSWYGkMf5PPYBabXybRG5tclkKYqDRT3P1hjxtKwFMhu8455
         nOd+2jBpOlIwHSWesAm06nsItODJWA+Dtssck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3GUV61uVSIerF+ELncG1fH+dpOS1FOac6PWcPJ8Q1wY=;
        b=P7S4GduVdvzHH5dkdq/basPaBHQhO2BPsgEEZ+fMMS6hK2enDpxyjr6WUL826J3ozC
         sbgXaD+xhrk6dQqwj1MkiXmjj1OIcfeSHroCVnNMydLtIwSIA6zh8tNfIHZ+fR0l9IUw
         Vw0wISZu7zpx8+bUcrSTbVYxMujViFgyTFfQ4lwxL4dJlWeHOsy72Ik/+fNRWljr2/pe
         sqpcGU3EK3FQfx7DcL4Fv7prjF/0BVeRwla9UuFZlANTnuDPELXFJdJrX9tkMm5bbT1r
         M53uxSXJf3iS/Mqq2x0E7HliGWNZeiVvnOvwzGNTGvP0mgDpRrl74f5rZjbGiirbpjSM
         cUbg==
X-Gm-Message-State: AOAM530wNyTHg67sya0LU2y6peb9jPwlikiqbsVhIySO/CnIP2L2JN2R
	IvyjSBqa9/lbbcPdXtQdqePZxg==
X-Google-Smtp-Source: ABdhPJw+CywWQJpS4KfM2NRILUgoAh3i8scTu3GVHuzsWDnZEIcwPBmryok+e8IZLgT1zsYAPIeSRQ==
X-Received: by 2002:adf:aadb:: with SMTP id i27mr7987752wrc.258.1600097198800;
        Mon, 14 Sep 2020 08:26:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id m10sm19294473wmi.9.2020.09.14.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:26:37 -0700 (PDT)
Message-ID: <16242b3cafddcea9747bbc02bc54fc8e7426bd31.camel@linuxfoundation.org>
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	docs@lists.yoctoproject.org
Date: Mon, 14 Sep 2020 16:26:37 +0100
In-Reply-To: <16349A56620CF0CB.7642@lists.yoctoproject.org>
References: 
	<CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
	 <16346239585A567B.3515@lists.yoctoproject.org>
	 <16349A56620CF0CB.7642@lists.yoctoproject.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-14 at 09:50 +0100, Richard Purdie via
lists.yoctoproject.org wrote:
> On Sun, 2020-09-13 at 16:42 +0100, Richard Purdie via
> lists.yoctoproject.org wrote:
> > On Fri, 2020-09-11 at 00:03 +0200, Nicolas Dechesne wrote:
> > > If anybody has any cycle now, we need to finish #4. The current
> > > status is that:
> > > * brief-yoctoprojectqs/* is done.
> > > * bitbake user manual is half done, and I am doing it
> > > * bsp-guide/*: i started it, and will finish
> > > * ref-manual/*: RP is on it.
> > 
> > This is done, at least as a first pass with hopefully the bulk of
> > issues fixed.
> > 
> > > * there are plenty of warnings when we build, i would like to get
> > > rid
> > > of them all!
> > > 
> > > Anything else is work that remains to be done. Before starting
> > > anything, please send a quick email here to let everyone know, to
> > > avoid duplication. If you have any improvement, please share your
> > > patches, I will take them into the sphinx/master branch. And I
> > > will
> > > continue to work on the remaining files that no one would pick.
> > 
> > I'll take dev-manual/* next.
> 
> dev-manual is on the branch, I'll look at sdk-manual next.

sdk-manual is on the branch, kernel-dev is my next target.

Cheers,

Richard

