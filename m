Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250E9C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 13:29:29 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12635.1787750961326355562
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 06:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Iist3sZ+;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8efef6533aaso6439286d6.0
        for <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750960; x=1788355760; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3d55FZr0FA2byQGGfiUZOU5Hv5IhFNhEj754EixdAXI=;
        b=Iist3sZ+vxbKFBF+kL5HAQFf4TjCYkgcm12AtW9ExlnavK8NE4eguBgRONLHCT5rLR
         2R+9vYHt0KDlGWT/jDcEiu8mCokg5EFB215TYWN2zBxFTm+cluYsInKAtu7lDPDalmqT
         BaEGDQ/OUIehI8XOtE8X2UA0ebycJWx18iPPTyowg5lmPnbNJLPfbMjxF+Ge3VzP/Rlh
         gpUoEYdN85k5q8LRYf0ItEvWRt2B6TrFiei0Bt+w3UwC9HeClMAM3JfK2aJV/n+gSzQt
         0jQmwBN+l1InPUzXNHFskvro8g4lAMvuPVio7oC945gJ93j47ozvyIwf2URrNvuWnP7W
         h7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750960; x=1788355760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3d55FZr0FA2byQGGfiUZOU5Hv5IhFNhEj754EixdAXI=;
        b=tRLMPKvMNZsnQyj/SL9abuhsDEVUYXJXDqElrGFst2g6Mg+GWMQ71k09NHxUY5tGuE
         Fuu6GIQUsZiwh650sxipj29mkeMr3cRj/3buuTZBf5EPqLUGhcbAoEXtmuXNEIj/LGBC
         TOcjwSu66FDyXyHMj8P2AmL54OBq5mZYyqvTzeyhl4TN1HDRfH1pGwZ6HywM6D82twhn
         shHHZRJc56sA/CyyrDWB2BSgV2XyWPRWyHk2CAGeGkto0pLF1WFCSeOEKfcEP8CpOEVl
         z+MWrIAg7JQGoGS91Zsl9Z3ECB0mZXunHmcB3WsT33/l1WKXziidd6JSOTSOblJl45mS
         GJNw==
X-Gm-Message-State: AFuF++nvLKKHlWPWAY04iCWdKgLJunP1dAAYyhMfVdqTOoiX0Ax+jFFV
	BWZJTdvrhsjwOYpMvo0Oi9e+hxTTDKesBrLnaelqInDJ1smatxOX32SelmGLk3u0
X-Gm-Gg: AR+sD10aylK3bGmNkTChOPKrUGRdkBOur+XIt3x3sJ6Dke742JEn8FK5B97eSPWPJYP
	oCsrgwS31kLTkfG+TMDr30wtSiCRub2JM412mybZJIiUMm9FJMAGX4IaVzkgDfqtaQUW38NdEea
	Q9e4e/0K0yGNMySh4bSn5xBCwLZPGJc/Xi8RxCHinA9p2iDCsV7P4OunjPZYGHpqTOJ8u1BmNRS
	wFcfkMsGD22rJuyRafeSNGfpjLTBDde1wDcGNh4o9hCMO9yHOg+WmxbKBGQxqThaOK1kkGaNJh1
	tU13DYkpPJcQIne8zDLHeX5lGkynQYrM1SBxynBEABk4fZOTioWedEU5raY6jA/GKHjZlDhEMst
	08QbEEURQ3AfGIKxmoYWKjhTYxeuYw657tIEPs5ygC+6yblM7fOpDdg6QGC/O6NMQwO65MLPc7G
	Tu7FcdG5Hl1bxd3oj6jb9AmoIYVx0bZn0n9EQNESkSmS0lVIIfuEhMr79ceJ7py4r8K/GXNGf5R
	OSfi1YCSB0LdlkoGlJhpWrGpgFvwks=
X-Received: by 2002:ad4:4eac:0:b0:90c:c696:9909 with SMTP id 6a1803df08f44-90cc7937a1amr67817816d6.28.1787750960021;
        Wed, 26 Aug 2026 06:29:20 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc63bbf37sm26388546d6.2.2026.08.26.06.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:29:18 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:29:16 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 00/10] docs: highlight BitBake snippets with the bitbake
 language
Message-ID: <ao7qLNFwDk93z18Z@localhost.localdomain>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <4a093c1908c664f29ac49e8f68d606f2491fb8bf.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a093c1908c664f29ac49e8f68d606f2491fb8bf.camel@pbarker.dev>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 13:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10366

On Wed 2026-08-26 @ 12:56:32 PM, Paul Barker wrote:
> Hi Trevor,
> 
> On Tue, 2026-08-25 at 21:34 -0400, Trevor Woerner wrote:
> > Please do not apply this yet
> 
> It's easy to miss this when looking at the individual patches, you
> should use `RFC` in the subject :)

True. But Antonin had told me he could test with an updated environment,
and if this did "accidentally" land too early, the worst outcome would
be a lot of warning messages about an unknown lexer name "bitbake". I
don't believe this would cause a build failure, just warnings until the
environment would be updated, which I was told in another email would be
coming.

So _ideally_ don't apply yet, but no biggie if you do. I would have
RFC'ed it otherwise.

> Best regards,
> 
> -- 
> Paul Barker
> 

