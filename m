Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B944CC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 21:03:37 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.61215.1747083813816916336
 for <docs@lists.yoctoproject.org>;
 Mon, 12 May 2025 14:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lWKK61aU;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f54e4f2989so18352676d6.1
        for <docs@lists.yoctoproject.org>; Mon, 12 May 2025 14:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747083813; x=1747688613; darn=lists.yoctoproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSS/D8SCJDumxzwVN4CRlHMDXpO62bjrZHyB3Z74gMo=;
        b=lWKK61aUBNTidTvhe5flOiSw1DsMflVZXhpYDw4wdH/LdMip0jqeuDtBMg+OUrtA+C
         GnsJwNCQOwNivU4UljQQr+isIu93flJfQiMTbHKmNJC274quEh46MikVGmL11C0Qq1ND
         se5xwjajohgiHlPYazGku+iGj4uxZrCOBOtdFhSdGpjC4etuFbem+TZU+Re2HHNPYsIF
         cRqM60bWWsRrGNMLPsgWjeQXhsreOQjKWFSD7hNSdYbk8XHscdV7y3hwjptSXsvWRVHJ
         94s2ES2QxUSKZGhH/Zw/g6/zrYWfaqxr5fgr69Z/X+/c9aTiu6+OqlahJ5w7D5m9XXow
         7/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083813; x=1747688613;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSS/D8SCJDumxzwVN4CRlHMDXpO62bjrZHyB3Z74gMo=;
        b=FfuOJcLGSLU75C6S2IU/JE0nUP3Gw+aG5NqpWDVtGT0FfwAkoCiDA+EjU1TwtVan9h
         rs4zuD3yi3CvaDNBI3to6keDtvu8A6ZNo5Bak/FktyxyIvrN75O2UVUSRckS7LmwF1pr
         6GoKgikH2RUAMAOwHckeizVsgw3DS0UA/IdKd4V0A1Uv4H32U9a4kUbj4Vm5FaTxLrQA
         S5zG4X6Tp+EUh5N/CQqcgZRTTpuSaVBe9TdkTnhoMvOAGoKernxu2+8PX+JuSoZAB2hQ
         mw1t50wvd8j8ViQNp9qowFDzCM1Vi4bAbxNo80IzmUKMzj17fifxaiuKH/MgrPAs/9U6
         FOgQ==
X-Gm-Message-State: AOJu0YxSYjjLAh6zXDR0+U2LKEw6AJaejMdheqiTiBFTCBCZG5jz7SXt
	LkiwHst1UtMTUQbW/jWuWhaXRz8OrXMRUWUoSIJiAw/s0+G6h6LMuCLcZw==
X-Gm-Gg: ASbGncvnth7hGMV6ZzEvxsKrAIs/QRxWSl5HcR0ywaHm5HhudmF41mXVwNoHi2Lq7oN
	hMXrup+HxWsng0L+nRBXh04Zj4dEToEKnAsRFWWXlncY+1HWON6rBExOBs/4pW3ZfNreJ2/gOEK
	pQP86ZzpzAA4fEQqD74W4zLLev9RZ6YwLaootRorcTFaIuUYxt5au6AOog4SSYy8/6bFjbU4hMt
	sdlZHzlhm1K0jB19Znijq1SrPmyb0bhoBgvR3uNRU1MDNNk8NTCl7kPPhJ+I4Rp/diU3PaiFRtW
	Au3B3/w0JzUl59jwl8klpNxVcYQH2p6Ji+xcJ4PbPRJ2X95YRkspUWJaX7sGFu3ZPMjCv98wUaI
	Qz+c=
X-Google-Smtp-Source: AGHT+IEupuLvOzucTX/DiNVEuwebR4K7Y+jbQoNeGa/5Eqxg1NAfqMs/X+wRj06v/8PaeQ1t5tIINQ==
X-Received: by 2002:ad4:4eaf:0:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f6e4831507mr251120676d6.34.1747083812894;
        Mon, 12 May 2025 14:03:32 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e9c6ca4asm44977006d6.91.2025.05.12.14.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:03:32 -0700 (PDT)
Date: Mon, 12 May 2025 17:03:30 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] sphinx-lint: various fixes
Message-ID: <20250512210330.GB25174@localhost>
References: <20250506180301.32610-1-twoerner@gmail.com>
 <d7d0d319-581a-486b-bffb-7ddf0f771d9b@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d7d0d319-581a-486b-bffb-7ddf0f771d9b@cherry.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 May 2025 21:03:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6812

On Mon 2025-05-12 @ 09:50:07 AM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 5/6/25 8:03 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > A 'make sphinx-lint' pass found the following issues:
> > 	trailing-whitespace
> > 	missing-space-after-literal
> > 	role-with-double-backticks
> > 	missing-space-before-role (role missing opening tag colon)
> > 
> 
> I'll let Antonin confirm but I assume it would be a good idea to have
> separate commits so we could easily backport them to earlier releases? Or
> maybe you/someone can run sphinx-lint on older releases and send patches for
> those too?

okay, waiting on Antonin

> 
> The changes look fine (and necessary) to me :)
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> [...]
> 
> > diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> > index 0f015d434041..21d3dce58c14 100644
> > --- a/documentation/dev-manual/start.rst
> > +++ b/documentation/dev-manual/start.rst
> > @@ -860,7 +860,7 @@ Initializing the Build Environment
> >   Before you can use Yocto you need to setup the build environment.
> >   From within the ``poky`` directory, source the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
> >   setup script to define Yocto Project's build environment on your build host::
> > -
> > -    $ source oe-init-build-env
> > +
> > +    $ source oe-init-build-env
> 
> You could also remove one whitespace before the $ to respect the
> "code-blocks are aligned by three whitespaces" rule we have (and which seems
> to not be part of our documentation/standards.md :) ).

ok

> Thanks!
> Quentin

