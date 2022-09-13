Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA7DC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 18:27:36 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web08.1150.1663093651874782350
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 11:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O7dZ97vc;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id p5so15415432ljc.13
        for <docs@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Qc4dzRUhjxiHxX+FePu3HhZjaHXVYu+Bv0mG8UHLZwI=;
        b=O7dZ97vcLzpd5fMLih0jlb8pRyIfWDaj+0JrJIXfi3JfT7Df6mFTxgCqfd+HHzjfHi
         KN24l/A6i8y0kuws1YcX2Taen+MZGItWLqODNyABYXdkqU8ZY7l9TOU0kiEeiHiW0HUe
         uCcmkzTSUmFe+vz01oMfe0KvpFKhXtCcyxjHcbt6YWhq2oA5dUoV4rnHRJftZCpnE3ZO
         CvKndZX+abqA2RAe0eMMwjHGqedtbLJ1nHQA28SJdQBAeQi3uWAULDhLtAy/dKK5pBPh
         /9KdpWw3vFDg3fPZsMLbN0Gg+//N7cS+SkrScNs2Q51sWUuC1yjGtXI3WN5KLk3e1skD
         6hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Qc4dzRUhjxiHxX+FePu3HhZjaHXVYu+Bv0mG8UHLZwI=;
        b=BaAv5JUm1DL84FSkxWH3ir9s5WgM3Ps4CpCmRLrzij8QXNovaHpFR/KRXkwiacoZD/
         aNPl+pa/iiIQsZQiyFv6ndHCIgk6FLlR0JH9TrFIuZeelxEgpx4ddb2urxIZ7zLc5mYq
         uRHvDMgbHjuEA85521Ul3GAzYfZtc//echZXXuxB9yWYzvmNvySOWHxEcf69BhUbTaDB
         EpyWvikeZYSwy3/V3DdqZTkJhtJKMGgcFa1g9HIMYxsU8NWIkwMKXYX1Xe2mF0sfj5eX
         Gf1EPJd7xV/rq/tvGTS/mWqmDlDkDP4nWSY60oMg87OY6XqeyAsx1cNQBXIS9FyXH/lD
         IuIQ==
X-Gm-Message-State: ACgBeo2cgWMIYoQILYm/fMS3uVDULDFCWvxzjLz4tAamkaYG41B4IFFS
	xcq8Aw2cABgJGbJyqaZtvvndx3CBkoBO5ebZSg4=
X-Google-Smtp-Source: 
 AA6agR4nIKxUYDs886B9eW0gNsamsE0/dwik85osJrAgUC2tbhORTtFMi3BN0npa0sECn9Tfft/0e+7akvpRz2LdmXk=
X-Received: by 2002:a05:651c:104e:b0:26b:fceb:a526 with SMTP id
 x14-20020a05651c104e00b0026bfceba526mr4010628ljm.109.1663093649568; Tue, 13
 Sep 2022 11:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-5-alex@linutronix.de>
 <f20e7ca0158e49329b2ed2d7685ef945@axis.com>
In-Reply-To: <f20e7ca0158e49329b2ed2d7685ef945@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Sep 2022 20:27:18 +0200
Message-ID: 
 <CANNYZj_mTijA18UCxpTVa9V0k7pPakqvAGBLWBS39UDBCHS8RA@mail.gmail.com>
Subject: Re: [docs] [PATCH 5/5] common-tasks.rst: rewrite the section about
 configuration templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>,
 Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Sep 2022 18:27:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3161

On Tue, 13 Sept 2022 at 19:38, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> I do not agree with this sentiment. If you create and distribute a setup
> similar to Poky (which we do), why would we not change .templateconf to
> point at our templates? This has been the documented method and the one
> at least we use for our distribution. Where have you gotten the notion
> that this is only to be used by OE-Core & Poky? It does not make sense.

First we need to find out, where the documentation section that sets
the idea is coming from. It was written by Scott R. in 2014:
https://git.yoctoproject.org/yocto-docs/commit/?id=c07fb7082fe08387bbc546b2a23620dedc7127b8
from
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5895

I believe Scott misunderstood how the whole thing is supposed to work,
and never road tested what he had written. You are free to continue to
do the .templateconf rewrite, but I do not want to keep it in the
docs. It just isn't actually supported, unless you *also* provide a
description and tools for 'creating a distribution setup similar to
poky' and for doing the actual rewrite, and find someone else except
you who's using it (I believe you do this with custom unpublished
scripts?). Besides, the only feature it gets you is not having to
specify TEMPLATECONF when you have a default choice for it, which is
useful, but should be made possible with the setup everyone *actually*
uses, which is cloning poky, then adding layers next to it.

Alex

