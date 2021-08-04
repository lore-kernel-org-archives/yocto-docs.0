Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.9089.1628084898762386657
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 06:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BUJxiNuk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id b13so2350887wrs.3
        for <docs@lists.yoctoproject.org>; Wed, 04 Aug 2021 06:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0CeEmFvXeTb9qe7PLgKUz73mKfKg9qsJhbiRjpSsJv4=;
        b=BUJxiNukflNj2tUI/CB28PlAgjGWfcPj7dgOFdFMJh7jbK+aCh67tv2a2FNQb3NMIo
         QpRkcjgB8ArXz9lH7PqiCn4KAsyJd8DrPynY3tkFIatBe5miKvciBKPUt/yDJZgLwgWW
         AymdvQEo76NqYLDb4l30BW/MDDpGa1mT5V1vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0CeEmFvXeTb9qe7PLgKUz73mKfKg9qsJhbiRjpSsJv4=;
        b=TbRy9RitkZrwLX/4j4eFucfthbz1zrHXKYfxDl7ZQsHzi+csyEQSQ/cpi87D2jQbXI
         Rldq5iFhfxyZOPPdLzhaxvh2vQOqfWpyUTC9bA2Eu8QEiH0qXTc4LQ1dTElawWXvfwXF
         cNqFrQutRaS4mTwwc5Rj1R9mmAfYWxiG6kGAChN+sg/JmzmQ7H4N7ujKkqB5Px+ygNvv
         D8kAgSiOhULWmHSOLor0O8B8cxWiEY+sFLkAe5NB/m45T5TtRH52GiD+PePxtP9CREVV
         O/RWA/Kg6kipWzlik4CT6DaRgBr5tCPI0NoRwbU5sBsS1NllzUJ0BAhCkwxYs7gOpDv5
         a7pQ==
X-Gm-Message-State: AOAM531rTWrv3qGSzNV6/ol3VIj873Ap+oJkoG/IhxCwcTsibuYJSWMK
	3xeIEoEm2+V6p4Rx6Yn26RcFAw==
X-Google-Smtp-Source: ABdhPJxrRLt84qn5okohukAuR2e1Io67ghz5XZfPUSJZmXmMgYtiF0VmdiFKGsv9XJoeW414YJLiJg==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr29429902wru.309.1628084896451;
        Wed, 04 Aug 2021 06:48:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id f74sm2446888wmf.16.2021.08.04.06.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 06:48:16 -0700 (PDT)
Message-ID: <f8fb3e4e98014f13bca55a71b2c8fdc28771758d.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] manuals: mention license information in footer
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Wed, 04 Aug 2021 14:48:12 +0100
In-Reply-To: <c6225ec3-fe53-8005-093c-c7d7cb16596d@bootlin.com>
References: <1695FB134708B5C3.29235@lists.yoctoproject.org>
	 <1695FB528AB59051.5172@lists.yoctoproject.org>
	 <1696A0E01FF4F31A.10446@lists.yoctoproject.org>
	 <c6225ec3-fe53-8005-093c-c7d7cb16596d@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 15:41 +0200, Michael Opdenacker wrote:
> Richard, all,
> 
> On 7/30/21 7:13 PM, Michael Opdenacker wrote:
> > On 7/28/21 4:39 PM, Michael Opdenacker wrote:
> > > Greetings,
> > > 
> > > On 7/28/21 4:34 PM, Michael Opdenacker wrote:
> > > > Previously, the license for the manuals was only
> > > > stated in the SPDX headers at the beginning of source files
> > > > 
> > > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > > ---
> > > >  documentation/conf.py | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/documentation/conf.py b/documentation/conf.py
> > > > index 6c6458fed7..8e15fdc869 100644
> > > > --- a/documentation/conf.py
> > > > +++ b/documentation/conf.py
> > > > @@ -28,7 +28,7 @@ release = current_version
> > > >  
> > > > 
> > > > 
> > > > 
> > > >  # -- Project information -----------------------------------------------------
> > > >  project = 'The Yocto Project \xae'
> > > > -copyright = '2010-%s, The Linux Foundation' % datetime.datetime.now().year
> > > > +copyright = '2010-%s, The Linux Foundation, CC-BY-SA-2.0-UK license' % datetime.datetime.now().year
> > > >  author = 'The Linux Foundation'
> > > I have a few follow-up questions...
> > > 
> > >   * Shouldn't we have a quick section at the beginning of the
> > >     documentation mentioning the license information?
> > >   * Shouldn't the copyright owner be "The Yocto Project and OpenEmbedded
> > >     community", as in the Linux kernel documentation? Though the
> > >     contributions funded by the Linux Foundation are very big, there are
> > >     other contributors and we don't ask them to transfer their copyright
> > >     to the LF.
> > > 
> > > Thanks in advance for your advise.
> > 
> > Any thoughts on this?
> > Thanks in advance,
> > Michael.
> 
> 
> Would you have an idea on this? At least, can I merge the change I'm
> proposing?

We probably should have something mentioning the license, yes and this
change is ok.

We can't just say it is community owned because it is not, much of the 
docs work was done through the Linux Foundation and they do technically 
own that copyright, not the community. If any contributor wants to add
their copyright we can do that, or we can probably change it to "Linux
Foundation and The Yocto Project and OpenEmbedded community".

Cheers,

Richard



