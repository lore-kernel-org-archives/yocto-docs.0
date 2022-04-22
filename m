Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52BBC43219
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.8014.1650631856073341165
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 05:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aNes/4fE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id bv16so10891248wrb.9
        for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=LnMrYrn7+IvPQqC90gi44iECLIovjt4VJYPMcha2tZo=;
        b=aNes/4fE7m5TqnfnKHKh4PxKSNjSj4PYF5qgafucmteGUYGBlFX7YvN0luBfPpSAss
         spb0nINZucQNUsKjgbeLyYsQWj80p8k6sMQmTnK4LzeQOi+olBH41GWGT+qQYp4NN8c5
         id55+TRpU2ea/gq2yEtj2m8u2aueos9qF7JCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LnMrYrn7+IvPQqC90gi44iECLIovjt4VJYPMcha2tZo=;
        b=yPsD0ZAHZ79gDuDTTKJrrSUBaBJJqDZEQMI6V3jIKatsHzhdulQTz2CL/vEu+LUUKI
         hbjhZEuwOCL40m0O02unr0DUGK0e2fwJx/PdsbwFnzaxw53d6YnDJsHsHfcuPd0ajFBW
         Y1qcQDhIUlOq5CLHJ54VEr09ZjSCnKwOji3thSGrIR8mav/BtJ6a5an2KBWlYlzqABrw
         g6VnO6oIERhlcTISen4GLClyQp7XxOH+6BaAk5pUFVgzK0K+wXfRQClOYJJfupQt24HX
         mRUlvQKHGA16T05QPvV+5Ae7bMWU1FaKes8qyOA59d49208Woebfzph6e6adbX7l8QRv
         XI2w==
X-Gm-Message-State: AOAM533GtoOcwh8RUhQCoMFVf92/qy3X5G4iwZNAGWVByc1nhTIXjCW2
	5eow5f7babsxhB/bpHvw7WfJ+Q==
X-Google-Smtp-Source: 
 ABdhPJweEcp3hm+B/BesVm9f5lPRFBIPoOVrsH6YGvfP1AmNz4VsEaPsuod+U/h+0qtSHHXQiVpf+A==
X-Received: by 2002:a5d:4747:0:b0:20a:c40b:1189 with SMTP id
 o7-20020a5d4747000000b0020ac40b1189mr3560581wrs.509.1650631854436;
        Fri, 22 Apr 2022 05:50:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e?
 ([2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e])
        by smtp.gmail.com with ESMTPSA id
 b6-20020adfd1c6000000b0020aac8a9946sm1982588wrd.47.2022.04.22.05.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 05:50:53 -0700 (PDT)
Message-ID: 
 <1ad964a11b494fbc725d0529e2b3a02be73c04a7.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 6/9] ref-manual: add XZ_THREADS and ZSTD_THREADS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Paul Eggleton
	 <paul.eggleton@linux.microsoft.com>, docs@lists.yoctoproject.org
Date: Fri, 22 Apr 2022 13:50:51 +0100
In-Reply-To: <d7705830-c7a3-b3b9-51b3-c3b76232dccf@theobroma-systems.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
	 <fde984bfa988c26cf7ef4cacf4ac830d974129b0.1650591341.git.paul.eggleton@linux.microsoft.com>
	 <e843b4b7-3a45-d44a-c423-c004151a32c9@theobroma-systems.com>
	 <9e8203a32b436c8c279727658bef00ec626f1da9.camel@linuxfoundation.org>
	 <d7705830-c7a3-b3b9-51b3-c3b76232dccf@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2850

On Fri, 2022-04-22 at 14:47 +0200, Quentin Schulz wrote:
> Hi Richard,
> 
> On 4/22/22 13:46, Richard Purdie wrote:
> > On Fri, 2022-04-22 at 12:40 +0200, Quentin Schulz wrote:
> > > Hi Paul,
> > > 
> > > On 4/22/22 03:40, Paul Eggleton wrote:
> > > > ZSTD_THREADS is new for kirkstone, XZ_THREADS was introduced in dunfell.
> > > > 
> > > 
> > > Separate patch please so XZ_THREADS can be backported to all branches up
> > > to dunfell.
> > > 
> > > > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > > > ---
> > > >    documentation/ref-manual/variables.rst | 13 ++++++++++++-
> > > >    1 file changed, 12 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > > > index b9448b8..4803578 100644
> > > > --- a/documentation/ref-manual/variables.rst
> > > > +++ b/documentation/ref-manual/variables.rst
> > > > @@ -8737,4 +8737,15 @@ system and gives an overview of their function and contents.
> > > >    
> > > >          The default value of :term:`XSERVER`, if not specified in the machine
> > > >          configuration, is "xserver-xorg xf86-video-fbdev xf86-input-evdev".
> > > > -
> > > > +
> > > > +   :term:`XZ_THREADS`
> > > > +      Specifies the number of parallel threads that should be used when
> > > > +      using xz compression. By default this scales with core count, but
> > > > +      is never set less than 2 to ensure that multi-threaded mode is
> > > > +      always used (so that the output file contents are deterministic).
> > > > +
> > > 
> > > I don't see how having it set to 1 breaks deterministic builds, do you
> > > mind explaining?
> > > 
> > > Also, this feels like explanation of the implementation more than what
> > > the user should do with this variable.
> > 
> > I think having a cautionary note here about reproducible builds is important.
> > 
> > > If the variable should never be <2, then it needs to be explicitly
> > > stated here (and eventually the reason).
> > 
> > You can set it, you just won't have reproducible builds.
> > 
> 
> My understanding right now is that builds with XZ_THREADS=1 are 
> reproducible, and XZ_THREADS>2 are reproducible too. But if you switch 
> between them, the builds aren't reproducible.
> 
> Is that correct?

Correct. If you have a pool of builders, they all need to do one or the other
too.

Cheers,

Richard


