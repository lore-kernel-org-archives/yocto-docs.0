Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C91C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 15:38:07 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.8959.1714664281656702506
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 08:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FnMC2X5b;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e060d49f87so16874921fa.0
        for <docs@lists.yoctoproject.org>; Thu, 02 May 2024 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714664280; x=1715269080; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Fa7oibUpa+dQJtTlAAXUvDnH+Q0vejsY48SfXdvchs=;
        b=FnMC2X5bJQ8JVcPiEi3qTl20dHzVc9mIe7hODufM+IrpP+35/YZCMiBfzmKmYcOCSQ
         VK5w4nBjbZKRNqB1z1H7qXeiu5zBAj9ZjLbsGVAELW7ZJi5YblCAoxLIYK9ZnU17w4u/
         k/2z3GxMtMf2gVVQrlDReA0pGCOwOUpmSA/KcF5owdnNQWew9PXYjMi+uA/BcB1KTXLl
         TODZ80NWTRMoCfstnlASxeZyKbONliCocmTMWUIbDW6b59qFU0a3b1PvP0sm2flwifyF
         B3tn1+KBrtafPSv0sYX022vVmsQqFGMpFVlIQwD6yrK3cjrQrhYnDOYsTGnZ1jI8/Ao2
         NeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714664280; x=1715269080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Fa7oibUpa+dQJtTlAAXUvDnH+Q0vejsY48SfXdvchs=;
        b=Q1rJag+JMkfZyuYPaezaByf1aX2O+A32RdS4eJhXow/jdhwE9l04+PTSAHlwK656DP
         3YEcG8fejI95r0RJ9YTJ9d/7LfAJQQGq60+p++QsMSjFAXM1TqbmdC4J60+uhkMDs/ay
         GwCUVKfUMyEDjdsSf/A0CpkMy/1l5kBdUbR2+4A1kxw93Pb3qLtjus4R8wVAr1ycvlHP
         zaqSelcU1got3xvLoBvJv3f4NpFNuwqN0B5Vm1DmNlYFSdOERr56YFxakTw8c/V4FohD
         n4Y8syYEET4VcYRroaHgQ/MyFKAl0mHTFx9KJmmI16pSVwaQ2gY6lT3KrZUyu0qejfTN
         KEOg==
X-Gm-Message-State: AOJu0Ywz1y8urhkPqSpyMTSI7OQzoLSl6l5z3raLTG7D4HfOfR47b0Ja
	vijsFFUTuO7JqHgmP2Dbq5mtywTnuzL94j3YpxqYhlW7ZGDdWaPZ1sbkufB5jC6byJ4/togE1gt
	AVKlC9DXRlNdkrXVYC7lClK4k+/M=
X-Google-Smtp-Source: AGHT+IG4A04DjeVpPpv0zqit/cYkBrUXyTPdsVV98pEWYtzMC/fSLhsIlrPmQAqkJWwzFq4RbMV3vgC+swihTVusPDw=
X-Received: by 2002:a2e:9943:0:b0:2db:fe17:7c86 with SMTP id
 r3-20020a2e9943000000b002dbfe177c86mr826818ljj.17.1714664279489; Thu, 02 May
 2024 08:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240502152701.1798568-2-tim.orling@konsulko.com>
In-Reply-To: <20240502152701.1798568-2-tim.orling@konsulko.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 2 May 2024 09:37:47 -0600
Message-ID: <CAJdd5GYyNK5qq-CKH=WHQRAZLxhJN45Nz8xYtKkO3MpYDXiBhQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] contributor-guide: recommend format.forceInBodyFrom
To: tim.orling@konsulko.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 15:38:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5200

On Thu, May 2, 2024 at 9:27=E2=80=AFAM Tim Orling via lists.yoctoproject.or=
g
<tim.orling=3Dkonsulko.com@lists.yoctoproject.org> wrote:
>
> We are seeing a lot of patches failing when the From:
> line is not contained in the message body. It is probably
> better to just recommend to force the in-body From: to be
> present globally.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  documentation/contributor-guide/submit-changes.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documen=
tation/contributor-guide/submit-changes.rst
> index 47a416b24..c292a143a 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -65,6 +65,11 @@ use to identify your commits::
>     git config --global user.name "Ada Lovelace"
>     git config --global user.email "ada.lovelace@gmail.com"
>
> +To ensure that your patches are formatted properly, it is also
> +recommended to set::
> +
> +   git config --global format.forceInBodyFrom true
> +

This is good, but we will probably need to clarify that there is a git
version dependency here. Git 2.34.1 (at least) doesn't have this
option. I'm not sure when it was added. It appears that 2.34 is the
version that ships with Ubuntu 22.04

>  Clone the Git repository for the component to modify
>  ----------------------------------------------------
>
> --
> 2.43.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5199): https://lists.yoctoproject.org/g/docs/message/=
5199
> Mute This Topic: https://lists.yoctoproject.org/mt/105864996/3616693
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmai=
l.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

