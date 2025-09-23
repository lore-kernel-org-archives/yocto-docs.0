Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CE1CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 16:38:31 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.2311.1758645507567326519
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 09:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5f+is/y;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70ba7aa131fso59629606d6.2
        for <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758645506; x=1759250306; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kPV+yy0OA2ORfvCzUA/VRHhlhgvk7kgObHRKhnqnpAQ=;
        b=e5f+is/yny77y4GrngnmpRNLhIXyWS8rFRj+3dlY5/IOO0bS8yRrInCecI9czWfglq
         IzP4Fx+wFfnZ15c3fbv6hNxgc2Q3X0tLrfS3HGuOtqEYVwMm3BbyT02CCFqO+d3kDIBD
         cBOtcY9Aw5eYj3HkV+KbvvSN/KA7OmR+ymAGP1VZoHVRNmOAmHejdGrSv1B9Z7JgUYqW
         w3fmY3dbiJlDE1NWpgJTQZftbNBdmCzK6ycscPunGzHB0HTp0/wmOeMNdJcwI0Jn/Gsx
         UH7BNiLmlOdAFrE3+NWDvM8Cqycqcn18Pj6Sj5/sYzMkdhrmHW0lB04itmN+DcCEE2u5
         OBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758645506; x=1759250306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPV+yy0OA2ORfvCzUA/VRHhlhgvk7kgObHRKhnqnpAQ=;
        b=Nf4q2K+9Qmg0D8oPIFhFHnNyzwi4hF/ypL3lr2wkdbd1K79Byx1YSQsj/JOxDQFpmV
         r0yk2QwXkcAjJ7d3IWvOpp6EzrgfGKr9tHB7jRSDdh4uJOQcpAvIDgoG/bZtDimo2lBy
         dtN+Qddh0esfU6hmrs44UQkXDMZ5dnp/lS567vvDus/i8NXXfgUWWkuuqcfTLF7r4mfU
         1iOAlYLAMy1OzzMDuwOn6seA3mOK0K9EUZvXpCdRFombp2FDCZNXU0FQHxycok1hL3kk
         MfsYgjxk4w6kkdQofWmeG8CsiZax5dWX7jRIapz3DWuxouEtswebwMBDPTGLIFY1bo2B
         eIaw==
X-Forwarded-Encrypted: i=1; AJvYcCVY3bb9qidPczpBw7xLxG74vd+j8o7ytbkSs8DBvd5BpLxh7+mWOqorLTBUTk10YmMQN2lD@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YylkaNnwnevRD6xiKdL3SvpsHWT+O1yInjGyvpbPiQ7Lc7SFFWP
	w0h9Fxh32khqR0zs6I6ZyB473wWNZieHVOZIRECHkusYklf9JMrMeDldb8zXAYNMsauomS8qGPc
	YlkYoz5uJqB2exrvT4hSQ3mDH/1qeiYE=
X-Gm-Gg: ASbGncsb2q+YTNg1qevY06sAx5DNKX9eFv7e2wx4YwrgkP9ERs5CuNby8JiRpbovNjl
	MtHwA9WdSirrcSGuM70u0MHkOfobIm/EumXGYmDIW5Mg5GchGNDqchvhqo6RzEOLlFgye8Dwcmv
	42SFxthUky+CnUv+XY/SBVWbiS4mPJ5eeY+aEA6/0UHD6m/mrIUobqHRDDhw7G3Fm12xCnoHuIz
	CG0kWpwnwfbuXDLc3o9aCCjNTDuP7hGGQrmm9w52xUzpurmwN4oy708j5VwhoqMrVNoTzymz/gT
	KZWHPFwFXi8DS/nowR91jJbTu8nLRiEWXnP9j0dX9AjERoyht2s=
X-Google-Smtp-Source: AGHT+IEVQ12omKIpsKxZ5vF7su6hN0HF7qj3P0rLamij7wMP0DHcvE+OSbC24RS1UmXBw3y+1a7tXsEwFhPA0fmZoSo=
X-Received: by 2002:ad4:5bce:0:b0:781:a2ef:aa77 with SMTP id
 6a1803df08f44-7e716c4e29amr32707726d6.46.1758645506493; Tue, 23 Sep 2025
 09:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250819213530.3616042-1-tim.orling@konsulko.com> <DD0B43YZK3LO.1TVXDXSLGVPIU@bootlin.com>
In-Reply-To: <DD0B43YZK3LO.1TVXDXSLGVPIU@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Sep 2025 18:38:14 +0200
X-Gm-Features: AS18NWCPlAWDggncQD4OoulI2ok6lHJxNTgGgCBJ6Uz9PtiZ7VUMEPoRR2sqdNA
Message-ID: <CANNYZj9n0Na=y9+-mY=AYc37-iYyLoQFX33q7D5ptsuxcsbiZA@mail.gmail.com>
Subject: Re: [docs] [RFC][PATCH v2] brief-yoctoprojectqs: add bitbake-setup info
To: antonin.godard@bootlin.com
Cc: tim.orling@konsulko.com, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 16:38:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7586

On Tue, 23 Sept 2025 at 18:06, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> Do we want to list this here? I feel like this could distract from the point of
> this section, which is to showcase how to use bitbake-setup. I think we need a
> separate section on fragments that we could link from here. I know this is
> additional work: we can merge this as-is but probably a task for later.

I too think properly documenting the oe-core fragment implementation
and available fragments should be done first, and only then full
bitbake-setup documentation should be based on it. Bitbake manual
describes the addfragments keyword, but not what is actually done with
that keyword in oe-core, or available tooling (in oe-core) to manage
fragments, or available fragments.

You can write a top level user guide for 'initial setup/status/update'
with bitbake-setup without getting into fragments, but the moment you
go into how bitbake-setup really works and what needs to be in a
config file for it, they're are a key piece.

Alex

