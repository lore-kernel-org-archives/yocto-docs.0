Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8193C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:44:27 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.10768.1708695859177398437
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 05:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UHWItzZo;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29a7951c6faso387639a91.1
        for <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 05:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708695858; x=1709300658; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GGxn5CoJpwBFSM6uPe2aC+nFoxNddvyC56MhaaY0OE=;
        b=UHWItzZo88emOkWfcJoOYCPp3w6abNw6nAgyQkNYfOUrQHMTNF66AN+X4MInHDQOyE
         7xKbEQP8tkOxw1p1qMvlODW09WhF4KccDjH750W3iP9/Bqk4TH8a06wmoawdpDO0jOFN
         U6WYjPONQOjL2Vzh2MvGqqlaFst9VpqwoDDfdZ6O8+cFlEalp02+a9kUnMtcX05A3pVv
         VkyaRFXAFv8DzFB3UbM2xsPMz/HzYITcyDfFSxD+No5DX6E1qKPUz7wBv+47Zk6vvxpR
         AFOXYbG8roeS64PIhxRxSsjaEJ4v91EEK6GtMLBCgVls7y6ZjAYuFrneXrT3O4nwlAGv
         BYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708695858; x=1709300658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GGxn5CoJpwBFSM6uPe2aC+nFoxNddvyC56MhaaY0OE=;
        b=D/4L11FezqkQqlxKW4buVVlZ867wmTTnS3cB2TJtxJogtX5LR3jtLmTLBAyF25gWx1
         YkyW0RHxe4SXbZoU/9lyBo0yobw2l/m+yl2Mysw7WxOcGtx6KfUQEW7BQf5jnrWaOKXz
         xfYZrO6oNdWCxRo4pCFQYufcbVtHg5FuT8TxyF0Bxn4d5BCYE4CD0sTpzs9c6+TJgyHK
         sBU7ReujMJDJECaxOpxX+kebIh0/4PHjTaaXLDcr1nZInRa42rht7bBSJ/EsllSJwVFk
         hzc0LN631DOBNEuJZpDgH908qcfR4/5A0QcIMUIdnKf+eDtym8PYPZDadK+XavpSVMJM
         2Eow==
X-Gm-Message-State: AOJu0YwzQHUCVsqfwQ/TCH3EtdLelquYTTijA5Se9kQ5AP7r1B+FPG0n
	oU0Yq0kKrNI77lVMdqLo3wM+O20cROfL182myhl+ZpAo9/5QPZHrrVspwOB8bEuvqJp9ZR75A0z
	hU5LzBp0tmX0UX2FUEf9SOek+uR8=
X-Google-Smtp-Source: AGHT+IEdINKvT6xAZ4w0K9I+15+AohfqB6QzkyLwaZ+JZ+B6LLlgaX07JWQFPlHKoUfPkuoIHAJOjf4Zx5QqF7O5uJ0=
X-Received: by 2002:a17:90a:5502:b0:299:4269:b8c9 with SMTP id
 b2-20020a17090a550200b002994269b8c9mr1679053pji.26.1708695858484; Fri, 23 Feb
 2024 05:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20240221072612.79402-1-uvv.mail@gmail.com>
In-Reply-To: <20240221072612.79402-1-uvv.mail@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 23 Feb 2024 08:44:06 -0500
Message-ID: <CADkTA4NVhyHwRkjoodbxb6gvJM3y5UiW5WkyHha-dTuH2xs=wg@mail.gmail.com>
Subject: Re: [docs] [PATCH] manuals: kernel-dev: Fix BSP in recipe space
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 13:44:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4865

On Wed, Feb 21, 2024 at 2:26=E2=80=AFAM Vyacheslav Yurkov <uvv.mail@gmail.c=
om> wrote:
>
> File fetcher doesn't have destsuffix parameter.
>

While the file fetcher doesn't have that option, it was the fact that
it didn't have it that kept things working.

If you use subdir, then in fact, a recipe space BSP doesn't work at
all as the tools can't find the BSP definition.

The kernel-yocto bbclass is what is using this to set up search paths
for kernel features when it sees the type=3Dkmeta.

The option could have had a less confusing name (since it is
effectively passthrough like "type=3Dkmeta", but that's not something
that I'm willing to change right now (I'll do it post release)

But the documents are correct, you do need destsuffix or the
recipe-space BSP will  not work.

Bruce




> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  documentation/kernel-dev/advanced.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel=
-dev/advanced.rst
> index bcaaaeed1..bddff1158 100644
> --- a/documentation/kernel-dev/advanced.rst
> +++ b/documentation/kernel-dev/advanced.rst
> @@ -718,7 +718,7 @@ If the BSP description is in recipe space, you cannot=
 simply list the
>  form from your kernel append file::
>
>     SRC_URI:append:myplatform =3D " \
> -       file://myplatform;type=3Dkmeta;destsuffix=3Dmyplatform \
> +       file://myplatform;type=3Dkmeta;subdir=3Dmyplatfrom \
>         "
>
>  Metadata Outside the Recipe-Space
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4852): https://lists.yoctoproject.org/g/docs/message/=
4852
> Mute This Topic: https://lists.yoctoproject.org/mt/104484337/1050810
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [bruce.ashfield@=
gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

