Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.7566.1623316458072267791
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 02:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TPCyLBz6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id t4-20020a1c77040000b029019d22d84ebdso6050000wmi.3
        for <docs@lists.yoctoproject.org>; Thu, 10 Jun 2021 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=q7f/W8nwSK3h15E3OapTI12esu5blkSqf//EZgXkvr4=;
        b=TPCyLBz6fD/ca6MLNRK43KOB5QHShdXUCG7EFkweJKqo5I1jaWDJJaN/yXD7IqeB6h
         LjzykrLSW0jdkLsBnqZj+jcSPN8bmJ41zrt36G4UnGGy/DHaKwx62MF+7lLDumPFBVQf
         9N/N6Ds+rKOvbXVJ9FBHqX79KdMjfIQ2EABU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=q7f/W8nwSK3h15E3OapTI12esu5blkSqf//EZgXkvr4=;
        b=Kmvm+9dzok533oQ/HKfkeNvp5MAurv0GmeqhaG5FLEb8pXZhIf+LHTbVpmAJXVIJUd
         OOeC4M0vUjpP4OZxxXPC0Be83vkBV5aMZW6rwcJwzdZDzz8Si/1TxF4PVXypOpDdYMKV
         ELhwYY3xUHgdxq8bGbW6Rk5DMQkyEWmJRYdBKg3wHbnczeGqCiMtRFgfI8eQ/0e78AAI
         ikoX44dq0lw1gNJQJhqr/K+DBWE00nMSNM9DMcpOuEZNMTTEAX+31HD6Pm6EKBOYSNZb
         zYVx1KJWiYbTwg0ehHt0q2EvZlVdUCNgwooGaDB66nPbzON3TK5CWMPW6v3S6YqQuh0c
         ppYw==
X-Gm-Message-State: AOAM533l+/tTO7zG03tIQbxYwKWqN62xo1Rra0g56bqTDlzxxE8xSlWU
	yPZTvAn+SqxIi5CAVNMII7pMMQ==
X-Google-Smtp-Source: ABdhPJz1wzB/Zqb6ai1EP7teEXH8i7UPD1EPj80ULk6OKTTHx4DKb2dclzCSerym7sZZD9IUktbKsw==
X-Received: by 2002:a1c:a516:: with SMTP id o22mr14264409wme.136.1623316456024;
        Thu, 10 Jun 2021 02:14:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e846:1707:1d31:eae9? ([2001:8b0:aba:5f3c:e846:1707:1d31:eae9])
        by smtp.gmail.com with ESMTPSA id i15sm2672188wmq.23.2021.06.10.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 02:14:15 -0700 (PDT)
Message-ID: <25943cb95fd97a83144e00e7a30917d609b184b2.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v3] test-manual: add initial reproducible builds documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Date: Thu, 10 Jun 2021 10:14:11 +0100
In-Reply-To: <20210610085412.nepf2mxa2mco5z6a@qschulz>
References: <1686F0ED5A1183FF.18579@lists.yoctoproject.org>
	 <20210609144728.103458-1-michael.opdenacker@bootlin.com>
	 <20210609155552.nwjdirom4lkqi4n7@qschulz>
	 <6400f2c43fd9d292616cbc5d2f6cd99f98ebc2a3.camel@linuxfoundation.org>
	 <20210610085412.nepf2mxa2mco5z6a@qschulz>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-06-10 at 10:54 +0200, Quentin Schulz wrote:
> Hi Richard,
> 
> On Wed, Jun 09, 2021 at 05:30:56PM +0100, Richard Purdie wrote:
> > On Wed, 2021-06-09 at 17:55 +0200, Quentin Schulz wrote:
> > > On Wed, Jun 09, 2021 at 04:47:28PM +0200, Michael Opdenacker wrote:
> > > 
> > > > +
> > > > +You could subclass the test and change ``targets`` to a different target.
> > > > +
> > > > +You may also change ``sstate_targets`` which would allow you to "pre-cache" some
> > > > +set of recipes before the test, meaning they are excluded from reproducibility
> > > > +testing. As a practical example, you could set ``sstate_targets`` to
> > > > +``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
> > > > +run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
> > > > -- 
> > > 
> > > I'm not sure this section has its place in our documentation since it
> > > seems bound to the current implementation and explains modifications of
> > > the code.
> > > 
> > > I'd vote it out.
> > 
> > Doesn't most of the manual document the current implementation?
> > 
> > When this wasn't here, you wanted an example! I do agree we should give people 
> > some kind of a hint about how to write their own tests. We're likely going to end 
> > up adding more example, not less?
> > 
> 
> Because I understood the original section as "it's very simple to do
> this, look into this file", so I assumed some arguments could be passed
> to make it easy to re-use. I wasn't expecting changes in a Python
> script.

I think the confusion here is the definition of simple :).

At least in theory, you can create your own test case in your own layer
and in that test, inherit and subclass the original test (standard python). 
In that subclassed test, you could change those two variables and you 
should then have your own test case.

Would that work? Should do, at least mostly but I will admit I've not tried it.
Adding a new test in your layer and also subclassing an existing test is 
something we should document somewhere in the test manual ultimately. That
is partly why I continued to expand on what I meant here.

> As opposed to classes, variables and/or tasks, which to me seems to be
> kind of an ABI, so it is maintained and watched for changes and if
> there's any, usually listed in the migration manual, I would assume the
> content of Python scripts aren't expected to stay "stable" or their
> change be documented otherwise?
> 
> Here the suggested example is about modifying variables that are used only
> in a given Python class, which could change over time, including the name
> of the variables to be changed.

I agree it is a bit risky to have these in the manual, equally, the manual
does have worked examples and I believe there is a good case for having them
here as this is something we want to teach people how to do.

FWIW that test was designed to be sub-classed so there is at least some
intent to allow people to do this. As such we'd probably try to maintain 
some kind of compatibility if we can.

> This also kind of encourages people to modify code in layers they don't
> have push access to, which is something that we usually don't want
> people to do IIRC?

The key missing detail is you can put test code in your own layer. I
can even point at an example:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py

(which is also how we test this stays working)

> I'm not sure I managed to convey my thoughts better. I just expected a
> simple command to be able to test my recipes, or via a configuration
> script.
> 
> Anyway, no big deal, I'm happy to see the reproducible test procedure is
> being documented :)

Thanks for the review, it is helpful to have have a fresher perspective on
this!

Cheers,

Richard

