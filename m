Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A5DC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 11:31:00 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.118509.1698060652794343224
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 04:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDUuZFvh;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bfed7c4e6dso47094121fa.1
        for <docs@lists.yoctoproject.org>; Mon, 23 Oct 2023 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698060651; x=1698665451; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/5Kj5B8oMabliZnTZoLY+dmX7DwLpj81q4EDOJr6ARY=;
        b=nDUuZFvhe/YTl0Pneqm7t6RjdXVwFuu78NE3imdSEdtltwxoIiA4+XyMG7yRHppliP
         akq9i25WVsLvxu9DGb05LwoegvPFPB+s4csnC0U7/pzeDul3UOMrLgjdnZYjz11/mA3M
         p4YAywI8Aw/Y2LwtEz3OaaUxrjeGdERn3oPlCqOO3dJFjy9jSN9cjKQB3k8LEyuVEsfb
         tADnBhj5cATgew8k3r9uTYVrgSTwR6gHI+HyZfsgtJV6YsgUs48n0dkYphM3L0iZ8KmG
         VxYyyqQFb8/2btHbnwaRwLugwHnEPwd92tInn9JZoT15LWiqtc5Ae/VMQKGQDYH3jn5H
         H2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698060651; x=1698665451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5Kj5B8oMabliZnTZoLY+dmX7DwLpj81q4EDOJr6ARY=;
        b=SmFpyiWiz6cxmIH2LeKrDvY20aTw5NdHgJuG75C3BgeRzy+4wTiejf/1qmcw5jIKnn
         2tXfKA7h+uVoM+RSBgIy02sZy5FKSj8cYoisTHIR25NbCAziewR7yTYgVdVKTtKU0GCq
         WTIxShnaYi5BNQb/UQMw00vk4P24vQCMZHbeu+QCwnAqC5Fs51iPDMkFq65pckBy33RZ
         N8qsLa3Dm2vsz+wN00s/fs9YjevSeIPv0XzUBJtJ8ve1+KhkjcZKMtWTMhZHSfXMb9xY
         aes+HsYv57Q6XqM4xz2MPxKyM+Am3P5FzSyahjnJm5ROgTZ6TqxraKlMPD2gi0na2x5V
         CesA==
X-Gm-Message-State: AOJu0YxC9kOYIc8jw8/iJM98WC+niJ0FQfPUjmIUM3WXPFN6eC2+9nud
	LprRSlL3YQeUmiqdf2qw2JTdStk229PlYYlX/Bc=
X-Google-Smtp-Source: AGHT+IHtWgNn48kPXYLILZTKm01XyUUvUzt/TigkmMkPLkgCGXKoIkyROMfvveN0xfDADfZ0TaOJE3yN3je61UWVypU=
X-Received: by 2002:a2e:8610:0:b0:2c5:6d8:8dfc with SMTP id
 a16-20020a2e8610000000b002c506d88dfcmr6005307lji.13.1698060650810; Mon, 23
 Oct 2023 04:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAOgG7m3Z8E9PvROHDV5qL8-WGJmY0f6NQgPrfxG8YXnVw6AfPA@mail.gmail.com>
In-Reply-To: <CAOgG7m3Z8E9PvROHDV5qL8-WGJmY0f6NQgPrfxG8YXnVw6AfPA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Oct 2023 13:30:39 +0200
Message-ID: <CANNYZj8xYZWLnbxoHuBaGR0SDx98vbO26ob8qmsZ7eTRZgQA3g@mail.gmail.com>
Subject: Re: [docs] [Proposition] Workshop-like documentation
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
Cc: docs@lists.yoctoproject.org, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Oct 2023 11:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4454

Hello Talel,

I really like the idea. Hand drawn diagrams are awesome! This could be
on the doc website just under the 'Quick Build':
https://docs.yoctoproject.org/index.html

Alex

On Fri, 20 Oct 2023 at 19:06, BELHADJ SALEM Talel <bhstalel@gmail.com> wrote:
>
> Hello Michael,
>
> I have a website for Yocto that I have some articles in there: https://yoctoleef.xyz/
>
> I am a Yocto trainer for long time now, and I love detailing everything,
>
> For instance check: https://yoctoleef.xyz/2023/07/27/details-you-should-know-about-the-recipes-working-directory-part-ii/
>
> I would like to contribute something like:
>
> Practical Manual, or
> Workshop Manual
>
> or something like that, the aim is to provide a learning process for newcomers.
>
> It is like putting a Yocto training path with workshops and examples to follow in order to master Yocto.
>
> It is like The Rust Programming Book idea.
>
> What do you think?
>
> Kind regards
> Talel
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4450): https://lists.yoctoproject.org/g/docs/message/4450
> Mute This Topic: https://lists.yoctoproject.org/mt/102085617/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

