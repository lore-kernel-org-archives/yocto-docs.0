Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC615CCFA02
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 19:43:20 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.web10.4226.1761939796903422746
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 12:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EzyZiiI6;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63f95dc176fso985107d50.1
        for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761939796; x=1762544596; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72FcZ20417qxTRTvfProD6+3jMkKsFGlXkhvN7JJOz8=;
        b=EzyZiiI6wQF1+v0VozQuxkZ8Bc5cvLMSWBoYyKWhd55wD1aH3bqZ2akVa3x3F8haU2
         yTgaBQyNXp0l3AWVC9NM1OQ0AIzZOS+mo+rdqo66zvnbZ9Bw2eGHZmjGk2sdCstC12Q2
         MmYCcPQdzgxWI0wMo+AS9Ef94UZXohCfFXqKO/KDVvIMze0F0acGQOqEnQpYLV0kq+rv
         tCw/c0kkztRdQXc+GDBu2dJt96G5igvUS3wOsroUVk43GWvF9rEf20DjSEJENamXXQKx
         B5vkTI/nb7fbKYbpbpBDSmg7r9CZFOh1do+Cl/BX6+2yl8nRNvwC6phr/GN95FBuX209
         m4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761939796; x=1762544596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72FcZ20417qxTRTvfProD6+3jMkKsFGlXkhvN7JJOz8=;
        b=OZQujwzgMk3oCSkkWmWKAmC6fCtwjPzrulH8d3N2FKMNkIvmqHPKnhAJUOprtWwc38
         2lptHzGQNRtQ6trUkasrX11RvtULy1Euljx23Vegh/Ks/Qv2+WvBlFpyvbR7GfkMM8ul
         1aeFiUSnVtQZMijPuab11AH7EtlQ5bVjihxF3VsbFi7GtWLGyMikiPsqOUkQyIvk/cau
         2LHS3wmRLaX3H8QGt25sSsdnYlMBpKqNe4dttfUZHS+Tm8eaF8XE1HsIWxE+adW/+3l0
         PTo6yqClbdVmorJh+OpXLfrhDlqEbkVKbtiK/Xy7fNR0akmO+uqD/lRZRUCM8Ei5riM1
         1oPA==
X-Gm-Message-State: AOJu0Yz/q4dSQ+dqSSdYvZhW99eNc7fBQ7lt2h4jGLZZZknC4KzMLuK2
	l5z8mTsaJ7eXuYKGFD4/tOijvqFktxpWJCWk1tN3GI49hLvmJ5/di5WDQPrBnkDrchlujMaUExA
	1aDNW3wX3f6gE0cIDxf2rPpoWL53Eyyc=
X-Gm-Gg: ASbGncuoofwHxuqtVN+3PnaategWYMqVqLDSK2T3tUF5Z2VSUUVllih+PRLjgK+yyd7
	nBsv05EIReUm0gc9HtuGdjDEjsNVyh5klhCNIUpPyXSHAnm0v91oVCAIHQMUqMh0FPh+tG1x2tf
	/PcFE8RRtr4wCx9mlAlmzCKqTdQkmyvyqSt77+9OlXBFszJMLCzIba4SF9WgtoZJwguzlkRLgGW
	eR+xACaYKwWFubeIQDURpvEoQUgXwqbrQaSwk9Aw+o8VRicjx0R+BaMI/AX031FcXXvCGIubxo=
X-Google-Smtp-Source: AGHT+IEY1GIDyr+II4Kl5W/rbJbpiKFd0mQkp/bPQ8p7t+KwkLOJhG+Ij6WONUStxL/o+VrZI2Dnvemx05wHGp3TbO8=
X-Received: by 2002:a53:b4cf:0:b0:63e:33a7:cdd7 with SMTP id
 956f58d0204a3-63f92243e4bmr2548080d50.20.1761939795129; Fri, 31 Oct 2025
 12:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <f9c5f224-1015-bb70-f28b-0eccf4c29486@crashcourse.ca>
In-Reply-To: <f9c5f224-1015-bb70-f28b-0eccf4c29486@crashcourse.ca>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 31 Oct 2025 13:43:04 -0600
X-Gm-Features: AWmQ_bktkJZnC95iU0k2mTJfY6DLWi_y1g7Jc_MCvf1gwatAKr8kAjmstVvIHR0
Message-ID: <CAJdd5GaLzu0OkmL8HPHn03P0n0rwVRydt6zvv0a8_k5nAwoBLA@mail.gmail.com>
Subject: Re: [docs] dev manual, "5.23 Recipe SYntax" ... talking about
 functions or tasks?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 19:43:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7959

On Fri, Oct 31, 2025 at 8:02=E2=80=AFAM Robert P. J. Day via
lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
wrote:
>
>
>   i find this section confusing and possibly incomplete:
>
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#recipe-syntax
>
>   The bullet point is labelled "Functions", but almost immediately
> switches into referring to a "task function". so is it a function or a
> task? what is this meant to refer to? it gets more confusing by
> referring to the "function" from sed which is actually the task
> do_install(), then goes on to talk about adding new functions between
> tasks.

I think it's correct as is. It is describing the bitbake syntax
construct of a "function"; tasks are implemented using functions, but
not all functions are tasks, and I don't think the documentation is
contradicting that statement; it's just saying that the most common
place you'll see functions is as the implementation of tasks (which is
true).

It could possibly also clarify that functions can be written in
python, but that is covered elsewhere, so I don't think it's a problem
in the high level description here.

>
>   if this section is meant to explain tasks and not just functions, it
> should also mention "addtask". but i'm not sure what point is trying
> to be made here.

I think it's just trying to state that "functions" are a thing in
recipes (as distinct from variables, etc). The details of task
functions, python functions, python tasks, etc. are all covered
elsewhere, so I don't think it needs to be mentioned here. If
anything, it could maybe link to the section on tasks, but I wouldn't
say more about tasks specifically.

>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7951): https://lists.yoctoproject.org/g/docs/message/=
7951
> Mute This Topic: https://lists.yoctoproject.org/mt/116048376/3616693
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmai=
l.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

