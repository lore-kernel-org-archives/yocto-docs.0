Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9D6C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 20:54:11 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.5634.1714683248154197816
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 13:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PgBSW/bZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e1d6166521so10241651fa.1
        for <docs@lists.yoctoproject.org>; Thu, 02 May 2024 13:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714683246; x=1715288046; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YlIUHgir7pw827wztQ/SEDpvZbYTClanM3gcUo/IdYc=;
        b=PgBSW/bZMqkZC2Yz2o8jp1t3PgncKIWAxFBhS7nj6/vHRDsRS8JojZaJ/fbXGXZn2x
         Ut+SldGYNW0g/ULLBepfYTqz68K3qtRkD1AZaQq/yIGOVp6MhHcjpy0sA6+0Af/ZIXZK
         sGKNAA8oWpYNTsIe5XE412YDp3+MVYKYD6dxcrOcYXtw799jpliN9HvA+0FRcLOPeQEV
         RxKupcuhCw2rh6Zo2yAx679i4uzYz+ji04kArCNWfRq92TQhD3jXtAX+TaMRQO451Bxo
         iukfxYlQ3w558auZwGcWI8/xIl9DvLQCyjWKC/olrx2sqVPfU9qOYUioEbCqM8+41LFz
         mMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714683246; x=1715288046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlIUHgir7pw827wztQ/SEDpvZbYTClanM3gcUo/IdYc=;
        b=lVQWyuv490V/v050aIItvqiEownEBUMBwQrmat4LWJ41cbqbTkhaK0H5Zpqc4GDJmT
         UHCVPJFalWBwLlHRitDBV5UxwdmMAzEEllPRWQ9Ns5jZG8dNCIj3SmK6r1YtEMG8ax03
         4hzQCy998+zM67NSszvNyH3zxryQQ+mOaVCy9cdYEF84ayVwRR+EYmmPBUjbhMjfPAMy
         P+LkGI/ZIsDAG4TX+yknIJ1T/EqnJEFi4Eqxu4RthBVpwWhzZ1GbxxETU97GQ+ttBpqm
         0CoSo+Q3TSSlWOhpLETlQjILmlwMdZg5o4zGFiRwn6pwKgpDxq/Qsfqic1BYLhLtwIVD
         n/0w==
X-Forwarded-Encrypted: i=1; AJvYcCU/scp0JUh+/5XZNzbpfv4OE8TvcqQmhaMfyEOYfnLvgAhgb9172o9wAe0w9A3Zx6J3wEpNh8zJlZfJ1rxQFpyze+P6LJegQw7B4xg=
X-Gm-Message-State: AOJu0YzYblzRJ4YyDYl3mjnde9TqeuG3uPWr+6XfBmhNT2cEk4GdBe3M
	/LZEDNaRhdVDL5zLPrEJwlB8dQ+vCmKSXNUy/018ZoJjfkBJiLIoPbMePsnyc/pF5SMxWktFqyw
	2/9HuP18/xy6eruQIRrVUHukSb6Y=
X-Google-Smtp-Source: AGHT+IGd6Kdb5jLiaZDRJKfxZZCLlhyc7cx7EP0m30ugZ3OSJHrtup2Sc+rx6fpBK7aAMAVFrIp5iB4cR6f7FCqC52A=
X-Received: by 2002:a2e:8482:0:b0:2e2:1b1c:7465 with SMTP id
 b2-20020a2e8482000000b002e21b1c7465mr228120ljh.10.1714683245900; Thu, 02 May
 2024 13:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240502152701.1798568-2-tim.orling@konsulko.com>
 <20240502191839a351b43b@mail.local> <CAJdd5GbY+WkMHOsMnv0U+WOLfOk=FM0OFH=yxqRNMGwxV5cDDg@mail.gmail.com>
 <202405021945001e34cffa@mail.local> <CANNYZj9GuMZFpbCdYd0kQSJ9fK2isT9rDQzpP3P2YzPpD9s8vA@mail.gmail.com>
 <CAOyo-84Y6B9kzzwq6MV9zUs55POsmXzt4uwNOk+YQ14+p1rxCg@mail.gmail.com>
In-Reply-To: <CAOyo-84Y6B9kzzwq6MV9zUs55POsmXzt4uwNOk+YQ14+p1rxCg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 May 2024 22:53:54 +0200
Message-ID: <CANNYZj8e5GUq+BuOjKcdontqx4+_sHZbhtz8AubwoNsHOgkB6g@mail.gmail.com>
Subject: Re: [docs] [PATCH] contributor-guide: recommend format.forceInBodyFrom
To: Tim Orling <tim.orling@konsulko.com>
Cc: alexandre.belloni@bootlin.com, Joshua Watt <jpewhacker@gmail.com>, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 20:54:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5210

On Thu, 2 May 2024 at 22:23, Tim Orling <tim.orling@konsulko.com> wrote:
> The reason for this thread was a comment from RP during the YP Bug Triage meeting that things were different recently, so we are trying to make sure we get this correct.
> Either something changed in groups.io or somewhere else, because my setup only added either of these settings today.
> I have just sent three emails with the same exact patch but different settings to test-list
> (1) both sendemail.from and format.forceInBodyFrom
> (2) only sendemail.from
> (3) neither sendemail.from nor format.forceInBodyFrom
>
> #3 is also the same conditions I used to send the original patch to the oe-core list.
>
> I would have expected to have heard from Alexandre Belloni previously that there was an issue with my setup in #3.

Right so my observations are:

- groups.io sometimes mangles From (with this 'via list' stuff) and
sometimes it doesn't. I can't see a pattern other than it used to
happen less, and lately it seems to happen for everyone including RP
:-/

- git will insert From: into the body when the patch author and
sendemail.from are not the same (as I set up for myself). It will not
do this if they are the same, even when --force-in-body-from is added
or set in a global config. I'm not sure what am I doing wrong, but it
just doesn't work for me :-/ git is at 2.39.2, so maybe this is fixed
in later versions?

Alex

