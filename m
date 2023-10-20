Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F889CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:42:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.54537.1697809353909006356
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 06:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VOtG5vwY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso6984415e9.3
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697809352; x=1698414152; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sMbvj14tYbzxBeOZRrqLY1lRNjKecRSiACjYCgyR03M=;
        b=VOtG5vwYQ0YutakEzd3nLyRbJMPAktrLBjrduVhX2wsMRFwXyfHDwKp2/Qgtr44Qd6
         nj/fphLk7Sl11AZD0HIFRA5ddgG18PLF2w+SZ1NppH/KuBkGr7YtEWTWs5l25VYHqWik
         sIf/W4awyH6Kl20V9mGYU7Vfr3iXLX/fkz4iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697809352; x=1698414152;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMbvj14tYbzxBeOZRrqLY1lRNjKecRSiACjYCgyR03M=;
        b=dX0jK+ymc0ovzMcCjFN7VU5of3loYJiD4mH52XnQJxKzQk0n68rAItccypD00GUdRo
         DCGTjWuniWGDYQWxYPtpXzr78ewUDT51M1mz6SVKIHjB6xCGOHGOupBXyPvB3AEgJHlf
         EGS+BhrUsiwXiTCz89ddrlPZ5BImn1XN3ZfuI0eJta9GC/PL+J6ET0NOU3wT/hDJHa9i
         NyfCs/9az8nh1BBduenMsSDVGck+H7+7IuN/4xYSlu0OPnm9uIU7mWYOR4xa5XqKnNR8
         Oz+mLkeHkslhCIu797KTjs3d6/ortepit5gTz8LF4t8qBjzxxFtCumeQFj3bDGvCgSNO
         6DMg==
X-Gm-Message-State: AOJu0Yz0tJoXmei1/3Cg70HGK/DobAY9fSJbIjIR5Xl3I41axljOGkiW
	ieHgzrnLMhZh6oRRG/DPS7uBlQ==
X-Google-Smtp-Source: AGHT+IHQL1PEhPuO7hQf+U2r6GmHpZfkpXu0GPhKVxtVCvnDAauCISQV4pTCiuZQu1skZLNxj50bJQ==
X-Received: by 2002:a05:600c:3502:b0:407:8e85:899f with SMTP id h2-20020a05600c350200b004078e85899fmr1457245wmq.16.1697809352040;
        Fri, 20 Oct 2023 06:42:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e461:a77:598a:10d6? ([2001:8b0:aba:5f3c:e461:a77:598a:10d6])
        by smtp.gmail.com with ESMTPSA id t8-20020adff048000000b0032dc2110d01sm1727553wro.61.2023.10.20.06.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:42:31 -0700 (PDT)
Message-ID: <4807751be630ff5f7d4f14eb9c4e6100fd191c8c.camel@linuxfoundation.org>
Subject: Re: [master] Pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 20 Oct 2023 14:42:31 +0100
In-Reply-To: <82bbde1a-45cc-48d8-8ef8-1415ca007c94@bootlin.com>
References: <82bbde1a-45cc-48d8-8ef8-1415ca007c94@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 13:42:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4444

On Fri, 2023-10-20 at 15:26 +0200, Michael Opdenacker wrote:
> Hi Richard,
>=20
> The following changes since commit ceb1812e63b9fac062f886c2a1dde23137c0e1=
ed:
>=20
>  =C2=A0 migration-guides: add release notes for 4.0.13 (2023-10-06 09:59:=
00=20
> +0200)
>=20
> are available in the Git repository at:
>=20
>  =C2=A0 git://git.yoctoproject.org/yocto-docs master-next
>=20
> for you to fetch changes up to 65b62118da6f355e56c489c6be08ba9ea94b9f04:
>=20

Thanks!

As part of sorting the 4.3 relase, I did create a nanbield docs repo
branch btw so patches are currently only merged to master. I can also
merge to nanbield if all these are appropriate for the release.

Cheers,

Richard

