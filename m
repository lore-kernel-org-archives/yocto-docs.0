Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7823C87FDA
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 02:48:13 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.3308.1754707687528914228
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 19:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jw+P4yvM;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e902e1a2996so2281195276.3
        for <docs@lists.yoctoproject.org>; Fri, 08 Aug 2025 19:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754707687; x=1755312487; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+NyyEZSkw1dSK7ZuGFMam3R4reJX5czx8P+jx9025E=;
        b=Jw+P4yvMa6sNni9mihrNkVdZrm0rl27N0V4QOngNR/IbBP2sGu5kpwoZHk/06ZxrI6
         e6UIVyKzHbUhho0xV1jPaPgLIQMRpQhDPQ2vqWaTN5P/jzDr3rTd9iZpkAWCLeR2tnPc
         leXEeioBGlH7O606/yEkG6+TLBdav2wzJMMCVN8sa2EHK1eTDMue8ayZXzwIjuYD37nn
         lK2Leen10DZJ4YTVJFuKZMaWDqwJ3A5k6Ft1YAjnmONJnTnfbY7z3d3/xNKdREsSDD1A
         Mmsa/olLmNzNFvRua0J82Xns9orJh3QC2JB+mY9LCI/38JXXTOnTX5dW4gHFV8iLXmCI
         8zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754707687; x=1755312487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+NyyEZSkw1dSK7ZuGFMam3R4reJX5czx8P+jx9025E=;
        b=F0OuJhvY/fpPCrRwGkNddMyjFh1TdoMA3PjVnsFHVNxidtdZHXJwEpw/Ij2R4s2AnL
         R6VEP9m2BkHDy9y2Ex5dKSFQ/CYbiAwyRRy9sdOJfwjPoZrevWWE/9tY7RQLruHYJNdi
         JNB7wlvlLTF9D4oPUXemPaDBH5kCH6KNMpErhap7JNc1Rc5gIwaDZXIokdTrg6BDqBBx
         iVv+5dKV1Q0OIFL58KXd6J8+UP2qMWEZN7LTQQEzy2sLwjtxcgQBbIIbFjYhHOqwSoC/
         9cbL86GsEfP3BeASD8QQBX4bFGHloXZ7K/aEdPyzBv+wAg8LYgAoeXVcBkTjiNcQPm2R
         65JQ==
X-Gm-Message-State: AOJu0Yzt/V6SadztItyJQ847jNlCn5TgplOGa9vIAnfaHbe8F2CY80KZ
	EgtiXpNDjg3NnCK/22Sf+hcP19iXcIMV7B2PHOdKIraXdvcX83DZbjrZf9Xaup6NGyOCVi32BcI
	xXY6EFbrwMtdSre1cagRADMMTEZR/IGw=
X-Gm-Gg: ASbGnctrJbBswDto51isjfIS/b+qyJAtQS7fvXmuy+nXxJKTe81i9zAn8vaiiBZCTwk
	LUlBO09rrsNUHao+gv6LmEz8EJpElMj4wzjmo8HGRLfrIkbl+CSTeS+TyicWBf0tYd3FQy8s+4p
	C94YCI77po+ui43BIKozqZKThfQ+kpEXwuFRHFzPqfnMeoa3WGphBi0AqoF1tU5a55J6BrvQUsx
	EDTLg==
X-Google-Smtp-Source: AGHT+IFJcjT6pqsChX2+co2qC4iNDh8u9gX/w5ODCtsdBGx0tTvLO6w7O7FZtWwamqjKT7zL+8UwcndAVHecSXD6AfU=
X-Received: by 2002:a05:690c:7446:b0:718:38be:b3e0 with SMTP id
 00721157ae682-71bf0ec7eb5mr66293677b3.40.1754707686494; Fri, 08 Aug 2025
 19:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250808174828.236218-1-jan.vermaete@gmail.com>
In-Reply-To: <20250808174828.236218-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Aug 2025 19:47:40 -0700
X-Gm-Features: Ac12FXyWI90KX6pjrgNxSHQPQRFTJXmlc4Vvkso3PWQ7VIkaMwhcE6fJGk5kKQc
Message-ID: <CAMKF1srX4oUqvD3+X4-nf3r4ANuZ0XyyJ3UM0ea2+5fCU=Fwqw@mail.gmail.com>
Subject: Re: [docs] [PATCH] sdk: The main in the C example should return an int
To: jan.vermaete@gmail.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 09 Aug 2025 02:48:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7447

On Fri, Aug 8, 2025 at 10:48=E2=80=AFAM Jan Vermaete via
lists.yoctoproject.org <jan.vermaete=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> see C17 (ISO/IEC 9899:2018)
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  documentation/sdk-manual/working-projects.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/sdk-manual/working-projects.rst b/documentatio=
n/sdk-manual/working-projects.rst
> index 4236bcec2..7df73b1b1 100644
> --- a/documentation/sdk-manual/working-projects.rst
> +++ b/documentation/sdk-manual/working-projects.rst
> @@ -56,9 +56,10 @@ project:
>
>           #include <stdio.h>
>
> -         main()
> +         int main()
>               {
>                   printf("Hello World!\n");
> +                 return 0;
>               }
>


I will go a step further

#include <stdio.h>

int main(void) {
    printf("Hello World!\n");
    return 0;
}

int main(void) explicitly states the function takes no parameters

>     -  ``configure.ac``::
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7446): https://lists.yoctoproject.org/g/docs/message/=
7446
> Mute This Topic: https://lists.yoctoproject.org/mt/114604610/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

