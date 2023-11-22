Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9812C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:48 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.18536.1700657142531593316
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Nov 2023 04:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQrmRzMH;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so89950761fa.1
        for <docs@lists.yoctoproject.org>; Wed, 22 Nov 2023 04:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657141; x=1701261941; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K4LQEKNCmHcY3/o7dp4S7ALTtBoVeylEQhoU6AytDwo=;
        b=hQrmRzMHyis7qCjA4GjFe5tAxjpx8gpzYH+91fzX8dklhzrzY+yrQakbD6shz9QPvc
         AnBGmKbCINZJU4N9eMuDwoOFmyg7WncbZXntWKFeNhAUElb01BKP+vbXzsg8YZNeOoui
         N80snYPUPTTK/kSm6JoH6JFYWa3kO8VN36wrVWYGZUVq6seF07BfOo0cSURZJUZFHhq3
         N2yXH85dlcvranoL7C9AxeHstlptUXoQa80TYGZQD4nDsRK9l9O9V5sJLJWW/UY54CgS
         JukmaOgV2SIZLnP7Ju3tWQSyoYBX2JFDGt1EVcDOi/wYtMeh8U27tunyhZcRUcYn0EUT
         tMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657141; x=1701261941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4LQEKNCmHcY3/o7dp4S7ALTtBoVeylEQhoU6AytDwo=;
        b=Uemm3HS9UEM3QQGQrkGdx4IzsMLjkge+gft9EDS1w++eGdw71SlO5RdaV5bmYZmrhJ
         sR9Frgt7HjVHLb95Wi5Ke41ErJFjiLes/gMMRqEYp/q7Llv9Lth6v2U2vj4o/klyqlRS
         ES6kvAi7dyZhM1o+kKW0z/VTAf3Y3xEk6XnMfHI2vQyfYve8f2IwHepvFk7a8NW+lJYt
         bGtkTd3LU0Gog/0fV//OMIIPeIAta1vvSvaDCkJSw/xL3To3+p5e224HeEfJN58kHtDM
         QmkmscvdjUUh0Bp1LYc0LxDV89zfiAMLMb54mKTR2sXp/A0qcmtEfpN8kf0rEyiPnP+4
         qcjw==
X-Gm-Message-State: AOJu0YxnQl4b8bCG3ufTWnjRc5TJVZ7lGATDAGCsISP25ij1ZA3S04qt
	QMHz8WM/e3n84GWDiw1um1LeZM/etkglMWIAGGI=
X-Google-Smtp-Source: AGHT+IEO8GAec5zV+sHHhJ0PLCZi+pQhrv1Y0iErHmrPXRPP3aKPHrCTL2frH9FLuCvsFCI0lWrQzvtTaNbWo+HdsL4=
X-Received: by 2002:a2e:88da:0:b0:2c5:1915:9824 with SMTP id
 a26-20020a2e88da000000b002c519159824mr1690821ljk.9.1700657140601; Wed, 22 Nov
 2023 04:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20231122085438.7328-1-alb3rt0.m3rciai@gmail.com>
 <CANNYZj87+-6jte1KYUNg2ueWvsYzxiOQvbTzrCZ_ooo9N7uutw@mail.gmail.com>
 <CAH=B7vfs74f-vyx8JGJyfAu3NPa5xwgumsW+_ahMBXnfUmJw2Q@mail.gmail.com> <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com>
In-Reply-To: <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 13:45:28 +0100
Message-ID: <CANNYZj-Ac_+_AG3_sW=yObw8peavCb3NfUh11-7YDy5xy91StQ@mail.gmail.com>
Subject: Re: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment file generation
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>, docs <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Nov 2023 12:45:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4643

On Wed, 22 Nov 2023 at 10:30, Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> Thanks, now I understand what happened. This feature was actually
> never backported to kirkstone (and won't be because of LTS policy - no
> new features), but documentation was (mistakenly) updated to state
> that it was:
> https://git.yoctoproject.org/yocto-docs/commit/?h=kirkstone&id=5e2ec35e3d63f9c73726122fe2b3dd6d6f85a77e
>
> Michael, the bits about meta-ide-suppport/build-sysroots need to be
> reverted, before more people get misled.

I've now sent a patch for it to docs@ - needed only for kirkstone.

Alex

