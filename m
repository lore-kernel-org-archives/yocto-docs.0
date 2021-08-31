Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.3403.1630404096503391918
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 03:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A0KlTygg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so2071299wml.3
        for <docs@lists.yoctoproject.org>; Tue, 31 Aug 2021 03:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=a72Ej7ShNFx11s+ElTxqyFRg/wpltJr6ZuL0dMcsJqM=;
        b=A0KlTyggUd/nxIYO0WYGGfUhfKGZKKoE/GBUtJx2nA8+5E8iNGxjVULeGWQFA9lHN8
         zTamXuorDZ8nvPvXfLbtiaBT8XLWwsI/S4WmPxZ2PRlw0mRw5djT1ithqP6GWVhOHdm8
         +onY1slWFeE/qMuh7P7g0F0f5oFlsc/L+q4XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=a72Ej7ShNFx11s+ElTxqyFRg/wpltJr6ZuL0dMcsJqM=;
        b=kXCB0nvPrlaoXyVgv6ndxTN9PTBedJKpbQQJlA7T+6/GNRD8WgIk9fXUgN/Swhpvni
         inrpur93+yg3Mivg+TiP797SvIpalto1ZbrMMP1z0ps2NmZfDhfM0XF5E9zAH+QkGSK6
         71G96iWxqeC2ZiooEmcma+GIMgAmQUaVckXmruzNF6UJ8NRWHN/0TNhMpfZ12Ye/MSo8
         3ULQ8D33kdE7eadEdn43oyscmqutnGHxeVySS851vGGpoHct4lwT+m/b3aYGn5zP8OZ4
         xde1522W4UR6gkvXxuSgNUTxpoQi4F8WsxVesgzrVruWqiDH7LMkEiV5IY5Va7X5XiF0
         MDqg==
X-Gm-Message-State: AOAM5333Z3PvffLcUl+HILtZcL2Bu0J3bzY7888LKMKFG6X01zw9H9Te
	fL8sBSBecvLE8sMxkjNbykhLWA==
X-Google-Smtp-Source: ABdhPJxNJoJhkfVtyyAt3/UNKUxUckX9Jhu22weHkqsISVgT59fkA/a4xCMSL+z52sqkPowdcTyYHw==
X-Received: by 2002:a1c:2209:: with SMTP id i9mr3325773wmi.92.1630404094558;
        Tue, 31 Aug 2021 03:01:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id l19sm2030119wmj.34.2021.08.31.03.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 03:01:34 -0700 (PDT)
Message-ID: <c5458825b741ce1fad5737d46a0a5210cabc4548.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] dev-manual: correct note about virtual providers
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org, "Robert P . J . Day" <rpjday@crashcourse.ca>
Date: Tue, 31 Aug 2021 11:01:33 +0100
In-Reply-To: <20210831094951.syxtrwtk65jziwbk@fedora>
References: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
	 <795cdbf31208231b7ab001464b7247524aa6b459.camel@linuxfoundation.org>
	 <20210831094951.syxtrwtk65jziwbk@fedora>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-08-31 at 11:49 +0200, Quentin Schulz wrote:
> On Tue, Aug 31, 2021 at 10:16:49AM +0100, Richard Purdie wrote:
> > On Mon, 2021-08-30 at 17:37 +0200, Michael Opdenacker wrote:
> > > Fixes [YOCTO #14530]
> > > 
> > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > ---
> > >  documentation/dev-manual/common-tasks.rst | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> > > index f3b5084436..dd015a761e 100644
> > > --- a/documentation/dev-manual/common-tasks.rst
> > > +++ b/documentation/dev-manual/common-tasks.rst
> > > @@ -2114,9 +2114,10 @@ The following lists specific examples of virtual providers:
> > >  
> > >  .. note::
> > >  
> > > -   Virtual providers only apply to build time dependencies specified with
> > > -   :term:`PROVIDES` and :term:`DEPENDS`. They do not apply to runtime
> > > -   dependencies specified with :term:`RPROVIDES` and :term:`RDEPENDS`.
> > > +   Virtual providers can be applied not only to build time dependencies
> > > +   specified with :term:`PROVIDES` and :term:`DEPENDS`, as show in the
> > > +   example above, but also to runtime dependencies specified with
> > > +   :term:`RPROVIDES` and :term:`RDEPENDS`.
> > >  
> > 
> > This isn't correct. virtual providers of the form virtual/ *only* apply to the
> > build namespace, not the runtime one.
> > 
> 
> What is the mechanism behind RPROVIDES:${PN} then? You could technically
> set it to "virtual/something" right?

There is no mechanism and whilst you could set it to that, it wouldn't do
anything useful.

> How Bitbake chooses between two recipes creating a package RPROVIDES'ing the 
> same "virtual/something" is something I have no knowledge in 

You don't set that. It doesn't work. It isn't supported. This is what that
manual section is trying to say. Making the manual pretend it does doesn't
change this.

> but I feel like it's something that
> should be explained here, or at least explicit why it does not apply to
> runtime dependencies or point to where the providers for runtime
> dependencies are explained in the docs.

I've explained this many times before but let me try once again.

Bitbake is the interpreter of DEPENDS and PROVIDES and it can see multiple
providers and choose between them. We have full control over that piece of the
process.

Bitbake picks the combination it thinks the user wants and then bakes it into
the task graph. For any given configuration, one task graph should result.

The runtime namespace is quite different. RPROVIDES are written into the
packages and they are interpreted by the package managers. We have no way to
tell the package manager that when it sees "virtual/shell", it should be bash.
It would be something different for each package manager and at best it is badly
supported by the distros and packaging backends (e.g. dpkg-reconfigure). We've
therefore not gone there.

It is understandable the user still needs to make some choices in OE. These are
the VIRTUAL-RUNTIME_xxxx variables. These are the virtual/ equivalent from
DEPENDS/PROVIDES. The distro hardcodes values of things for the VIRTUAL-
RUNTIME_xxx variables. This is to try and make it clear these are not like
virtual/ and do not respect PREFERRED_PROVIDER. The selections are hardcoded
into packages as they are built.

VIRTUAL-RUNTIME is ugly and it is an OE thing, not a bitbake one, there is
nothing related to it in bitbake. This does make it harder to document.

I'd love something nicer but we've never found a way to make it work reliably
with the package managers, deterministic builds and all our other constraints.

Cheers,

Richard
















