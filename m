Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8DCC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 09:27:54 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.21635.1664962065746652172
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 02:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=a5ZtLJz6;
 spf=pass (domain: linaro.org, ip: 209.85.167.51,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id bp15so11242550lfb.13
        for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=OTcUIlAJnxixqq/o0k6qGqm2li0rWZ5h8DEUxrfup7o=;
        b=a5ZtLJz6dTjsTIoaFnwmb6NGyuRHCMI6MkggjkkfJnuIjILm7rWDDUzTiRJe3lEeyA
         bYip5qJ9/YXj65RpoXq//IYHGK/9am1qWt/znkdDTv2OcVisnQeGAQ+Bn/FIplVr7aNm
         wJ0aBSQshQblKkTrTRYnf+iH2FcXSEYFQU5gCuGrNV9clQOQCvQTb6bScLCkFgnplWOJ
         S94ug1Tl1ThnqUQEEm5Jn/nV9Rv/ZSR1yUBPDjMiZZhbtwQgU4GmyNkhpWXgak5cpXPL
         sTZRXw5aYiOPI82iJBjwtmhbUP4Z7MCW7vOW0L75cZtO9xcy3lz4RSrahHhwtWpa+ycL
         QSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=OTcUIlAJnxixqq/o0k6qGqm2li0rWZ5h8DEUxrfup7o=;
        b=ng5jOUVDLd9tuxEl0QrJDVcE7xjAOGWzSmjESF2aG+e4xAVwscAxqnLaApvjtQKauv
         ruvfJnfkZ1hqGbUt/ZScpOVzjWwgwJNhJFKWWEB+rYCl/lmdqmhDbpQ+5nclS8bgeOCV
         bROg+wUF0hC/X7N9hU43TTEjijeInMfcGkSWpSn+3yQYDfWYIyeDy/fktSBKqiowuey5
         mPCIUWBAuUc9DHc5dbTn+qtNUOzLVJBWN0HfSdWohJWPThbru15j4OGtp3amgU3Z7FNf
         3/bHK7LkbeUbpjG0LGlXuDdJZpBTDBMfzMfnQdQdXSctIDdBO+W62RAXtgOMQnDAIzA/
         u3Vw==
X-Gm-Message-State: ACrzQf2e4l/nbbq5xa1fSKGLrdDhWNyvHlGJZ2FnFTLXlhfHE6ZMtdAE
	/LR47E1iinmoFsMYJeGMsA7DVw==
X-Google-Smtp-Source: 
 AMsMyM7KsDgLBcvKNXxYTY67W0xE78gXCfmzoYhhpuxnnd0/7NnZk3ywdMlKVgzKwGFPC+B8MY5eHA==
X-Received: by 2002:ac2:5f58:0:b0:4a2:4ac5:5e1a with SMTP id
 24-20020ac25f58000000b004a24ac55e1amr4206946lfz.475.1664962063681;
        Wed, 05 Oct 2022 02:27:43 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id
 i19-20020a056512225300b0048a921664e8sm2287400lfu.37.2022.10.05.02.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 02:27:43 -0700 (PDT)
Date: Wed, 5 Oct 2022 12:27:40 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 2/5] classes.rst: document
 openssl-native.bbclass
Message-ID: <Yz1ODNKowrrgUdzq@nuoska>
References: <20221004152750.978712-1-mikko.rapeli@linaro.org>
 <663d2c74-59ba-032d-88a3-dfe22237136f@theobroma-systems.com>
 <Yz1Dx2rm4AfhsjNo@nuoska>
 <f8cf2e82-9bbe-c90b-5fc2-c2fb5b8f87d6@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8cf2e82-9bbe-c90b-5fc2-c2fb5b8f87d6@theobroma-systems.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Oct 2022 09:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3283

Hi, dropping oe-core since this is doc specific

On Wed, Oct 05, 2022 at 10:53:34AM +0200, Quentin Schulz wrote:
> Hi Mikko,
> 
> On 10/5/22 10:43, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Wed, Oct 05, 2022 at 10:31:25AM +0200, Quentin Schulz wrote:
> > > Hi Mikko,
> > > 
> > > On 10/4/22 17:27, Mikko Rapeli wrote:
> > > > It sets various environment variables correctly for openssl-native.
> > > > 
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > >    documentation/ref-manual/classes.rst | 11 +++++++++++
> > > >    1 file changed, 11 insertions(+)
> > > > 
> > > > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> > > > index 11e0d472e8..5fc30f9233 100644
> > > > --- a/documentation/ref-manual/classes.rst
> > > > +++ b/documentation/ref-manual/classes.rst
> > > > @@ -1672,6 +1672,17 @@ one such example. However, being aware of this class can reduce the
> > > >    proliferation of different versions of similar classes across multiple
> > > >    layers.
> > > > +.. _ref-classes-openssl-native:
> > > > +
> > > > +``openssl-native.bbclass``
> > > > +==================
> > > > +
> > > > +The ``openssl-native`` class supports using the native version of openssl
> > > 
> > > The :ref:`openssl-native <ref-classes-openssl-native>` class supports using
> > > the native version of ``openssl``
> > 
> > The text and syntax was shamesly copied from the other class descriptions.
> > Sould those all be updated?
> > 
> 
> It's being worked on by Michael AFAIK (he sent a v1 of 30 patches last
> week). In short, we want to have all mentions of classes and terms
> (variables basically) using a link (:ref: for classes, :term: for
> variables), even within the section defining the class or variable itself.

Ok will send the update.

> > > > +built by the build system rather than support of the version provided
> > > > +by the build host. It helps setting environment variables for engines,
> > > > +modules, certificates etc correctly. For full certificate checking
> > > > +users should also add ``ca-certificates-native`` to :term:`DEPENDS`.
> > > > +
> > > 
> > > I could suggest:
> > > """
> > > built by the Yocto Project instead of the one provided by the build host
> > > distribution.
> > > """
> > > 
> > > I find "rather than support of the version..." confusing.
> > > 
> > > I think we could also replace the "It helps" sentence by stating that any
> > > recipe requiring openssl to be run on the host should inherit this class
> > > instead of just adding openssl-native to DEPENDS. Maybe that could even be a
> > > new QA check?
> > > 
> > > I would still keep the last sentence though.
> > > 
> > > What do you think?
> > 
> > Yes, I can send a new version. I copied the text template form the other
> > class descriptions so maybe they need to be changed too.
> > 
> 
> Mmmm, would you be able to point me to which class descriptions you're
> talking about? Not sure to understand what you're suggesting here :)

Yes, python3native:

.. _ref-classes-python3native:

``python3native.bbclass``
=========================

The ``python3native`` class supports using the native version of Python
3 built by the build system rather than support of the version provided
by the build host.

Cheers,

-Mikko

