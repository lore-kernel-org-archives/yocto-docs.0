Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.3615.1599812107753155054
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2020 01:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y8XW1AAN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id b79so3880875wmb.4
        for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2020 01:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=x8qsgd46i3E+Q3OAyW84jz80RFhvOawmu4j58kIstFU=;
        b=Y8XW1AANPwz2RgWSuI/GIRqdcsmdz3A2pRzYg+Lm6c/lb09fqdFfN6i1942LKtT4PH
         iIw3gVMIBoRFun03MDNPaRuG0sK9eQC03QeRPUlMmia6xhAeY+n2vM0PzXTEY9n8cvXV
         qmFLfXvQ4ysFmNnToJo4Y6ZikdR2ocau+/ZVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x8qsgd46i3E+Q3OAyW84jz80RFhvOawmu4j58kIstFU=;
        b=ZnbHojHzIjomDw1q2VP5oOuA8OGaLSI0gZXS5msc63fDXLi4YuKWSW/xqVIHqeJyyF
         zi+YO1vQhGL7KyN5dOGUyXMfvRQbGlqg6lB0Qob1RPw0vUj69pDpEBP5IREpU8T/W05n
         sxJJNTx03yJ4RpcGv6BLMHMb7Hnn60VqWY3soZfAxYPhJjJ9JsMwB0JON/EYbN0+KLhe
         GT7FPoH978/yches2YrAmhC+j/yF92d1Z/+1ZhdHG71+ckUnLJHRSyj2dfLAv/l5zt/N
         S8sf2yjSVphaqlc6hVfFiU4xhwbsfZ8TDv3rVSds6DjtS3D/cOSZNGuzocZb7S0xQ4eW
         YrCg==
X-Gm-Message-State: AOAM530yMOKSwJBnVOOqtL9faNbwYr0oClY5c0cXl7Mci04Xa49bOzHL
	d7l4Ab4OMNyZUTNS1/tT477+jw==
X-Google-Smtp-Source: ABdhPJxV8D7JXmIITQdaIRz5egzydcLeeQqvafFvPmx5fA9QbfItJPyTDP339DHDn59xalG/M2EBDQ==
X-Received: by 2002:a1c:99c7:: with SMTP id b190mr962187wme.44.1599812106028;
        Fri, 11 Sep 2020 01:15:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 8.4.6.b.e.8.e.4.6.7.0.3.a.2.d.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (8.4.6.b.e.8.e.4.6.7.0.3.a.2.d.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2d2a:3076:4e8e:b648])
        by smtp.gmail.com with ESMTPSA id q18sm2930883wre.78.2020.09.11.01.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 01:15:05 -0700 (PDT)
Message-ID: <640f30438224b7c95aef68cdf7f5c111753b8d89.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 2/8] bsp-guide: Add SPDX license headers
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, akuster
	 <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Date: Fri, 11 Sep 2020 09:15:03 +0100
In-Reply-To: <CAP71WjxLR9=7AoCdLUb4u=_YM6cvZN43eJPoPXLjGjt=A9d9fw@mail.gmail.com>
References: <20200615142412.30882-1-akuster808@gmail.com>
	 <20200615142412.30882-2-akuster808@gmail.com>
	 <CAP71WjxLR9=7AoCdLUb4u=_YM6cvZN43eJPoPXLjGjt=A9d9fw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-11 at 10:04 +0200, Nicolas Dechesne wrote:
> hi Armin, RP,
> 
> On Mon, Jun 15, 2020 at 4:24 PM akuster <akuster808@gmail.com> wrote:
> > [Yocto #13873]
> > 
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  documentation/bsp-guide/bsp-guide-customization.xsl | 2 ++
> >  documentation/bsp-guide/bsp-guide.xml               | 1 +
> >  documentation/bsp-guide/bsp-style.css               | 2 ++
> >  documentation/bsp-guide/bsp.xml                     | 1 +
> >  4 files changed, 6 insertions(+)
> > 
> > diff --git a/documentation/bsp-guide/bsp-guide-customization.xsl
> > b/documentation/bsp-guide/bsp-guide-customization.xsl
> > index de674a0ae..37fcbcd20 100644
> > --- a/documentation/bsp-guide/bsp-guide-customization.xsl
> > +++ b/documentation/bsp-guide/bsp-guide-customization.xsl
> > @@ -1,4 +1,6 @@
> >  <?xml version='1.0'?>
> > +<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
> 
> While doing the sphinx conversion, I noticed that the bsp-guide is
> using a slightly different license than the other manuals (e.g. the
> non commercial flavor). There was a commit in 2015 to 'fix' the
> license statement, but it was just a partial change, since the link
> to the license wasn't changed:
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?id=bb1d80c121e9e34090a07feac9d510b2304f058e
> 
> When the bsp guide was initially imported in 2010, it was using the
> NC flavor:
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?id=d630317b6b297ba6567cc2e3914706dda0690245
> 
> I don't know why the change was done in 2015. But I wanted to flag
> this as a potential 'issue'.

I think we take the commit as a sign it was a mistake and was attempted
to be fixed but didn't quite work out. The docs should be under the
same license so I think we write up a commit, referencing these and
stating that we're cleaning it up to match original intent. We're
fortunate in that the bulk of the work is from Scott so the intent is
clear.

> While I am here.. I also wanted to mention that I couldn't find CC-
> BY-2.0-UK SPDX tag in the SPDX licenses list.. only CC-BY-2.0 exists
> (without the -UK tag).

Right, it used to have geo specific license pages which is what this
refers to. The license is the same I think we can just drop the UK part
and have proper SPDX tags.

Cheers,

Richard

