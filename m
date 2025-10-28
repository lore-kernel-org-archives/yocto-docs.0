Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B687CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 16:16:30 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.16269.1761668187379179150
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 09:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YwgvCIWP;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7847ee5f59dso86258107b3.2
        for <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761668186; x=1762272986; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRUyCyqgQT7+bB+afomgb6g6/OGySYROEle59QRugRI=;
        b=YwgvCIWPLRLRQbBCuW5tx72Y2nB8h3YY+T4YddoHhx78lqcA6OnRhDygB3S62Dt3NS
         bV9zIqVwQ5Yniggz5MFJX61q6oT0QLTt5olgSf5t1KzKYQUKDrWDf1ojeWdpXQyiTfwp
         FLlet+dtVD1Jw3cyOh2RMTgyJYKGokDr6YMLcoGOnTEA3hK+RuXzxk0duW22KiREG+V5
         pYUDrdq0b7DV8x1Q6ucXSeNivjwU9oW+lvAGr4/Bzntqa7kcxvZszejXdY5kmEUurLd2
         26cetw416gDvMWuothmtbBcSZHxxkKwYrlma27hBYe9SX28YXy10YZDq5QQB9PpCAVcI
         ldMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761668186; x=1762272986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRUyCyqgQT7+bB+afomgb6g6/OGySYROEle59QRugRI=;
        b=FH51e5XVDzRPSlaNC+vdpBLyEqGZ68yD6Qr7o4W4NJE+NLwwOKcjG8yz0/6hlXhaAo
         +GHu0Ar3E8TjJxzQ7UeV2fO9Ibb+Eb5UuhBhojEo+ZwcwgraNZZLYYnI2K5q0ZehQC6K
         wz90zEhUB2uTPpzA9FWlhui3S/WGaKbv3QSzbeZIjkQeZN4yz9clj1rQEYMxv5Rlp9aA
         ZP4mCGLNqiaEwzyx5Nf5rwQ/EMHkRNa7rWbuhaypkS5HeleK78S03+qcYKRu1MrbqyXL
         j1mEQ2KWPJ3M4fjc/AXt1nG+mYzQ/87Z2jTrcfbxUFFwsGRr6uoMxZwRcRFao7zLbeWA
         jM8w==
X-Gm-Message-State: AOJu0Yy3e3Rr/V80Ljx8eT8ZxKchL911EMrvECcFGTzNoBjuiAwIAaNk
	jqW88H81MifZp4r/aBRwUU9OMsSPXhd39BVAI9F86gVz1pmNTZ+ajfp8GJVjpZJjphSI588q5ZV
	OK8hWa4OxuE0XDlrr9F9HCDf2x3lWnT7V3jqH0EA=
X-Gm-Gg: ASbGncvSpfdy7/BknHDLR8Mjr/AQeOVBr9vpBD8IOAgrxKIMqo6tyd1f1d6ZBzFBcFq
	RKuxout+Xdn2BQw66+nd4YabzIzPdf7hBTGbviG4RUKM7Ms8Dl626bhe/pdjRZC8Dh3+Aymo03b
	I6Kf//PiedKLOqOGn6yCmgmeafTBSlV+szVS/V6UEfF9p6WMU7vO3CExYUrQJdiGcnqPiTB/k3N
	jZ1JnweCCHXVNlcj9OXgzxXo2cM92Yhvp6jy0nI3v/TGUvvzzBiCrWy95QeaX6LlvV5RUTPl3e4
	K/OFRTF37jCmyEwWo7nzbKp0Myh6ZQweVX0fbSNyM2qiA3+i/mT1FUvhvjfp3OHR9LizqNesk3t
	7rA3QNnH8s5ry
X-Google-Smtp-Source: AGHT+IHZPdmq1N0o72uIbI6qZAmhXmVVLwzzYhDJ+0MKpPJPjZM6JBxoE+vaz036+590QtmZPg/+0Ip2em4wqJPXfWY=
X-Received: by 2002:a05:690c:338e:b0:785:d173:7d0f with SMTP id
 00721157ae682-78618120dc3mr38801117b3.52.1761668186390; Tue, 28 Oct 2025
 09:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <a49eeec2-9048-1b31-a317-de344e7c0bd1@crashcourse.ca>
In-Reply-To: <a49eeec2-9048-1b31-a317-de344e7c0bd1@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Oct 2025 09:16:00 -0700
X-Gm-Features: AWmQ_bntICjdYZQe0WryW05n6NpBLqMwKowx4pVhQsYiyxshxIYO247g_RmW5JI
Message-ID: <CAMKF1srkRqQPwQht0X452xPbL-J_Vz_kbuir=ua7ApDfSrMc5A@mail.gmail.com>
Subject: Re: [docs] should meta-xfce layer use dynamic-layers feature?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 16:16:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7885

On Tue, Oct 28, 2025 at 3:54=E2=80=AFAM Robert P. J. Day via
lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
wrote:
>
>
>   not afraid to embarrass myself but as i was perusing dynamic layers,
> i ran across this in the meta-openembedded/meta-xfce layer:
>
> https://git.openembedded.org/meta-openembedded/tree/meta-xfce/README.md
>
> which reads, in part:
>
>   meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this
>   repository.
>
>   To avoid dependencies on meta-multimedia you need to mask recipes by
>   adding this to local.conf:
>
>   BBMASK =3D "meta-xfce/recipes-multimedia"
>
> isn't that exactly what dynamic layers are supposed to address? the
> conditional inclusion of recipes based on which layers you include? or
> is the above doing something different?

The above describes the way to mask the recipes from a layer en-masse
dynamic-layers provide a mechanism in a layer to add tweaks that are only
effective when concerned layer, to which they make changes, is enabled
in a project via BBLAYERS

>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7879): https://lists.yoctoproject.org/g/docs/message/=
7879
> Mute This Topic: https://lists.yoctoproject.org/mt/115991189/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

