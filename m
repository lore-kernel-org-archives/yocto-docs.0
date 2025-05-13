Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7CFC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 13:14:42 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.75731.1747142081425973467
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 06:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TZc0pFZe;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7cd0a7b672bso242582485a.2
        for <docs@lists.yoctoproject.org>; Tue, 13 May 2025 06:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747142080; x=1747746880; darn=lists.yoctoproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ru5/p4xSqncwd5pRzLEJL3l5uEpEEoHRcLzNgHmYMBM=;
        b=TZc0pFZexkBnKrf7QaghneDauEvm2yba5avZSxZPN0PaayDOkyBafzFbMAcVsIaqcg
         7nMFQ3NHf+Q++skxTr4/UKr9JWiJ9XFXUzqdx1lp1e3hlfHOWGHFYlH1kUQahjqxtDLt
         iFLWoPaO7pxApkbeamhcJdntZSmFUdCvDz9h1rhwAzrIoSjKV2MU1FtWTihKZLZ4fSNP
         5FhxVjph9esMwLdzQfz2vWQSFtIN7HDIFlAKUSTeZOiKg87+UggMuUnvyCRUNEKoqBB/
         LDRt2QyPmqzQGBMnP0f0w+IvUgTNxy9gD2OYfMmQwK//uPX0dsw8f7rH7AEH7mDWoKqI
         0bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142080; x=1747746880;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ru5/p4xSqncwd5pRzLEJL3l5uEpEEoHRcLzNgHmYMBM=;
        b=i6oJNPWxs6pQvqWWVQSbc16vR1R76ihbdvCWKwRiSSxm5Yx87hFmsvcra04QwvndQ8
         BGMy0AAo2NYto4tEQJZRCjzEKYvyPSDc1iSLfD29mv8T2Hdpch54gjk5v2l/d7tROKZH
         EwSFj8JvAaPNv+wHZxa3EAb7fTCaln+gcfIqdK5dWQ4JyDi6pCN3VQQcrUk3zowfyiuU
         tO/35wPFmwkmNGLf4Zj6B27Z7PdorwEfL4+Vdi8QrQHTvY5EBbOmJwen6MwzvQGdbm9N
         F4zaRHcKThpBB6V9Ge5NenUH9J/Q3pcq8QcvZ/BbPVAwG0/2bU4GP6OWUry+M1hkWUbu
         G8rQ==
X-Gm-Message-State: AOJu0Ywiyw0D4u4FVwUFy3b+A0ZNii5i1GYqwbb5YAiGcPCMW7/AJruz
	Ls0ntlorFuCjC6695eCcFyykNmquLxtYoOt6tjNDaaipW3Jhy3pxWayblQ==
X-Gm-Gg: ASbGncuLu+RHsrDiFrsszfNg2nGiYxLMyxg/PHnDtdT0jaVXxgGfFSmctDU/w+7T2P2
	zWwefzl4c35Grtyt5jOEcvpa77/oOaylYJ1WVXc48jxI8ojAQtiwEds1OsIiQmWkqAt0Hz9OttN
	1VJTILdZyZIi80f9wxKtuaKipVBlI3IJ7uh96IlTf1aex4iClf746W5A/RaewbjvfMOGhxJ2M/x
	Cgi17xNKp6N/Kwzn0qrGR7xMlgYmglm9DJigRHfz66+C/yXeU1GkLC7xhDge3/XwbMzFd7Mrwpy
	vv723fAE+dnzRF1r2oZBMGuNgnO+0NPxQEesDElCNki0vWtz17nUxB52ag9FwKCfMxHp2k26+/R
	gkAEvGAax0hsfCw==
X-Google-Smtp-Source: AGHT+IHefnP73qSjMxOgzkQHLe6ndGGb9eDUeWQwTxN9CPsmjSJy0eDs8tybEUBl4ei40pYxL7qquw==
X-Received: by 2002:a05:620a:4490:b0:7c5:54d8:3d43 with SMTP id af79cd13be357-7cd0115008bmr2784333385a.58.1747142080231;
        Tue, 13 May 2025 06:14:40 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00fdc779sm709259285a.76.2025.05.13.06.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:14:37 -0700 (PDT)
Date: Tue, 13 May 2025 09:14:35 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 WIC_CREATE_EXTRA_ARGS
Message-ID: <20250513131435.GA31516@localhost>
References: <20250506172300.19220-1-twoerner@gmail.com>
 <8ebddc9e-300b-4e82-8ff7-20328f06d7a1@cherry.de>
 <20250512210120.GA25174@localhost>
 <788da1ca-6e56-41ed-8814-4771710bfb69@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <788da1ca-6e56-41ed-8814-4771710bfb69@cherry.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 13:14:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6817

On Tue 2025-05-13 @ 09:59:58 AM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 5/12/25 11:01 PM, Trevor Woerner wrote:
> > On Mon 2025-05-12 @ 09:31:27 AM, Quentin Schulz wrote:
> > > Hi Trevor,
> > > 
> > > On 5/6/25 7:23 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> 
> [...]
> 
> > > > +      image recipe. As part of this process the Wic bbclass will call the
> > > 
> > > There's no wic bbclass.
> > 
> > I know. That's why I didn't write "wic.bbclass". I wrote, generically, the Wic
> > bbclass.
> > 
> > > I think you meant to say image_types_wic bbclass? It
> > > would be nice to provide a :ref: there but we actually do not have the class
> > > explained yet so cannot do a :ref:`ref-classes-image_types_wic` like we
> > > could for image_types.
> > 
> > I didn't want to give a specific name and wanted to write something that would
> > be immune from changes in the bbclass's name. Also, layers might implement
> > their own bbclass that uses wic, so I wanted to include those as well.
> > 
> 
> If they have their own bbclass that uses wic, they wouldn't necessarily be
> using WIC_CREATE_EXTRA_ARGS as this variable is specific to
> image_types_wic.bbclass, we also already list the name of some classes so it
> isn't a new problem.

I'll just rewrite the part to avoid mentioning the bbclass. How the command is
invoked is irrelevant.

