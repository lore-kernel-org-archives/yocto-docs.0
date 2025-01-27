Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A09C02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 10:18:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.48497.1737973089652009063
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 02:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P0+MsRZS;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43621d27adeso27705735e9.2
        for <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 02:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737973088; x=1738577888; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7heqQsm4CGsoTne3M9BOpnxhPUvORIrxaPsMYLZPeA=;
        b=P0+MsRZSOF6tT0gpZ+pVZqP62y6IS3gCieHHdplwoLP0+Yszi79/TqtE/p2+N3f6ZJ
         3/2ZhNjfjaqKBXFw0hVj0PEHhW6vmOTKcpGpmVdRxJ5SzDSzs8CXx6ut/ZLi38sJqxTc
         lrGdwTyeRetD0iRMUJ4ZU3ZB7uartM5J8zHoRN0w1RwaQzPbqGJH8ITiuT27HnEXxQkg
         jEMwNZukFoR4ZJvQ82JiM+dYnUhRGo7vxhp6qn6dSLCYR4LgXI+dKJjlLjuFoZkc2LLm
         phcI4eWYR0rO7OCombRVBCbkqAOYhtLwLNE0k6tmCSZfrLLxZxZlR+uAuYldK9t43CVq
         TA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737973088; x=1738577888;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k7heqQsm4CGsoTne3M9BOpnxhPUvORIrxaPsMYLZPeA=;
        b=CFZHNSqSobbZOhRMtk8BdUy+ZwuJk2DLmJMHbdrBGWOF6I+F7+UdZoZQh4jStKrhD6
         JHb4chmVzFxOOV6j/XYfr0y3CN4Kffa8BgLlL0bt6qIvgwCg35096xuVNa+a5PtCMOQL
         AnOsUw9/UMOYDLNZWw+PsICz7aZjNAphVP6d1PHs7rQ42/tC+aW4XfUFRCffWeO0BSMX
         PS3sQLAOeRWPnsvBJhGXgiK93KeBvG8o2Vu6Ody/hiFumcxnfY96RTzbt6wPNcHyX76I
         TX5NjKau/9Huq0g8jSQbk1jo6gXtsq49p1vL3LndVn2D8IxMR6ROh6j+nuJnYpz3butj
         JtGg==
X-Forwarded-Encrypted: i=1; AJvYcCWBk5v+JOL2Me52O3WrtAm97EjF+jo9Sdd+Nu+U83VdoBXesa/mYG7TgY4iNQ7K3PLO/VLh@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx1EnnGQ/mqhlM1PWHwiPv7gshh1eC6DcxsVoFwDGEtvzefqA8w
	k3Bg//v5H0ntF6lhx5Y9/+4qkmBdqtgMLseD6FIsvJER2QoBBff96LEMCfvE
X-Gm-Gg: ASbGncvbvEoYbZPG4bmvNWJ/gl2RlD91Q35y4Rn81vnu+YmjjOeRGPL9wIrS1dHz7Sy
	5i24Y6/h85CAUKWlhchvGjTXYABXDtiAqnd0Dg+oHn9rKVE0YtZEry9ZYqiOntsuF1M76ZG+kXg
	Al1Tzl2mP5pOvhr+wJ10JWrD4YTw9z2IGiK2rwbT2QPa5DZRNN7dwewV4hnkUboqS3EahKJ6LYQ
	7b8t5pIdCbr47R5NZgeNDHwuJGjPADteD4yyLlbSezCPaogHLv9yRAkH+z1jDLCTZHCLhNoYSU/
	iLiz0xwul5m1+r1U1DtTQjuJHdg9AMYOZQ3hujmuY++ie77CAx7JYw==
X-Google-Smtp-Source: AGHT+IGVHqMDiYL+zLec07w21E2+FBds9obBXjJt1z8o6Z4D832r3b9dHPgROLrmiVY9UtHoas1ZXA==
X-Received: by 2002:a05:600c:5125:b0:434:a852:ba6d with SMTP id 5b1f17b1804b1-438913d5f4cmr330853015e9.9.1737973087775;
        Mon, 27 Jan 2025 02:18:07 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507dc9sm127596875e9.19.2025.01.27.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 02:18:07 -0800 (PST)
Message-ID: <a8dfa467700d8d7961bb24bb5c52290b077d8d5b.camel@gmail.com>
Subject: Re: [scarthgap,styhead][PATCH 1/1] sdk-manual: extensible.rst:
 update devtool ide-sdk
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Date: Mon, 27 Jan 2025 11:18:06 +0100
In-Reply-To: <D7CPUNB5VPU4.8GY2FQBHEPPQ@bootlin.com>
References: <20250126125313.1454763-1-adrian.freihofer@siemens.com>
	 <20250126125313.1454763-2-adrian.freihofer@siemens.com>
	 <D7CPUNB5VPU4.8GY2FQBHEPPQ@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41app1) 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 10:18:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6192

Hi Antonin

It's a bit complicated to keep yocto-docs, oe-core and the bitbake
VSCode plugin consistent by sending patches to different mailing list
and different people. The related patch series for oe-core is here:
https://lists.openembedded.org/g/openembedded-core/message/210279.

There are multiple reasons, why I would like to update all the branches
to the same level:
 * Latest VSCode plugin does devtool modify --debug-build by default.
   With a poky without this option, the user has to take manual action.
 * It's a bug which should be fixed
 * It's without risk for breaking something, it's a trivial change.

So probably yocto-docs needs to wait until oe-core decides and then
follow. Is this possible?

Thank you.
Adrian


