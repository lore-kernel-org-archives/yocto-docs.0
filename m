Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89264C3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 10:34:03 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.32963.1672655638340499052
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jan 2023 02:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qrvzbCA2;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id q2so28716285ljp.6
        for <docs@lists.yoctoproject.org>; Mon, 02 Jan 2023 02:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yQvEnXcIkYMHS1hWPx202+VRZA6p3xT0AYF5FZTtVeE=;
        b=qrvzbCA2eqe4Q6X2J70Ym/2vWkVp4z7HSiJ4EnqSJyqQ7/Bb+t7abFs+tZncUKNC6V
         LWQu4y0iyjCraGGxo6FK1BdBvwrwi89SWjHFS0qn/nXtHEWzUYd617cPVoYJD3u9ubwW
         mO3OwcEuqPG8dyfqWlE0ZMtYMH4RhAPsqU5+Uu+S/jC7PheCZiiRffluIJWoFNLNlLwp
         thSxqcr+PSsoXX3CN4mmfcZ0lQAZovzWjhWqBt0iqiU2Uos8dvgKImRVqlYogu3od378
         mQjQ+fCcOutiJm843uS7V2U5s8dHufakzbcF3ruaRqZ74hTRC5RrtxakBbYw9mm9se2F
         EuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQvEnXcIkYMHS1hWPx202+VRZA6p3xT0AYF5FZTtVeE=;
        b=fE7i343HQz6Ty6BGpxcPbNCcZbs3ZySuJWs1bENoUXCVx0zTJ4uwGgAWilm5kRe7Bh
         Z2aEOsPiU1zZiqCA/ND7zh2q3SPbc3cSaCEWHKt2oZP8jpKi9LBeE9dG+I/QkNO7J34B
         ltR04O43oljauDBtknUNLXm7OQHlOjONOsvS28QRvJ2luJWyKYECVvhkehcxPm+6cZJv
         sL1sYXdyc6DoAIymSV6G3l7RPZS8XqmiQsB40CJf326JAphS5kQe3sHdyU8VnH53bYBL
         FCYiz5wlxOo8Y58NQg+k3lizmqLvLLe7Z34WXdxlfAaMWEAGEkVu0t6GpzpdHAfoet50
         Wbvg==
X-Gm-Message-State: AFqh2kqjlE0mR07xyYFix6D+CkOhYc3Z+Opns3EKAvd4HLY//N+/qENa
	VTOPKhQyMaYWPsgTXjprKWL0KFW8UNX3rU4QY0M=
X-Google-Smtp-Source: AMrXdXv8APQ2x8ySHTiQIRfBx5pYWmlMklXop3fniym5wzxwnUel3elXWj763bXYuXxOwJfCkuViHA38fdNllLX2v18=
X-Received: by 2002:a05:651c:168a:b0:27a:2285:411b with SMTP id
 bd10-20020a05651c168a00b0027a2285411bmr3190581ljb.33.1672655636387; Mon, 02
 Jan 2023 02:33:56 -0800 (PST)
MIME-Version: 1.0
References: <20221227194932.3783-1-vince@underview.tech> <456184cf-b08c-9eeb-c261-840552bcb5dc@theobroma-systems.com>
 <d3110d81-b0fa-de4a-965a-0c775485e7dd@bootlin.com>
In-Reply-To: <d3110d81-b0fa-de4a-965a-0c775485e7dd@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Jan 2023 11:33:44 +0100
Message-ID: <CANNYZj_hQatNRSiOkxoj0p5HYYeeZHVzq7otc2R7xC7pOOpCTQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: support Arch Linux
To: michael.opdenacker@bootlin.com
Cc: Vincent Davis Jr <vince@underview.tech>, docs@lists.yoctoproject.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, quentin.schulz@theobroma-systems.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jan 2023 10:34:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3566

On Mon, 2 Jan 2023 at 11:30, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> Another idea would be to create a page on our wiki
> (https://wiki.yoctoproject.org/), for people trying to use Yocto on
> distributions which are currently not supported. We could then refer to
> such a page from the documentation, reminding people that there is no
> support commitment. Or something specific to Arch would be to update
> https://wiki.archlinux.org/title/Yocto

Please no. Wikis are a dumpster of outdated information, and this in
particular will quickly become a source of confusion, which is worse
than simply trying to build and dealing with issues as they happen.

Alex

