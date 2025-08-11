Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57937C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 09:25:45 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.43985.1754904335161039763
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 02:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f6hk/UZl;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70749d4c5b5so36271796d6.1
        for <docs@lists.yoctoproject.org>; Mon, 11 Aug 2025 02:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754904334; x=1755509134; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uCDde5ru3BT4Vqdee9OvEdeMYKQl0Kl/+rmU3I55exM=;
        b=f6hk/UZl0QfV1RzrM+t8kZs1+F6fk7kidhbiM4AZMtqzxWvBLPzA7U56oU+DDybcrp
         e+bSvWUK0gUh+/P+gKSelCOU7a9c8q6HQrRqYT76PsKPV76VX8rvV3ZJ8Hv436Zy0da0
         ie64mr0MtjmjFueY4CGAyJWer/jC4M4xc/TqZ2fKpZLbqdqUKOA8muOYGzHymBX0iWSp
         tCIOY9pPuSoUMG0ic9gCsUpH2OgZnXcZoABGzeQOp/c31ZEZJoGLUnyihLKaJxZSS0PC
         JGiJ1DBUe/y1+jVlZUv+mYKtx5jgIwjP8Q81QK2z9bxL63ILWLtZXv6cT7snbisgRV7J
         Hyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904334; x=1755509134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCDde5ru3BT4Vqdee9OvEdeMYKQl0Kl/+rmU3I55exM=;
        b=VJIjiVcZN7Z7Vd4t4PXJfdJVPMfzzeekR24DUHBLcre20qXlSE6i7Z52sTifjwRd6o
         0JtJAPvp88gECCCiJq1Rfp4ErkdEev7EwbkMZlS1t/LRwGZsdbQIEQBV+qKC8dWy1QPD
         YVwSwL7lGJ6UzINzuNk3XoyW2HTxRfKre3/eibKcQNZQnhbQP7wNte3Z5Rlfwm3Oml/r
         JibUR9JiZhFcuVGQr0b+G1KjxhL/3ByRov4ZYF9IBw4HbRNXfbwSL/SgxVRhotsMnpRf
         Zf2qjOgWLed8ZEP4U1lviPq7UEvGrq2r/aojMaMeRCfjQ3ak8CDxaGWHNtC+9Vy/vBM5
         FHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpI/1avPj5sKDtswoZjaQsd43PiPJqPSE5sOg+5I+MhjR8XhtJoAjVkP3PQs2qpGavKUm1@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwHwAVTqmqCZ1+Nk8aOGw1EOgevPDKrGaWLm+b0Glog1eEElCj+
	YnHPhSpBNF5q6I9gY+C2+9cAWVJzJzYrlnYcegKPkaknKIlcIRSfIw1Pzg5P2fiJvy6s8EoxjBo
	45jHjhA0OegFjXr5fChauuvUei2RkM8c=
X-Gm-Gg: ASbGncudWMzVtuILb8qVatJyI1Cs2p00Nv4SsLG4wmqZezDJwRIdSRzawPDIWC+F7FZ
	qR6pHaQWDIVkRGEG7bi7KQ+SUZU5xIvhjMU2Edfmp2AOWs14XM6MxHPXSUkHir59VFCHdZYmdKj
	NT+m1ceTYF6eqk1FfID+D/DqOi4CLWjF+eMWWZg2cQh+wGmTOv5Fg+qHrrLXpTc2Z3HuCcP6M12
	tcLmdM=
X-Google-Smtp-Source: AGHT+IFh0mBR5zm9T8ZfQH2264pWWjTa7VIkatZ8nYktCLi5+Jas2IPfWCfb3bN4+FfLOwHsZTx5j8wO6yco8NEpzOU=
X-Received: by 2002:a05:6214:2349:b0:709:82d8:6c68 with SMTP id
 6a1803df08f44-7099a4a0544mr125933796d6.34.1754904334024; Mon, 11 Aug 2025
 02:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Aug 2025 11:25:22 +0200
X-Gm-Features: Ac12FXzF4EkxSVBYXnA8DpZ2IzETcoirMhFRQo3vZMb2Etb_t6VQfDDxxhm7Z4k
Message-ID: <CANNYZj8e=BpGeFryh0+bn6sRT2jFRjJ=n=kwdVHMEaTx9YG00w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "qemux86-64: Reduce tuning to core2-64"
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org, 
	docs <docs@lists.yoctoproject.org>, Antonin Godard <antonin.godard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Aug 2025 09:25:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7449

On Mon, 11 Aug 2025 at 00:25, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> This was originally applied as our autobuilder had older hardware and couldn't
> cope with the newer settings. This has been resolved in the new cluster so we
> can go back to the newer tuning, which software is now more likely to need.

The other reason was that qemu's TCG implementation of these v3
instructions back then was very new and had subtle bugs which have
since been fixed.

This change merits a mention in release notes:

======
qemux86-64 MACHINE now defaults to x86-64-v3 micro-architecture level

The previous default was Core 2 era processors. This change means that
the toolchain is configured to build for that level, and qemu is
configured to emulate it.

v3 level adds support for AVX/AVX2/BMI/BMI2/F16C and other newer
instructions which are seeing increasing usage in modern software and
add performance benefits. Please see
https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels for
definition of the levels and lists of Intel/AMD CPUs where support for
the instructions was first added.

Note that if qemu system emulation is used on an x86 build machine
with kvm enabled, then the build machine's CPU must also be recent
enough to support these instructions natively.
======

Alex

