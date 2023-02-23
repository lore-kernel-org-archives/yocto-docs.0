Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ABCC64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 17:39:31 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.17461.1677173969280659884
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 09:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B8oi18wR;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1724d65d002so9613465fac.4
        for <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 09:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mbHQzmuTZCYyw/uQAU3zUtpt/t6M0I9vwxOsUu3u9EE=;
        b=B8oi18wRuJKOrNC2rC3W//WoRq5FTGsIWdPp0yy4aF1EHj85fFxynJKxujYZwHAAIG
         WLoA10qaDFD55JDlv03aOP4z28/boI6dxp0CH2wDnVxuEecHJ/MlcWgsD2DwD+f0IYL9
         4EqYkjJLmJFcysWNMHb0SPfpDgPn7n0mBjJtabZ3kR0+qUQn7uJFWBbsZIsbi6iYN1Bc
         DSu/qG1z5Xi6kqsazD6ndoSVg2AQeImSM95T0uWJOGLt0DKEPYp7Rj/HFW6K9d3rltl8
         sXtkzaq69LLKVIxDVQm2d1xGcR4CxLGAOHujvzO8w2xEt33TCYmE92CVIEwWGARxKH8R
         ydqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbHQzmuTZCYyw/uQAU3zUtpt/t6M0I9vwxOsUu3u9EE=;
        b=6tJN6NvZzHBrCe8VYJVa3pevb96xR6jcYg2yRxVdyy4grzysjuRrnlroQXQwKVoxt2
         3k7HhAVV3rcof/smjboJ4BaS0L2zwt6oE5OODa+qdRDtk6Z8EGJFDF7bzeGUtVnn7XF6
         YHJGiCz9MVBxgdo5/R2n5FV7fd7ednBEFkHpR40AAmrHXKxfQ/uMLn37gek4/RXC8svB
         lYiBc93MMW+RXt2k0bp2dlVLcMokCKi9rFewh/EpKEjmxgjp3y/umarIjjBFuJkjEr/b
         pjE6vcA9+wyOfPtYdxXJ+Re80iXEZp9Q29QV1aHQBaPDVzd8gHsvNFPzo5HwuXyZFfIH
         jpRQ==
X-Gm-Message-State: AO0yUKUlD1gzrb/zhKaQSs97vSj+Ij5wxZf4iTtnYsko8UbABLck1rqG
	/t2ijhE/JmvOQtJnVTJHoODDKCjwYx/SuX3pj5o=
X-Google-Smtp-Source: AK7set+7qlRg7Enxs4vGT9bqtbZTKS+x/LY1PG4FUXY0IslCI+KnNFb+4Z+Dc9weI/O7ZA8JB+W+cs8b6C1sMptLe/s=
X-Received: by 2002:a05:6870:d188:b0:163:b85e:f1ca with SMTP id
 a8-20020a056870d18800b00163b85ef1camr1921252oac.262.1677173968481; Thu, 23
 Feb 2023 09:39:28 -0800 (PST)
MIME-Version: 1.0
References: <66b9a05e-00fe-a3f7-82e1-2cb9459d87f8@bootlin.com>
In-Reply-To: <66b9a05e-00fe-a3f7-82e1-2cb9459d87f8@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Feb 2023 09:39:02 -0800
Message-ID: <CAMKF1srkaS9byR-TmRKxbr3Nka4BJ5VEhwkU6nSmrAD53VLzhA@mail.gmail.com>
Subject: Re: [OE-core] Difference between INIT_MANAGER="none" and INIT_MANAGER="sysvinit"?
To: michael.opdenacker@bootlin.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 17:39:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3731

On Thu, Feb 23, 2023 at 9:09 AM Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
>
> Greetings
>
> I'm trying to document the possible values of INIT_MANAGER.
>
> I'm using the master branch of Poky, and whether I'm using
> INIT_MANAGER="none" or INIT_MANAGER="sysvinit" in conf/local.conf, I'm
> getting the exact same "core-image-minimal" image (it's not even rebuilt).
>
> Anyway, ./meta/conf/distro/include/init-manager-sysvinit.inc and
> ./meta/conf/distro/include/init-manager-none.inc look very similar and
> even seem to be equivalent as I'm getting the same image anyway.
>
> So, what's the use of INIT_MANAGER = "none"?
>

It basically sets a nodistro default which is sysvinit like atm.

> Thanks in advance
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177616): https://lists.openembedded.org/g/openembedded-core/message/177616
> Mute This Topic: https://lists.openembedded.org/mt/97187470/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

