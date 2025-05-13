Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B40C3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 13:16:12 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.76206.1747142169621200211
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 06:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M2S3Sz7T;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47688ae873fso62048291cf.0
        for <docs@lists.yoctoproject.org>; Tue, 13 May 2025 06:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747142168; x=1747746968; darn=lists.yoctoproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y1zxECAedy6b+x1biLF1XhWQHHW0ehzGZ+brcc16Qg=;
        b=M2S3Sz7TD8nIxXxtlK6ygO8U3XaoZZeW3QcuEB68GaUmB06QK/bXdNfsyoOC47+cOY
         XmScodpw5ypG+Suf7G+UwhE1VCMJosyRCnmavVHfPDqgGduXyGRzzcV9HmIPt2Kl2/dQ
         w9bCPx4TsGFeJeq/2Yg6Uym08LQvSlOzi6lpu9pf+CgBhcltmR8esTSPScpRjBdp/y48
         CChHJNBWXRbWEE4fBEKmVsDZf4hnS2kAtmmBWJ7YVKnDzO25bS/1hT8LyVLPHunRciGA
         sTlBnaovoixlMGTCOU4BSw5D1gt0vUWepJ3TNUnC3nc7jaaOV9lGVncTsB6akRPzl0RS
         Zfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142168; x=1747746968;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y1zxECAedy6b+x1biLF1XhWQHHW0ehzGZ+brcc16Qg=;
        b=G+wXA09h2RM13D1md1oREJjRUWe/5tJ1Ix4HxAOgm9+ol3HvsmZPGoBJimAgdiLb7e
         L/o1ZOep1lCqjpV0LXjBkQ6W4pPEzT5IC9sBqwhpZ/e98vLe0OZG5zZOENRJZc7exCf9
         o1Fu+jw0616nqOS7qPLuwoNda2j6oTpRYoQ1rf1Zgf3wwkEJpqC/Jt/a0y6UwZWdT4q+
         UhWdcCbjUl4JgHle9rVAmaxr2QDhpMRV2zB/qxYWrEXdH9WoPSvsRr0CiqNd51ab8TKY
         cRCoIgy4aSzdRvcVyoJXq0TfF5T4ueyandVkf4LXJoNEo4GM/mEvzkBu/Vvl9Dv87qDU
         8i6g==
X-Forwarded-Encrypted: i=1; AJvYcCWLSlD2Nb8IUltPKF7A8zwtKcUoH6K6I48EIlGmQB7dOuoKrnc6K9ffFqt4WoaGPNZPr9TH@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwOB2CoWsHJyDdLisqS0ce+tv1ARJORsZ10oBb5X+2eL3ICBDUV
	e786wa4TcDbT4cv+SI87Kbvme/yUt46zFdHNIsjZLJUqSu1Ql/bw1H1GBA==
X-Gm-Gg: ASbGnctTUxmtGKFYHMhhygNfBrLg+Z0KMeeY3PNlQXQzUGjMP7pSW5jfq9S4h9GmkW0
	LyFUemgg7OBUg9zNlZFgAiNkPPnBk+W5up1OXnzcQHQ92D8AeWPFhfcCYZUM0hqmZSmWcR9F5Mt
	Sj8ZVTzeivx+FNypAdcHHPkebCxm4mWyVB3SwFLXfA4ygkY95pztZAd/xdJYDZ6T5D+U7W2FwKy
	c45/CJ44/X4gZI7zEePKHfFMThPHjMaCZLVdvoKs5SKvs+J6vL1k+aOA6Qn27utKLMOemgLK9jb
	U4p643X299/pNbG6XZXeOlWHMXm3f+0z6SiHr+NQQs6Zl2kQ6DSsHzDLkCd4TAf4oi7PuO/Fj5y
	83WY=
X-Google-Smtp-Source: AGHT+IFGzruvx7xBrNj/EhLUqflhDoGX0m3fbROAHF1RuL/v01dKtv/+4FR3m+zT+EDYIH87nhnpfQ==
X-Received: by 2002:ac8:5d55:0:b0:48a:6af8:58a5 with SMTP id d75a77b69052e-494527639aemr238790601cf.29.1747142168491;
        Tue, 13 May 2025 06:16:08 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494524bda8esm66370811cf.48.2025.05.13.06.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:16:07 -0700 (PDT)
Date: Tue, 13 May 2025 09:16:05 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] sphinx-lint: various fixes
Message-ID: <20250513131605.GB31516@localhost>
References: <20250506180301.32610-1-twoerner@gmail.com>
 <d7d0d319-581a-486b-bffb-7ddf0f771d9b@cherry.de>
 <20250512210330.GB25174@localhost>
 <D9UVUL1RJXK9.HT6YMHKRHD36@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D9UVUL1RJXK9.HT6YMHKRHD36@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 13:16:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6818

On Tue 2025-05-13 @ 10:17:05 AM, Antonin Godard wrote:
> On Mon May 12, 2025 at 11:03 PM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> > On Mon 2025-05-12 @ 09:50:07 AM, Quentin Schulz wrote:
> >> Hi Trevor,
> >> 
> >> On 5/6/25 8:03 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> >> > A 'make sphinx-lint' pass found the following issues:
> >> > 	trailing-whitespace
> >> > 	missing-space-after-literal
> >> > 	role-with-double-backticks
> >> > 	missing-space-before-role (role missing opening tag colon)
> >> > 
> >> 
> >> I'll let Antonin confirm but I assume it would be a good idea to have
> >> separate commits so we could easily backport them to earlier releases? Or
> >> maybe you/someone can run sphinx-lint on older releases and send patches for
> >> those too?
> >
> > okay, waiting on Antonin
> 
> Ultimately the best approach would be to run sphinx-lint on each branch, because
> we might miss some lint warnings by simply backporting this patch.
> 
> Do you want to take care of it?

Sure. In addition to master assume you want:
- kirkstone
- scarthgap
- walnascar
?

> >> 
> >> The changes look fine (and necessary) to me :)
> >> 
> >> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> >> 
> >> [...]
> >> 
> >> > diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> >> > index 0f015d434041..21d3dce58c14 100644
> >> > --- a/documentation/dev-manual/start.rst
> >> > +++ b/documentation/dev-manual/start.rst
> >> > @@ -860,7 +860,7 @@ Initializing the Build Environment
> >> >   Before you can use Yocto you need to setup the build environment.
> >> >   From within the ``poky`` directory, source the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
> >> >   setup script to define Yocto Project's build environment on your build host::
> >> > -
> >> > -    $ source oe-init-build-env
> >> > +
> >> > +    $ source oe-init-build-env
> >> 
> >> You could also remove one whitespace before the $ to respect the
> >> "code-blocks are aligned by three whitespaces" rule we have (and which seems
> >> to not be part of our documentation/standards.md :) ).
> >
> > ok
> 
> I can do it when applying your patch on master-next if that's ok to you, that's
> an easy enough change. :)

Yes please.

