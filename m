Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A8DC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:09:51 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.980.1645110589663199394
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 07:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JdXnjz2O;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id b13so10304769edn.0
        for <docs@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 07:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DCSF2U6sEU0Yg9pFffoq6/z6QaPSHr1zKfw3KfGrrBQ=;
        b=JdXnjz2O24lMWyvBwbB1LLvdqK4mVaom+H+dnZ4bbIlC9tlgDOyd9eqWmr8lwpSz/w
         FElbpuf3zEBuXSVHBN9C9OiQbH9DZQPAP8n1JjJLV34ajzse7MKJSgxCGlhZFcJXv8gD
         OqiJDjU5b34Ro7NozhmUa26FvazMQWvpD2sJTS/xa9hGR8VU03OAtz6ji9rnBh0mhX8E
         s0hNLUJ8jWknN9sLzAPk57LCeXuXck5gcVCcmo9Gq0w4AV4LykXnp1sVQT+1cQdQV+lY
         KbuAuipv/sgA1MQTyOdH1JaD3Ih/QbR09AyOB3sQq5PIRhrLyPP85RNi3vQbmHp+0eov
         0u+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DCSF2U6sEU0Yg9pFffoq6/z6QaPSHr1zKfw3KfGrrBQ=;
        b=nHJXp/zkBQg/w+mx+GYMWwh5M4PEOAmi6mzBCIy2UQ8WPhviTPUkYx5bAPTDZJLf/E
         XPvdUMa/8eyCJdu9lO7qHqP4rQzk2GGqrPGZGTQy4b6/EGJ8dQOgufCIc0/lteli/p9a
         XqMZr1lm/UiOAE6G43VUcXebcPIlXWN9b62tlkTxzr6csNePj0uWU89ODQWqMv6dikwo
         t6O0JcgoxEM6vIlN1FcmDVC0JK5PesHQmFCHDkJGYpw/yuflWCQp4irOoQH1qvjob/v6
         JKxhHGUU11BgwMHB7XFEoiv+o1R0ORIRb4c4EjF9ZgVKmPwY/hVBmZMu8jrOaotX4u6C
         JUUA==
X-Gm-Message-State: AOAM531xGiHHhcyymi8k0CX6rqMrcpp92Yy37zp7KFjnCo/7FZzVnvd9
	P/9utMYgvPGk66F9NNz+dLWDGZKF7tXxVDxOtwLh1g==
X-Google-Smtp-Source: 
 ABdhPJzxUZMFYgcT72FlWd81l6+LxMRDYYvz7VZwRCo6nZq/41I7EqizEva8dtzhazp2AgGBNUr50tO6hsyzVeJZH18=
X-Received: by 2002:aa7:d2c8:0:b0:410:e248:48eb with SMTP id
 k8-20020aa7d2c8000000b00410e24848ebmr3020948edr.325.1645110587796; Thu, 17
 Feb 2022 07:09:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642715781.git.steve@sakoman.com>
 <e94c4c7d7103b8af5a332e53afb1e0c5d848695b.1642715781.git.steve@sakoman.com>
 <940d6bfc-7f86-4bf6-550d-af095673c289@bootlin.com>
In-Reply-To: <940d6bfc-7f86-4bf6-550d-af095673c289@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 17 Feb 2022 05:09:36 -1000
Message-ID: 
 <CAOSpxdaSoceJ1Fr8Yb2rML8wqMqbNJEk-E=cs75nW-sOtqrQMg@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][dunfell 1/1] documentation: update for 3.1.14
 release
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Feb 2022 15:09:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2471

On Fri, Jan 21, 2022 at 12:06 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
>
> On 1/20/22 10:57 PM, Steve Sakoman wrote:
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  documentation/conf.py                    | 2 +-
> >  documentation/poky.yaml                  | 8 ++++----
> >  documentation/releases.rst               | 1 +
> >  documentation/sphinx-static/switchers.js | 2 +-
> >  4 files changed, 7 insertions(+), 6 deletions(-)
>
> Thanks Steve.
> I'll apply the patch when the release is out.

Just a reminder, release is out now!

Steve

