Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6077DCDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:51:39 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.23623.1697709095248621284
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 02:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iDwy0u8H;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso97524931fa.1
        for <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697709093; x=1698313893; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z91YNDBciws7nW21q5/F45F6IcYeLwJsawPjOrPx4do=;
        b=iDwy0u8HI7NghtTE1vw6SwVzaKHzJlQPpZ4IEjO3yhApwZQw0/GAaNEzZzYROixTlw
         EOmMrz9jnpyWgDqHuUGXQN7nbpdQQ2boX4BiKSxPyP0PHp54fdKDD2h+Oyy07lR7+jKK
         On+lRujYri13N9b17t0DmUopkexdjZUIrpdPi2GADwjnHeOV96blJFn6kmMVHWSiJjmy
         zkFxVBscu7zk2kah+9jqyH+CHr0GIcG/sUI+RYO1jL3YJ4+4V3DM3Gy38mcrIPvwFiWN
         ZT7/czhdj540o/BwUEy6exVASs+thqNnOKtM1A3+4urRbIDd+7lCwqlZKZYnmFob38sV
         t0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709093; x=1698313893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z91YNDBciws7nW21q5/F45F6IcYeLwJsawPjOrPx4do=;
        b=kVwBL7v5p4+/QIOmPJx65VnOsiYEuTHMvKeIBhLHYhMXxD0T3/8uN1DAK7s/rO4X97
         CNGQBSU9fskdKPtotv0U49wo3mrDnTiqK/alnbQKKOXC2wz3WZyl/ssmoXWDkjljqlM2
         6+9iURHvZErXoUNMuIH5nBKS81VFrb3NPW8npYXrECMqqM7IzA1UoNl+zBB/SLVvyTf1
         zH+bjhpuowxrqaFDS3OoPVUYFUh3sVLh8Bv3zpq7A53B9q0bBX7n7GtdEX4ndHZHh3eE
         brV8Z4p/Zqa7h5mppWl1mzRZwzyx+YRvITwmLlw0QDKBTuuBaaM+Lz/XWMwSSfULR+tf
         orUg==
X-Gm-Message-State: AOJu0Yw3IL1C/A6gPrVWgy9/Q2Ob413vCtONvAnfztkrT+nsJZOhE4rR
	xAedjcX1HxBsQcerW3cd6+Te26nF1QLmL8Q+HCD+vXLV
X-Google-Smtp-Source: AGHT+IHZxfSAjfiY7Jlfdam29Gmy0Rh3qWmmVMWnTIb9nQn4C5y5ajMkjLfLFOt+mK5gpHOq02rsM/7kuiRwBZaIfKI=
X-Received: by 2002:a2e:985a:0:b0:2c5:15a5:826a with SMTP id
 e26-20020a2e985a000000b002c515a5826amr1109410ljj.19.1697709092314; Thu, 19
 Oct 2023 02:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231019094826.9503-1-rybczynska@gmail.com>
In-Reply-To: <20231019094826.9503-1-rybczynska@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 19 Oct 2023 11:51:19 +0200
Message-ID: <CAApg2=S9ConmZUMi9hTYJM1ZBCwQrehky+3NKKqva8fc_n=Qkw@mail.gmail.com>
Subject: Re: [RFC][PATCH] security-manual: initial version
To: docs@lists.yoctoproject.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 09:51:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4419

On Thu, Oct 19, 2023 at 11:48=E2=80=AFAM Marta Rybczynska <rybczynska@gmail=
.com> wrote:
>
> Add the initial version of the Security Manual with a
> transcription of https://wiki.yoctoproject.org/wiki/Security_private_repo=
rting
>

Here is the first version. As a separate manual, so that you can make your =
mind
about the best way to follow. This is bringing only the main page we discus=
sed,
I'm going for more content.

Cheers,
Marta

