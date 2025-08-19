Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FE1CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 09:43:12 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.10163.1755596588665250822
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 02:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R8doh7Uf;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70a88db0bd8so44742866d6.0
        for <docs@lists.yoctoproject.org>; Tue, 19 Aug 2025 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755596588; x=1756201388; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VBRUE8a2XavcR+7d2IT5XpTVKaBmDy3kaBu827QNKbY=;
        b=R8doh7Uf20Fe29HSaX+VldNFofebuY8ZmUqmiINyGMlYuN0HcG0BaD98xn4cU4RZmI
         7/srFcL9HG+MhJIDdq/Ayx//77zRPwE0o79vQrvjQDgyjNKnkSi7YTh5W5mGCsDsjuyf
         M0qXXK7pfunCkPPOG5jkdXZ+vKUJOIOgrg6B6xqOzpd3cyw7gpD2MzIh5VzpbO7HSf+D
         h7/drU82guzbdy9hxiXmapFLJaocARrAO//1lp3pJAaBrsKYS6DmyeclQrcX1Rzz0rlo
         yw1FYXLFoyDAoGzxNsc6vWUU5C5FvJxtCbomD2mf9fxwPW0d8hA6RR6zByiPlO1tTJzL
         AVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596588; x=1756201388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBRUE8a2XavcR+7d2IT5XpTVKaBmDy3kaBu827QNKbY=;
        b=Nncy+1CAnnqgVDwbJSsbgBe6IvKY5MZ82DNnJfVM8I1bNTN4QWoSDB8b36VDYWHfHg
         xp7Rjy7W8uATnvkKn/YSybmriiow/UeVRicFkZ4rnaFRLLvZ0jSZCllI5NI89nT0HxRA
         9r8gkAEgAXCaUjzRLnELGjtzprWJgOYQquEXqXt2Y4ffy6kmPLYt5ylm1lE+B4HRoQUi
         KVc60z55dURu2bzwXAvcCthfe8+sXPS0YAdbywPZ8iZU0MLMm4tvjWQFregcww+VM1Ak
         PuVJv3WRiHTbYl7TpkChNa5lNEmXgqfmvTttTPOxIgdztlhRFBgGG4E+pGr1KTiclH0T
         UPkA==
X-Forwarded-Encrypted: i=1; AJvYcCVklULBZ6rwvY21I0Cclx1R8UlqkKicdNrv/CL123M2mR4b+edfbqsucAN6e8rHPVnlP3lW@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yza0bwZg35Z0y7jaDD8hDydUxvmx2sHR8tsVEPUoou/PlinRwc3
	NG5gcG81gbA8zD57uNq5SuLMOn5DI1t3Rh05nZbKSkGM4eMxcQ+IOcJSrm1l55orlDQN3qJkGJA
	VqPeO2jfdrw9Cyt5kgYX+uzwmxzlyz+k=
X-Gm-Gg: ASbGncsQYhcdhnFhGPRHJfkN8HWOEXUsKfUkxlporYKC64TmiasZ3SPK73gGax5wxw+
	K/hVdS7smplo+tR1UIsxuY6IZeJ1+kG0MGyy5SfdxpqbBdDTJjofg+YfyxQ+kGKD8Wb8wkoaulJ
	NBPlhQUqu8y3iDXxg7MyiNusqE5xitK7RhZvYnqbEb0OYgoIXjHOtBMnBkBlXncJoL4KMDTv+Er
	I4uA9eMjVk6ticvmY9RguI/8Nx73EHLwB16slGGrTebZXms4MJ+
X-Google-Smtp-Source: AGHT+IEC4up9ErhVMXH8BSWrf+MtZbqn+pl1jCbdK2lRyGEa0O3l+BOTKYjEk0GKGtBPLF0LSK6+10okP53NRkJOSc0=
X-Received: by 2002:a05:6214:410e:b0:707:5633:d702 with SMTP id
 6a1803df08f44-70c2b6da85fmr18513246d6.9.1755596587645; Tue, 19 Aug 2025
 02:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org> <CANNYZj8e=BpGeFryh0+bn6sRT2jFRjJ=n=kwdVHMEaTx9YG00w@mail.gmail.com>
In-Reply-To: <CANNYZj8e=BpGeFryh0+bn6sRT2jFRjJ=n=kwdVHMEaTx9YG00w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Aug 2025 11:42:56 +0200
X-Gm-Features: Ac12FXx3rRCwpdh5ZYsE7Vn4SJA7AyBA3hbwGFZ6yQ9QuMSp5YDcrRNMwwz-nyo
Message-ID: <CANNYZj_PJgweyLaffD0h+8DZUHXY3hMkKv7RmkWNn857wGptcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "qemux86-64: Reduce tuning to core2-64"
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	docs <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Aug 2025 09:43:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7454

On Mon, 11 Aug 2025 at 11:25, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Mon, 11 Aug 2025 at 00:25, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> >
> > This was originally applied as our autobuilder had older hardware and couldn't
> > cope with the newer settings. This has been resolved in the new cluster so we
> > can go back to the newer tuning, which software is now more likely to need.
>
> The other reason was that qemu's TCG implementation of these v3
> instructions back then was very new and had subtle bugs which have
> since been fixed.
>
> This change merits a mention in release notes:
>
> ======
> qemux86-64 MACHINE now defaults to x86-64-v3 micro-architecture level
>
> The previous default was Core 2 era processors. This change means that
> the toolchain is configured to build for that level, and qemu is
> configured to emulate it.
>
> v3 level adds support for AVX/AVX2/BMI/BMI2/F16C and other newer
> instructions which are seeing increasing usage in modern software and
> add performance benefits. Please see
> https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels for
> definition of the levels and lists of Intel/AMD CPUs where support for
> the instructions was first added.
>
> Note that if qemu system emulation is used on an x86 build machine
> with kvm enabled, then the build machine's CPU must also be recent
> enough to support these instructions natively.
> ======


The change has now merged, so the above can be added to the docs too.

Alex

