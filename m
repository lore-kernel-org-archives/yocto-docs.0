Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B344CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 13:23:00 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.123915.1697462578793401934
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 06:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l8w8/R8A;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c51388ccebso23897481fa.3
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697462577; x=1698067377; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8CbOaATkqs/Q7o5Wc6OkpLrIEcBPbcKP2Vf8imQBQps=;
        b=l8w8/R8A5UGx1YVhky0ce1Pd68k+CzWgpqkDYMjqrK9v8M2wk5LHyeRu5GS7k1c4OK
         oNX4mAwkFc+zW/UhvT080zZc1kUk+qj6m6DCgD5FaMgvyq5D40HSvkQSllFIX5zUigPi
         X6VIG92unZwKE/Bm7H42ozU/+B1xP4O5sR6sk4TK2X6Gkf/Xght0gHYXQWSp0oHrvol3
         z9NRwxBTq+rL/SvY6UmHve2dVoTN193kTnYgHeXxjmEHbXFgHx/wejGQs3W99tFm/ftG
         SnEFNFI4LMMLGvvP1Px0wFqntMr4/kML4WUDbNQ60A1nRlNVCi2bVx63VcOzMSAcqdjU
         jqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697462577; x=1698067377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CbOaATkqs/Q7o5Wc6OkpLrIEcBPbcKP2Vf8imQBQps=;
        b=hnm27cITuwH7dGvP7SX2C56JsSKsOJoYpTEWQXfBS6qekQn/HwZJNGK/AAAGEZsTnN
         WWyv7KIlVgNoew633HqLrbzq7nimPV3XmNcv8pMj1VU/SNWdi+dZLc9kcHUXdVKCnzQP
         VVouPWEeZy4FBGgN9rZ++mKMgbZQ+3MhCnOYq23Hykl/H1yAWzS9ftCKJJIgmS85lrPo
         7j5w+UE8U7JIYNRPno4TafXX9LncO9PObdvazVOUK3j3ff0ZQdzSzVT9ICrG74ONmEmw
         NDiUiuQFtYa5pMWB0UjQZohGv+7yDaVsVRV/OD8Jtnd0LXz00C8DnxLmqSs7MTQR8c1Y
         7GWw==
X-Gm-Message-State: AOJu0YxM9o0irTT+b3KUEDTyBaXtPwzIsBoFOLZjOJleNkkRHRv4bz6x
	K0YJi7IxRVqVUCIjxSFNXFF42wh/Xz/YHcs6w4E=
X-Google-Smtp-Source: AGHT+IGdaT7sAp4dX/94k+uoTCvq/uQefJVlqXt8pMAeIPQgpDOKGqSsyo0oIuQftlKPftAbjtcVPhH2VYF/SaAxqz8=
X-Received: by 2002:a2e:a789:0:b0:2c5:1603:9c48 with SMTP id
 c9-20020a2ea789000000b002c516039c48mr6615997ljf.20.1697462576565; Mon, 16 Oct
 2023 06:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <b04580d85e3578125b326abb70607998@crashcourse.ca>
In-Reply-To: <b04580d85e3578125b326abb70607998@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Oct 2023 15:22:45 +0200
Message-ID: <CANNYZj_=WZj_1MvuOuh4Bz76L_Pc-=4gddE=xOTO1kq+wWFPiA@mail.gmail.com>
Subject: Re: [docs] Dev Manual, "5.16 Sharing Files Between Recipes", does not
 define /sysroot-only
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 13:23:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4377

What I think this means is that placing items into ${D}/sysroot-only/
at do_install() will not package those in do_package() at all, but
will still provide the items in sysroots of dependent recipes.

Alex

On Sun, 15 Oct 2023 at 11:46, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> Here:
>
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#sharing-files-between-recipes
>
> the Note reads:
>
> "The /sysroot-only is to be used by recipes that generate artifacts that
> are not
> included in the target filesystem, allowing them to share these
> artifacts without
> needing to use the DEPLOY_DIR."
>
> Except there does not appear to be any explanation of what
> "/sysroot-only" means
> earlier in that manual.
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4372): https://lists.yoctoproject.org/g/docs/message/4372
> Mute This Topic: https://lists.yoctoproject.org/mt/101974338/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

