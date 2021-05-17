Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.16589.1621243646939620122
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 02:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SoHf7lRH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id n2so5674073wrm.0
        for <docs@lists.yoctoproject.org>; Mon, 17 May 2021 02:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1yVjkv1EGNvdxH9Dki5kWxYGvh6hcRRsyC1bq6JGdyg=;
        b=SoHf7lRHXTHAGbdW7vmCeHC6+BBZDq37cz7LZBGBOBt2j6AX6+fS7LIkWGrqy3hDL/
         rj6OxaQE0a6GAJMmdLX0Je3S1YxRhb/3NKWRtgramPhQeuB7ngaSN3GHJPPu++gapQne
         HGAGR9MwnxrZ6GeTeO9CiyLPU8u9kFGEzOFoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1yVjkv1EGNvdxH9Dki5kWxYGvh6hcRRsyC1bq6JGdyg=;
        b=FaxW3N17HvYAShU1IqUv2Lmrjpf27ETjMWRn8iBE7pqa/aSqSMYBtTFzl4F6QLuMk7
         /3831HFLeNU1iVzZ9jxb4U225FsAVxKboxRw9HKYrAoWqj6RM0esmaFU6zyQttkShyw0
         dPAV1inx3fcMawlBq4BSVsLhNMhnIwix1F4I/ox5P2b8cNKTU4/lEeuxY1KaTkL5nwGG
         QAKPpgBhERWj2ePU8mRKkN1kFYa42QDYcBsqm4p0LxARUyoxZIx9Ey83gmm2hGq/kYrg
         HpDgDIgTV0EID4waYkZ1lIvW3m3nMf+DieSmdUAwNDfVnrB1mmEAGOJsnCqMW3yHTbNY
         ncmg==
X-Gm-Message-State: AOAM530RN8hc4Qkx9p8dG4MbUu5kfnR8hejJjztVM8o/A1ef1zeeLlis
	hzZ0T7l7MB97Qrk36jGzDyYaOQ==
X-Google-Smtp-Source: ABdhPJy7qfZvctgjBEYFMYOe1xE7DRI7/jpRq3v+yUDI25WE/+8217Ite550puu8V+Xf9UhvVoj58g==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr73222548wrp.341.1621243645367;
        Mon, 17 May 2021 02:27:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc? ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f26sm12599056wmj.30.2021.05.17.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 02:27:25 -0700 (PDT)
Message-ID: <c4b4213e61f13b528f2d08807c4b8cb60f2cc601.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual: Ubuntu 20.04 is also LTS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Ross Burton
	 <ross@burtonini.com>, docs@lists.yoctoproject.org
Date: Mon, 17 May 2021 10:27:24 +0100
In-Reply-To: <a9bd784b-6923-c0d4-14d6-86846af3319b@bootlin.com>
References: <20210513124808.2703933-1-ross.burton@arm.com>
	 <a9bd784b-6923-c0d4-14d6-86846af3319b@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-05-14 at 11:11 +0200, Michael Opdenacker wrote:
> Hi Ross,
> 
> On 5/13/21 2:48 PM, Ross Burton wrote:
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  documentation/ref-manual/system-requirements.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> > index fc251945db8..9b4afc043e6 100644
> > --- a/documentation/ref-manual/system-requirements.rst
> > +++ b/documentation/ref-manual/system-requirements.rst
> > @@ -41,7 +41,7 @@ distributions:
> >  
> > 
> > 
> > 
> >  -  Ubuntu 18.04 (LTS)
> >  
> > 
> > 
> > 
> > --  Ubuntu 20.04
> > +-  Ubuntu 20.04 (LTS)
> >  
> > 
> > 
> > 
> >  -  Fedora 30
> 
> 
> Thanks!
> 
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ... and merged into the "master-next" tree.
> 
> By the way, since standard support for Ubuntu 16.04 has ended last
> month, are we supposed to drop support for this version?

The versions match what we have in our test cluster which you can see here:

https://autobuilder.yoctoproject.org/typhoon/#/workers

We have the 16.04 worker at the moment but I suspect it may be retired as some
point now. A tricky issue is that our perf worker OS installs are very old now :/

Cheers,

Richard

